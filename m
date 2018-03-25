From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 21:37:11 +0200
Subject: [Buildroot] [git commit] eudev: prevent udev init script
 nonexistent directory error
Message-ID: <20180325193829.462A583B57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe725d755006e41a71180b5786fa9f52104f518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following error occures in the udev init script because the kernel config
may optionally not include uevent_helper.

/etc/init.d/S10udev: line 47: can't create /proc/sys/kernel/hotplug: nonexistent directory

Work around this by not trying to access the destination if it's not available.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 640fec625b..47c715c886 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -28,7 +28,7 @@ test -r $UDEV_CONFIG || exit 6
 case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
-        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
+        [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
