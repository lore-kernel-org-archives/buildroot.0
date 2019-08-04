From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:36 +0200
Subject: [Buildroot] [buildroot-test 5/5] utils/daily-mail: allow to select
 only a subset of data to send in emails
In-Reply-To: <20190804152536.17829-1-victor.huesca@bootlin.com>
References: <20190804152536.17829-1-victor.huesca@bootlin.com>
Message-ID: <20190804152536.17829-6-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a modular way to select a subset of the available
information collected by this script. Currently the range of possibilities
is limited to enable or disable the autobuild results, but it allow
future patches to easily add new kind of data to this script.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 4407438..20e5886 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -231,7 +231,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
     for dev, notif in notifications.iteritems():
         to = dev.name
         email_from = localconfig.fromaddr
-        subject = "[{}] Your build results for {}".format(baseurl, datestr)
+        subject = "[{}] Your daily results for {}".format(baseurl, datestr)
         contents = "Hello,\n\n"
         contents += textwrap.fill("This is the list of Buildroot build failures that occurred on {}, "
                                   "and for which you are a registered architecture developer or package "
@@ -304,11 +304,12 @@ def global_email(smtp, results, results_by_reason, datestr, overall, dry_run):
     '''
     to = "buildroot at buildroot.org"
     email_from = localconfig.fromaddr
-    subject = "[{}] Build results for {}".format(baseurl, datestr)
+    subject = "[{}] Daily results for {}".format(baseurl, datestr)
     contents = "Hello,\n\n"
-    contents += "Build statistics for {}\n".format(datestr)
-    contents += "===============================\n\n"
-    contents += "      branch |  OK | NOK | TIM | TOT |\n"
+    if len(overall) != 0:
+        contents += "Autobuild statistics for {}\n".format(datestr)
+        contents += "===============================\n\n"
+        contents += "      branch |  OK | NOK | TIM | TOT |\n"
     for branch in sorted(overall.iterkeys()):
         stats = overall[branch]
         if stats[3] == 0:
@@ -390,6 +391,8 @@ def parse_args():
     parser.add_argument('--branches', action='store', nargs='+', help='List of branches (blank separated)')
     parser.add_argument('--dest', action='store', nargs='+', choices=['dev', 'global'],
                         help='List of emails type to send (ie. global, dev)')
+    parser.add_argument('--data', action='store', nargs='+', choices=['autobuild'],
+                        help='List of information to add in emails (blank separated)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
         parser.error('date must be in format YYYY-MM-DD')
@@ -405,14 +408,20 @@ def __main__():
         yesterday_str = yesterday.strftime('%Y-%m-%d')
     branches = args.branches if args.branches else get_branches()
     email_dest = set(args.dest) if args.dest else {'dev', 'global'}
+    email_data = set(args.data) if args.data else {'autobuild'}
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
                         passwd=localconfig.passwd,
                         db=localconfig.db)
-    overall_stats = get_overall_stats(db, yesterday_str, branches)
-    results = get_build_results(db, yesterday_str, branches)
-    results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
+    if 'autobuild' in email_data:
+        overall_stats = get_overall_stats(db, yesterday_str, branches)
+        results = get_build_results(db, yesterday_str, branches)
+        results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
+    else:
+        overall_stats = {}
+        results = {}
+        results_by_reason = {}
     notifications = calculate_notifications(results)
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
-- 
2.21.0
