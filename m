From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 14:34:25 +0100
Subject: [Buildroot] [git commit] package/meson: install
 cross-compilation.conf during toolchain install
Message-ID: <20191027132802.CCA5A89121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccc9e05990a44d8db5825c07ed61d405ebb40caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

package/meson installs a cross-compilation.conf file in
$(HOST_DIR)/etc/meson, via TARGET_FINALIZE_HOOKS.

package/pkg-cmake.mk installs a toolchainfile.cmake in
$(HOST_DIR)/share/buildroot, via TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.

Both files have a similar concept, they describe some flags/paths needed for
compilation using respective build systems. One difference is that the meson
file is added for external compilation, from the SDK, while the cmake file
is used internally in Buildroot.

The 'problem' of using TARGET_FINALIZE_HOOKS for the meson file, is that it
installs a 'host' file from target-finalize, which is conceptually incorrect
since not just TARGET_DIR but also HOST_DIR is "regenerated" on a subsequent
'make' when everything was already built (i.e. only target-finalize is run).

This can easily be fixed, by using the same hook as cmake uses, i.e.
TOOLCHAIN_POST_INSTALL_STAGING_HOOKS.

Note that actually even for cmake, TOOLCHAIN_POST_INSTALL_STAGING_HOOKS is
not the best hook to install a host file. A better hook would have been
TOOLCHAIN_POST_INSTALL_HOOKS, but this triggers only for 'host' packages,
and 'toolchain' is treated as a 'target' package.

Also, the hook (and therefore also the definition of
PKG_MESON_INSTALL_CROSS_CONF) is moved to pkg-meson.mk, again to make it
more similar to how it's done for cmake. Otherwise check-package
complains that the meson package is setting variables that don't start
with MESON_.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/meson/meson.mk | 24 ------------------------
 package/pkg-meson.mk   | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 29a192c569..c708532c6d 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -49,28 +49,4 @@ HOST_MESON_SED_CFLAGS = $(if $(strip $(TARGET_CFLAGS)),`printf '"%s"$(comma) ' $
 HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
 HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
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
index 184a22a44a..2189565440 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -178,3 +178,32 @@ endef
 
 meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
 host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
+
+################################################################################
+# Generation of the Meson cross-compilation.conf file
+################################################################################
+
+# Generate a Meson cross-compilation.conf suitable for use with the
+# SDK; also install the file as a template for users to add their
+# own flags if they need to.
+define PKG_MESON_INSTALL_CROSS_CONF
+	mkdir -p $(HOST_DIR)/etc/meson
+	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
+	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
+	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
+	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
+	sed -e "s%@PKG_TARGET_CFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
+	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
+endef
+
+TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+TOOLCHAIN_INSTALL_STAGING = YES
