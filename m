From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:27 +0200
Subject: [Buildroot] [PATCH 31/34] reproducible/syslinux: make syslinux
	build reproducible
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-31-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with the target toolchain so that the binaries are identical with
different host toolchains.
Sort files lists in order to get deterministic link order.
Build with HEXDATE set to the source date epoch.
---
 boot/syslinux/0001-fixed-build-order.patch | 37 +++++++++++++++++++++++
 boot/syslinux/syslinux.mk                  | 47 +++++++++++++++++++++++++-----
 fs/iso9660/iso9660.mk                      |  4 +--
 3 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 boot/syslinux/0001-fixed-build-order.patch

diff --git a/boot/syslinux/0001-fixed-build-order.patch b/boot/syslinux/0001-fixed-build-order.patch
new file mode 100644
index 0000000..4eda186
--- /dev/null
+++ b/boot/syslinux/0001-fixed-build-order.patch
@@ -0,0 +1,37 @@
+--- syslinux-6.03/core/Makefile~	2014-10-06 18:27:44.000000000 +0200
++++ syslinux-6.03/core/Makefile	2016-03-24 14:36:38.207391899 +0100
+@@ -41,9 +41,9 @@
+ # All primary source files for the main syslinux files
+ NASMSRC	 := $(wildcard $(SRC)/*.asm)
+ NASMHDR  := $(wildcard $(SRC)/*.inc)
+-CSRC	 := $(shell find $(SRC) -name '*.c' -print)
+-SSRC	 := $(shell find $(SRC) -name '*.S' -print)
+-CHDR	 := $(shell find $(SRC) -name '*.h' -print)
++CSRC	 := $(shell find $(SRC) -name '*.c' -print | sort)
++SSRC	 := $(shell find $(SRC) -name '*.S' -print | sort)
++CHDR	 := $(shell find $(SRC) -name '*.h' -print | sort)
+ OTHERSRC := keywords
+ ALLSRC    = $(NASMSRC) $(NASMHDR) $(CSRC) $(SSRC) $(CHDR) $(OTHERSRC)
+ 
+@@ -56,18 +56,18 @@
+ 	$(addprefix $(SRC)/fs/pxe/, dhcp_option.c pxe.c tftp.c urlparse.c bios.c)
+ 
+ LPXELINUX_CSRC = $(CORE_PXE_CSRC) \
+-	$(shell find $(SRC)/lwip -name '*.c' -print) \
++	$(shell find $(SRC)/lwip -name '*.c' -print | sort) \
+ 	$(addprefix $(SRC)/fs/pxe/, \
+ 		core.c dnsresolv.c ftp.c ftp_readdir.c gpxeurl.c http.c \
+ 		http_readdir.c idle.c isr.c tcp.c)
+ 
+ PXELINUX_CSRC = $(CORE_PXE_CSRC) \
+-	$(shell find $(SRC)/legacynet -name '*.c' -print)
++	$(shell find $(SRC)/legacynet -name '*.c' -print | sort)
+ 
+ LPXELINUX_OBJS = $(subst $(SRC)/,,$(LPXELINUX_CSRC:%.c=%.o))
+ PXELINUX_OBJS  = $(subst $(SRC)/,,$(PXELINUX_CSRC:%.c=%.o))
+ 
+-UNITTEST_CSRC = $(shell find $(SRC) -path '*/tests/*.c' -print)
++UNITTEST_CSRC = $(shell find $(SRC) -path '*/tests/*.c' -print | sort)
+ UNITTEST_OBJS = $(subst $(SRC)/,,$(UNITTEST_CSRC:%.c=%.o))
+ 
+ # Don't include console and network stack specific objects or unit tests
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0868896..4486e95 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -13,7 +13,7 @@ SYSLINUX_LICENSE_FILES = COPYING
 
 SYSLINUX_INSTALL_IMAGES = YES
 
-SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx
+SYSLINUX_DEPENDENCIES = host-nasm host-util-linux host-upx host-perl host-python host-xz
 
 ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
 SYSLINUX_TARGET = bios
@@ -47,12 +47,35 @@ define SYSLINUX_CLEANUP
 endef
 SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define SYSLINUX_REPRODUCIBLE
+	HEXDATE="`printf "0x%x" $(SOURCE_DATE_EPOCH)`"
+endef
+endif
+
+define SYSLINUX_MAKE
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		$(SYSLINUX_REPRODUCIBLE) \
+		NASM=$(HOST_DIR)/usr/bin/nasm \
+		PERL=$(HOST_DIR)/usr/bin/perl \
+		PYTHON=$(HOST_DIR)/usr/bin/python \
+		UPX=$(HOST_DIR)/usr/bin/upx \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD) -m elf_i386" \
+		OBJDUMP="$(TARGET_OBJDUMP)" \
+		OBJCOPY="$(TARGET_OBJCOPY)" \
+		STRIP="$(TARGET_STRIP)" \
+		AR="$(TARGET_AR)" \
+		NM="$(TARGET_NM)" \
+		RANLIB="$(TARGET_RANLIB)" \
+		XZ=$(HOST_DIR)/usr/bin/xz $(SYSLINUX_EFI_ARGS)
+endef
+
 # syslinux build system has no convenient way to pass CFLAGS,
 # and the internal zlib should take precedence so -I shouldn't
 # be used.
 define SYSLINUX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
+	$(SYSLINUX_MAKE) -C $(@D) $(SYSLINUX_TARGET)
 endef
 
 # While the actual bootloader is compiled for the target, several
@@ -61,8 +84,7 @@ endef
 # Repeat CC and AR, since syslinux really wants to check them at
 # install time
 define SYSLINUX_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
-		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) INSTALLROOT=$(HOST_DIR) \
+	$(SYSLINUX_MAKE) INSTALLROOT=$(@D)/inst \
 		-C $(@D) $(SYSLINUX_TARGET) install
 endef
 
@@ -80,10 +102,21 @@ define SYSLINUX_INSTALL_IMAGES_CMDS
 	for i in $(SYSLINUX_IMAGES-y); do \
 		$(INSTALL) -D -m 0755 $(@D)/$$i $(BINARIES_DIR)/syslinux/$${i##*/}; \
 	done
-	for i in $(SYSLINUX_C32); do \
-		$(INSTALL) -D -m 0755 $(HOST_DIR)/usr/share/syslinux/$${i} \
+	for i in $(SYSLINUX_C32) ldlinux.c32; do \
+		$(INSTALL) -D -m 0755 $(@D)/inst/usr/share/syslinux/$${i} \
 			$(BINARIES_DIR)/syslinux/$${i}; \
 	done
 endef
 
+define HOST_SYSLINUX_BUILD_CMDS
+       $(HOST_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+-               AR="$(HOSTAR)" -C $(@D) bios
+endef
+
+define HOST_SYSLINUX_INSTALL_CMDS
+       $(HOST_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
+-               AR="$(HOSTAR)" -C $(@D) INSTALLROOT=$(HOST_DIR) bios install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 5e36ed1..899d8e8 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -70,8 +70,6 @@ ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
 define ROOTFS_ISO9660_INSTALL_BOOTLOADER
 	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/* \
 		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/
-	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
-		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
 endef
 endif
 
@@ -168,6 +166,8 @@ define ROOTFS_ISO9660_CMD
 endef
 
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660_HYBRID),y)
+ROOTFS_ISO9660_DEPENDENCIES += host-syslinux
+
 define ROOTFS_ISO9660_GEN_HYBRID
 	$(ROOTFS_ISO9660_ISOHYBRID) -t 0x96 $@
 endef
-- 
2.7.4
