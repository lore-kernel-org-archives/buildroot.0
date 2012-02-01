From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 23:05:18 +0100
Subject: [Buildroot] [git commit] Migrate Xenomai to the new infrastructure
Message-ID: <20120201221424.A850790979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df8fa1712c06d748a6ae99b1084e480b68dd4bc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xenomai used to have commented out devices to be created in the device
table that the user had to uncomment. Use the new infrastructure to do
just that.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xenomai/xenomai.mk          |    8 ++++++--
 target/generic/device_table_dev.txt |    5 -----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index b1a492f..72100f0 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -89,8 +89,12 @@ endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
 
-# If you use static /dev creation don't forget to update your
-#  device_table_dev.txt
+define XENOMAI_DEVICES
+/dev/rtheap  c  666  0  0  10  254  0  0  -
+/dev/rtscope c  666  0  0  10  253  0  0  -
+/dev/rtp     c  666  0  0  150 0    0  1  32
+endef
+
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
 XENOMAI_DEPENDENCIES += udev
 
diff --git a/target/generic/device_table_dev.txt b/target/generic/device_table_dev.txt
index 71cd083..a3d53d4 100644
--- a/target/generic/device_table_dev.txt
+++ b/target/generic/device_table_dev.txt
@@ -141,8 +141,3 @@
 
 # I2C device nodes
 /dev/i2c-	c	666	0	0	89	0	0	1	4
-
-# Xenomai
-#/dev/rtheap     c       666     0       0       10      254     0       0       -
-#/dev/rtscope    c       666     0       0       10      253     0       0       -
-#/dev/rtp        c       666     0       0       150     0       0       1       32
