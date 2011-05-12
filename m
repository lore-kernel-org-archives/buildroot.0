From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 May 2011 17:21:06 +0200
Subject: [Buildroot] [git commit] target/generic: only show getty port
	option if default skeleton is used
Message-ID: <20110512153807.1D5B4834DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7d9d09db673abbedc1cc865c213b742e0450268d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The special marker in etc/inittab might not be present with a custom
skeleton. At the same time make the option always active, remove the
hardcoded tty1/tty2 gettys and reword the option description slightly.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/skeleton/etc/inittab    |    4 ----
 target/generic/Config.in   |    9 +++------
 target/generic/Makefile.in |    2 +-
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/skeleton/etc/inittab b/fs/skeleton/etc/inittab
index 873db29..b1e5c16 100644
--- a/fs/skeleton/etc/inittab
+++ b/fs/skeleton/etc/inittab
@@ -22,10 +22,6 @@ null::sysinit:/bin/hostname -F /etc/hostname
 # now run any rc scripts
 ::sysinit:/etc/init.d/rcS
 
-# Set up a couple of getty's
-tty1::respawn:/sbin/getty 38400 tty1
-tty2::respawn:/sbin/getty 38400 tty2
-
 # Put a getty on the serial port
 #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index c624ba8..2d2ad44 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -12,13 +12,10 @@ config BR2_TARGET_GENERIC_ISSUE
        help
          Select system banner (/etc/issue) to be displayed at login.
 
-menuconfig BR2_TARGET_GENERIC_GETTY
-	bool "Generic serial port config"
-
-if BR2_TARGET_GENERIC_GETTY
+if BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_TARGET_GENERIC_GETTY_PORT
-	string "Serial port to run a getty on"
+	string "Port to run a getty (login prompt) on"
 	default "ttyS0"
 	help
 	  Specify a port to run a getty (login prompt) on.
@@ -52,6 +49,6 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 	default "57600"		if BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600
 	default "115200"	if BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200
 
-endif # BR2_TARGET_GENERIC_GETTY
+endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 endmenu
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index ba6e4b0..ce07ecf 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -31,7 +31,7 @@ ifneq ($(TARGET_GENERIC_ISSUE),)
 TARGETS += target-generic-issue
 endif
 
-ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
 else
-- 
1.7.3.4
