From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 26 May 2020 14:24:37 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: propagate missing
 libdrm-freedreno deps
Message-ID: <20200526202437.4126010-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libdrm freedreno depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
as such we need to propagate those dependencies to mesa's gallium
freedreno driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add note about LIBDRM_HAS_ATOMIC dependency
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
-- 
2.25.1
