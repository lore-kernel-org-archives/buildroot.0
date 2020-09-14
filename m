From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Sep 2020 21:57:33 +0200
Subject: [Buildroot] [git commit] package/pkg-meson: ensure the global
 cross-compilation.conf file is correct
Message-ID: <20200914195135.A88368B253@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48d2606e28c41e22971e2b6ee163a6cedf041813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the cross-compilation.conf installed in
$(HOST_DIR)/etc/meson/cross-compilation.conf for use by the SDK is
generated in a post-install-staging hook of the toolchain package.

With per-package directory support enabled, this means that the
generated cross-compilation.conf contains references to the
per-package directory of the toolchain/ package, which is not want we
want:

[binaries]
c = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-gcc'
cpp = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-g++'
ar = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-ar'
strip = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/bin/arm-linux-strip'
pkgconfig = '/home/thomas/projets/buildroot/output/per-package/toolchain/host/usr/bin/pkg-config'

So instead, we generate this file in TOOLCHAIN_TARGET_FINALIZE_HOOKS,
so that the global paths are used:

[binaries]
c = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc'
cpp = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-g++'
ar = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-ar'
strip = '/home/thomas/projets/buildroot/output/host/bin/arm-linux-strip'
pkgconfig = '/home/thomas/projets/buildroot/output/host/usr/bin/pkg-config'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-meson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e827bb5f3c..c3fe6df5d0 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -205,4 +205,4 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
 endef
 
-TOOLCHAIN_POST_INSTALL_STAGING_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
+TOOLCHAIN_TARGET_FINALIZE_HOOKS += PKG_MESON_INSTALL_CROSS_CONF
