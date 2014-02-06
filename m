From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Thu, 6 Feb 2014 20:25:39 +0100
Subject: [Buildroot] [PATCH v4 2/3] libdrm: Remove dependency towards X11
In-Reply-To: <1391714740-1495-1-git-send-email-berndkuhls@hotmail.com>
References: <1391714740-1495-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP2147F39F405B1DBA87896BBD9940@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using this defconfig

BR2_x86_pentium_mmx=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
# BR2_UCLIBC_INSTALL_UTILS is not set
BR2_BINUTILS_VERSION_2_23_2=y
BR2_GCC_VERSION_4_8_X=y
BR2_PACKAGE_LIBDRM=y
BR2_PACKAGE_LIBDRM_RADEON=y
BR2_PACKAGE_LIBDRM_NOUVEAU=y
BR2_PACKAGE_LIBDRM_VMWGFX=y

libdrm (w/o Intel API) compiles without BR2_PACKAGE_LIBATOMIC_OPS and without
BR2_PACKAGE_XLIB_LIBPCIACCESS, so USE_WCHAR, TOOLCHAIN_HAS_THREADS and
!BR2_PREFER_STATIC_LIB, previously added by the Xorg dependency, do not seem
to be necessary for libdrm at all.

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v5: Moved patch changelog, added explanation about dependencies (Arnout)
v4: remove unnecessary dependencies (Arnout)
v3: rebased v2
v2: http://patchwork.ozlabs.org/patch/304116/ (Paul Cercueil)
v1: http://patchwork.ozlabs.org/patch/278297/ (Spenser Gilliland)

 package/libdrm/Config.in |    7 +------
 package/libdrm/libdrm.mk |    3 ---
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 4d7646b..7192e94 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
 	select BR2_PACKAGE_LIBPTHREAD_STUBS
-	depends on BR2_PACKAGE_XORG7
 	depends on BR2_LARGEFILE
 	help
 	  Direct Rendering Manager
@@ -14,6 +13,7 @@ menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
@@ -22,22 +22,18 @@ config BR2_PACKAGE_LIBDRM_INTEL
 
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
-	select BR2_PACKAGE_LIBATOMIC_OPS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install AMD/ATI graphics driver
 
 config BR2_PACKAGE_LIBDRM_NOUVEAU
 	bool "nouveau"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  install Nvidia graphics driver
 
 config BR2_PACKAGE_LIBDRM_VMWGFX
 	bool "vmwgfx"
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  installs Vmware graphics driver
@@ -65,5 +61,4 @@ endmenu
 endif
 
 comment "libdrm needs a toolchain w/ largefile"
-	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_LARGEFILE
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index dd08af1..cecb382 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -28,21 +28,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
 LIBDRM_CONF_OPT += --enable-radeon
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
 LIBDRM_CONF_OPT += --enable-nouveau
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-nouveau
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
 LIBDRM_CONF_OPT += --enable-vmwgfx
-LIBDRM_DEPENDENCIES += xlib_libpciaccess
 else
 LIBDRM_CONF_OPT += --disable-vmwgfx
 endif
-- 
1.7.9.5
