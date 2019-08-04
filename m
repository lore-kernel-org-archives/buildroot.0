From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 17:25:32 +0200
Subject: [Buildroot] [buildroot-test 1/5] utils/daily-mail: introduce
 argparse to ease modularity of the script
In-Reply-To: <20190804152536.17829-1-victor.huesca@bootlin.com>
References: <20190804152536.17829-1-victor.huesca@bootlin.com>
Message-ID: <20190804152536.17829-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having an actual argument parser instead of manually checking for
command-line arguments will allow future patches to add divers options
to the script. This patch only introduce the parser with the 'dry-run'
argument.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 2d5e684..d4c69f6 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -12,6 +12,7 @@ import localconfig
 import csv
 from collections import defaultdict
 import math
+import argparse
 
 sys.path.append(os.path.join(localconfig.brbase, "utils"))
 import getdeveloperlib  # noqa: E402
@@ -379,7 +380,14 @@ def calculate_notifications(results):
     return notifications
 
 
+def parse_args():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--dry-run', action='store_true', help='Do not send email, only show output')
+    return parser.parse_args()
+
+
 def __main__():
+    args = parse_args()
     yesterday = date.today() - timedelta(1)
     yesterday_str = yesterday.strftime('%Y-%m-%d')
     branches = get_branches()
@@ -392,15 +400,12 @@ def __main__():
     results = get_build_results(db, yesterday_str, branches)
     results_by_reason = get_build_results_grouped_by_reason(db, yesterday_str, branches)
     notifications = calculate_notifications(results)
-    dry_run = False
-    if len(sys.argv) == 2 and sys.argv[1] == "--dry-run":
-        dry_run = True
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
-    developers_email(smtp, branches, notifications, yesterday_str, dry_run)
+    developers_email(smtp, branches, notifications, yesterday_str, args.dry_run)
     global_email(smtp, results, results_by_reason, yesterday_str,
-                 overall_stats, dry_run)
+                 overall_stats, args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
