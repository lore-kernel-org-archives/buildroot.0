From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 12:53:16 +0200
Subject: [Buildroot] [PATCH] libdrm: improve atomic handling,
	fix SPARCv8 build
Message-ID: <1464259996-7505-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves the handling of the "atomic stuff" in the libdrm
package. libdrm can either use the atomic intrinsics (4 byte variant)
when available, or otherwise can use libatomic_ops. Note that the
dependency on atomic operations is not from libdrm itself, but only
from some specific DRM drivers only.

Amongst other things, it fixes the build of the libdrm package on
SPARCv8, therefore fixing:

  http://autobuild.buildroot.org/results/74dd29b5ea146c320fde80a87a2fc910de9b7f60/

This commit does a number of changes that are all related to each
other:

 - Removes the dependency of the Intel DRM driver on
   libatomic_ops. The Intel DRM driver builds perfectly fine without
   libatomic_ops, as long as 4-byte variant __sync operations are
   available, which is always the case on x86 and x86_84 (which are
   the only architectures on which the Intel DRM driver can be
   enabled).

 - Adds an hidden Config.in boolean option
   BR2_PACKAGE_LIBDRM_HAS_ATOMIC that allows DRM driver that need
   atomic operation to know whether atomic support is available
   (either through intrinsics or through libatomic_ops).

 - Adds an hidden BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC Config.in option
   that DRM drivers that need atomic operation should select to ensure
   that the relevant dependencies are selected. It simply selects
   libatomic_ops if 4-byte atomic intrinsics are not available. We
   could let each DRM driver do this, but having an intermediate
   option avoids a bit of duplication.

 - Adds a patch that defines AO_REQUIRE_CAS before including
   <atomic_ops.h>. This is needed because libdrm uses the
   AO_compare_and_swap_full() which is only provided on all
   architectures when AO_REQUIRE_CAS is defined. The exact same fix
   was done in the erlang package in commit
   4a9df2942470241d7a96f326f0e7012aacd36f2e.

 - Adds the dependency on libatomic_ops when the package is enabled,
   and passes the necessary CFLAGS on SPARCv8 to make the thing build
   properly. The same CFLAGS are passed in the nginx package and bdwgc
   package.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...omic-require-CAS-support-in-libatomic_ops.patch | 32 ++++++++++++++++++++++
 package/libdrm/Config.in                           | 24 +++++++++++++++-
 package/libdrm/libdrm.mk                           |  9 +++++-
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch

diff --git a/package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch b/package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch
new file mode 100644
index 0000000..ff920fb
--- /dev/null
+++ b/package/libdrm/0003-xf86atomic-require-CAS-support-in-libatomic_ops.patch
@@ -0,0 +1,32 @@
+From 7384f79f69fdb7b691cc5b0c28c301b3fe8b633e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 26 May 2016 10:46:57 +0200
+Subject: [PATCH] xf86atomic: require CAS support in libatomic_ops
+
+Since AO_compare_and_swap_full() is used by libdrm, AO_REQUIRE_CAS
+must be defined before including <atomic_ops.h> so that we are sure
+that CAS support will be provided. This is necessary to make sure that
+the AO_compare_and_swap_full() function will be provided on all
+architectures, including the ones that don't have built-in CAS support
+such as SPARCv8.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ xf86atomic.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xf86atomic.h b/xf86atomic.h
+index 922b37d..d7017a5 100644
+--- a/xf86atomic.h
++++ b/xf86atomic.h
+@@ -58,6 +58,7 @@ typedef struct {
+ #endif
+ 
+ #if HAVE_LIB_ATOMIC_OPS
++#define AO_REQUIRE_CAS
+ #include <atomic_ops.h>
+ 
+ #define HAS_ATOMIC_OPS 1
+-- 
+2.7.4
+
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 343a2ed..7c2a828 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -9,6 +9,15 @@ config BR2_PACKAGE_LIBDRM
 
 if BR2_PACKAGE_LIBDRM
 
+config BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	bool
+	default y if BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS || \
+		BR2_TOOLCHAIN_HAS_SYNC_4
+
+config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
+	bool
+	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4
+
 config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
 	bool "Install test programs"
 	help
@@ -18,24 +27,31 @@ menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	select BR2_PACKAGE_LIBATOMIC_OPS
 	select BR2_PACKAGE_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install intel graphics driver.
 
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install AMD/ATI graphics driver.
 
 config BR2_PACKAGE_LIBDRM_AMDGPU
 	bool "amdgpu"
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install AMD GPU driver.
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install NVIDIA graphics driver.
 
@@ -48,6 +64,8 @@ config BR2_PACKAGE_LIBDRM_VMWGFX
 config BR2_PACKAGE_LIBDRM_OMAP
 	bool "omap (experimental)"
 	depends on BR2_arm
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install the TI OMAP driver using an experimental API.
 
@@ -60,12 +78,16 @@ config BR2_PACKAGE_LIBDRM_EXYNOS
 config BR2_PACKAGE_LIBDRM_FREEDRENO
 	bool "freedreno"
 	depends on BR2_arm || BR2_aarch64 || BR2_aarch64_be
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install Qualcomm Snapdragon driver.
 
 config BR2_PACKAGE_LIBDRM_TEGRA
 	bool "tegra (experimental)"
 	depends on BR2_arm
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install NVIDIA Tegra driver using an experimental API.
 
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 1d41f05..50fa7ef 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -21,9 +21,16 @@ LIBDRM_CONF_OPTS = \
 
 LIBDRM_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+LIBDRM_DEPENDENCIES += libatomic_ops
+ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
+LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += --enable-intel
-LIBDRM_DEPENDENCIES += libatomic_ops libpciaccess
+LIBDRM_DEPENDENCIES += libpciaccess
 else
 LIBDRM_CONF_OPTS += --disable-intel
 endif
-- 
2.7.4
