From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 21 Sep 2010 15:45:41 +0200
Subject: [Buildroot] Fail to automatically create if-scripts dirs
Message-ID: <4C98B705.5080704@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the case of creating devices via mdev/udev I wanted to create those missing dirs in 

output/target/etc/network/

Here is what I'm doing:

Index: b/fs/common.mk
===================================================================
--- a/fs/common.mk	2010-09-21 15:35:52.000000000 +0200
+++ b/fs/common.mk	2010-09-21 15:39:31.000000000 +0200
@@ -33,6 +33,7 @@
 
 FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 ROOTFS_DEVICE_TABLE = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE))
+NET_DIRS = if-down.d if-post-down.d if-post-down.d if-up.d
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -45,6 +46,10 @@
 	echo "chown -R 0:0 $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 ifneq ($(ROOTFS_DEVICE_TABLE),)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(ROOTFS_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
+else
+	for i in $(NET_DIRS) ; do \
+		[ -d $(TARGET_DIR)/etc/network/$$i ] || mkdir $(TARGET_DIR)/etc/network/$$i; \
+	done
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)

As result the folders will not be created and even if I replace test & mkdir with echo $$i, I can just see 4 blank lines, but $$i doesn't show the value it should. 

What am I doing wrong?

Regards,
Yegor
