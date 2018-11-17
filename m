From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 17 Nov 2018 22:48:04 +0100
Subject: [Buildroot] [DRAFT v1] meson: change from global to per package
 cross-compilation.conf
Message-ID: <20181117214804.30194-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pkg-meson.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 507e686068..a01fe26060 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -64,12 +64,22 @@ ifeq ($(4),target)
 define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
+	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
+	    -e "s%@TARGET_ARCH@%$(ARCH)%g" \
+	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
+	    -e "s%@TARGET_ENDIAN@%$(call LOWERCASE,$(BR2_ENDIAN))%g" \
+	    -e "s%@TARGET_CFLAGS@%$(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)%g" \
+	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	    package/meson/cross-compilation.conf.in \
+	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
-		--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
-- 
2.19.1
