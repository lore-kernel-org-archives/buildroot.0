From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:48 +0200
Subject: [Buildroot] [PATCH buildroot-test 10/10] utils/daily-mail: enable
 gitlab-ci emails
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-11-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enable all gitlab-ci related results added by previous
patches from the series in both the global and per-developer emails.

Defconfigs and runtime-tests entries are added in the per-branch results
for both global and dev-mails.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 6b0a1b4..c249376 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -809,7 +809,11 @@ def __main__():
         results = {}
         results_by_reason = {}
     outdated_pkgs = get_outdated_pkgs(localconfig.pkg_stats) if 'outdated' in email_data else []
-    notifications = calculate_notifications(results, outdated_pkgs, {})
+    if email_data & {'defconfig', 'runtime-test'}:
+        gitlab_ci = get_gitlab_ci(branches, date_struct, kinds=email_data)
+    else:
+        gitlab_ci = {}
+    notifications = calculate_notifications(results, outdated_pkgs, gitlab_ci)
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
@@ -817,7 +821,7 @@ def __main__():
         developers_email(smtp, branches, notifications, date_str, args.dry_run)
     if 'global' in email_dest:
         global_email(smtp, branches, results, results_by_reason, date_str,
-                     overall_stats, outdated_pkgs, {}, args.dry_run)
+                     overall_stats, outdated_pkgs, gitlab_ci, args.dry_run)
     smtp.quit()
 
 
-- 
2.21.0
