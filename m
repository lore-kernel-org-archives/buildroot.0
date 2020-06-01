From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2020 22:03:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/mesa3d: propagate
 missing libdrm-freedreno deps
Message-ID: <20200601201602.EFFF085F5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ce681d2f69c5f0c2c3f581f8f5dda8822ede5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
as such we need to propagate those dependencies to mesa's gallium
freedreno driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 00c1a8c34f7340c2db6eee82cd8d3f5e6ea62577)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 16d77f42c2..ade13ec035 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -112,6 +112,12 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
+	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be # libdrm-freedreno
+	# libdrm's freedreno option depends on LIBDRM_HAS_ATOMIC. Propagating
+	# that dependency here causes a circular dependency that Kconfig
+	# can't see is just spurious. However, that dependency is about
+	# the toolchain having sync4 primitives, which is always a given
+	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
