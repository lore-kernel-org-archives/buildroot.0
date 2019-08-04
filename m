From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:41 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/9] utils/daily-mail: replace
 function's comments by doc-strings
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since these comments describe what their corresponding function does, it
makes sense to use docstring instead of regular comment. This improve a
bit the readability.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 62 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 6db7f3b..0774242 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -32,9 +32,11 @@ def get_branches():
     return branches
 
 
-# Find, for the previous day, the global statistics: number of
-# success, failures, timeouts, and total number of builds.
 def get_overall_stats(db, datestr, branches):
+    '''
+    Find, for the previous day, the global statistics: number of
+    success, failures, timeouts, and total number of builds.
+    '''
     stats = {}
     for branch in branches:
         db.query("""select status,count(id) as count from results
@@ -64,10 +66,12 @@ class Notification:
         self.package_notifications = defaultdict(list)
 
 
-# Calculate the list of .mk files in the Buildroot source tree, will
-# be used to guess the name of the packages that caused build
-# failures.
 def get_mklist(basepath):
+    '''
+    Calculate the list of .mk files in the Buildroot source tree, will
+    be used to guess the name of the packages that caused build
+    failures.
+    '''
     mklist = []
     for root, dirs, files in os.walk(basepath):
         for f in files:
@@ -89,9 +93,11 @@ def get_notification_for_dev(notifications, dev):
         return n
 
 
-# Add to the notifications{} dict notifications that are related to
-# architecture "maintainers".
 def add_arch_notification(branch, notifications, build_result):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    architecture "maintainers".
+    '''
     arch = build_result['arch']
     for dev in developers:
         if arch not in dev.architectures:
@@ -100,14 +106,16 @@ def add_arch_notification(branch, notifications, build_result):
         n.arch_notifications[branch].append(build_result)
 
 
-# Given a failure reason as provided by the autobuilders, tries to
-# find the corresponding package by stripping progressively the last
-# "-<something>" parts of the failure reason. A failure reason like
-# "qt5location-5.6.1-1" will first attempt to find a package named
-# "qt5location-5.6.1" (which will not find any match) and then attempt
-# to find a package named "qt5location" (which will match an existing
-# package).
 def find_package(reason):
+    '''
+    Given a failure reason as provided by the autobuilders, tries to
+    find the corresponding package by stripping progressively the last
+    "-<something>" parts of the failure reason. A failure reason like
+    "qt5location-5.6.1-1" will first attempt to find a package named
+    "qt5location-5.6.1" (which will not find any match) and then attempt
+    to find a package named "qt5location" (which will match an existing
+    package).
+    '''
     if reason == "unknown":
         return
     # Strip host- prefix so that host packages can match
@@ -131,9 +139,11 @@ def get_orphan_developer():
     return None
 
 
-# Add to the notifications{} dict notifications that are related to
-# package "maintainers".
 def add_package_notification(branch, notifications, build_result):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    package "maintainers".
+    '''
     pkg = find_package(build_result['reason'])
     if not pkg:
         return
@@ -179,8 +189,10 @@ def show_results(results, show_status, show_orphan=False):
     return contents
 
 
-# Send the e-mails to the individual developers
 def developers_email(smtp, branches, notifications, datestr, dry_run):
+    '''
+    Send the e-mails to the individual developers
+    '''
     for k, v in notifications.iteritems():
         to = k.name
         email_from = localconfig.fromaddr
@@ -259,8 +271,10 @@ def global_email_branch_result(results, results_by_reason, branch):
     return contents
 
 
-# Send the global e-mail to the mailing list
 def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
+    '''
+    Send the global e-mail to the mailing list
+    '''
     to = "buildroot at buildroot.org"
     email_from = localconfig.fromaddr
     subject = "[%s] Build results for %s" % (baseurl, datestr)
@@ -300,8 +314,10 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
         print "To: buildroot at buildroot.net"
 
 
-# Get the list of build failures for the past day
 def get_build_results(db, datestr, branches):
+    '''
+    Get the list of build failures for the past day
+    '''
     results = {}
     for branch in branches:
         db.query("""select * from results
@@ -324,10 +340,12 @@ def get_build_results_grouped_by_reason(db, datestr, branches):
     return results_by_reason
 
 
-# Prepare the notifications{} dict for the notifications to individual
-# developers, based on architecture developers and package
-# developers
 def calculate_notifications(results):
+    '''
+    Prepare the notifications{} dict for the notifications to individual
+    developers, based on architecture developers, package developers,
+    defconfig developers and runtime developers.
+    '''
     notifications = {}
     for branch in results.keys():
         for result in results[branch]:
-- 
2.21.0
