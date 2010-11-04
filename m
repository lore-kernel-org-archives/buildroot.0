From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Nov 2010 20:31:25 +0100
Subject: [Buildroot] [PATCH 1/1] Remove support for shared configuration
	cache
In-Reply-To: <cover.1288899072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1288899072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cc180c03ef4ac761ab7a25cb7935992e3c65db35.1288899072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configuration cache shared between packages, while being in
principle a nice idea to speed-up the configuration of packages by
avoiding repetitive identical checks, turned out to be unreliable due
to the subtle differences between similar but not identical checks in
different packages. After spending some time trying to fix those, we
concluded that supporting the shared configuration cache is definitely
too hard and too unreliable, and that we'd better get rid of it
altogether.

This patch therefore removes the shared configuration cache
infrastructure and usage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                          |   14 --------------
 Makefile                                           |    9 ---------
 configs/arm_nptl_toolchain_defconfig               |    1 -
 configs/arm_toolchain_defconfig                    |    1 -
 configs/at91rm9200df_defconfig                     |    1 -
 configs/at91rm9200df_ext_bare_defconfig            |    1 -
 configs/at91rm9200df_ext_defconfig                 |    1 -
 configs/at91sam9260dfc_defconfig                   |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig          |    1 -
 configs/at91sam9260dfc_ext_defconfig               |    1 -
 configs/at91sam9261ek_defconfig                    |    1 -
 configs/at91sam9261ek_ext_bare_defconfig           |    1 -
 configs/at91sam9261ek_ext_defconfig                |    1 -
 configs/at91sam9263ek_defconfig                    |    1 -
 configs/at91sam9263ek_ext_bare_defconfig           |    1 -
 configs/at91sam9263ek_ext_defconfig                |    1 -
 configs/at91sam9g20dfc_defconfig                   |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig          |    1 -
 configs/at91sam9g20dfc_ext_defconfig               |    1 -
 configs/atngw100-base_defconfig                    |    1 -
 configs/atngw100_defconfig                         |    1 -
 configs/atstk1005_defconfig                        |    1 -
 configs/atstk100x_defconfig                        |    1 -
 configs/i386_defconfig                             |    1 -
 configs/i686_defconfig                             |    1 -
 configs/integrator926_defconfig                    |    1 -
 configs/integrator926_huge_defconfig               |    1 -
 docs/buildroot.html                                |    7 -------
 package/Makefile.autotools.in                      |    3 ---
 package/fontconfig/fontconfig.mk                   |    1 -
 package/gamin/gamin.mk                             |    2 --
 package/haserl/haserl.mk                           |    2 --
 package/libxml2/libxml2.mk                         |    2 --
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 --
 package/ng-spice-rework/ng-spice-rework.mk         |    2 --
 package/rpm/rpm.mk                                 |    2 --
 package/sqlite/sqlite.mk                           |    2 --
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 -
 38 files changed, 0 insertions(+), 74 deletions(-)

diff --git a/Config.in b/Config.in
index 0f8ddf4..43baed1 100644
--- a/Config.in
+++ b/Config.in
@@ -256,20 +256,6 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
-menu "Advanced"
-
-config BR2_CONFIG_CACHE
-	bool "Use a central configure cache file (EXPERIMENTAL)"
-	help
-	  Notice: This is experimental and known to break with certain
-	  package combinations.
-
-	  This determines if a central config cache is used by
-	  packages, reducing the configure time for packages as each
-	  one caches its findings.
-
-endmenu
-
 endmenu
 
 source "toolchain/Config.in"
diff --git a/Makefile b/Makefile
index 22c3801..be28ace 100644
--- a/Makefile
+++ b/Makefile
@@ -449,15 +449,6 @@ external-deps:
 show-targets:
 	@echo $(TARGETS)
 
-ifeq ($(BR2_CONFIG_CACHE),y)
-# drop configure caches if configuration is changed
-$(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache: $(CONFIG_DIR)/.config
-	rm -f $@
-	touch $@
-
-$(BASE_TARGETS): | $(BUILD_DIR)/tgt-config.cache $(BUILD_DIR)/host-config.cache
-endif
-
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index d7b26a5..e167bc3 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -155,7 +155,6 @@ BR2_OPTIMIZE_2=y
 #
 # Advanced
 #
-# BR2_CONFIG_CACHE is not set
 
 #
 # Toolchain
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 37426ae..d4642d9 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -160,7 +160,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index ac5bfa3..de061ac 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -165,7 +165,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 608460d..522daff 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -160,7 +160,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 26ec527..d030b1e 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -171,7 +171,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91rm9200df-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 50fa8ef..1740e13 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -178,7 +178,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 9977e42..bbaadfb 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -160,7 +160,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index b46b8b0..1df4926 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -179,7 +179,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9260dfc-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 2ef1748..f4c0755 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 6837f41..ec86bae 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -163,7 +163,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index 1f64123..39b5019 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -182,7 +182,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9261ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index df559da..cfa8742 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -179,7 +179,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index 8143318..54755ce 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -162,7 +162,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index d044d05..56605d9 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -181,7 +181,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9263ek-NAND"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 7239327..dc9b600 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -179,7 +179,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam92g20ek-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index a63706e..c43c6f9 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -160,7 +160,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 02dd6b4..e61234b 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -179,7 +179,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="at91sam9g20dfc-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index ec3d4a0..2b79015 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -112,7 +112,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 6d8293c..ec87a09 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -108,7 +108,6 @@ BR2_OPTIMIZE_S=y
 #
 # Advanced
 #
-# BR2_CONFIG_CACHE is not set
 
 #
 # Toolchain
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index d0ec24d..6212e2b 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -111,7 +111,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index 6ee8f11..ce50944 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -111,7 +111,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 672b694..80100d6 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -113,7 +113,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 5b1b56f..4a128e8 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -113,7 +113,6 @@ BR2_TOPDIR_PREFIX=""
 BR2_TOPDIR_SUFFIX=""
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index d7ccc65..fc2dccf 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -110,7 +110,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index f88fcc7..c56b628 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -110,7 +110,6 @@ BR2_TOPDIR_SUFFIX=""
 BR2_ROOTFS_PREFIX="$(BOARD_NAME)-rootfs"
 BR2_JLEVEL=2
 # BR2_DEPRECATED is not set
-# BR2_CONFIG_CACHE is not set
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
diff --git a/docs/buildroot.html b/docs/buildroot.html
index 00808ff..94726c8 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1268,13 +1268,6 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       not. Valid values are <code>YES</code> and <code>NO</code>. By
       default, the value is <code>YES</code></li>
 
-      <li><code>LIBFOO_USE_CONFIG_CACHE</code> tells whether the configure
-      script should use the central configure cache, which caches test
-      results from previous configure scripts. Usually, this variable should
-      be left to its default value. Only packages having issues with the
-      configure cache, can set this variable to the <code>NO</code> value
-      (but this is more of a work-around than a fix)</li>
-
       <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make options
       used to install the package to the staging directory. By default, the
       value is <code>DESTDIR=$$(STAGING_DIR) install</code>, which is
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 87c3092..e1cf60a 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -64,7 +64,6 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
-$(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 $(2)_CLEAN_OPT			?= clean
@@ -88,7 +87,6 @@ define $(2)_CONFIGURE_CMDS
 	$$(TARGET_CONFIGURE_ARGS) \
 	$$($$(PKG)_CONF_ENV) \
 	./configure \
-		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
 		--build=$$(GNU_HOST_NAME) \
@@ -112,7 +110,6 @@ define $(2)_CONFIGURE_CMDS
 		LDFLAGS="$$(HOST_LDFLAGS)" \
                 $$($$(PKG)_CONF_ENV) \
 		./configure \
-		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/host-config.cache",) \
 		--prefix="$$(HOST_DIR)/usr" \
 		--sysconfdir="$$(HOST_DIR)/etc" \
 		$$($$(PKG)_CONF_OPT) \
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 6cbe2ea..a875e74 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -7,7 +7,6 @@ FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_AUTORECONF = YES
-FONTCONFIG_USE_CONFIG_CACHE = NO
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 # This package does not like using the target cflags for some reason.
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index db27692..f0600b2 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -19,8 +19,6 @@ GAMIN_CONF_ENV = have_abstract_sockets=no
 
 ifneq ($(BR2_LARGEFILE),y)
 GAMIN_CONF_ENV += CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-# the above doesn't work with shared config.cache
-GAMIN_USE_CONFIG_CACHE = NO
 endif
 
 GAMIN_DEPENDENCIES = libglib2
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 79f0241..a8585e8 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -11,8 +11,6 @@ HASERL_INSTALL_TARGET:=YES
 
 # force haserl 0.8.0 to use install-sh so stripping works
 HASERL_CONF_ENV = ac_cv_path_install=./install-sh
-# the above doesn't interact nicely with a shared cache, so disable for now
-HASERL_USE_CONFIG_CACHE = NO
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
 		--with-lua-headers=$(STAGING_DIR)
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 820f465..387dce3 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -13,8 +13,6 @@ LIBXML2_LIBTOOL_PATCH = NO
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-# the above doesn't work with shared config.cache
-LIBXML2_USE_CONFIG_CACHE = NO
 endif
 
 LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index ee9d9bc..a3d5fe4 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -67,8 +67,6 @@ endif
 
 ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
-# the above doesn't work with shared config.cache
-ALSA_LIB_USE_CONFIG_CACHE = NO
 
 define ALSA_LIB_UNINSTALL_TARGET_CMDS
 	-rm -f $(TARGET_DIR)/usr/lib/libasound.so*
diff --git a/package/ng-spice-rework/ng-spice-rework.mk b/package/ng-spice-rework/ng-spice-rework.mk
index 7515d25..113b59d 100644
--- a/package/ng-spice-rework/ng-spice-rework.mk
+++ b/package/ng-spice-rework/ng-spice-rework.mk
@@ -11,8 +11,6 @@ NG_SPICE_REWORK_INSTALL_STAGING = NO
 NG_SPICE_REWORK_INSTALL_TARGET = YES
 
 NG_SPICE_REWORK_CONF_OPT = CFLAGS="-I$(STAGING_DIR)/usr/include"
-# the above doesn't work with shared config.cache
-NG_SPICE_REWORK_USE_CONFIG_CACHE = NO
 
 NG_SPICE_REWORK_DEPENDENCIES = xserver_xorg-server xlib_libXaw
 
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 0104f17..778982a 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -12,8 +12,6 @@ RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
 		ac_cv_va_copy=yes 
-# the above doesn't work with shared config.cache
-RPM_USE_CONFIG_CACHE = NO
 
 RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index cc74fd7..847e77c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -15,8 +15,6 @@ ifneq ($(BR2_LARGEFILE),y)
 # --disable-largefile is passed, breaking the build. Work around it by
 # simply adding it to CFLAGS for configure instead
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DSQLITE_DISABLE_LFS"
-# changing CFLAGS doesn't work with config.cache
-SQLITE_USE_CONFIG_CACHE = NO
 endif
 
 SQLITE_CONF_OPT =	--enable-shared \
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index d9ea570..fed8c10 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -11,7 +11,6 @@ XSERVER_XORG_SERVER_MAKE = $(MAKE1) # make install fails with parallel make
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
-XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
-- 
1.7.0.4
