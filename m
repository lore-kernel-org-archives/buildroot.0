From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:43 +0200
Subject: [Buildroot] [PATCH buildroot-test 4/9] utils/daily-mail: remove the
 unnecessary 'get_notification_for_dev' function
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-5-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python dictionaries provide a way to return a value associated to a key
while adding the corresponding entry in case the key doesn't exists yet
(it acts like a default_dict from itertools).
Since the 'get_notification_for_dev' does exactly that, this patch
remove this function and replace it by the build-in
`dict.setdefault(key, value)`.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index f6a55a6..12f909e 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -85,15 +85,6 @@ def get_mklist(basepath):
 mklist = get_mklist(localconfig.brbase)
 
 
-def get_notification_for_dev(notifications, dev):
-    if dev in notifications:
-        return notifications[dev]
-    else:
-        n = Notification()
-        notifications[dev] = n
-        return n
-
-
 def add_arch_notification(branch, notifications, build_result):
     '''
     Add to the notifications{} dict notifications that are related to
@@ -103,7 +94,7 @@ def add_arch_notification(branch, notifications, build_result):
     for dev in developers:
         if arch not in dev.architectures:
             continue
-        n = get_notification_for_dev(notifications, dev)
+        n = notifications.setdefault(dev, Notification())
         n.arch_notifications[branch].append(build_result)
 
 
@@ -153,11 +144,11 @@ def add_package_notification(branch, notifications, build_result):
         if pkg not in dev.packages:
             continue
         orphan = False
-        n = get_notification_for_dev(notifications, dev)
+        n = notifications.setdefault(dev, Notification())
         n.package_notifications[branch].append(build_result)
     if orphan:
         dev = get_orphan_developer()
-        n = get_notification_for_dev(notifications, dev)
+        n = notifications.setdefault(dev, Notification())
         n.package_notifications[branch].append(build_result)
     build_result['orphan'] = orphan
 
-- 
2.21.0
