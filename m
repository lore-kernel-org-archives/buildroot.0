From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:14:03 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/4] utils/daily-mail: add
 information about version that may need an update
In-Reply-To: <20190708081406.28215-1-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
Message-ID: <20190708081406.28215-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch use the output of buildroot pkg-stats to inform maintainers about packages
they maintain that may need an update.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 96 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 13 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index cf600c5..4ab7710 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -11,10 +11,15 @@ from datetime import date, timedelta
 import localconfig
 import csv
 from collections import defaultdict
+import json
+from packaging import version
+import re
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib
 
+RE_HASH_40 = re.compile(r'.*[a-fA-F0-9]{40}.*')
+
 baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
 
@@ -59,6 +64,7 @@ class Notification:
     def __init__(self):
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
+        self.package_version_notification = []
 
 # Calculate the list of .mk files in the Buildroot source tree, will
 # be used to guess the name of the packages that caused build
@@ -139,6 +145,19 @@ def add_package_notification(branch, notifications, build_result):
         n.package_notifications[branch].append(build_result)
     build_result['orphan'] = orphan
 
+def add_outdated_pkg_notification(notifications, outdated_pkg):
+    for pkg in outdated_pkg:
+        orphan = True
+        for dev in developers:
+            if pkg['name'] in dev.packages:
+                orphan = False
+                notif = get_notification_for_dev(notifications, dev)
+                notif.package_version_notification.append(pkg)
+        if orphan:
+            pkg['orphan'] = True
+            notif = get_notification_for_dev(notifications, get_orphan_developer())
+            notif.package_version_notification.append(pkg)
+
 def show_results(results, show_status, show_orphan=False):
     contents = ""
     for r in results:
@@ -157,33 +176,55 @@ def show_results(results, show_status, show_orphan=False):
             orphan_str = ""
         url = http_baseurl + "/results/" + r['identifier']
         if show_status:
-            contents += "%12s | %30s | %3s | %40s" % (arch, reason, status_str, url)
+            contents += "%12s | %30s | %3s | %79s" % (arch, reason, status_str, url)
         else:
-            contents += "%12s | %30s | %40s" % (arch, reason, url)
+            contents += "%12s | %30s | %79s" % (arch, reason, url)
         if show_orphan:
             contents += " | %4s\n" % (orphan_str)
         else:
             contents += "\n"
     return contents
 
+def show_outdated(packages, show_orphan=False, show_header=False):
+    contents = ''
+    if show_header:
+        contents += '{:^30} | {:^8} | {:^44} | {:^12} | {:^12}'.format('name', 'found by', 
+                                                                     'link to release-moinotring.org', 
+                                                                     'version', 'upstream')
+        if show_orphan:
+            contents += ' | {:^5}'.format('orph?')
+        contents += '\n{0:-^30}-+-{0:-^8}-+-{0:-^44}-+-{0:-^12}-+-{0:-^12}-'.format('')
+        if show_orphan:
+            contents += '+-{:-^5}-'.format('')
+        contents += '\n'
+
+    for pkg in packages:
+        pkg_str = { k: (v[:9] + '...' if k in ('version', 'upstream') and len(v) > 12 else v) for k, v in pkg.items() }
+        orphan_str = 'ORHP' if 'orphan' in pkg and pkg['orphan'] else ''
+        contents += '{name:>30} | {from:^8} | https://release-monitoring.org/project/{id:0>5} | {version:12} | {upstream:12}'.format(**pkg_str)
+        if show_orphan:
+            contents += ' | {:4}'.format(orphan_str)
+        contents += '\n'
+    return contents
+
 # Send the e-mails to the individual developers
 def developers_email(smtp, branches, notifications, datestr, dry_run):
-    for k, v in notifications.iteritems():
-        to = k.name
+    for dev, notif in notifications.iteritems():
+        to = dev.name
         email_from = localconfig.fromaddr
         subject = "[%s] Your build results for %s" % (baseurl, datestr)
         contents = "Hello,\n\n"
         contents += textwrap.fill("This is the list of Buildroot build failures that occured on %s, and for which you are a registered architecture developer or package developer. Please help us improving the quality of Buildroot by investigating those build failures and sending patches to fix them. Thanks!" % datestr)
         contents += "\n\n"
-        show_orphan = k.name == ORPHAN_DEVELOPER
+        show_orphan = dev.name == ORPHAN_DEVELOPER
 
         for branch in branches:
-            if v.arch_notifications.has_key(branch):
-                archs = v.arch_notifications[branch]
+            if notif.arch_notifications.has_key(branch):
+                archs = notif.arch_notifications[branch]
             else:
                 archs = []
-            if v.package_notifications.has_key(branch):
-                packages = v.package_notifications[branch]
+            if notif.package_notifications.has_key(branch):
+                packages = notif.package_notifications[branch]
             else:
                 packages = []
 
@@ -203,6 +244,12 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
 
             contents += "\n"
 
+        outdated = notif.package_version_notification
+        if len(outdated) != 0:
+            contents += "Packages you maintain that have a new upstream version:\n\n"
+            contents += show_outdated(outdated, show_orphan=show_orphan)
+            contents += '\n'
+
         contents += "-- \n"
         contents += http_baseurl
         if dry_run:
@@ -220,7 +267,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             msg['From'] = email_from
             msg['Date'] = formatdate()
             smtp.sendmail(email_from, to, msg.as_string())
-            print "To: %s" % k.name
+            print "To: %s" % dev.name
 
 def global_email_branch_result(results, results_by_reason, branch):
     contents = "Results for branch '%s'\n" % branch
@@ -241,7 +288,7 @@ def global_email_branch_result(results, results_by_reason, branch):
     return contents
 
 # Send the global e-mail to the mailing list
-def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
+def global_email(smtp, results, results_by_reason, datestr, overall, dry_run, outdated=None):
     to = "buildroot at buildroot.org"
     email_from = localconfig.fromaddr
     subject = "[%s] Build results for %s" % (baseurl, datestr)
@@ -260,6 +307,11 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
         if len(results[branch]) == 0:
             continue
         contents += global_email_branch_result(results[branch], results_by_reason[branch], branch)
+    if outdated:
+        contents += '\n\n'
+        contents += "Packages having a newer version\n"
+        contents += "===============================\n\n"
+        contents += show_outdated(outdated, show_orphan=True)    
     contents += "\n"
     contents += "-- \n"
     contents += http_baseurl
@@ -304,7 +356,7 @@ def get_build_results_grouped_by_reason(db, datestr, branches):
 # Prepare the notifications{} dict for the notifications to individual
 # developers, based on architecture developers and package
 # developers
-def calculate_notifications(results):
+def calculate_notifications(results, outdated_pkg):
     notifications = {}
     for branch in results.keys():
         for result in results[branch]:
@@ -313,8 +365,25 @@ def calculate_notifications(results):
                 continue
             add_arch_notification(branch, notifications, result)
             add_package_notification(branch, notifications, result)
+    add_outdated_pkg_notification(notifications, outdated_pkg)
     return notifications
 
+def get_outdated_pkg(path):
+    with open(path, 'r') as f:
+        stats = json.load(f)
+    s = []
+    for name, pkg in stats['packages'].items():
+        status, latest_ver, p_id = pkg['latest_version']
+        cur_ver = pkg['current_version']
+        if  status in (2, 3) and cur_ver and latest_ver and not RE_HASH_40.match(cur_ver) \
+                             and version.parse(str(cur_ver)) < version.parse(str(latest_ver)):
+            s.append( { 'name': str(name), 
+                        'id': p_id, 
+                        'version': str(cur_ver), 
+                        'upstream': str(latest_ver),
+                        'from': 'MAPPING' if status == 2 else 'NAME' } )
+    return sorted(s, key=lambda pkg: pkg['name'])
+
 def __main__():
     yesterday = date.today() - timedelta(1)
     yesterday_str = yesterday.strftime('%Y-%m-%d')
@@ -327,7 +396,8 @@ def __main__():
     overall_stats = get_overall_stats(db, yesterday_str, branches)
     results = get_build_results(db, yesterday_str, branches)
     results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
-    notifications = calculate_notifications(results)
+    outdated_pkg = get_outdated_pkg(localconfig.pkg_stats)
+    notifications = calculate_notifications(results, outdated_pkg)
     dry_run = False
     if len(sys.argv) == 2 and sys.argv[1] == "--dry-run":
         dry_run = True
-- 
2.21.0
