From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Apr 2010 11:06:51 +0200
Subject: [Buildroot] [PATCH 13/44] target/cloop: cleanup
In-Reply-To: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
Message-ID: <57579378e1812123c4c120526c05b84e8a79944d.1270803901.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the code to build the cloop utilities for the host (it is now
in package/cloop).

Use fakeroot instead of ugly sudo. The cloop filesystem generation
code is now much more similar to other filesystems code.

Remove empty Makefile.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/cloop/Makefile.in |    3 -
 target/cloop/cloop.mk    |  133 +++++++++------------------------------------
 2 files changed, 27 insertions(+), 109 deletions(-)
 delete mode 100644 target/cloop/Makefile.in

diff --git a/target/cloop/Makefile.in b/target/cloop/Makefile.in
deleted file mode 100644
index 0afc58f..0000000
--- a/target/cloop/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(BR2_TARGET_ROOTFS_CLOOP),y)
-TARGETS+=clooproot
-endif
diff --git a/target/cloop/cloop.mk b/target/cloop/cloop.mk
index 059dd6c..ccdb2b4 100644
--- a/target/cloop/cloop.mk
+++ b/target/cloop/cloop.mk
@@ -1,108 +1,29 @@
 #############################################################
 #
-# mkcloop to build to target cloop filesystems
-#
-#############################################################
-CLOOP_VERSION=2.06
-CLOOP_DIR=$(BUILD_DIR)/cloop-$(CLOOP_VERSION)
-CLOOP_SOURCE=cloop_$(CLOOP_VERSION)-2.tar.gz
-CLOOP_SITE=http://debian-knoppix.alioth.debian.org/sources/
-
-CLOOP_TARGET:=$(IMAGE).cloop
-### Note: not used yet! ck
-### $(DL_DIR)/$(CLOOP_PATCH1):
-### $(call DOWNLOAD,$(CLOOP_PATCH1_URL),$(CLOOP_PATCH1))
-
-$(DL_DIR)/$(CLOOP_SOURCE):
-	 $(call DOWNLOAD,$(CLOOP_SITE),$(CLOOP_SOURCE))
-
-$(CLOOP_DIR)/.unpacked: $(DL_DIR)/$(CLOOP_SOURCE) ### $(DL_DIR)/$(CLOOP_PATCH1)
-	$(ZCAT) $(DL_DIR)/$(CLOOP_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch $@
-### $(ZCAT) $(DL_DIR)/$(CLOOP_PATCH1) | patch -p1 -d $(CLOOP_DIR)
-### toolchain/patch-kernel.sh $(CLOOP_DIR) target/cloop/ cloop\*.patch
-
-$(CLOOP_DIR)/create_compressed_fs: $(CLOOP_DIR)/.unpacked
-	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(CLOOP_DIR) \
-		APPSONLY=yes -j1
-
-cloop: $(CLOOP_DIR)/create_compressed_fs
-
-cloop-source: $(DL_DIR)/$(CLOOP_SOURCE)
-
-cloop-clean:
-	-$(MAKE) -C $(CLOOP_DIR) clean
-
-cloop-dirclean:
-	rm -rf $(CLOOP_DIR)
-
-#############################################################
-#
-# Build the cloop.o kernel module for the HOST
-#
-#############################################################
-
-$(CLOOP_DIR)/cloop.o: $(CLOOP_DIR)/create_compressed_fs
-	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(CLOOP_DIR) -j1
-
-cloop-module: $(CLOOP_DIR)/cloop.o
-
-#############################################################
-#
-# Build the cloop root filesystem image
-#
-# Note: we need additionall host tools:
-# required:
-# mkisofs 2.01a34-unofficial-iconv from http://users.utu.fi/jahhein/mkisofs/
-# optional:
-# symlinks: scan/change symbolic links - v1.2 - by Mark Lord
-# from ftp://ftp.ibiblio.org/pub/Linux/utils/file/
-#
-#############################################################
-
-### Note: target/default/device_table.txt is not yet supported! ck
-# the quickfix is to use sudo to mount the previous created cramroot
-check-tools:
-	- which symlinks && symlinks -r $(TARGET_DIR)
-
-$(IMAGE).cramfs: cramfsroot
-
-clooproot: cloop check-tools $(IMAGE).cramfs
-	### $(CLOOP_DIR)/create_compressed_fs -q -D target/default/device_table.txt $(TARGET_DIR) $(CLOOP_TARGET)
-	## mkisofs -r $(TARGET_DIR) | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
-	sudo mkdir -p /mnt/compressed
-	sudo mount -o ro,loop -t cramfs $(IMAGE).cramfs /mnt/compressed
-	mkisofs -r /mnt/compressed | $(CLOOP_DIR)/create_compressed_fs - 65536 > $(CLOOP_TARGET)
-	- symlinks -r /mnt/compressed
-	sudo umount /mnt/compressed
-	@echo "Mounting a compressed image:"
-	@echo " sudo mkdir -p /mnt/compressed"
-	@echo " sudo /sbin/insmod cloop"
-	@echo " sudo /sbin/losetup /dev/cloop1 $(CLOOP_TARGET)"
-	@echo " sudo mount -o ro -t iso9660 /dev/cloop1 /mnt/compressed"
-
-clooproot-source: cloop-source
-
-clooproot-clean:
-	-$(MAKE) -C $(CLOOP_DIR) clean
-
-clooproot-dirclean:
-	rm -rf $(CLOOP_DIR)
-
-#############################################################
-# symlinks -r /mnt/compressed
-# dangling: /mnt/compressed/dev/log -> /tmp/log
-# other_fs: /mnt/compressed/etc/mtab -> /proc/mounts
-# other_fs: /mnt/compressed/var/lib/pcmcia -> /tmp
-# other_fs: /mnt/compressed/var/lock -> /tmp
-# other_fs: /mnt/compressed/var/log -> /tmp
-# other_fs: /mnt/compressed/var/pcmcia -> /tmp
-# other_fs: /mnt/compressed/var/run -> /tmp
-# other_fs: /mnt/compressed/var/spool -> /tmp
-# other_fs: /mnt/compressed/var/tmp -> /tmp
-#
-# ls -lrsS root_fs_*.*
-# 1296 -rw-r--r-- 1 claus users 1325478 Mar 13 16:52 root_fs_powerpc.cloop
-# 1448 -rw-r--r-- 1 claus users 1482752 Mar 13 16:52 root_fs_powerpc.cramfs
-# 1840 -rw-r--r-- 1 claus users 1883408 Mar 13 13:14 root_fs_powerpc.jffs2
-#############################################################
+# Build the compressed loop root filesystem image
+#
+#############################################################
+
+CLOOP_TARGET=$(IMAGE).cloop
+CLOOP_FAKEROOT_SCRIPT=$(BUILD_DIR)/_fakeroot.$(notdir $(CLOOP_TARGET))
+
+clooproot: host-cloop host-cdrkit host-fakeroot
+	rm -f $(CLOOP_FAKEROOT_SCRIPT)
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(CLOOP_FAKEROOT_SCRIPT)
+	# Use fakeroot to pretend all target binaries are owned by root
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(CLOOP_FAKEROOT_SCRIPT)
+ifneq ($(TARGET_DEVICE_TABLE),)
+	# Use fakeroot to pretend to create all needed device nodes
+	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+		>> $(CLOOP_FAKEROOT_SCRIPT)
+endif
+	# Use fakeroot so genisoimage believes the previous fakery
+	echo "$(HOST_DIR)/usr/bin/genisoimage -r $(TARGET_DIR) | $(HOST_DIR)/usr/bin/create_compressed_fs - 65536 > $(CLOOP_TARGET)" >> $(CLOOP_FAKEROOT_SCRIPT)
+	chmod a+x $(CLOOP_FAKEROOT_SCRIPT)
+	$(HOST_DIR)/usr/bin/fakeroot -- $(CLOOP_FAKEROOT_SCRIPT)
+	- at rm -f $(CLOOP_FAKEROOT_SCRIPT)
+
+ifeq ($(BR2_TARGET_ROOTFS_CLOOP),y)
+TARGETS+=clooproot
+endif
-- 
1.6.3.3
