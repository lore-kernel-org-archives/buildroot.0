From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:50 +0200
Subject: [Buildroot] [RFC v4 16/16] infra: add per-package staging feature
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-17-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To improve the build reproducibility, instead of sharing a common
staging are, every package has a private staging directory where only
the declared dependency are present.

Having a per-package staging directory ensure that every package use
only the declared dependency, because even if a undeclared dependency is
build before, it will be not included in the private package directory.

This feature is useful for both top-level non-parallel make and
top-level parallel make.

This feature is useful for target dependencies but not for host
dependencies, to solve that a similar feature for host packages must be
developed.

Implementation details:
To minimize change the STAGING_DIR variable will be redefined for each
package to point to the per-package staging directory.

At the beginning of each configuration stage the per-package staging
directory will be created copying using hard links all the declared
target dependencies.
Also each path of every copied configuration files will be changed to
point to the per-package

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile               |  2 +-
 package/Makefile.in    |  1 +
 package/pkg-cmake.mk   |  2 +-
 package/pkg-generic.mk | 34 +++++++++++++++++++++++++++++++++-
 4 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index b4e5a10..01a7198 100644
--- a/Makefile
+++ b/Makefile
@@ -800,7 +800,7 @@ printvars:
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(BUILD_DIR) $(BASE_DIR)/staging \
+		$(BUILD_DIR) $(BASE_DIR)/staging $(STAGINGPKG_DIR) \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
diff --git a/package/Makefile.in b/package/Makefile.in
index 169c6b3..ea26772 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -110,6 +110,7 @@ endif
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 STAGINGNOPKG_DIR := $(STAGING_DIR)
+STAGINGPKG_DIR = $(BASE_DIR)/stagingpkg
 
 TARGET_OPTIMIZATION := $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 8af1e48..eb80466 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -85,7 +85,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
-	GCC_SYSROOT=$$(STAGING_DIR) \
+	GCC_SYSROOT=$$($(2)_STAGING_DIR) \
 	$$($$(PKG)_CONF_ENV) $$(HOST_DIR)/usr/bin/cmake $$($$(PKG)_SRCDIR) \
 		-DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
 		-DCMAKE_BUILD_TYPE=$$(if $$(BR2_ENABLE_DEBUG),Debug,Release) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 376b025..edac936 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -221,7 +221,7 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
-	rm -Rf $(@D)
+	rm -Rf $(@D) $(STAGING_DIR)
 
 ################################################################################
 # virt-provides-single -- check that provider-pkg is the declared provider for
@@ -414,6 +414,33 @@ $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
 $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
 $(2)_FINAL_ALL_DEPENDENCIES = $$(sort $$($(2)_FINAL_DEPENDENCIES) $$($(2)_FINAL_PATCH_DEPENDENCIES))
 
+ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
+  $(2)_STAGING_DIRS = $$(wildcard $$(foreach dep,\
+	$$(filter-out host-% toolchain,$$($(2)_FINAL_DEPENDENCIES)),\
+	$$($$(call UPPERCASE,$$(dep))_STAGING_DIR)/))
+
+  $(2)_STAGING_DIR = $$(STAGINGPKG_DIR)/$(1)
+
+  define $(2)_PREPARE_STAGING_DIR
+	mkdir -p $$($(2)_STAGING_DIR)/usr/mkspecs/qws
+	cp -rl $(STAGING_DIR)/* $$($(2)_STAGING_DIR)
+	$$(if $$($(2)_STAGING_DIRS), $$(foreach dir,$$($(2)_STAGING_DIRS),\
+		rsync -au --link-dest=$$(dir) $$(dir) $$($(2)_STAGING_DIR); ))
+	find $$($(2)_STAGING_DIR)/usr/{bin,lib,mkspecs/qws} \
+		-ignore_readdir_race \
+		-name "*[-_]config" -or -name "*.la" -or -name "*.pc" -or \
+		-name "*.prl" -or -name "qmake.conf" | xargs -r sed -i -r \
+		-e "s|$$(STAGINGPKG_DIR)/[^/]*/+usr|$$($(2)_STAGING_DIR)/usr|g" \
+		-e "s|$$(BUILD_DIR)/[^ ]+/([^/ ]+).la|$$($(2)_STAGING_DIR)/usr/lib/\1.la|g" \
+		-e "s|/lib/libpulsecommon|/lib/pulseaudio/libpulsecommon|g"
+  endef
+
+  $(2)_PRE_CONFIGURE_HOOKS := \
+	$(2)_PREPARE_STAGING_DIR $$($(2)_PRE_CONFIGURE_HOOKS)
+else
+  $(2)_STAGING_DIR = $$(STAGING_DIR)
+endif
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
@@ -617,11 +644,15 @@ $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
+$$($(2)_TARGET_INSTALL_TARGET):		STAGING_DIR:=$$($(2)_STAGING_DIR)
 $$($(2)_TARGET_INSTALL_STAGING):	PKG=$(2)
+$$($(2)_TARGET_INSTALL_STAGING):	STAGING_DIR:=$$($(2)_STAGING_DIR)
 $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):           PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
+$$($(2)_TARGET_BUILD):			STAGING_DIR:=$$($(2)_STAGING_DIR)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		STAGING_DIR:=$$($(2)_STAGING_DIR)
 $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):                  PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
@@ -631,6 +662,7 @@ $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
+$$($(2)_TARGET_DIRCLEAN):		STAGING_DIR:=$$($(2)_STAGING_DIR)
 
 # Compute the name of the Kconfig option that correspond to the
 # package being enabled. We handle three cases: the special Linux
-- 
2.4.3
