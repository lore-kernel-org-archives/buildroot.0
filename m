From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 15:15:43 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 3/4] utils/daily-mail: add
 outdated-packages email formating part
In-Reply-To: <20190805131544.3849-1-victor.huesca@bootlin.com>
References: <20190805131544.3849-1-victor.huesca@bootlin.com>
Message-ID: <20190805131544.3849-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides the formating part for the outdated packages.
This adds a new table after the autobuild results to inform about
packages having a newer version.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index e99f526..58c4b2a 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -245,6 +245,34 @@ def show_results(results, show_status, show_orphan=False):
     return contents
 
 
+def show_outdated(packages, show_orphan=False):
+    contents = ''
+    # Header
+    contents += '{:^30} | {:^8} | {:^44} | {:^12} | {:^12}'.format('name', 'found by',
+                                                                   'link to release-monitoring.org',
+                                                                   'version', 'upstream')
+    if show_orphan:
+        contents += ' | {:^5}'.format('orph?')
+    contents += '\n{0:-^30}-+-{0:-^8}-+-{0:-^44}-+-{0:-^12}-+-{0:-^12}-'.format('')
+    if show_orphan:
+        contents += '+-{:-^5}-'.format('')
+    contents += '\n'
+
+    # Actual data
+    for pkg in packages:
+        name = shrink_str(pkg['name'], 30)
+        version = shrink_str(pkg['version'], 12)
+        upstream = shrink_str(pkg['upstream'], 12)
+        orphan_str = 'ORPH' if pkg.get('orphan') else ''
+        url = 'https://release-monitoring.org/project/{:0>5}'.format(pkg['id'])
+
+        contents += '{:>30} | {:^8} | {:0>5} | {:12} | {:12}'.format(name, pkg['from'], url, version, upstream)
+        if show_orphan:
+            contents += ' | {:4}'.format(orphan_str)
+        contents += '\n'
+    return contents
+
+
 def developers_email(smtp, branches, notifications, datestr, dry_run):
     '''
     Send the e-mails to the individual developers
@@ -282,6 +310,17 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
 
             contents += "\n"
 
+        outdated = notif.package_version_notification
+        if len(outdated) != 0:
+            contents += '\n'
+            contents += textwrap.fill("This is the list of packages for which a new version has been "
+                                      "detected and for which you are a registered developer. Please "
+                                      "help us improving the quality of Buildroot by bumping these "
+                                      "packages to their latest version. Thanks!")
+            contents += '\n\n'
+            contents += show_outdated(outdated, show_orphan=show_orphan)
+            contents += '\n'
+
         contents += "-- \n"
         contents += http_baseurl
         if dry_run:
@@ -319,7 +358,7 @@ def global_email_branch_result(results, results_by_reason, branch):
     return contents
 
 
-def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
+def global_email(smtp, results, results_by_reason, datestr, overall, outdated_pkg, dry_run):
     '''
     Send the global e-mail to the mailing list
     '''
@@ -341,6 +380,11 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
         if len(results[branch]) == 0:
             continue
         contents += global_email_branch_result(results[branch], results_by_reason[branch], branch)
+    if outdated_pkg:
+        contents += '\n\n'
+        contents += "Packages having a newer version\n"
+        contents += "===============================\n\n"
+        contents += show_outdated(outdated_pkg, show_orphan=True)
     contents += "\n"
     contents += "-- \n"
     contents += http_baseurl
@@ -479,7 +523,7 @@ def __main__():
         developers_email(smtp, branches, notifications, date_str, args.dry_run)
     if 'global' in email_dest:
         global_email(smtp, results, results_by_reason, date_str,
-                     overall_stats, args.dry_run)
+                     overall_stats, [], args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
