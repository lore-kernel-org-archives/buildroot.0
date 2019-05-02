From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  2 May 2019 22:14:35 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/pkg-meson: change to use
 <PKG>_BUILDDIR
Message-ID: <20190502201436.6163-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to use <PKG>_BUILDDIR (and change from <PKG>_SRCDIR/build
to <PKG>_SRCDIR/buildroot-build as in package/pkg-cmake.mk).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - suggested change by Arnout Vandecappelle
  - <PKG>_SRCDIR seems to contain already an trailing '/', so
    <PKG>_BUILDDIR gets an double '//' path seperator
---
 package/pkg-meson.mk | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 886fcf7205..597c48b90a 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -49,6 +49,8 @@ $(2)_CONF_ENV		?=
 $(2)_CONF_OPTS		?=
 $(2)_NINJA_ENV		?=

+$(2)_BUILDDIR		?= $$($(2)_SRCDIR)/buildroot-build
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -61,8 +63,8 @@ ifeq ($(4),target)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_BUILDDIR)
+	mkdir -p $$($$(PKG)_BUILDDIR)
 	sed -e "s%@TARGET_CROSS@%$$(TARGET_CROSS)%g" \
 	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
 	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
@@ -72,22 +74,22 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
 	    package/meson/cross-compilation.conf.in \
-	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
+	    > $$($$(PKG)_BUILDDIR)/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_BUILDDIR)/cross-compilation.conf \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
 endef
 else

 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_BUILDDIR)
+	mkdir -p $$($$(PKG)_BUILDDIR)
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=$$(HOST_DIR) \
@@ -97,7 +99,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=shared \
 		--buildtype=release \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
@@ -112,12 +114,12 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 else
 define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_BUILDDIR)
 endef
 endif
 endif
@@ -129,7 +131,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
 endef
 endif

@@ -140,7 +142,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
 endef
 endif

@@ -151,7 +153,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_BUILDDIR) install
 endef
 endif

--
2.21.0
