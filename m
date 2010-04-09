From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/squashfs: cleanup,
	remove support for 3.x
Message-ID: <20100409142127.1F22320E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f5c3ccdceac58b2a4af6fc22fb49041462cc04f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the code to build squashfs-tools for the host, since they can
now be built using package/squashfs.

We also remove support for Squashfs 3.x, because the Squashfs driver
merged inside the mainline kernel is a 4.x driver. So 3.x is only
useful for old kernels using a Squashfs patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/squashfs/Config.in                          |   28 ---------
 .../squashfs/squashfs-3.4-build-system-fix.patch   |   28 ---------
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   65 --------------------
 target/squashfs/squashfsroot.mk                    |   52 +---------------
 4 files changed, 2 insertions(+), 171 deletions(-)
 delete mode 100644 target/squashfs/squashfs-3.4-build-system-fix.patch
 delete mode 100644 target/squashfs/squashfs-4.0-build-system-fix.patch

diff --git a/target/squashfs/Config.in b/target/squashfs/Config.in
index 9259ba3..6cc8fca 100644
--- a/target/squashfs/Config.in
+++ b/target/squashfs/Config.in
@@ -1,32 +1,4 @@
 config BR2_TARGET_ROOTFS_SQUASHFS
 	bool "squashfs root filesystem"
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a squashfs root filesystem
-
-choice
-	prompt "Squashfs version"
-	default BR2_TARGET_ROOTFS_SQUASHFS_4
-	depends on BR2_TARGET_ROOTFS_SQUASHFS
-	help
-	  Select squashfs version - This must match what your kernel
-	  supports. Select 3.x if you use the legacy 3.x kernel
-	  patches (pre 2.6.29), and 4.x otherwise.
-
-config BR2_TARGET_ROOTFS_SQUASHFS_3
-       depends on BR2_DEPRECATED || BR2_RECENT
-       bool "3.x"
-       help
-         Select this if you use the legacy 3.x kernel patches (pre 2.6.29)
-
-config BR2_TARGET_ROOTFS_SQUASHFS_4
-       bool "4.x"
-       help
-         Select this if you use the squashfs version in mainline (from 2.6.29)
-
-endchoice
-
-config BR2_TARGET_ROOTFS_SQUASHFS_VERSION
-	string
-	default "3.4"	if BR2_TARGET_ROOTFS_SQUASHFS_3
-	default "4.0"	if BR2_TARGET_ROOTFS_SQUASHFS_4
diff --git a/target/squashfs/squashfs-3.4-build-system-fix.patch b/target/squashfs/squashfs-3.4-build-system-fix.patch
deleted file mode 100644
index 5b86b00..0000000
--- a/target/squashfs/squashfs-3.4-build-system-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-[PATCH]: squashfs-tools: Handle user supplied CFLAGS/LDFLAGS
-
-Properly handle make CFLAGS=.. LDFLAGS=..
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- squashfs-tools/Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: squashfs3.4/squashfs-tools/Makefile
-===================================================================
---- squashfs3.4.orig/squashfs-tools/Makefile
-+++ squashfs3.4/squashfs-tools/Makefile
-@@ -2,12 +2,12 @@ INSTALL_DIR = /usr/local/bin
- 
- INCLUDEDIR = .
- 
--CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
-+override CFLAGS += -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
- 
- all: mksquashfs unsquashfs
- 
- mksquashfs: mksquashfs.o read_fs.o sort.o
--	$(CC) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
- 
- mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h
- 
diff --git a/target/squashfs/squashfs-4.0-build-system-fix.patch b/target/squashfs/squashfs-4.0-build-system-fix.patch
deleted file mode 100644
index 7ba0ab9..0000000
--- a/target/squashfs/squashfs-4.0-build-system-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Fix the build system so that CFLAGS can be overriden on the command
-line to pass additionnal -I options.
-
-Patch borrowed from OpenEmbedded.
-
-Index: squashfs-4.0/squashfs-tools/Makefile
-===================================================================
---- squashfs-4.0.orig/squashfs-tools.orig/Makefile	2009-04-19 01:47:43.000000000 +0200
-+++ squashfs-4.0/squashfs-tools/Makefile	2009-04-19 01:52:36.000000000 +0200
-@@ -1,36 +1,48 @@
- INSTALL_DIR = /usr/local/bin
- 
- INCLUDEDIR = .
-+CFLAGS_R = -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE
-+LIBS = -lz -lpthread
- 
- CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
- 
- all: mksquashfs unsquashfs
- 
- mksquashfs: mksquashfs.o read_fs.o sort.o swap.o pseudo.o
--	$(CC) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
- 
- mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h squashfs_swap.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- read_fs.o: read_fs.c squashfs_fs.h read_fs.h global.h squashfs_swap.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- sort.o: sort.c squashfs_fs.h global.h sort.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- swap.o: swap.c Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- pseudo.o: pseudo.c pseudo.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- unsquashfs: unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o
--	$(CC) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
- 
--unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
-+unsquashfs.o: unsquashfs.c unsquashfs.h squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-1.o: unsquashfs.h unsquash-1.c squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-1.o: unsquash-1.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-2.o: unsquashfs.h unsquash-2.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-2.o: unsquash-2.c unsquashfs.h unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-3.o: unsquashfs.h unsquash-3.c squashfs_fs.h squashfs_compat.h global.h Makefile
-+unsquash-3.o: unsquash-3.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
--unsquash-4.o: unsquashfs.h unsquash-4.c squashfs_fs.h squashfs_swap.h global.h Makefile
-+unsquash-4.o: unsquash-4.c unsquashfs.h squashfs_fs.h squashfs_swap.h global.h Makefile
-+	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
- 
- clean:
- 	-rm -f *.o mksquashfs unsquashfs
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index 63adc5c..01c4dab 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -1,52 +1,12 @@
 #############################################################
 #
-# mksquashfs to build to target squashfs filesystems
-#
-#############################################################
-SQUASHFS_VERSION:=$(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_VERSION))
-SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
-SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
-SQUASHFS_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(SQUASHFS_SOURCE):
-	 $(call DOWNLOAD,$(SQUASHFS_SITE),$(SQUASHFS_SOURCE))
-
-$(SQUASHFS_DIR)/.unpacked: $(DL_DIR)/$(SQUASHFS_SOURCE) #$(SQUASHFS_PATCH)
-	$(SQUASHFS_CAT) $(DL_DIR)/$(SQUASHFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(SQUASHFS_DIR) target/squashfs/ squashfs-$(SQUASHFS_VERSION)-\*.patch
-	touch $@
-
-$(SQUASHFS_DIR)/squashfs-tools/mksquashfs: $(SQUASHFS_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(SQUASHFS_DIR)/squashfs-tools
-
-squashfs: host-zlib $(SQUASHFS_DIR)/squashfs-tools/mksquashfs
-
-squashfs-source: $(DL_DIR)/$(SQUASHFS_SOURCE)
-
-squashfs-clean:
-	-$(MAKE) -C $(SQUASHFS_DIR)/squashfs-tools clean
-
-squashfs-dirclean:
-	rm -rf $(SQUASHFS_DIR)
-
-#############################################################
-#
 # Build the squashfs root filesystem image
 #
 #############################################################
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_3),y)
-# 4.x is always little endian
-ifeq ($(BR2_ENDIAN),"BIG")
-SQUASHFS_ENDIANNESS=-be
-else
-SQUASHFS_ENDIANNESS=-le
-endif
-endif
 
 SQUASHFS_TARGET:=$(IMAGE).squashfs
 
-squashfsroot: host-fakeroot makedevs squashfs
+squashfsroot: host-fakeroot host-squashfs makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	touch $(BUILD_DIR)/.fakeroot.00000
@@ -58,7 +18,7 @@ ifneq ($(TARGET_DEVICE_TABLE),)
 		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 endif
 	# Use fakeroot so mksquashfs believes the previous fakery
-	echo "$(SQUASHFS_DIR)/squashfs-tools/mksquashfs " \
+	echo "$(HOST_DIR)/usr/bin/mksquashfs " \
 		    "$(TARGET_DIR) $(SQUASHFS_TARGET) " \
 		    "-noappend $(SQUASHFS_ENDIANNESS)" \
 		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
@@ -67,14 +27,6 @@ endif
 	chmod 0644 $(SQUASHFS_TARGET)
 	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 
-squashfsroot-source: squashfs-source
-
-squashfsroot-clean:
-	-$(MAKE) -C $(SQUASHFS_DIR) clean
-
-squashfsroot-dirclean:
-	rm -rf $(SQUASHFS_DIR)
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
