From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Jul 2018 21:16:03 +0200
Subject: [Buildroot] [RFC v2 2/4] meson: change from global to per package
 cross-compilation.conf
In-Reply-To: <20180717191605.19263-1-ps.report@gmx.net>
References: <20180717191605.19263-1-ps.report@gmx.net>
Message-ID: <20180717191605.19263-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add FOO_MESON_CFLAGS, FOO_MESON_LDFLAGS and FOO_MESON_CXXFLAGS
variables to allow per package additional flags.

Change to buildtype plain as all compiler/linker flags forcing
debug/release are already given via the cross-compilation.conf
file.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - documentation change for new flags missing
  - use in pkg-meson.mk the same sed/printf for flags quotation mark
    and comma adding

Changes v1 -> v2:
  - no changes
---
 package/meson/cross-compilation.conf.in | 8 ++++----
 package/meson/meson.mk                  | 6 +++---
 package/pkg-meson.mk                    | 9 +++++++--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index 0eec74087b..6af03314eb 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -11,10 +11,10 @@ strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
 
 [properties]
-c_args = [@TARGET_CFLAGS@]
-c_link_args = [@TARGET_LDFLAGS@]
-cpp_args = [@TARGET_CXXFLAGS@]
-cpp_link_args = [@TARGET_LDFLAGS@]
+c_args = [@TARGET_CFLAGS@ @PKG_TARGET_CFLAGS@]
+c_link_args = [@TARGET_LDFLAGS@ @PKG_TARGET_LDFLAGS@]
+cpp_args = [@TARGET_CXXFLAGS@ @PKG_TARGET_CXXFLAGS@]
+cpp_link_args = [@TARGET_LDFLAGS@ @PKG_TARGET_LDFLAGS@]
 
 [host_machine]
 system = 'linux'
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d110e594f5..0f2ee2855d 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -20,7 +20,7 @@ HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_C
 HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
 HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
 
-define HOST_MESON_INSTALL_CROSS_CONF
+define HOST_MESON_INSTALL_CROSS_CONF_IN
 	mkdir -p $(HOST_DIR)/etc/meson
 	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
 	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
@@ -31,9 +31,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
-	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
+	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 endef
 
-HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF
+HOST_MESON_POST_INSTALL_HOOKS += HOST_MESON_INSTALL_CROSS_CONF_IN
 
 $(eval $(host-python-package))
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 507e686068..565e10e8fb 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -64,12 +64,17 @@ ifeq ($(4),target)
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
+	sed -e "s%@PKG_TARGET_CFLAGS@%$$($$(PKG)_MESON_CFLAGS)%g" \
+	    -e "s%@PKG_TARGET_LDFLAGS@%$$($$(PKG)_MESON_LDFLAGS)%g" \
+	    -e "s%@PKG_TARGET_CXXFLAGS@%$$($$(PKG)_MESON_CXXFLAGS)%g" \
+	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
+	    > $$($$(PKG)_SRCDIR)/build//cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
-		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-		--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+		--buildtype=plain \
+		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
-- 
2.18.0
