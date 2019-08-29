From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:46 +0200
Subject: [Buildroot] [PATCH buildroot-test 08/10] utils/daily-mail: add
 formatting for runtime-test results
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-9-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch uses the gitlab-ci results generic function to format
runtime-test in mails.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index f8a4bfb..0510c07 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -355,14 +355,19 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         email_from = localconfig.fromaddr
         subject = "[{}] Your daily results for {}".format(baseurl, datestr)
         contents = "Hello,\n\n"
-        if notif.arch_notifications or notif.package_notifications or notif.defconfig_notifications:
-            contents += "Recent build failures\n"
-            contents += "=====================\n\n"
+
+        archs = notif.arch_notifications
+        packages = notif.package_notifications
+        defconfigs = notif.defconfig_notifications
+        runtime_tests = notif.runtime_test_notifications
+        if archs or packages or defconfigs or runtime_tests:
+            contents += "Recent build failures and runtime-tests failures\n"
+            contents += "================================================\n\n"
             contents += textwrap.fill("This is the list of Buildroot build failures that occurred on {}, "
                                       "and for which you are a registered architecture developer, package "
-                                      "developer or defconfig developer. Please help us improving the "
-                                      "quality of Buildroot by investigating those build failures and "
-                                      "sending patches to fix them. "
+                                      "developer or defconfig developer. This list also include runtime "
+                                      "tests failures. Please help us improving the quality of Buildroot by "
+                                      "investigating those build failures and sending patches to fix them. "
                                       "Thanks!".format(datestr))
             contents += "\n\n"
         show_orphan = dev.name == ORPHAN_DEVELOPER
@@ -371,8 +376,9 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             archs = notif.arch_notifications.get(branch, [])
             packages = notif.package_notifications.get(branch, [])
             defconfigs = notif.defconfig_notifications.get(branch, [])
+            runtimes = notif.runtime_test_notifications.get(branch, [])
 
-            if not any(map(len, (archs, packages, defconfigs))):
+            if not any(map(len, (archs, packages, defconfigs, runtimes))):
                 continue
 
             contents += "Results for the '{}' branch\n".format(branch)
@@ -390,6 +396,11 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
                 contents += "Build failures related to your defconfigs:\n\n"
                 contents += show_gitlab_ci_jobs(defconfigs, job_column_description='defconfig',
                                                 job_column_length=33, show_orphan=show_orphan)
+                contents += "\n\n"
+            if len(runtimes) != 0:
+                contents += "Build failures related to your runtime tests:\n\n"
+                contents += show_gitlab_ci_jobs(runtimes, job_column_description='runtime-test',
+                                                job_column_length=25, show_orphan=show_orphan)
 
             contents += "\n"
 
@@ -441,6 +452,7 @@ def global_email_branch_result(results, results_by_reason):
 
 def global_email_branch_gitlab_ci(pipelines):
     defconfigs = [j for p in pipelines for j in p['jobs'] if j['kind'] == 'defconfig']
+    runtime_tests = [j for p in pipelines for j in p['jobs'] if j['kind'] == 'runtime-test']
 
     contents = ""
     if len(defconfigs) != 0:
@@ -449,6 +461,12 @@ def global_email_branch_gitlab_ci(pipelines):
         contents += show_gitlab_ci_jobs(defconfigs, job_column_description='defconfig',
                                         job_column_length=33, show_orphan=True)
         contents += "\n\n"
+    if len(runtime_tests) != 0:
+        contents += "Detail of runtime-test failures\n"
+        contents += "-------------------------------\n\n"
+        contents += show_gitlab_ci_jobs(runtime_tests, job_column_description='runtime-test',
+                                        job_column_length=25, show_orphan=True)
+        contents += "\n\n"
     return contents
 
 
-- 
2.21.0
