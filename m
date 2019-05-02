From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  2 May 2019 22:14:36 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/pkg-meson: change to use
 upper-case package name as parameter
In-Reply-To: <20190502201436.6163-1-ps.report@gmx.net>
References: <20190502201436.6163-1-ps.report@gmx.net>
Message-ID: <20190502201436.6163-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to use upper-case package name as parameter, rather than expect
it from a variable.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - suggested by Arnout Vandecappelle
---
 package/pkg-meson.mk | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 597c48b90a..09d98d61a7 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -63,8 +63,8 @@ ifeq ($(4),target)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_BUILDDIR)
-	mkdir -p $$($$(PKG)_BUILDDIR)
+	rm -rf $$($(2)_BUILDDIR)
+	mkdir -p $$($(2)_BUILDDIR)
 	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
@@ -74,32 +74,32 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    package/meson/cross-compilation.conf.in \
-	    > $$($$(PKG)_BUILDDIR)/cross-compilation.conf
-	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
+	    > $$($(2)_BUILDDIR)/cross-compilation.conf
+	PATH=$$(BR_PATH) $$($(2)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_BUILDDIR)/cross-compilation.conf \
-		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
+		--cross-file=$$($(2)_BUILDDIR)/cross-compilation.conf \
+		$$($(2)_CONF_OPTS) \
+		$$($(2)_SRCDIR) $$($(2)_BUILDDIR)
 endef
 else

 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_BUILDDIR)
-	mkdir -p $$($$(PKG)_BUILDDIR)
+	rm -rf $$($(2)_BUILDDIR)
+	mkdir -p $$($(2)_BUILDDIR)
 	$$(HOST_CONFIGURE_OPTS) \
-	$$($$(PKG)_CONF_ENV) $$(MESON) \
+	$$($(2)_CONF_ENV) $$(MESON) \
 		--prefix=$$(HOST_DIR) \
 		--libdir=lib \
 		--sysconfdir=$$(HOST_DIR)/etc \
 		--localstatedir=$$(HOST_DIR)/var \
 		--default-library=shared \
 		--buildtype=release \
-		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
+		$$($(2)_CONF_OPTS) \
+		$$($(2)_SRCDIR) $$($(2)_BUILDDIR)
 endef
 endif
 endif
@@ -113,13 +113,13 @@ $(2)_DEPENDENCIES += host-meson
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(TARGET_MAKE_ENV) $$($(2)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) $$($(2)_NINJA_OPTS) -C $$($(2)_BUILDDIR)
 endef
 else
 define $(2)_BUILD_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
+	$$(HOST_MAKE_ENV) $$($(2)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) $$($(2)_NINJA_OPTS) -C $$($(2)_BUILDDIR)
 endef
 endif
 endif
@@ -130,8 +130,8 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
+	$$(HOST_MAKE_ENV) $$($(2)_NINJA_ENV) \
+		$$(NINJA) $$(NINJA_OPTS) -C $$($(2)_BUILDDIR) install
 endef
 endif

@@ -141,8 +141,8 @@ endif
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
+	$$(TARGET_MAKE_ENV) $$($(2)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
+		$$(NINJA) $$(NINJA_OPTS) -C $$($(2)_BUILDDIR) install
 endef
 endif

@@ -152,8 +152,8 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
+	$$(TARGET_MAKE_ENV) $$($(2)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
+		$$(NINJA) $$(NINJA_OPTS) -C $$($(2)_BUILDDIR) install
 endef
 endif

--
2.21.0
