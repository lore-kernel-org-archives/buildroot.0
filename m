From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:25:41 +0100
Subject: [Buildroot] [git commit] package/pkg-meson.mk: fix
 cross-compilation.conf
Message-ID: <20200311211659.76BC690999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fb784afb124ec689330177da5ee0e3e744f6237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$$(STAGING_DIR) -> $(STAGING_DIR) in PKG_MESON_INSTALL_CROSS_CONF.

$$ resulted in `$(STAGING_DIR)` in the file instead of the expanded
value.

Note that this change only affects the etc config at:
host/etc/meson/cross-compilation.conf

Per-package cross-compilation.conf files are already correct.

Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 642b715938..416129f6fe 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -193,7 +193,7 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
-	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
+	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
 	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
 	sed -e 's%@PKG_TARGET_CFLAGS@%%g' \
