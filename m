From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  4 Feb 2007 08:34:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma
	target/x86/grub target/x86/ etc...
Message-ID: <20070204163456.F0C6E48621@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-04 08:34:56 -0800 (Sun, 04 Feb 2007)
New Revision: 17763

Log:
- avoid spurious rebuilds. Thanks to janlana, closes #1191
- provide a syslinux-source target while at it


Modified:
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/target/x86/grub/grub.mk
   trunk/buildroot/target/x86/syslinux/syslinux.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-02-04 16:30:07 UTC (rev 17762)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-02-04 16:34:56 UTC (rev 17763)
@@ -12,8 +12,8 @@
 LZMA_CFLAGS:=$(TARGET_CFLAGS)
 ifeq ($(BR2_LARGEFILE),y)
 LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-else
 endif
+LZMA_TARGET_BINARY:=bin/lzma
 
 $(DL_DIR)/$(LZMA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LZMA_SITE)/$(LZMA_SOURCE)
@@ -81,14 +81,14 @@
 	$(MAKE) -C $(LZMA_TARGET_DIR) all
 	touch -c $@
 
-$(TARGET_DIR)/usr/bin/lzma: $(LZMA_TARGET_DIR)/src/lzma/lzma
-	-cp -dpf $(LZMA_TARGET_DIR)/src/lzma/lzma $(TARGET_DIR)/bin/;
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/bin/lzma
-	touch -c $(TARGET_DIR)/bin/lzma
+$(TARGET_DIR)/$(LZMA_TARGET_BINARY): $(LZMA_TARGET_DIR)/src/lzma/lzma
+	cp -dpf $(LZMA_TARGET_DIR)/src/lzma/lzma $@
+	-$(STRIP) --strip-unneeded $@
+	touch -c $@
 
-#lzma-headers: $(TARGET_DIR)/bin/lzma
+#lzma-headers: $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
 
-lzma-target: uclibc $(TARGET_DIR)/usr/bin/lzma
+lzma-target: uclibc $(TARGET_DIR)/$(LZMA_TARGET_BINARY)
 
 lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
 

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-02-04 16:30:07 UTC (rev 17762)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-02-04 16:34:56 UTC (rev 17763)
@@ -27,7 +27,7 @@
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub
-GRUB_TARGET_BINARY:=bin/grub
+GRUB_TARGET_BINARY:=sbin/grub
 GRUB_SPLASHIMAGE=$(TOPDIR)/target/x86/grub/splash.xpm.gz
 
 
@@ -93,21 +93,22 @@
 		--disable-auto-linux-mem-opt \
 		$(GRUB_CONFIG-y) \
 	);
-	touch  $@
+	touch $@
 
 $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
 
-grub-target_binary: $(GRUB_DIR)/$(GRUB_BINARY)
-	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/sbin/
+$(GRUB_DIR)/.installed: $(GRUB_DIR)/$(GRUB_BINARY)
+	cp $(GRUB_DIR)/$(GRUB_BINARY) $(TARGET_DIR)/$(GRUB_TARGET_BINARY)
 	test -d $(TARGET_DIR)/boot/grub || mkdir -p $(TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage1/stage1 $(GRUB_DIR)/stage2/*1_5 $(GRUB_DIR)/stage2/stage2 $(TARGET_DIR)/boot/grub/
 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
 	test -f $(TARGET_DIR)/boot/grub/$(GRUB_SPLASHIMAGE) || \
 		cp $(GRUB_SPLASHIMAGE) $(TARGET_DIR)/boot/grub/
 endif
+	touch $@
 
-grub: grub-target_binary
+grub: uclibc $(GRUB_DIR)/.installed
 
 grub-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB_DIR) uninstall

Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-02-04 16:30:07 UTC (rev 17762)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-02-04 16:34:56 UTC (rev 17763)
@@ -34,14 +34,16 @@
 $(DL_DIR)/$(SYSLINUX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(SYSLINUX_SITE)/$(SYSLINUX_SOURCE)
 
+syslinux-source: $(DL_DIR)/$(SYSLINUX_SOURCE)
+
 $(SYSLINUX_DIR)/Makefile: $(DL_DIR)/$(SYSLINUX_SOURCE) $(SYSLINUX_PATCH)
 	$(SYSLINUX_CAT) $(DL_DIR)/$(SYSLINUX_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	toolchain/patch-kernel.sh $(SYSLINUX_DIR) target/x86/syslinux/ \*.patch
-	touch -c $(SYSLINUX_DIR)/Makefile
+	touch -c $@
 
 $(SYSLINUX_DIR)/isolinux.bin: $(SYSLINUX_DIR)/Makefile
 	$(MAKE) -C $(SYSLINUX_DIR)
-	touch -c $(SYSLINUX_DIR)/isolinux.bin
+	touch -c $@
 
 syslinux: $(SYSLINUX_DIR)/isolinux.bin
 

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-04 16:30:07 UTC (rev 17762)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-04 16:34:56 UTC (rev 17763)
@@ -292,7 +292,7 @@
 	#
 	touch $@
 
-gcc-target-libs: $(GCC_BUILD_DIR2)/.installed
+$(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -311,7 +311,8 @@
 endif
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
-	$(GCC_BUILD_DIR2)/.installed gcc-target-libs $(GCC_TARGETS)
+	$(GCC_BUILD_DIR2)/.installed $(GCC_BUILD_DIR2)/.libs_installed \
+	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 
