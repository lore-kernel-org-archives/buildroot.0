From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Jul 2011 23:33:32 +0200
Subject: [Buildroot] [PATCH 15/28] grub2: remove package
In-Reply-To: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <d9a344dbaa103345f4814c60b3aba9e2ab0113fa.1309815048.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub 2 has been marked BROKEN in June 2010, and nobody cared to fix it
since then.

At that time, it was marked broken because the build process needed a
Ruby interpreter available on the host, and it's really a pain that
building a bootloader needs such a thing.

I've tried to upgrade the package to Grub2 1.99-rcX, and now it does
not need a Ruby interpreter anymore, but instead requires a tool
called "autogen", which itself needs the Guile Scheme interpreter.

Since we haven't heard any complaints about Grub2 being marked broken,
and since it's such a pain to package, let's get rid of it. Of course,
anybody interested in Grub2 is invited to contribute a working
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in       |    1 -
 boot/grub2/Config.in |    9 -----
 boot/grub2/grub2.mk  |   93 --------------------------------------------------
 3 files changed, 0 insertions(+), 103 deletions(-)
 delete mode 100644 boot/grub2/Config.in
 delete mode 100644 boot/grub2/grub2.mk

diff --git a/boot/Config.in b/boot/Config.in
index 6bcc98a..67ab8ac 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -2,7 +2,6 @@ menu "Bootloaders"
 
 source "boot/barebox/Config.in"
 source "boot/grub/Config.in"
-source "boot/grub2/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/u-boot/Config.in"
 source "boot/at91bootstrap/Config.in"
diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
deleted file mode 100644
index 1301b5b..0000000
--- a/boot/grub2/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_TARGET_GRUB2
-	bool "grub2"
-	# Only supports PC, Mac (Power, x86 and x86-64), Pegasos
-	depends on BR2_i386 || BR2_powerpc
-	# Build process is broken (./configure doesn't work, Ruby
-	# required, etc.)
-	depends on BROKEN
-	help
-	  The GRand Unified Bootloader for x86 systems, take #2.
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
deleted file mode 100644
index f939d9a..0000000
--- a/boot/grub2/grub2.mk
+++ /dev/null
@@ -1,93 +0,0 @@
-#############################################################
-#
-# grub2
-#
-# TODO
-#
-#  * grub2's autogen uses ruby, which isn't part of the core Debian
-#    installation. So either decide it is a requirement for Buildroot,
-#    or build it for the host.
-#
-#  * improve the installation procedure. For the moment, it just
-#    installs everything in $(TARGET_DIR).
-#
-#############################################################
-GRUB2_SOURCE:=grub2_1.98.orig.tar.gz
-GRUB2_PATCH:=grub2_1.98-1.diff.gz
-GRUB2_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub2
-GRUB2_PATCH_SITE:=$(GRUB2_SITE)
-GRUB2_CAT:=$(ZCAT)
-GRUB2_DIR:=$(BUILD_DIR)/grub-1.98
-
-GRUB2_CFLAGS=-DSUPPORT_LOOPDEV
-ifeq ($(BR2_LARGEFILE),)
-GRUB2_CFLAGS+=-U_FILE_OFFSET_BITS
-endif
-
-$(DL_DIR)/$(GRUB2_SOURCE):
-	 $(call DOWNLOAD,$(GRUB2_SITE),$(GRUB2_SOURCE))
-
-$(DL_DIR)/$(GRUB2_PATCH):
-	 $(call DOWNLOAD,$(GRUB2_PATCH_SITE),$(GRUB2_PATCH))
-
-grub2-source: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
-
-$(GRUB2_DIR)/.unpacked: $(DL_DIR)/$(GRUB2_SOURCE) $(DL_DIR)/$(GRUB2_PATCH)
-	mkdir -p $(@D)
-	$(GRUB2_CAT) $(DL_DIR)/$(GRUB2_SOURCE) | tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) -xvf -
-	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(GRUB2_PATCH)
-	for i in `grep -v "^#" $(@D)/debian/patches/00list`; do \
-		cat $(@D)/debian/patches/$$i | patch -p1 -d $(@D); \
-	done
-	toolchain/patch-kernel.sh $(@D) boot/grub2 grub-\*.patch
-	touch $@
-
-$(GRUB2_DIR)/.configured: $(GRUB2_DIR)/.unpacked
-	(cd $(GRUB2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) ; \
-		./autogen.sh ; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CPPFLAGS="$(GRUB2_CFLAGS)" \
-		grub_cv_i386_check_nested_functions=no \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--disable-grub-mkfont \
-		--disable-grub-fstest \
-		--disable-grub-emu-usb \
-		--disable-werror \
-		$(DISABLE_LARGEFILE) \
-		$(GRUB2_CONFIG-y) \
-	)
-	touch $@
-
-$(GRUB2_DIR)/.compiled: $(GRUB2_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
-	touch $@
-
-$(GRUB2_DIR)/.installed: $(GRUB2_DIR)/.compiled
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
-	touch $@
-
-grub2: host-automake host-autoconf $(GRUB2_DIR)/.installed
-
-grub2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GRUB2_DIR) uninstall
-	-$(MAKE) -C $(GRUB2_DIR) clean
-
-grub2-dirclean:
-	rm -rf $(GRUB2_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_TARGET_GRUB2),y)
-TARGETS+=grub2
-endif
-- 
1.7.4.1
