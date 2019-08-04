From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:35 +0200
Subject: [Buildroot] [buildroot-test 4/5] utils/daily-mail: allow to select
 only a subset of emails to send
In-Reply-To: <20190804152536.17829-1-victor.huesca@bootlin.com>
References: <20190804152536.17829-1-victor.huesca@bootlin.com>
Message-ID: <20190804152536.17829-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to send the global email and the per-developer email
separately by specifying the destination as command-line argument.
The default behavior -- when no destination is provided -- is to select
both the global and developers emails.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 040ee15..4407438 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -388,6 +388,8 @@ def parse_args():
     parser.add_argument('--dry-run', action='store_true', help='Do not send email, only show output')
     parser.add_argument('--date', action='store', help='Use this date instead of yesterday')
     parser.add_argument('--branches', action='store', nargs='+', help='List of branches (blank separated)')
+    parser.add_argument('--dest', action='store', nargs='+', choices=['dev', 'global'],
+                        help='List of emails type to send (ie. global, dev)')
     args = parser.parse_args()
     if args.date and not RE_DATE.match(args.date):
         parser.error('date must be in format YYYY-MM-DD')
@@ -402,6 +404,7 @@ def __main__():
         yesterday = date.today() - timedelta(1)
         yesterday_str = yesterday.strftime('%Y-%m-%d')
     branches = args.branches if args.branches else get_branches()
+    email_dest = set(args.dest) if args.dest else {'dev', 'global'}
 
     db = _mysql.connect(host=localconfig.host,
                         user=localconfig.user,
@@ -414,9 +417,11 @@ def __main__():
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
-    developers_email(smtp, branches, notifications, yesterday_str, args.dry_run)
-    global_email(smtp, results, results_by_reason, yesterday_str,
-                 overall_stats, args.dry_run)
+    if 'dev' in email_dest:
+        developers_email(smtp, branches, notifications, yesterday_str, args.dry_run)
+    if 'global' in email_dest:
+        global_email(smtp, results, results_by_reason, yesterday_str,
+                     overall_stats, args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
