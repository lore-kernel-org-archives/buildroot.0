From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:40 +0200
Subject: [Buildroot] [PATCH buildroot-test 02/10] utils/daily-mail: new
 gitlab-ci data: defconfigs
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds defconfigs to the gitlab-ci data introduced by the
previous patch.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 2d4ed1c..9dc9729 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -528,8 +528,12 @@ def get_pipeline_jobs(project_id, pipeline, kinds=None, **request_kwargs):
         # Remove the unnecessary 'pipeline' field
         del job['pipeline']
         # Backup the actual name and set the job's kind and name depending on the naming scheme
-        job['full_name'] = job['name']
-        job['kind'] = 'other'
+        name = job['full_name'] = job['name']
+        if name.endswith('_defconfig'):
+            job['kind'] = 'defconfig'
+            job['name'] = name[:-10]
+        else:
+            job['kind'] = 'other'
     # Filter failed jobs then sort them
     jobs = (job for job in jobs if job['status'] == 'failed')
     if kinds:
-- 
2.21.0
