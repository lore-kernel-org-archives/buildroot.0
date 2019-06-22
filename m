From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 22:20:46 +0200
Subject: [Buildroot] [PATCHv2] meson: add per package optional
 compiler/linker flags
Message-ID: <20190622202046.21817-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

Add LIBFOO_CFLAGS, LIBFOO_LDFLAGS and LIBFOO_CXXFLAGS variables to allow
packages to provide their own flags, possibly overriding the generic
ones entirely, like we allow for other infras.

This means that the meson infra is the first and only infra for which
FOO_CFLAGS, FOO_LDFLAGS, and FOOO_CXXFLAGS are meaningful, while for the
other infras, they are just variable private to the package itself.
Instead of naming those variables after the meson infra (e.g.
LIBFOO_MESON_CFLAGS), we name them with a generic name, as mayb, just
maybe, we could also change the ither infras to also recognise those
variables.

To mimic this feature for packages that are bui9lt from the SDK, we also
install a templatised version of cross-compilation.conf, with three new
placeholders for custom flags. If a user wants to buidl a package that
needs custom flags, they can use that template to generate a per-pacakge
cross-compilation.conf.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v1 -> v2 (adopted by Yann):
  - rename the variables
  - don't add new placeholders in the bundled template; instead, insert
    those placeholders when generating the partially-templatised
    template (irk!).
  - update the doc
---
 docs/manual/adding-packages-meson.txt | 12 ++++++++++++
 package/meson/meson.mk                | 14 ++++++++++----
 package/pkg-meson.mk                  | 14 +++++++++++---
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 30c338f486..c0bfa6a13f 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -97,6 +97,18 @@ will therefore only use a few of them.
 * +FOO_CONF_OPTS+, to specify additional options to pass to +meson+ for the
   configuration step. By default, empty.
 
+* +FOO_CFLAGS+, to specify compiler arguments added to the package specific
+  +cross-compile.conf+ file +c_args+ property. By default, empty, so that
+  the global +TARGET_CFLAGS+ are used.
+
+* +FOO_CXXFLAGS+, to specify compiler arguments added to the package specific
+  +cross-compile.conf+ file +cpp_args+ property. By default, empty, so that
+  the global +TARGET_CXXFLAGS+ are used.
+
+* +FOO_LDFLAGS+, to specify compiler arguments added to the package specific
+  +cross-compile.conf+ file +c_link_args+ and +cpp_link_args+ properties. By
+  default, empty, so that the global +TARGET_LDFLAGS+ are used.
+
 * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
   +ninja+, meson companion tool in charge of the build operations. By default,
   empty.
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 5b5100cccc..c9269d2a7c 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -50,18 +50,24 @@ HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET
 HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
 # Generate a Meson cross-compilation.conf suitable for use with the
-# SDK
+# SDK; also install the file as a template for users to add their
+# own flags if they need to.
 define HOST_MESON_INSTALL_CROSS_CONF
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
 	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
-	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
-	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
+	sed -e "s%@PKG_TARGET_CFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
+	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
+	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 886fcf7205..807b578219 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -57,6 +57,14 @@ $(2)_NINJA_ENV		?=
 ifndef $(2)_CONFIGURE_CMDS
 ifeq ($(4),target)
 
+$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
+$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
+$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
+
+$(2)_MESON_SED_CFLAGS = $(if $($(2)_CFLAGS),`printf '"%s"$$(comma) ' $($(2)_CFLAGS)`)
+$(2)_MESON_SED_LDFLAGS = $(if $($(2)_LDFLAGS),`printf '"%s"$$(comma) ' $($(2)_LDFLAGS)`)
+$(2)_MESON_SED_CXXFLAGS = $(if $($(2)_CXXFLAGS),`printf '"%s"$$(comma) ' $$($$(2)_CXXFLAGS)`)
+
 # Configure package for target
 #
 #
@@ -67,9 +75,9 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
 	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
-	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
-	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
-	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
+	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
+	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
-- 
2.20.1
