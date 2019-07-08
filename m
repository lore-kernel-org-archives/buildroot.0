From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  8 Jul 2019 10:14:06 +0200
Subject: [Buildroot] [PATCH buildroot-test 4/4] utils/daily-mail: add
 multiple argument to ease modularity of the script
In-Reply-To: <20190708081406.28215-1-victor.huesca@bootlin.com>
References: <20190708081406.28215-1-victor.huesca@bootlin.com>
Message-ID: <20190708081406.28215-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Options added:
- Include out-to-date packages
- Specify a custom date instead of today
- Enable/disable a header for tables displayed
- Specify branches to include instead of reading the 'branches' file
- Allow to send emails to developers only / to the maillist only

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 66 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 85a1c4e..9c64645 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -14,11 +14,13 @@ from collections import defaultdict
 import json
 from packaging import version
 import re
+import argparse
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib
 
 RE_HASH_40 = re.compile(r'.*[a-fA-F0-9]{40}.*')
+RE_DATE = re.compile(r'^\d\d\d\d-\d\d-\d\d$')
 
 baseurl = "autobuild.buildroot.net"
 http_baseurl = "http://" + baseurl
@@ -237,7 +239,7 @@ def show_outdated(packages, show_orphan=False, show_header=False):
     return contents
 
 # Send the e-mails to the individual developers
-def developers_email(smtp, branches, notifications, datestr, dry_run):
+def developers_email(smtp, branches, notifications, datestr, dry_run, show_header=False):
     for dev, notif in notifications.iteritems():
         to = dev.name
         email_from = localconfig.fromaddr
@@ -265,18 +267,18 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
 
             if len(archs) != 0:
                 contents += "Build failures related to your architectures:\n\n"
-                contents += show_results(archs, show_status=False, show_orphan=False)
+                contents += show_results(archs, show_status=False, show_orphan=False, show_header=show_header)
                 contents += "\n\n"
             if len(packages) != 0:
                 contents += "Build failures related to your packages:\n\n"
-                contents += show_results(packages, show_status=False, show_orphan=show_orphan)
+                contents += show_results(packages, show_status=False, show_orphan=show_orphan, show_header=show_header)
 
             contents += "\n"
 
         outdated = notif.package_version_notification
         if len(outdated) != 0:
             contents += "Packages you maintain that have a new upstream version:\n\n"
-            contents += show_outdated(outdated, show_orphan=show_orphan)
+            contents += show_outdated(outdated, show_orphan=show_orphan, show_header=show_header)
             contents += '\n'
 
         contents += "-- \n"
@@ -298,11 +300,14 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             smtp.sendmail(email_from, to, msg.as_string())
             print "To: %s" % dev.name
 
-def global_email_branch_result(results, results_by_reason, branch):
+def global_email_branch_result(results, results_by_reason, branch, show_header=False):
     contents = "Results for branch '%s'\n" % branch
     contents += "=====================" + "=" * len(branch) + "\n\n"
     contents += "Classification of failures by reason\n"
     contents += "------------------------------------\n\n"
+    if show_header:
+        contents += "{:>30} | {:<2}\n".format('reason', 'n')
+        contents += "{0:-^30}-+-{0:-^2}\n".format('')
     for r in results_by_reason:
         reason = r['reason']
         if len(reason) > 30:
@@ -312,35 +317,37 @@ def global_email_branch_result(results, results_by_reason, branch):
     contents += "\n\n"
     contents += "Detail of failures\n"
     contents += "------------------\n\n"
-    contents += show_results(results, show_status=True, show_orphan=True)
+    contents += show_results(results, show_status=True, show_orphan=True, show_header=show_header)
     contents += "\n"
     return contents
 
 # Send the global e-mail to the mailing list
-def global_email(smtp, results, results_by_reason, datestr, overall, dry_run, outdated=None):
+def global_email(smtp, results, results_by_reason, datestr, overall, outdated, dry_run, show_header=False):
     to = "buildroot at buildroot.org"
     email_from = localconfig.fromaddr
     subject = "[%s] Build results for %s" % (baseurl, datestr)
     contents = "Hello,\n\n"
     contents += "Build statistics for %s\n" % datestr
     contents += "===============================\n\n"
-    contents += "      branch |  OK | NOK | TIM | TOT |\n"
+    contents += "      branch |  OK | NOK | TIM | TOT\n"
+    if show_header:
+        contents += "-------------+-----+-----+-----+-----\n"
     for branch in sorted(overall.iterkeys()):
         stats = overall[branch]
         if stats[3] == 0:
             continue
-        contents += "  %10s | %3d | %3d | %3d | %3d |\n" % \
+        contents += "  %10s | %3d | %3d | %3d | %3d\n" % \
                     (branch, stats[0], stats[1], stats[2], stats[3])
     contents += "\n"
     for branch in results.keys():
         if len(results[branch]) == 0:
             continue
-        contents += global_email_branch_result(results[branch], results_by_reason[branch], branch)
+        contents += global_email_branch_result(results[branch], results_by_reason[branch], branch, show_header=show_header)
     if outdated:
         contents += '\n\n'
         contents += "Packages having a newer version\n"
         contents += "===============================\n\n"
-        contents += show_outdated(outdated, show_orphan=True)    
+        contents += show_outdated(outdated, show_orphan=True, show_header=show_header)
     contents += "\n"
     contents += "-- \n"
     contents += http_baseurl
@@ -413,10 +420,29 @@ def get_outdated_pkg(path):
                         'from': 'MAPPING' if status == 2 else 'NAME' } )
     return sorted(s, key=lambda pkg: pkg['name'])
 
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--dry-run', action='store_true', help='Do not send email, only show output')
+    parser.add_argument('--outdated', action='store_true', help='Include outdated packages in emails')
+    parser.add_argument('--date', action='store', help='Use this date instead of today')
+    parser.add_argument('--no-header', dest='header', action='store_false', help='Dont not print header for the different tables')
+    parser.add_argument('--branches', dest='branches', action='store', help='List of branches (comma separated)')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('--global-only', dest='dev_email', action='store_false', help='Only send global email')
+    group.add_argument('--dev-only', dest='global_email', action='store_false', help='Only send developers email')
+    args = parser.parse_args()
+    if args.date and not RE_DATE.match(args.date):
+        parser.error('date must be in format YYYY-MM-DD')
+    return args
+
 def __main__():
-    yesterday = date.today() - timedelta(1)
-    yesterday_str = yesterday.strftime('%Y-%m-%d')
-    branches = get_branches()
+    args = parse_args()
+    if not args.date:
+        yesterday = date.today() - timedelta(1)
+        yesterday_str = yesterday.strftime('%Y-%m-%d')
+    else:
+        yesterday_str = args.date
+    branches = get_branches() if not args.branches else args.branches.split(',')
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
@@ -425,17 +451,15 @@ def __main__():
     overall_stats = get_overall_stats(db, yesterday_str, branches)
     results = get_build_results(db, yesterday_str, branches)
     results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
-    outdated_pkg = get_outdated_pkg(localconfig.pkg_stats)
+    outdated_pkg = get_outdated_pkg(localconfig.pkg_stats) if args.outdated else []
     notifications = calculate_notifications(results, outdated_pkg)
-    dry_run = False
-    if len(sys.argv) == 2 and sys.argv[1] == "--dry-run":
-        dry_run = True
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
-    developers_email(smtp, branches, notifications, yesterday_str, dry_run)
-    global_email(smtp, results, results_by_reason, yesterday_str,
-                 overall_stats, dry_run)
+    if args.dev_email:
+        developers_email(smtp, branches, notifications, yesterday_str, args.dry_run, args.header)
+    if args.global_email:
+        global_email(smtp, results, results_by_reason, yesterday_str, overall_stats, outdated_pkg, args.dry_run, args.header)
     smtp.quit()
 
 __main__()
-- 
2.21.0
