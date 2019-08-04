From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:47 +0200
Subject: [Buildroot] [PATCH buildroot-test 8/9] utils/daily-mail: replace
 '%' style format strings by the newer '{}' version
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-9-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python provides several ways to perform string formatting. The 1st is C
style inspired and use the '%' operator, this is the original way to
create format strings in python. The second way -- which is the standard
in python3 -- is the '.format()' method, this version is more flexible,
removes the strong type constraints and allow more format styles. This
method is also noted as the preferred way over the '%' formatting [1].

In order to introduce new kind of notification, this patch update the
current format strings to this new standard.

[1] https://docs.python.org/2/library/stdtypes.html#str.format

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 51 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 6786caa..7af1933 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -41,7 +41,7 @@ def get_overall_stats(db, datestr, branches):
     stats = {}
     for branch in branches:
         db.query("""select status,count(id) as count from results
-        where date(builddate) = '%s' and branch = '%s' group by status""" % (datestr, branch))
+        where date(builddate) = '{}' and branch = '{}' group by status""".format(datestr, branch))
         r = db.use_result()
         result = dict(r.fetch_row(maxrows=0))
         if '0' in result:
@@ -193,11 +193,11 @@ def show_results(results, show_status, show_orphan=False):
         orphan_str = 'ORPH' if r.get('orphan') else ''
         url = http_baseurl + "/results/" + r['identifier']
         if show_status:
-            contents += "%12s | %30s | %3s | %79s" % (arch, reason, status_str, url)
+            contents += "{:^12} | {:^30} | {:^3} | {:^79}".format(arch, reason, status_str, url)
         else:
-            contents += "%12s | %30s | %79s" % (arch, reason, url)
+            contents += "{:^12} | {:^30} | {:^79}".format(arch, reason, url)
         if show_orphan:
-            contents += " | %4s\n" % (orphan_str)
+            contents += " | {:^4}\n".format(orphan_str)
         else:
             contents += "\n"
     return contents
@@ -210,13 +210,13 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
     for dev, notif in notifications.iteritems():
         to = dev.name
         email_from = localconfig.fromaddr
-        subject = "[%s] Your build results for %s" % (baseurl, datestr)
+        subject = "[{}] Your build results for {}".format(baseurl, datestr)
         contents = "Hello,\n\n"
-        contents += textwrap.fill("This is the list of Buildroot build failures that occurred on %s, "
+        contents += textwrap.fill("This is the list of Buildroot build failures that occurred on {}, "
                                   "and for which you are a registered architecture developer or package "
                                   "developer. Please help us improving the quality of Buildroot by "
                                   "investigating those build failures and sending patches to fix them. "
-                                  "Thanks!" % datestr)
+                                  "Thanks!".format(datestr))
         contents += "\n\n"
         show_orphan = dev.name == ORPHAN_DEVELOPER
 
@@ -227,7 +227,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             if len(archs) == 0 and len(packages) == 0:
                 continue
 
-            contents += "Results for the '%s' branch\n" % branch
+            contents += "Results for the '{}' branch\n".format(branch)
             contents += "=========================" + "=" * len(branch) + "\n\n"
 
             if len(archs) != 0:
@@ -244,9 +244,9 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
         contents += http_baseurl
         if dry_run:
             print "====================================================="
-            print "To: %s" % to
-            print "From: %s" % email_from
-            print "Subject: %s" % subject
+            print "To: {}".format(to)
+            print "From: {}".format(email_from)
+            print "Subject: {}".format(subject)
             print
             print contents
             print "====================================================="
@@ -257,18 +257,18 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             msg['From'] = email_from
             msg['Date'] = formatdate()
             smtp.sendmail(email_from, to, msg.as_string())
-            print "To: %s" % dev.name
+            print "To: {}".format(dev.name)
 
 
 def global_email_branch_result(results, results_by_reason, branch):
-    contents = "Results for branch '%s'\n" % branch
+    contents = "Results for branch '{}'\n".format(branch)
     contents += "=====================" + "=" * len(branch) + "\n\n"
     contents += "Classification of failures by reason\n"
     contents += "------------------------------------\n\n"
     for r in results_by_reason:
         reason = shrink_str(r['reason'], 30)
         count = int(r['reason_count'])
-        contents += "%30s | %-2d\n" % (reason, count)
+        contents += "{:>30} | {:<2}\n".format(reason, count)
     contents += "\n\n"
     contents += "Detail of failures\n"
     contents += "------------------\n\n"
@@ -283,17 +283,16 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
     '''
     to = "buildroot@buildroot.org"
     email_from = localconfig.fromaddr
-    subject = "[%s] Build results for %s" % (baseurl, datestr)
+    subject = "[{}] Build results for {}".format(baseurl, datestr)
     contents = "Hello,\n\n"
-    contents += "Build statistics for %s\n" % datestr
+    contents += "Build statistics for {}\n".format(datestr)
     contents += "===============================\n\n"
     contents += "      branch |  OK | NOK | TIM | TOT |\n"
     for branch in sorted(overall.iterkeys()):
         stats = overall[branch]
         if stats[3] == 0:
             continue
-        contents += "  %10s | %3d | %3d | %3d | %3d |\n" % \
-                    (branch, stats[0], stats[1], stats[2], stats[3])
+        contents += "  {:^10} | {:^3} | {:^3} | {:^3} | {:^3} |\n".format(branch, stats[0], stats[1], stats[2], stats[3])
     contents += "\n"
     for branch in results.keys():
         if len(results[branch]) == 0:
@@ -304,9 +303,9 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
     contents += http_baseurl
     if dry_run:
         print "====================================================="
-        print "To: %s" % to
-        print "From: %s" % email_from
-        print "Subject: %s" % subject
+        print "To: {}".format(to)
+        print "From: {}".format(email_from)
+        print "Subject: {}".format(subject)
         print
         print contents
         print "====================================================="
@@ -327,9 +326,9 @@ def get_build_results(db, datestr, branches):
     results = {}
     for branch in branches:
         db.query("""select * from results
-        where date(builddate) = '%s'
-        and status != 0 and branch = '%s'
-        order by reason""" % (datestr, branch))
+        where date(builddate) = '{}'
+        and status != 0 and branch = '{}'
+        order by reason""".format(datestr, branch))
         r = db.use_result()
         results[branch] = r.fetch_row(how=1, maxrows=0)
     return results
@@ -339,8 +338,8 @@ def get_build_results_grouped_by_reason(db, datestr, branches):
     results_by_reason = {}
     for branch in branches:
         db.query("""select reason,count(id) as reason_count from results
-        where date(builddate) = '%s' and status != 0 and branch = '%s'
-        group by reason order by reason_count desc, reason""" % (datestr, branch))
+        where date(builddate) = '{}' and status != 0 and branch = '{}'
+        group by reason order by reason_count desc, reason""".format(datestr, branch))
         r = db.use_result()
         results_by_reason[branch] = r.fetch_row(how=1, maxrows=0)
     return results_by_reason
-- 
2.21.0
