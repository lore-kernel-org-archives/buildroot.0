From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 15:15:42 +0200
Subject: [Buildroot] [PATCH buildroot-test v2 2/4] utils/daily-mail: add
 outdated packages to the developer notification
In-Reply-To: <20190805131544.3849-1-victor.huesca@bootlin.com>
References: <20190805131544.3849-1-victor.huesca@bootlin.com>
Message-ID: <20190805131544.3849-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides the logic to add outdated packages to the
notification structure.
This will allow future patches to add this new data to the per-developer
emails.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index c16af54..e99f526 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -72,6 +72,7 @@ class Notification:
     def __init__(self):
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
+        self.package_version_notification = []
 
 
 def get_mklist(basepath):
@@ -160,6 +161,23 @@ def add_package_notification(branch, notifications, build_result):
     build_result['orphan'] = orphan
 
 
+def add_outdated_pkg_notification(notifications, package):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    package "maintainers".
+    '''
+    orphan = True
+    for dev in developers:
+        if package['name'] in dev.packages:
+            orphan = False
+            notif = notifications.setdefault(dev, Notification())
+            notif.package_version_notification.append(package)
+    if orphan:
+        package['orphan'] = True
+        notif = notifications.setdefault(get_orphan_developer(), Notification())
+        notif.package_version_notification.append(package)
+
+
 def shrink_str(string, length, align='right', fill='...'):
     '''
     Returns the `string` shrinked to fit `length` characters and with `fill`
@@ -394,7 +412,7 @@ def get_outdated_pkg(path):
     return sorted(s, key=lambda pkg: pkg['name'])
 
 
-def calculate_notifications(results):
+def calculate_notifications(results, outdated_pkg):
     '''
     Prepare the notifications{} dict for the notifications to individual
     developers, based on architecture developers, package developers,
@@ -408,6 +426,10 @@ def calculate_notifications(results):
                 continue
             add_arch_notification(branch, notifications, result)
             add_package_notification(branch, notifications, result)
+
+    for pkg in outdated_pkg:
+        add_outdated_pkg_notification(notifications, pkg)
+
     return notifications
 
 
@@ -449,7 +471,7 @@ def __main__():
         overall_stats = {}
         results = {}
         results_by_reason = {}
-    notifications = calculate_notifications(results)
+    notifications = calculate_notifications(results, [])
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
-- 
2.21.0
