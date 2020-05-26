From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:44:31 +0200
Subject: [Buildroot] [git commit] package/mesa3d: propagate missing
 libdrm-freedreno deps
Message-ID: <20200526202729.8B67D87C4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00c1a8c34f7340c2db6eee82cd8d3f5e6ea62577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
as such we need to propagate those dependencies to mesa's gallium
freedreno driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd512d9b76..11d04b7a3f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -111,6 +111,12 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	bool "Gallium freedreno driver"
+	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be # libdrm-freedreno
+	# libdrm's freedreno option depends on LIBDRM_HAS_ATOMIC. Propagating
+	# that dependency here causes a circular dependency that Kconfig
+	# can't see is just spurious. However, that dependency is about
+	# the toolchain having sync4 primitives, which is always a given
+	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
