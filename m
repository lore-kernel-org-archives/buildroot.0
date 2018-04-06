From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:55:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] eudev: prevent udev init
 script nonexistent directory error
Message-ID: <20180406165914.155918104E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c118173cc3145a53c64ad6f03bb029d5187ace9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The following error occures in the udev init script because the kernel config
may optionally not include uevent_helper.

/etc/init.d/S10udev: line 47: can't create /proc/sys/kernel/hotplug: nonexistent directory

Work around this by not trying to access the destination if it's not available.

Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cbe725d755006e41a71180b5786fa9f52104f518)
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
