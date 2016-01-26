From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Jan 2016 23:44:45 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi: not available using a
	musl-based toolchain
Message-ID: <1453848286-2477-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build stops with
configure: error: unsupported host (i586-buildroot-linux-musl)
due to musl not being supported in
https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e697b52..ed90ed6 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
-comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library"
+comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -89,6 +90,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
-- 
2.7.0.rc3
