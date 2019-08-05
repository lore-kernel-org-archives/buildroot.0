From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 15:15:44 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 4/4] utils/daily-mail: enable
 outdated packages emails
In-Reply-To: <20190805131544.3849-1-victor.huesca@bootlin.com>
References: <20190805131544.3849-1-victor.huesca@bootlin.com>
Message-ID: <20190805131544.3849-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds an 'outdated' entry to the program data. This entry
adds information about the outdated packages in the global and
developers mails.

A new entry in the 'localconfig' file named 'pkg-stats' that contains
the location of the JSON output of the buildroot's 'pkg-stats' script.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 58c4b2a..4f670fb 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -484,7 +484,7 @@ def parse_args():
     parser.add_argument('--branches', action='store', nargs='+', help='List of branches (blank separated)')
     parser.add_argument('--dest', action='store', nargs='+', choices=['dev', 'global'],
                         help='List of emails type to send (ie. global, dev)')
-    parser.add_argument('--data', action='store', nargs='+', choices=['autobuild'],
+    parser.add_argument('--data', action='store', nargs='+', choices=['autobuild', 'outdated'],
                         help='List of information to add in emails (blank separated)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
@@ -501,7 +501,7 @@ def __main__():
         date_str = yesterday.strftime('%Y-%m-%d')
     branches = args.branches if args.branches else get_branches()
     email_dest = set(args.dest) if args.dest else {'dev', 'global'}
-    email_data = set(args.data) if args.data else {'autobuild'}
+    email_data = set(args.data) if args.data else {'autobuild', 'outdated'}
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
@@ -515,7 +515,8 @@ def __main__():
         overall_stats = {}
         results = {}
         results_by_reason = {}
-    notifications = calculate_notifications(results, [])
+    outdate_pkg = get_outdated_pkg(localconfig.pkg_stats) if 'outdated' in email_data else []
+    notifications = calculate_notifications(results, outdate_pkg)
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
@@ -523,7 +524,7 @@ def __main__():
         developers_email(smtp, branches, notifications, date_str, args.dry_run)
     if 'global' in email_dest:
         global_email(smtp, results, results_by_reason, date_str,
-                     overall_stats, [], args.dry_run)
+                     overall_stats, outdate_pkg, args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
