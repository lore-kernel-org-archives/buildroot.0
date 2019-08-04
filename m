From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:40 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/9] utils/daily-mail: make the
 script flake8 compliant
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch apply some coding styles changes to make the script flake8
pass the flake8 tests.
The goal is to have a cleaner code for the following patches.

This patch fixes the following:
- missing blank lines between functions/methods
- deprecated functions (dict.has_key)
- trailing whitespaces
- whitespace after '(', '{' and '['
- whitespace before ')', '}' and ']'
- continuation line under/over indented
- line too long (limit set to 132 characters)

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 39 ++++++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 432f7e5..6db7f3b 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -13,13 +13,14 @@ import csv
 from collections import defaultdict
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
-import getdeveloperlib
+import getdeveloperlib  # noqa: E402
 
 baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
 
 developers = getdeveloperlib.parse_developers(localconfig.brbase)
 
+
 def get_branches():
     """Returns the list of branches currently tested by the autobuilders."""
     branch_file = os.path.join(os.path.dirname(os.path.realpath(__file__)), "..", "web", "branches")
@@ -30,6 +31,7 @@ def get_branches():
         branches.append(branch[0])
     return branches
 
+
 # Find, for the previous day, the global statistics: number of
 # success, failures, timeouts, and total number of builds.
 def get_overall_stats(db, datestr, branches):
@@ -55,11 +57,13 @@ def get_overall_stats(db, datestr, branches):
         stats[branch] = (success, failures, timeouts, total)
     return stats
 
+
 class Notification:
     def __init__(self):
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
 
+
 # Calculate the list of .mk files in the Buildroot source tree, will
 # be used to guess the name of the packages that caused build
 # failures.
@@ -72,8 +76,10 @@ def get_mklist(basepath):
             mklist.append(os.path.splitext(f)[0])
     return mklist
 
+
 mklist = get_mklist(localconfig.brbase)
 
+
 def get_notification_for_dev(notifications, dev):
     if dev in notifications:
         return notifications[dev]
@@ -82,6 +88,7 @@ def get_notification_for_dev(notifications, dev):
         notifications[dev] = n
         return n
 
+
 # Add to the notifications{} dict notifications that are related to
 # architecture "maintainers".
 def add_arch_notification(branch, notifications, build_result):
@@ -92,6 +99,7 @@ def add_arch_notification(branch, notifications, build_result):
         n = get_notification_for_dev(notifications, dev)
         n.arch_notifications[branch].append(build_result)
 
+
 # Given a failure reason as provided by the autobuilders, tries to
 # find the corresponding package by stripping progressively the last
 # "-<something>" parts of the failure reason. A failure reason like
@@ -112,14 +120,17 @@ def find_package(reason):
             return reason
     return None
 
+
 ORPHAN_DEVELOPER = "Arnout Vandecappelle <arnout@mind.be>"
 
+
 def get_orphan_developer():
     for dev in developers:
         if dev.name == ORPHAN_DEVELOPER:
             return dev
     return None
 
+
 # Add to the notifications{} dict notifications that are related to
 # package "maintainers".
 def add_package_notification(branch, notifications, build_result):
@@ -139,6 +150,7 @@ def add_package_notification(branch, notifications, build_result):
         n.package_notifications[branch].append(build_result)
     build_result['orphan'] = orphan
 
+
 def show_results(results, show_status, show_orphan=False):
     contents = ""
     for r in results:
@@ -151,7 +163,7 @@ def show_results(results, show_status, show_orphan=False):
             status_str = "NOK"
         elif status == 2:
             status_str = "TIM"
-        if r.has_key('orphan') and r['orphan']:
+        if 'orphan' in r and r['orphan']:
             orphan_str = "ORPH"
         else:
             orphan_str = ""
@@ -166,6 +178,7 @@ def show_results(results, show_status, show_orphan=False):
             contents += "\n"
     return contents
 
+
 # Send the e-mails to the individual developers
 def developers_email(smtp, branches, notifications, datestr, dry_run):
     for k, v in notifications.iteritems():
@@ -173,16 +186,20 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         email_from = localconfig.fromaddr
         subject = "[%s] Your build results for %s" % (baseurl, datestr)
         contents = "Hello,\n\n"
-        contents += textwrap.fill("This is the list of Buildroot build failures that occured on %s, and for which you are a registered architecture developer or package developer. Please help us improving the quality of Buildroot by investigating those build failures and sending patches to fix them. Thanks!" % datestr)
+        contents += textwrap.fill("This is the list of Buildroot build failures that occurred on %s, "
+                                  "and for which you are a registered architecture developer or package "
+                                  "developer. Please help us improving the quality of Buildroot by "
+                                  "investigating those build failures and sending patches to fix them. "
+                                  "Thanks!" % datestr)
         contents += "\n\n"
         show_orphan = k.name == ORPHAN_DEVELOPER
 
         for branch in branches:
-            if v.arch_notifications.has_key(branch):
+            if branch in v.arch_notifications:
                 archs = v.arch_notifications[branch]
             else:
                 archs = []
-            if v.package_notifications.has_key(branch):
+            if branch in v.package_notifications:
                 packages = v.package_notifications[branch]
             else:
                 packages = []
@@ -222,6 +239,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             smtp.sendmail(email_from, to, msg.as_string())
             print "To: %s" % k.name
 
+
 def global_email_branch_result(results, results_by_reason, branch):
     contents = "Results for branch '%s'\n" % branch
     contents += "=====================" + "=" * len(branch) + "\n\n"
@@ -240,6 +258,7 @@ def global_email_branch_result(results, results_by_reason, branch):
     contents += "\n"
     return contents
 
+
 # Send the global e-mail to the mailing list
 def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
     to = "buildroot at buildroot.org"
@@ -280,17 +299,20 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
         smtp.sendmail(email_from, [to], msg.as_string())
         print "To: buildroot at buildroot.net"
 
+
 # Get the list of build failures for the past day
 def get_build_results(db, datestr, branches):
     results = {}
     for branch in branches:
         db.query("""select * from results
-        where date(builddate) = '%s' and status != 0 and branch = '%s' order by reason""" % \
-                 (datestr, branch))
+        where date(builddate) = '%s'
+        and status != 0 and branch = '%s'
+        order by reason""" % (datestr, branch))
         r = db.use_result()
         results[branch] = r.fetch_row(how=1, maxrows=0)
     return results
 
+
 def get_build_results_grouped_by_reason(db, datestr, branches):
     results_by_reason = {}
     for branch in branches:
@@ -301,6 +323,7 @@ def get_build_results_grouped_by_reason(db, datestr, branches):
         results_by_reason[branch] = r.fetch_row(how=1, maxrows=0)
     return results_by_reason
 
+
 # Prepare the notifications{} dict for the notifications to individual
 # developers, based on architecture developers and package
 # developers
@@ -315,6 +338,7 @@ def calculate_notifications(results):
             add_package_notification(branch, notifications, result)
     return notifications
 
+
 def __main__():
     yesterday = date.today() - timedelta(1)
     yesterday_str = yesterday.strftime('%Y-%m-%d')
@@ -339,4 +363,5 @@ def __main__():
                  overall_stats, dry_run)
     smtp.quit()
 
+
 __main__()
-- 
2.21.0
