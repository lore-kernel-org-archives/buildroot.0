From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 09:22:07 +0200
Subject: [Buildroot] [PATCH] eudev: improve S10udev script for startup
Message-ID: <1413098527-17162-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Paul Cercueil <paul@crapouillou.net>

This commit adjusts the S10udev script by:

 * Using the --action=add option to udevadm trigger. By default, only
   the "change" events are handled by 'udevadm trigger', which means
   it doesn't handle all the "device add" events that occured during
   the boot time, before eudev was started.

 * Adds a call to 'udevadm settle' to make sure we wait for udev to
   handle all the events that occured before eudev was started.

Both of these change match what the Ubuntu and Debian udev startup
scripts are doing.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/S10udev | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index e00aa91..107dfd5 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -30,7 +30,8 @@ case "$1" in
         printf "Populating ${udev_root:-/dev} using udev: "
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
-        udevadm trigger
+        udevadm trigger --action=add
+        udevadm settle
         echo "done"
         ;;
     stop)
-- 
2.0.0
