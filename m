From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 17:58:50 +0100
Subject: [Buildroot] [PATCH 1/3] package/pkg-meson.mk: refactor flags
 substitution into function
Message-ID: <20200204165852.1819360-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkg-meson defines variables _MESON_SED_CFLAGS, _MESON_SED_LDFLAGS and
_MESON_SED_CXXFLAGS that reformat the make-style flags (space-separated
and unquoted) as meson-style flags (comma-separated and double-quoted).
Similar variables are also defined in meson.mk. A future patch will add
even more similar cases.

Refactor this by defining a macro for this substitution, and using that
macro in all places where *_MESON_SED_* is used. The definitions of
these variables are no longer needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/meson/meson.mk |  4 ----
 package/pkg-meson.mk   | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e51e76d1c0..810c84690a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -45,10 +45,6 @@ else
 HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
 endif
 
-HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
-HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
-HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
-
 # Avoid interpreter shebang longer than 128 chars
 define HOST_MESON_SET_INTERPRETER
 	$(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e7eea2aa58..f1a3a69129 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -29,6 +29,10 @@ MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
 NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
 NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
+# convert space-separated 'make'-style list of flags to comma-separated and
+# double-quoted 'meson'-style
+meson-format-flags = $(if $(strip $(1)),`printf '"%s"$(comma) ' $(1)`)
+
 ################################################################################
 # inner-meson-package -- defines how the configuration, compilation and
 # installation of a Meson package should be done, implements a few hooks to
@@ -61,10 +65,6 @@ $(2)_CFLAGS ?= $$(TARGET_CFLAGS)
 $(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
 $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 
-$(2)_MESON_SED_CFLAGS = $$(if $$(strip $$($(2)_CFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CFLAGS)`)
-$(2)_MESON_SED_LDFLAGS = $$(if $$(strip $$($(2)_LDFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_LDFLAGS)`)
-$(2)_MESON_SED_CXXFLAGS = $$(if $$(strip $$($(2)_CXXFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CXXFLAGS)`)
-
 # Configure package for target
 #
 #
@@ -75,9 +75,9 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
-	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
-	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@TARGET_CFLAGS@%$$(call meson-format-flags,$$($(2)_CFLAGS))%g" \
+	    -e "s%@TARGET_LDFLAGS@%$$(call meson-format-flags,$$($(2)_LDFLAGS))%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$$(call meson-format-flags,$$($(2)_CXXFLAGS))%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
 	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
@@ -192,9 +192,9 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
-	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CFLAGS@%$(call meson-format-flags,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(call meson-format-flags,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(call meson-format-flags,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-- 
2.24.1
