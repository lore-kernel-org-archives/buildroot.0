From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:46:11 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi: not available
	using a musl-based toolchain
Message-ID: <20160229224615.D4573802A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=898de0af5b511c9dfb40f00469fb518810668ec0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The build stops with
configure: error: unsupported host (i586-buildroot-linux-musl)
due to musl not being supported in
https://github.com/xbmc/xbmc/blob/Isengard/m4/xbmc_arch.m4

Removing this obstacle will show that musl is really not being
supported, the build will fail:

In file included from emu_msvcrt.cpp:64:0:
emu_msvcrt.h:93:3: error: ???__off64_t??? does not name a type
   __off64_t dll_lseeki64(int fd, __off64_t lPos, int iWhence);
   ^
emu_msvcrt.h:94:3: error: ???__off_t??? does not name a type
   __off_t dll_lseek(int fd, __off_t lPos, int iWhence);
   ^

I know these problems are fixable and the voidlinux projects seems to
have done it already for 15.2-Isengard:
https://github.com/voidlinux/void-packages/tree/99f74705bc6520297d689fae4bcc9606c71ad34f/srcpkgs/kodi/patches

For Jarvis-16.0 these patches have to be rebased at a later stage.
For now block the Kodi package with musl-based toolchains to avoid
build errors.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 23468cc..13be622 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) && BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
-comment "kodi needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7"
+comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_KODI_EGL_GLES
@@ -92,6 +93,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
