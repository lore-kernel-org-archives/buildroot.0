From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 29 Aug 2019 15:23:42 +0200
Subject: [Buildroot] [PATCH buildroot-test 04/10] utils/daily-mail: add
 defconfig support in developers notifications
In-Reply-To: <20190829132348.1603-1-victor.huesca@bootlin.com>
References: <20190829132348.1603-1-victor.huesca@bootlin.com>
Message-ID: <20190829132348.1603-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds defconfig job failures in the 'Notification' structure.
This will allow to inform developers about failures related to the
defconfigs they maintains.

This patch relys on the gitlab-ci infrasture introduced earlier on in
this series as well as the patch adding support for defconfig in the
getdeveloperlib already applied to master.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index 53500a6..5a44fad 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -77,6 +77,7 @@ class Notification:
     def __init__(self):
         self.arch_notifications = defaultdict(list)
         self.package_notifications = defaultdict(list)
+        self.defconfig_notifications = defaultdict(list)
         self.package_version_notification = []
 
 
@@ -166,6 +167,23 @@ def add_package_notification(branch, notifications, build_result):
     build_result['orphan'] = orphan
 
 
+def add_defconfig_notification(branch, notifications, job):
+    '''
+    Add to the notifications{} dict notifications that are related to
+    defconfig "maintainers".
+    '''
+    orphan = True
+    for dev in developers:
+        if job['name'] in dev.defconfigs:
+            orphan = False
+            notif = notifications.setdefault(dev, Notification())
+            notif.defconfig_notifications[branch].append(job)
+    if orphan:
+        job['orphan'] = True
+        notif = notifications.setdefault(get_orphan_developer(), Notification())
+        notif.defconfig_notifications[branch].append(job)
+
+
 def add_outdated_pkg_notification(notifications, package):
     '''
     Add to the notifications{} dict notifications that are related to
@@ -631,7 +649,7 @@ def get_gitlab_ci(branches, date, date_range=None, kinds=None):
     return pipelines
 
 
-def calculate_notifications(results, outdated_pkgs):
+def calculate_notifications(results, outdated_pkgs, gitlab_results):
     '''
     Prepare the notifications{} dict for the notifications to individual
     developers, based on architecture developers, package developers,
@@ -649,6 +667,12 @@ def calculate_notifications(results, outdated_pkgs):
     for pkg in outdated_pkgs:
         add_outdated_pkg_notification(notifications, pkg)
 
+    for branch, pipelines in gitlab_results.iteritems():
+        for pipeline in pipelines:
+            for job in pipeline['jobs']:
+                if job['kind'] == 'defconfig':
+                    add_defconfig_notification(branch, notifications, job)
+
     return notifications
 
 
@@ -691,7 +715,7 @@ def __main__():
         results = {}
         results_by_reason = {}
     outdated_pkgs = get_outdated_pkgs(localconfig.pkg_stats) if 'outdated' in email_data else []
-    notifications = calculate_notifications(results, outdated_pkgs)
+    notifications = calculate_notifications(results, outdated_pkgs, {})
     smtp = smtplib.SMTP(localconfig.smtphost, localconfig.smtpport)
     smtp.starttls()
     smtp.login(localconfig.smtpuser, localconfig.smtppass)
-- 
2.21.0
