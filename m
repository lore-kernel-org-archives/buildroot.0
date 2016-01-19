From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 19 Jan 2016 08:03:04 +0100
Subject: [Buildroot] [PATCH v2] libdrm: disable drivers for sparcv8
Message-ID: <20160119070304.GA27854@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The drivers use atomic ops as CAS, which fails
to compile for sparcv8, but works fine for leon3.

Fixes following autobuild error:
http://autobuild.buildroot.net/results/fa0ac44d3c7953b2e2afa03cd7570d8a5d49fcc4/

Disable all sub packages using the DRM drivers.

As SPARC systems normally have SBUS graphic cards and I think nobody
cares about 3D graphics on these machines, all gallium drivers
are disabled for simplification, even if swrast might be used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
 - disable sub packages using libdrm drivers, suggested by Thomas Petazzoni

---
 package/libdrm/Config.in                           |    1 +
 package/mesa3d/Config.in                           |    2 ++
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    1 +
 package/x11r7/xdriver_xf86-video-nouveau/Config.in |    1 +
 4 files changed, 5 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 445a85b..bacbeac 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	  This option allows to install the libdrm test programs.
 
 menu "DRM Drivers"
+depends on !BR2_sparc_v8 # drivers need atomic ops
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8c72a3d..3f4fbd1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
 comment "Gallium drivers"
+depends on !BR2_sparc_v8 # drivers need atomic ops
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
@@ -93,6 +94,7 @@ comment "DRI drivers need X.Org"
 if BR2_PACKAGE_XORG7
 
 comment "DRI drivers"
+depends on !BR2_sparc_v8 # drivers need atomic ops
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	bool "DRI swrast driver"
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 55be603..c4afde6 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_PACKAGE_MESA3D
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm -> libpthread-stubs
+	depends on !BR2_sparc_v8 # drivers need atomic ops
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/Config.in b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
index 7e756e2..d671e94 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nouveau/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NOUVEAU
 	bool "xf86-video-nouveau"
 	depends on BR2_PACKAGE_MESA3D
+	depends on !BR2_sparc_v8 # drivers need atomic ops
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
-- 
1.7.10.4
