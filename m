From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 13:19:24 +0200
Subject: [Buildroot] [PATCH 1/4] package/pkg-meson: move crosscompilation
 support out of package
In-Reply-To: <20191016111927.14208-1-nolange79@gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
Message-ID: <20191016111927.14208-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

install the cross-compilation.conf file when setting up the
staging area, not as part of host-meson.
This allows external usage of the buildroot toolchain through meson.

Remove a few variables, as they were only used to communicate between
meson package and pkg-meson.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/meson/meson.mk                        | 60 ------------
 package/pkg-meson.mk                          | 92 +++++++++++++++----
 .../misc}/cross-compilation.conf.in           |  0
 3 files changed, 72 insertions(+), 80 deletions(-)
 rename {package/meson => support/misc}/cross-compilation.conf.in (100%)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index a664c55f55..435f8d338e 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -13,64 +13,4 @@ MESON_SETUP_TYPE = setuptools
 HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3
 
-HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
-HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
-
-# https://mesonbuild.com/Reference-tables.html#cpu-families
-ifeq ($(BR2_arcle)$(BR2_arceb),y)
-HOST_MESON_TARGET_CPU_FAMILY = arc
-else ifeq ($(BR2_arm)$(BR2_armeb),y)
-HOST_MESON_TARGET_CPU_FAMILY = arm
-else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
-HOST_MESON_TARGET_CPU_FAMILY = aarch64
-else ifeq ($(BR2_i386),y)
-HOST_MESON_TARGET_CPU_FAMILY = x86
-else ifeq ($(BR2_mips)$(BR2_mipsel),y)
-HOST_MESON_TARGET_CPU_FAMILY = mips
-else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
-HOST_MESON_TARGET_CPU_FAMILY = mips64
-else ifeq ($(BR2_powerpc),y)
-HOST_MESON_TARGET_CPU_FAMILY = ppc
-else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
-HOST_MESON_TARGET_CPU_FAMILY = ppc64
-else ifeq ($(BR2_riscv),y)
-HOST_MESON_TARGET_CPU_FAMILY = riscv64
-else ifeq ($(BR2_sparc),y)
-HOST_MESON_TARGET_CPU_FAMILY = sparc
-else ifeq ($(BR2_sparc64),y)
-HOST_MESON_TARGET_CPU_FAMILY = sparc64
-else ifeq ($(BR2_x86_64),y)
-HOST_MESON_TARGET_CPU_FAMILY = x86_64
-else
-HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
-endif
-
-HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
-HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
-HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
-
-# Generate a Meson cross-compilation.conf suitable for use with the
-# SDK; also install the file as a template for users to add their
-# own flags if they need to.
-define HOST_MESON_INSTALL_CROSS_CONF
-	mkdir -p $(HOST_DIR)/etc/meson
-	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
-	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
-	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
-	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
-	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
-	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-	sed -e "s%@PKG_TARGET_CFLAGS@%%g" \
-	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
-	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
-	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
-	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
-endef
-
-TARGET_FINALIZE_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
-
 $(eval $(host-python-package))
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 184a22a44a..2756fb7856 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -57,32 +57,18 @@ $(2)_NINJA_ENV		?=
 ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)
 
-$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
-$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
-$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
-
-$(2)_MESON_SED_CFLAGS = $$(if $$(strip $$($(2)_CFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CFLAGS)`)
-$(2)_MESON_SED_LDFLAGS = $$(if $$(strip $$($(2)_LDFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_LDFLAGS)`)
-$(2)_MESON_SED_CXXFLAGS = $$(if $$(strip $$($(2)_CXXFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CXXFLAGS)`)
-
 # Configure package for target
 #
 #
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
-	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
-	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
-	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
-	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
-	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
-	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
-	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
-	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
-	    ) \
-	    package/meson/cross-compilation.conf.in \
+	sed $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
+                -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
+        ) \
+        $$(call HOST_MESON_CROSSCONFIG_SED,$$(if $$($(2)_CFLAGS),$(2)_CFLAGS,TARGET_CFLAGS), \
+                $$(if $$($(2)_CXXFLAGS),$(2)_CXXFLAGS,TARGET_CXXFLAGS), \
+                $$(if $$($(2)_LDFLAGS),$(2)_LDFLAGS,TARGET_LDFLAGS)) \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
@@ -178,3 +164,69 @@ endef
 
 meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
 host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
+
+################################################################################
+# Generation of the Messon compile flags and cross-compilation file
+################################################################################
+
+# https://mesonbuild.com/Reference-tables.html#cpu-families
+ifeq ($(BR2_arcle)$(BR2_arceb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+HOST_MESON_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+HOST_MESON_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_i386),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86
+else ifeq ($(BR2_mips)$(BR2_mipsel),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+HOST_MESON_TARGET_CPU_FAMILY = mips64
+else ifeq ($(BR2_powerpc),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc
+else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+HOST_MESON_TARGET_CPU_FAMILY = ppc64
+else ifeq ($(BR2_riscv),y)
+HOST_MESON_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_sparc),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc
+else ifeq ($(BR2_sparc64),y)
+HOST_MESON_TARGET_CPU_FAMILY = sparc64
+else ifeq ($(BR2_x86_64),y)
+HOST_MESON_TARGET_CPU_FAMILY = x86_64
+else
+HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
+endif
+
+# Generates sed patterns for patching the cross-compilation.conf template,
+# since Flags might contain commas the arguments are passed indirectly by
+# variable name (stripped to deal with whitespaces).
+# Aruments are variable containing cflags, cxxflags, ldflags.
+define HOST_MESON_CROSSCONFIG_SED
+        -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+        -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
+        -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
+        -e "s%@TARGET_ENDIAN@%$(call LOWERCASE,$(BR2_ENDIAN))%g" \
+        -e "s%@TARGET_CFLAGS@%$(patsubst %,\"%\"$(comma),$($(strip $(1))))%g" \
+        -e "s%@TARGET_LDFLAGS@%$(patsubst %,\"%\"$(comma),$($(strip $(3))))%g" \
+        -e "s%@TARGET_CXXFLAGS@%$(patsubst %,\"%\"$(comma),$($(strip $(2))))%g" \
+        -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+        $(TOPDIR)/support/misc/cross-compilation.conf.in
+endef
+
+# Generate a Meson cross-compilation.conf suitable for use with the
+# SDK; also install the file as a template for users to add their
+# own flags if they need to.
+define TOOLCHAIN_MESON_INSTALL_FILES
+	mkdir -p $(HOST_DIR)/etc/meson
+	sed -e "s%@TARGET_CFLAGS@%$(patsubst %,\"%\"$(comma),$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(patsubst %,\"%\"$(comma),$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(patsubst %,\"%\"$(comma),$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    $(call HOST_MESON_CROSSCONFIG_SED) \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
+	sed $(call HOST_MESON_CROSSCONFIG_SED,TARGET_CFLAGS,TARGET_CXXFLAGS,TARGET_LDFLAGS) \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_MESON_INSTALL_FILES
+TOOLCHAIN_INSTALL_STAGING = YES
diff --git a/package/meson/cross-compilation.conf.in b/support/misc/cross-compilation.conf.in
similarity index 100%
rename from package/meson/cross-compilation.conf.in
rename to support/misc/cross-compilation.conf.in
-- 
2.23.0
