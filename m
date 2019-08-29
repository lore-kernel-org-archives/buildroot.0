From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:45 +0200
Subject: [Buildroot] [PATCH buildroot-test 07/10] utils/daily-mail: add
 formatting for defconfig results
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-8-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch uses the gitlab-ci results generic function to format
defconfigs in mails.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 9f0673b..f8a4bfb 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -355,14 +355,14 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         email_from = localconfig.fromaddr
         subject = "[{}] Your daily results for {}".format(baseurl, datestr)
         contents = "Hello,\n\n"
-
-        if notif.arch_notifications or notif.package_notifications:
-            contents += "Autobuilder failures\n"
-            contents += "====================\n\n"
+        if notif.arch_notifications or notif.package_notifications or notif.defconfig_notifications:
+            contents += "Recent build failures\n"
+            contents += "=====================\n\n"
             contents += textwrap.fill("This is the list of Buildroot build failures that occurred on {}, "
-                                      "and for which you are a registered architecture developer or package "
-                                      "developer. Please help us improving the quality of Buildroot by "
-                                      "investigating those build failures and sending patches to fix them. "
+                                      "and for which you are a registered architecture developer, package "
+                                      "developer or defconfig developer. Please help us improving the "
+                                      "quality of Buildroot by investigating those build failures and "
+                                      "sending patches to fix them. "
                                       "Thanks!".format(datestr))
             contents += "\n\n"
         show_orphan = dev.name == ORPHAN_DEVELOPER
@@ -370,8 +370,9 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         for branch in branches:
             archs = notif.arch_notifications.get(branch, [])
             packages = notif.package_notifications.get(branch, [])
+            defconfigs = notif.defconfig_notifications.get(branch, [])
 
-            if len(archs) == 0 and len(packages) == 0:
+            if not any(map(len, (archs, packages, defconfigs))):
                 continue
 
             contents += "Results for the '{}' branch\n".format(branch)
@@ -384,6 +385,11 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             if len(packages) != 0:
                 contents += "Build failures related to your packages:\n\n"
                 contents += show_results(packages, show_status=False, show_orphan=show_orphan)
+                contents += "\n\n"
+            if len(defconfigs) != 0:
+                contents += "Build failures related to your defconfigs:\n\n"
+                contents += show_gitlab_ci_jobs(defconfigs, job_column_description='defconfig',
+                                                job_column_length=33, show_orphan=show_orphan)
 
             contents += "\n"
 
@@ -434,7 +440,16 @@ def global_email_branch_result(results, results_by_reason):
 
 
 def global_email_branch_gitlab_ci(pipelines):
-    pass  # Implement this to support gitlab-ci related results
+    defconfigs = [j for p in pipelines for j in p['jobs'] if j['kind'] == 'defconfig']
+
+    contents = ""
+    if len(defconfigs) != 0:
+        contents += 'Detail of defconfig failures\n'
+        contents += '----------------------------\n\n'
+        contents += show_gitlab_ci_jobs(defconfigs, job_column_description='defconfig',
+                                        job_column_length=33, show_orphan=True)
+        contents += "\n\n"
+    return contents
 
 
 def global_email(smtp, branches, results, results_by_reason, datestr, overall, outdated_pkgs, gitlab_ci, dry_run):
-- 
2.21.0
