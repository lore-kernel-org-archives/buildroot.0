From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:43 +0200
Subject: [Buildroot] [PATCH buildroot-test 05/10] utils/daily-mail: add
 runtime tests support in developers notifications
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-6-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds runtime-test job failures in the 'Notification'
structure.
This will allow to inform developers about failures related to the
runtime-tests they maintains.

This patch relys on the gitlab-ci infrasture introduced earlier on in
this series as well as the patch adding support for runtime-tests in the
getdeveloperlib already applied to master.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/utils/daily-mail b/utils/daily-mail
index 5a44fad..5e8799a 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -78,6 +78,7 @@ class Notification:
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
         self.defconfig_notifications = defaultdict(list)
+        self.runtime_test_notifications = defaultdict(list)
         self.package_version_notification = []
 
 
@@ -184,6 +185,23 @@ def add_defconfig_notification(branch, notifications, job):
         notif.defconfig_notifications[branch].append(job)
 
 
+def add_runtime_test_notification(branch, notifications, job):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    runtime-tests "maintainers".
+    '''
+    orphan = True
+    for dev in developers:
+        if job['full_name'] in dev.runtime_tests:
+            orphan = False
+            notif = notifications.setdefault(dev, Notification())
+            notif.runtime_test_notifications[branch].append(job)
+    if orphan:
+        job['orphan'] = True
+        notif = notifications.setdefault(get_orphan_developer(), Notification())
+        notif.runtime_test_notifications[branch].append(job)
+
+
 def add_outdated_pkg_notification(notifications, package):
     '''
     Add to the notifications{} dict notifications that are related to
@@ -672,6 +690,8 @@ def calculate_notifications(results, outdated_pkgs, gitlab_results):
             for job in pipeline['jobs']:
                 if job['kind'] == 'defconfig':
                     add_defconfig_notification(branch, notifications, job)
+                elif job['kind'] == 'runtime-test':
+                    add_runtime_test_notification(branch, notifications, job)
 
     return notifications
 
-- 
2.21.0
