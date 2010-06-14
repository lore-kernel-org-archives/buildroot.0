From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub2: fix build
Message-ID: <20100614203439.C46DA80E27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d36fbf1eda3baf5e1a875d8335e4ecef8aa10e65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

grub2 now builds fine, but some work remains to make it usable. What
should be installed exactly in the TARGET_DIR ? What is the
installation procedure and what should Buildroot do ?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub-1.95-001-fix-grub-install.patch |   23 -----------
 boot/grub2/grub2.mk                             |   49 ++++++++++++----------
 2 files changed, 27 insertions(+), 45 deletions(-)
 delete mode 100644 boot/grub2/grub-1.95-001-fix-grub-install.patch

diff --git a/boot/grub2/grub-1.95-001-fix-grub-install.patch b/boot/grub2/grub-1.95-001-fix-grub-install.patch
deleted file mode 100644
index 3287b61..0000000
--- a/boot/grub2/grub-1.95-001-fix-grub-install.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-? config.status.lineno
-? fix-grub-install.diff
-? genkernsyms.sh
-? gensymlist.sh
-? grub-mkimage.d
-? grub_script.tab.c
-? grub_script.tab.h
-? kernel_elf_symlist.c
-Index: util/powerpc/ieee1275/grub-install.in
-===================================================================
-RCS file: /cvsroot/grub/grub2/util/powerpc/ieee1275/grub-install.in,v
-retrieving revision 1.5
-diff -u -r1.5 grub-install.in
---- grub-1.95/util/powerpc/ieee1275/grub-install.in	28 May 2006 23:01:43 -0000	1.5
-+++ grub-1.95/util/powerpc/ieee1275/grub-install.in	4 Mar 2007 19:05:47 -0000
-@@ -23,6 +23,7 @@
- # Initialize some variables.
- prefix=@prefix@
- exec_prefix=@exec_prefix@
-+bindir=@bindir@
- sbindir=@sbindir@
- libdir=@libdir@
- PACKAGE_NAME=@PACKAGE_NAME@
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 4af6c02..95fa245 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -2,6 +2,15 @@
 #
 # grub2
 #
+# TODO
+#
+#  * grub2's autogen uses ruby, which isn't part of the core Debian
+#    installation. So either decide it is a requirement for Buildroot,
+#    or build it for the host.
+#
+#  * improve the installation procedure. For the moment, it just
+#    installs everything in $(TARGET_DIR).
+#
 #############################################################
 GRUB2_SOURCE:=grub2_1.98.orig.tar.gz
 GRUB2_PATCH:=grub2_1.98-1.diff.gz
@@ -13,13 +22,11 @@ GRUB2_BINARY:=grub2/grub2
 GRUB2_TARGET_BINARY:=sbin/grub2
 GRUB2_SPLASHIMAGE=$(TOPDIR)/boot/grub/splash.xpm.gz
 
-
 GRUB2_CFLAGS=-DSUPPORT_LOOPDEV
 ifeq ($(BR2_LARGEFILE),)
 GRUB2_CFLAGS+=-U_FILE_OFFSET_BITS
 endif
 
-
 GRUB2_CONFIG-$(BR2_TARGET_GRUB2_SPLASH) += --enable-graphics
 GRUB2_CONFIG-$(BR2_TARGET_GRUB2_DISKLESS) += --enable-diskless
 GRUB2_CONFIG-$(BR2_TARGET_GRUB2_3c595) += --enable-3c595
@@ -53,16 +60,19 @@ $(DL_DIR)/$(GRUB2_PATCH):
 grub2-source: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
 
 $(GRUB2_DIR)/.unpacked: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
-	$(GRUB2_CAT) $(DL_DIR)/$(GRUB2_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(GRUB2_DIR) $(DL_DIR) $(GRUB2_PATCH)
-	for i in `grep -v "^#" $(GRUB2_DIR)/debian/patches/00list`; do \
-		cat $(GRUB2_DIR)/debian/patches/$$i | patch -p1 -d $(GRUB2_DIR); \
+	mkdir -p $(@D)
+	$(GRUB2_CAT) $(DL_DIR)/$(GRUB2_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) -xvf -
+	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(GRUB2_PATCH)
+	for i in `grep -v "^#" $(@D)/debian/patches/00list`; do \
+		cat $(@D)/debian/patches/$$i | patch -p1 -d $(@D); \
 	done
-	toolchain/patch-kernel.sh $(GRUB2_DIR) boot/grub2 grub-\*.patch
+	toolchain/patch-kernel.sh $(@D) boot/grub2 grub-\*.patch
 	touch $@
 
 $(GRUB2_DIR)/.configured: $(GRUB2_DIR)/.unpacked
 	(cd $(GRUB2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) ; \
+		./autogen.sh ; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CPPFLAGS="$(GRUB2_CFLAGS)" \
@@ -74,33 +84,28 @@ $(GRUB2_DIR)/.configured: $(GRUB2_DIR)/.unpacked
 		--prefix=/ \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--disable-auto-linux-mem-opt \
+		--disable-grub-mkfont \
+		--disable-grub-fstest \
+		--disable-grub-emu-usb \
+		--disable-werror \
 		$(DISABLE_LARGEFILE) \
 		$(GRUB2_CONFIG-y) \
 	)
 	touch $@
 
-$(GRUB2_DIR)/$(GRUB2_BINARY): $(GRUB2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GRUB2_DIR)
+$(GRUB2_DIR)/.compiled: $(GRUB2_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(@D)
+	touch $@
 
-$(GRUB2_DIR)/.installed: $(GRUB2_DIR)/$(GRUB2_BINARY)
-	cp $(GRUB2_DIR)/$(GRUB2_BINARY) $(TARGET_DIR)/$(GRUB2_TARGET_BINARY)
-	test -d $(TARGET_DIR)/boot/grub2 || mkdir -p $(TARGET_DIR)/boot/grub2
-	cp $(GRUB2_DIR)/stage1/stage1 $(GRUB2_DIR)/stage2/*1_5 $(GRUB2_DIR)/stage2/stage2 $(TARGET_DIR)/boot/grub2/
-ifeq ($(BR2_TARGET_GRUB2_SPLASH),y)
-	test -f $(TARGET_DIR)/boot/grub2/$(GRUB2_SPLASHIMAGE) || \
-		cp $(GRUB2_SPLASHIMAGE) $(TARGET_DIR)/boot/grub2/
-endif
+$(GRUB2_DIR)/.installed: $(GRUB2_DIR)/.compiled
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	touch $@
 
-grub2: $(GRUB2_DIR)/.installed
+grub2: host-automake host-autoconf $(GRUB2_DIR)/.installed
 
 grub2-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GRUB2_DIR) uninstall
 	-$(MAKE) -C $(GRUB2_DIR) clean
-	rm -f $(TARGET_DIR)/boot/grub2/$(GRUB2_SPLASHIMAGE) \
-		$(TARGET_DIR)/sbin/$(GRUB2_BINARY) \
-		$(TARGET_DIR)/boot/grub2/{stage{1,2},*1_5}
 
 grub2-dirclean:
 	rm -rf $(GRUB2_DIR)
-- 
1.7.1
