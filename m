From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  5 Feb 2020 11:33:02 +0100
Subject: [Buildroot] [PATCH 1/3] package/pkg-meson.mk: refactor flags
 substitution with make-comma-list
Message-ID: <20200205103304.2515942-1-arnout@mind.be>
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

However, we already have a macro that does something similar for
generating JSON output: make-comma-list. So let's use that. However,
make-comma-list doesn't add all the shell-expanded magic like
_MESON_SED_CFLAGS, which results in the double quotes being removed by
the shell. Therefore, we also need to change the quoting around it to
single quotes instead of double quotes. For consistency, the quotes of
the other sed expressions are changed as well. Except for the
_MESON_EXTRA_BINARIES: the values set by packages (e.g. mesa3d) already
contain single quotes, so changing the surrounding quotes to double
would break them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/meson/meson.mk |  4 ----
 package/pkg-meson.mk   | 42 +++++++++++++++++++-----------------------
 2 files changed, 19 insertions(+), 27 deletions(-)

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
index e7eea2aa58..1f3aaadf5d 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -61,24 +61,20 @@ $(2)_CFLAGS ?= $$(TARGET_CFLAGS)
 $(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
 $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 
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
+	sed -e 's%@TARGET_CROSS@%$$(TARGET_CROSS)%g' \
+	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
+	    -e 's%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g' \
+	    -e 's%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g' \
+	    -e 's%@TARGET_CFLAGS@%$$(call make-comma-list,$$($(2)_CFLAGS))%g' \
+	    -e 's%@TARGET_LDFLAGS@%$$(call make-comma-list,$$($(2)_LDFLAGS))%g' \
+	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
+	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
 	    $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
 	        -e "/^\[binaries\]$$$$/s:$$$$:\n$$(x):" \
 	    ) \
@@ -188,19 +184,19 @@ host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE
 # own flags if they need to.
 define PKG_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
-	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
-	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
-	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
-	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
-	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
-	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	sed -e 's%@TARGET_CROSS@%$(TARGET_CROSS)%g' \
+	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
+	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
+	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
+	    -e 's%@TARGET_CFLAGS@%$(call make-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g' \
+	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
+	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
+	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
-	sed -e "s%@PKG_TARGET_CFLAGS@%%g" \
-	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
-	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
+	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
+	    -e 's%@PKG_TARGET_LDFLAGS@%%g' \
+	    -e 's%@PKG_TARGET_CXXFLAGS@%%g' \
 	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
-- 
2.24.1
