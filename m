From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  3 Apr 2019 20:32:01 +0200
Subject: [Buildroot] [PATCH 1/2] meson: add entry for libgcrypt-config in
 cross file
Message-ID: <20190403183202.19682-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 0.49.0 the Meson build system has native support for
looking for `libgcrypt-config` if no pkg-config file is found. As the
latest version 1.8.4 of libgcrypt does not provide a .pc file, using
`libgcrypt-config` is the only way for detecting the required libraries
when linking agains libgrypt.

The `libgcrypt-config` entry is necessary for updating package mpd,
which switched from the Autotools to the Meson build system when bumping
from version 0.20 to 0.21.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/meson/cross-compilation.conf.in | 1 +
 package/meson/meson.mk                  | 1 +
 package/pkg-meson.mk                    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
index fc8e27f7eb..b68499a6fa 100644
--- a/package/meson/cross-compilation.conf.in
+++ b/package/meson/cross-compilation.conf.in
@@ -9,6 +9,7 @@ cpp = '@TARGET_CROSS at g++'
 ar = '@TARGET_CROSS at ar'
 strip = '@TARGET_CROSS at strip'
 pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
+libgcrypt-config = '@STAGING_DIR@/usr/bin/libgcrypt-config'
 
 [properties]
 needs_exe_wrapper = true
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 49e27f5527..113ff058f7 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -61,6 +61,7 @@ define HOST_MESON_INSTALL_CROSS_CONF
 	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
+	    -e "s%@STAGING_DIR@%$(STAGING_DIR)%g" \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 886fcf7205..6ec45b8b82 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -71,6 +71,7 @@ define $(2)_CONFIGURE_CMDS
 	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
 	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
 	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
+	    -e "s%@STAGING_DIR@%$$(STAGING_DIR)%g" \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
 	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
-- 
2.21.0
