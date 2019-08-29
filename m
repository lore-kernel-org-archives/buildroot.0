From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:39 +0200
Subject: [Buildroot] [PATCH buildroot-test 01/10] utils/daily-mail: new
 data: gitlab-ci jobs
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot have a mirror repository on gitlab.com that is used to run
continious integration tasks. Among these tasks, a complete checkup of
defconfigs and runtime-tests is regularly performed.

This patch allows to retrieve tests that have failed over a given period
of time. It is based on the (very imperfect) gitlab-ci API.

Due to multiple limitations of the API (pagination of results, crucial
data requiring a dedicated request, etc.), this implementation performs
multiple optimisation to be able to retreive the tasks needed.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 157 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index baf0e0b..2d4ed1c 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -7,7 +7,7 @@ import textwrap
 import mysmtplib as smtplib
 from email.mime.text import MIMEText
 from email.utils import formatdate
-from datetime import date, timedelta
+from datetime import date, timedelta, datetime
 import localconfig
 import csv
 from collections import defaultdict
@@ -16,6 +16,10 @@ import argparse
 import re
 import json
 from packaging import version
+import certifi
+from urllib3 import HTTPSConnectionPool
+from urllib3.exceptions import HTTPError
+from multiprocessing import Pool as ProcessPool
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib  # noqa: E402
@@ -27,6 +31,7 @@ baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
 
 developers = getdeveloperlib.parse_developers(localconfig.brbase)
+gitlab_ci_http_pool = None
 
 
 def get_branches():
@@ -469,6 +474,156 @@ def get_outdated_pkgs(path):
     return sorted(s, key=lambda pkg: pkg['name'])
 
 
+def request_paginated_url(pool, url, page_size=100, page_name='page', **request_kwargs):
+    '''
+    Simple helper to retreive data from call paginated url.
+    Request's result is assumed to be json list.
+    '''
+    request_kwargs.setdefault('fields', {})
+    request_kwargs['fields']['per_page'] = page_size
+    results = []
+    page = 1
+    while "len(res) == page_size":
+        request_kwargs['fields'][page_name] = page
+        try:
+            req = pool.request('GET', url, **request_kwargs)
+        except HTTPError:
+            print('error: there were an error with gitlab api. '
+                  'Please make sure your identification token is right and try again.')
+            break
+        if req.status != 200:
+            print('error: there were an error with gitlab api. '
+                  'Please make sure your identification token is right and try again.')
+            break
+        res = json.loads(req.data)
+        results += res
+        page += 1
+        if len(res) != page_size:
+            break
+    return results
+
+
+def get_pipeline_details(project_id, pipeline, **request_kwargs):
+    pool = gitlab_ci_http_pool
+    pipeline_url = '/api/v4/projects/{}/pipelines/{}'.format(project_id, pipeline)
+    try:
+        pipeline_req = pool.request('GET', pipeline_url, **request_kwargs)
+    except HTTPError:
+        print('error: there were an error while fetching the gitlab-ci pipeline\'s details. '
+              'Please make sure your identification token is right and try again.')
+        return {}
+    if pipeline_req.status != 200:
+        print('error: there were an error while fetching the gitlab-ci pipeline\'s details. '
+              'Please make sure your identification token is right and try again.')
+        return {}
+    infos = json.loads(pipeline_req.data)
+    return infos
+
+
+def get_pipeline_jobs(project_id, pipeline, kinds=None, **request_kwargs):
+    pool = gitlab_ci_http_pool
+    jobs_url = '/api/v4/projects/{}/pipelines/{}/jobs'.format(project_id, pipeline)
+    jobs = request_paginated_url(pool, jobs_url, **request_kwargs)
+    for job in jobs:
+        # Remove the unnecessary 'pipeline' field
+        del job['pipeline']
+        # Backup the actual name and set the job's kind and name depending on the naming scheme
+        job['full_name'] = job['name']
+        job['kind'] = 'other'
+    # Filter failed jobs then sort them
+    jobs = (job for job in jobs if job['status'] == 'failed')
+    if kinds:
+        jobs = (job for job in jobs if job['kind'] in kinds)
+    return sorted(jobs, key=lambda j: (j['name'], j['kind']))
+
+
+def get_gitlab_ci_pipelines(http_pool, process_pool, project_id, date, date_range=None):
+    '''
+    Returns all gitlab-ci pipelines ran after the giver `min_date`
+    '''
+    date_to = date
+    date_from = date - date_range if date_range else date
+    per_page = process_pool._processes
+    if per_page > 100:
+        raise ValueError('gitlab-ci supports a max pagination of 100 results per page. '
+                         'The pool passed as argument must have 100 or less processes.')
+    fields = {'per_page': per_page}
+    url = '/api/v4/projects/{}/pipelines'.format(project_id)
+    page = 1
+    pipelines = []
+
+    # Fetch pipelines `nb_processes` by `nb_processes` until `from_date` in reached
+    while True:
+        # List pipelines
+        fields['page'] = page
+        page += 1
+        try:
+            cur_pipelines = http_pool.request('GET', url, fields=fields)
+        except HTTPError:
+            print('error: there were an error while fetching the gitlab-ci pipelines. '
+                  'Please make sure your identification token is right and try again.')
+            return pipelines
+        if cur_pipelines.status != 200:
+            print('error: there were an error while fetching the gitlab-ci pipeline\'s details. '
+                  'Please make sure your identification token is right and try again.')
+            return pipelines
+        cur_pipelines = json.loads(cur_pipelines.data)
+
+        # Handle cases where the requested date is older than all pipelines
+        if len(cur_pipelines) == 0:
+            return pipelines
+
+        # Request more infos about each pipeline (for instance the date)
+        pipelines_infos = [process_pool.apply_async(get_pipeline_details, (project_id, p['id']))
+                           for p in cur_pipelines]
+        pipelines_infos = [p.get() for p in pipelines_infos]
+
+        # Add pipeline in the right period, break once the from_date is found
+        for p in pipelines_infos:
+            cur_date = datetime.strptime(p['finished_at'], '%Y-%m-%dT%H:%M:%S.%fZ').date()
+            if cur_date < date_from:
+                return pipelines
+            if cur_date > date_to:
+                continue
+            pipelines.append(p)
+
+    return pipelines
+
+
+def get_gitlab_ci(branches, date, date_range=None, kinds=None):
+    '''
+    Retreive failed jobs from gitlab-ci grouped by pipelines
+    for the specified date.
+    If `kinds` list is provided, only jobs matching one of the
+    given kind will be returned.
+    '''
+    header = {'PRIVATE-TOKEN': localconfig.gitlab_user_token}
+    project_id = localconfig.gitlab_project_id
+    failed_filter = {'fields': {'status': 'failed'}}
+
+    # Build pools
+    global gitlab_ci_http_pool
+    gitlab_ci_http_pool = HTTPSConnectionPool('gitlab.com', port=443, cert_reqs='CERT_REQUIRED',
+                                              ca_certs=certifi.where(), timeout=30, headers=header)
+    process_pool = ProcessPool(processes=64)
+
+    # Fetch pipelines 64 by 64 until `date_from` in reached
+    pipelines = get_gitlab_ci_pipelines(gitlab_ci_http_pool, process_pool, project_id, date, date_range)
+
+    # Drop unnecessary branches
+    pipelines = [p for p in pipelines if p['ref'] in branches]
+
+    # Get jobs ran by those pipelines
+    pipelines_jobs = [process_pool.apply_async(get_pipeline_jobs, (project_id, p['id'], kinds),
+                                               failed_filter) for p in pipelines]
+    for pipeline, jobs in zip(pipelines, pipelines_jobs):
+        pipeline['jobs'] = jobs.get()
+
+    # Group pipelines by branch
+    pipelines = {branch: [p for p in pipelines if p['ref'] == branch] for branch in branches}
+    return pipelines
+
+
 def calculate_notifications(results, outdated_pkgs):
     '''
     Prepare the notifications{} dict for the notifications to individual
-- 
2.21.0
