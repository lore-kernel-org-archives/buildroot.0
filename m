From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:28:34 +0200
Subject: [Buildroot] [git commit] package/libamcodec: remove package
Message-ID: <20190811122543.AF8B58E606@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7e3f6da6b42fde0625432fca4fea95b8b90e95a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package is not needed anymore after support for odroid2c was dropped:
https://git.buildroot.net/buildroot/commit/?id=b80712a16ae3deb65331a7923aa878e13e2e66b6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  3 ---
 package/Config.in                  |  1 -
 package/libamcodec/Config.in       | 14 --------------
 package/libamcodec/libamcodec.hash |  2 --
 package/libamcodec/libamcodec.mk   | 36 ------------------------------------
 6 files changed, 7 insertions(+), 56 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index dd396d4d56..190b98f5a5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.08"
 
+config BR2_PACKAGE_LIBAMCODEC
+	bool "liamcodec package was removed"
+	select BR2_LEGACY
+	help
+	  Support for odroidc2 based systems was removed, making the
+	  libamcodec package useless.
+
 config BR2_PACKAGE_ODROID_SCRIPTS
 	bool "odroid-scripts package was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a8fba2520e..7f62b3addf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -577,9 +577,6 @@ N:	Cyril Bur <cyrilbur@gmail.com>
 F:	arch/Config.in.powerpc
 F:	package/kvm-unit-tests
 
-N:	Dagg Stompler <daggs@gmx.com>
-F:	package/libamcodec/
-
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
diff --git a/package/Config.in b/package/Config.in
index 6a65daed11..710ed12be0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1504,7 +1504,6 @@ menu "Multimedia"
 	source "package/bitstream/Config.in"
 	source "package/kvazaar/Config.in"
 	source "package/libaacs/Config.in"
-	source "package/libamcodec/Config.in"
 	source "package/libass/Config.in"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
deleted file mode 100644
index 45846e6d29..0000000000
--- a/package/libamcodec/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-comment "libamcodec needs a toolchain w/ threads, dynamic library"
-	depends on BR2_arm || BR2_aarch64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LIBAMCODEC
-	bool "libamcodec"
-	depends on BR2_arm || BR2_aarch64
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_ALSA_LIB
-	help
-	  Interface library for Amlogic media codecs
-
-	  https://github.com/mdrjr/c2_aml_libs.git
diff --git a/package/libamcodec/libamcodec.hash b/package/libamcodec/libamcodec.hash
deleted file mode 100644
index a76d20a953..0000000000
--- a/package/libamcodec/libamcodec.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed hash
-sha256 2c9812154b6dfd6a6c9c43aa334d0d03f299379fdf83c20121ad3f3d3f97c666  libamcodec-296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca.tar.gz
diff --git a/package/libamcodec/libamcodec.mk b/package/libamcodec/libamcodec.mk
deleted file mode 100644
index 3fab228fd4..0000000000
--- a/package/libamcodec/libamcodec.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# libamcodec
-#
-################################################################################
-
-LIBAMCODEC_VERSION = 296f39bc6fc47ddf5d88b9fd3cfb82a5b39048ca
-LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
-LIBAMCODEC_DEPENDENCIES = alsa-lib
-LIBAMCODEC_LICENSE = Unclear
-LIBAMCODEC_INSTALL_STAGING = YES
-
-# This package uses the AML_LIBS_STAGING_DIR variable to construct the
-# header and library paths used when compiling
-define LIBAMCODEC_BUILD_CMDS
-	$(foreach d,amavutils amadec amcodec,\
-		$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
-			-C $(@D)/$(d) AML_LIBS_STAGING_DIR=$(STAGING_DIR)
-	)
-endef
-
-define LIBAMCODEC_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(STAGING_DIR)/usr/lib/libamavutils.so
-	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(STAGING_DIR)/usr/lib/libamadec.so
-	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(STAGING_DIR)/usr/lib/libamcodec.so
-	mkdir -p $(STAGING_DIR)/usr/include/amcodec
-	cp -rf $(@D)/amcodec/include/* $(STAGING_DIR)/usr/include/amcodec
-endef
-
-define LIBAMCODEC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/amavutils/libamavutils.so $(TARGET_DIR)/usr/lib/libamavutils.so
-	$(INSTALL) -D -m 0555 $(@D)/amadec/libamadec.so $(TARGET_DIR)/usr/lib/libamadec.so
-	$(INSTALL) -D -m 0555 $(@D)/amcodec/libamcodec.so $(TARGET_DIR)/usr/lib/libamcodec.so
-endef
-
-$(eval $(generic-package))
