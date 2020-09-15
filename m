From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 15 Sep 2020 12:05:43 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-meson.mk: fix generation of
 pkg_config_static prop
Message-ID: <20200915100546.806157-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes following in the generated cross-complation.conf file:
pkg_config_static = '$(if $(BR2_STATIC_LIBS),true,false)'

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-   truly fix the issue, missed one double $
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index c3fe6df5d0..3a34ba703b 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -195,7 +195,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
-	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
+	    -e 's%@STATIC@%$(if $(BR2_STATIC_LIBS),true,false)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
-- 
2.28.0
