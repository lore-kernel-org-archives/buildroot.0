From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 07:34:40 +0200
Subject: [Buildroot] [git commit] eudev: don't test if the binary exists in
 the init script
Message-ID: <20180416053717.DCEA388325@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6246ea7d14809cab4e0737f07f43fd026e2d008c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test doesn't make sense. It just exits with error code 5 if the
binary doesn't exist, which is silly. Buildroot installs both udevd and
its init script as part of the same package. But if it ever happens for
some reason, the error message "/sbin/udevd: No such file or directory"
in the start case should be pretty clear.

Replace the UDEV_BIN variable, which was used only once, by the full
path of the binary file.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/eudev/S10udev | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 47c715c886..4e799d6507 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -16,10 +16,6 @@
 #	/dev/zero, /dev/null -- that's needed to boot and run this script.
 #
 
-# Check for missing binaries
-UDEV_BIN=/sbin/udevd
-test -x $UDEV_BIN || exit 5
-
 # Check for config file and read it
 UDEV_CONFIG=/etc/udev/udev.conf
 test -r $UDEV_CONFIG || exit 6
@@ -29,7 +25,7 @@ case "$1" in
     start)
         printf "Populating %s using udev: " "${udev_root:-/dev}"
         [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        $UDEV_BIN -d || { echo "FAIL"; exit 1; }
+        /sbin/udevd -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
         udevadm settle --timeout=30 || echo "udevadm settle failed"
