From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:46 +0200
Subject: [Buildroot] [PATCH buildroot-test 7/9] utils/daily-mail: change
 variable name to be more explicit
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-8-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace 'k' and 'v' variables in favor of 'dev' and 'notif'.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 4cc5345..6786caa 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -207,8 +207,8 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
     '''
     Send the e-mails to the individual developers
     '''
-    for k, v in notifications.iteritems():
-        to = k.name
+    for dev, notif in notifications.iteritems():
+        to = dev.name
         email_from = localconfig.fromaddr
         subject = "[%s] Your build results for %s" % (baseurl, datestr)
         contents = "Hello,\n\n"
@@ -218,11 +218,11 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
                                   "investigating those build failures and sending patches to fix them. "
                                   "Thanks!" % datestr)
         contents += "\n\n"
-        show_orphan = k.name == ORPHAN_DEVELOPER
+        show_orphan = dev.name == ORPHAN_DEVELOPER
 
         for branch in branches:
-            archs = v.arch_notifications.get(branch, [])
-            packages = v.package_notifications.get(branch, [])
+            archs = notif.arch_notifications.get(branch, [])
+            packages = notif.package_notifications.get(branch, [])
 
             if len(archs) == 0 and len(packages) == 0:
                 continue
@@ -257,7 +257,7 @@ def developers_email(smtp, branches, notifications, datestr, dry_run):
             msg['From'] = email_from
             msg['Date'] = formatdate()
             smtp.sendmail(email_from, to, msg.as_string())
-            print "To: %s" % k.name
+            print "To: %s" % dev.name
 
 
 def global_email_branch_result(results, results_by_reason, branch):
-- 
2.21.0
