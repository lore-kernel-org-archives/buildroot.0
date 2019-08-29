From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:44 +0200
Subject: [Buildroot] [PATCH buildroot-test 06/10] utils/daily-mail: prepare
 the mail formatting to support gitlab-ci results
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-7-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to add gitlab-ci related results to mails.

Since every gitlab-ci result share the same information, a single
function was preferred to factorize this part for now (it could be split
once different gitlab-ci results have specific formatting).

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 68 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 14 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 5e8799a..9f0673b 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -246,6 +246,12 @@ def shrink_str(string, length, align='right', fill='...'):
         raise ValueError('align must be either `left`, `right` or `center`')
 
 
+def fmt_duration(**timedelta_args):
+    '''Small helper to format a duration'''
+    t = datetime(1990, 1, 1) + timedelta(**timedelta_args)
+    return t.strftime('%Hh%Mm%Ss').lstrip('0:hms')
+
+
 def show_results(results, show_status, show_orphan=False):
     contents = ""
     # Header
@@ -314,6 +320,32 @@ def show_outdated(packages, show_orphan=False):
     return contents
 
 
+def show_gitlab_ci_jobs(jobs, job_column_description='test-name', job_column_length=40, show_orphan=False):
+    # Header
+    contents = ''
+    if show_orphan:
+        contents += '{:>{}} | {:^61} | {:>8} | {:^5}\n'.format(job_column_description, job_column_length,
+                                                               'link to the job', 'duration', 'orph?')
+        contents += '{0:->{1}}-+-{0:-^61}-+-{0:->8} | {0:-^5}\n'.format('', job_column_length)
+    else:
+        contents += '{:>{}} | {:^61} | {:>8}\n'.format(job_column_description, job_column_length,
+                                                       'link to the job', 'duration')
+        contents += '{0:->{1}}-+-{0:-^61}-+-{0:->8}\n'.format('', job_column_length)
+
+    # Data
+    for job in sorted(jobs, key=lambda j: (j['kind'], j['name'])):
+        name = shrink_str(job['name'], job_column_length, align='left')
+        duration = fmt_duration(seconds=job['duration'])
+        orphan = 'ORPH' if job.get('orphan') else ''
+
+        contents += '{:>{}} | {:^61} | {:>8}'.format(name, job_column_length, job['web_url'], duration)
+        if show_orphan:
+            contents += ' | {:^5}'.format(orphan)
+        contents += '\n'
+
+    return contents
+
+
 def developers_email(smtp, branches, notifications, datestr, dry_run):
     '''
     Send the e-mails to the individual developers
@@ -387,10 +419,8 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             print "To: {}".format(dev.name)
 
 
-def global_email_branch_result(results, results_by_reason, branch):
-    contents = "Results for branch '{}'\n".format(branch)
-    contents += "=====================" + "=" * len(branch) + "\n\n"
-    contents += "Classification of failures by reason\n"
+def global_email_branch_result(results, results_by_reason):
+    contents = "Classification of failures by reason\n"
     contents += "------------------------------------\n\n"
     for r in results_by_reason:
         reason = shrink_str(r['reason'], 30)
@@ -400,11 +430,14 @@ def global_email_branch_result(results, results_by_reason, branch):
     contents += "Detail of failures\n"
     contents += "------------------\n\n"
     contents += show_results(results, show_status=True, show_orphan=True)
-    contents += "\n"
     return contents
 
 
-def global_email(smtp, results, results_by_reason, datestr, overall, outdated_pkgs, dry_run):
+def global_email_branch_gitlab_ci(pipelines):
+    pass  # Implement this to support gitlab-ci related results
+
+
+def global_email(smtp, branches, results, results_by_reason, datestr, overall, outdated_pkgs, gitlab_ci, dry_run):
     '''
     Send the global e-mail to the mailing list
     '''
@@ -421,14 +454,21 @@ def global_email(smtp, results, results_by_reason, datestr, overall, outdated_pk
         if stats[3] == 0:
             continue
         contents += "  {:^10} | {:^3} | {:^3} | {:^3} | {:^3} |\n".format(branch, stats[0], stats[1], stats[2], stats[3])
-    if len(overall) != 0:
+    if any(map(len, (overall, gitlab_ci))):
         contents += "\n"
-    for branch in results.keys():
-        if len(results[branch]) == 0:
+    for branch in branches:
+        res = results.get(branch, [])
+        git = gitlab_ci.get(branch, [])
+        if not any(map(len, (res, git))):
             continue
-        contents += global_email_branch_result(results[branch], results_by_reason[branch], branch)
-    if len(overall) != 0:
-        contents += "\n"
+        contents += "Results for branch '{}'\n".format(branch)
+        contents += "=====================" + "=" * len(branch) + "\n\n"
+        if len(res) != 0:
+            contents += global_email_branch_result(res, results_by_reason[branch])
+            contents += "\n\n"
+        if len(git) != 0:
+            contents += global_email_branch_gitlab_ci(git)
+            contents += "\n\n"
     if outdated_pkgs:
         contents += "Packages having a newer version\n"
         contents += "===============================\n\n"
@@ -742,8 +782,8 @@ def __main__():
     if 'dev' in email_dest:
         developers_email(smtp, branches, notifications, date_str, args.dry_run)
     if 'global' in email_dest:
-        global_email(smtp, results, results_by_reason, date_str,
-                     overall_stats, outdated_pkgs, args.dry_run)
+        global_email(smtp, branches, results, results_by_reason, date_str,
+                     overall_stats, outdated_pkgs, {}, args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
