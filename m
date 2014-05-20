From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 May 2014 23:13:23 +0200
Subject: [Buildroot] [PATCH] build: remove sstrip
Message-ID: <1400620403-14763-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Quoting Thomas on IRC:
  > sstrip is a piece of crap that we should exterminate
  > from the surface of the planet

sstrip is now unmaintained, has a long history of generating butchered
binaries in some cases, and does not gain that much space in the end.

Obliviate sstrip from the strip options, anihilate the sstrip package,
scortch any reference in fire, and cleanse our tree free of any remnants...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in                            | 12 ------------
 configs/armadeus_apf9328_defconfig   |  1 -
 package/Config.in                    |  1 -
 package/Makefile.in                  |  8 --------
 package/sstrip/Config.in             |  7 -------
 package/sstrip/sstrip.mk             | 32 --------------------------------
 support/dependencies/dependencies.mk |  4 ----
 7 files changed, 65 deletions(-)
 delete mode 100644 package/sstrip/Config.in
 delete mode 100644 package/sstrip/sstrip.mk

diff --git a/Config.in b/Config.in
index 79a455d..cccfd83 100644
--- a/Config.in
+++ b/Config.in
@@ -352,18 +352,6 @@ config BR2_STRIP_strip
 	  symbols on the target are needed for native debugging, but
 	  not when remote debugging is used.
 
-config BR2_STRIP_sstrip
-	bool "sstrip"
-	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
-	help
-	  Binaries and libraries in the target filesystem will be
-	  stripped using the 'sstrip' command, which strips a little
-	  bit more than the traditional 'strip' command. This allows to
-	  save space, mainly by removing debugging symbols. Debugging
-	  symbols on the target are needed for native debugging, but
-	  not when remote debugging is used.
-
 config BR2_STRIP_none
 	bool "none"
 	help
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index b42f757..806e9a8 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -3,7 +3,6 @@ BR2_arm=y
 BR2_arm920t=y
 
 # Toolchain
-BR2_STRIP_sstrip=y
 BR2_GCC_VERSION_4_4_X=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_HOST_GDB=y
diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..d09cba3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -119,7 +119,6 @@ source "package/pkgconf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
 endif
-source "package/sstrip/Config.in"
 source "package/subversion/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index 2fc3aa7..b8d1dad 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -200,14 +200,6 @@ TARGET_STRIP=$(TARGET_CROSS)strip
 STRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 KSTRIPCMD=$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
 endif
-ifeq ($(BR2_STRIP_sstrip),y)
-STRIP_STRIP_DEBUG:=
-STRIP_STRIP_UNNEEDED:=
-STRIP_STRIP_ALL:=
-TARGET_STRIP=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-STRIPCMD=$(TARGET_STRIP)
-KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
-endif
 ifeq ($(BR2_STRIP_none),y)
 TARGET_STRIP=true
 STRIPCMD=$(TARGET_STRIP)
diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
deleted file mode 100644
index 12a5941..0000000
--- a/package/sstrip/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_SSTRIP
-	bool "sstrip"
-	help
-	  Small utility that removes a few bytes from an executable that
-	  strip leaves behind.
-
-	  http://www.muppetlabs.com/~breadbox/software/elfkickers.html
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
deleted file mode 100644
index deab010..0000000
--- a/package/sstrip/sstrip.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# sstrip
-#
-################################################################################
-
-SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
-SSTRIP_VERSION = 20154
-HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
-
-define SSTRIP_BUILD_CMDS
-	cd $(@D) ; \
-	$(TARGET_CC) $(TARGET_CFLAGS) -include endian.h -include byteswap.h \
-		-o sstrip src/sstrip.c
-endef
-
-define SSTRIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
-endef
-
-define HOST_SSTRIP_BUILD_CMDS
-	cd $(@D) ; \
-	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
-		-o sstrip src/sstrip.c
-endef
-
-define HOST_SSTRIP_INSTALL_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 155a909..05d57ff 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -16,10 +16,6 @@ $(shell support/dependencies/check-host-$(1).sh $(2))
 endef
 -include $(sort $(wildcard support/dependencies/check-host-*.mk))
 
-ifeq ($(BR2_STRIP_sstrip),y)
-DEPENDENCIES_HOST_PREREQ+=host-sstrip
-endif
-
 ifeq ($(BR2_CCACHE),y)
 DEPENDENCIES_HOST_PREREQ += host-ccache
 endif
-- 
1.8.3.2
