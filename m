From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:56:23 +0100
Subject: [Buildroot] [git commit] package/kodi: needs host gcc >= 4.6
Message-ID: <20160320135630.1CB5E817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7fa8f42ec7c0494d04b1f4a76356b48c5693ab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...exturePacker-fix-compilation-with-gcc-4.6.patch | 53 ++++++++++++++++++++++
 package/kodi/Config.in                             |  4 +-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch b/package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
new file mode 100644
index 0000000..3d9370f
--- /dev/null
+++ b/package/kodi/0006-native-TexturePacker-fix-compilation-with-gcc-4.6.patch
@@ -0,0 +1,53 @@
+From 2b395fb3f07551ae1ce2e484c14ac59f36e192b0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Thu, 17 Mar 2016 21:47:53 +0100
+Subject: [PATCH] native/TexturePacker: fix compilation with gcc 4.6
+
+Kodi itself depends on gcc >= 4.7 due to its use of the C++11 standard.
+When cross-compiling the host gcc currently also needs to be >= 4.7 due
+to the texturepacker tool being needed as native binary to compile
+Textures.xbt for the target system.
+
+Cross-compiling on a system where host gcc is at version 4.6 fails atm
+with this error:
+
+cc1plus: error: unrecognized command line option '-std=c++11'
+make[4]: *** [md5.o] Error 1
+make[4]: *** Waiting for unfinished jobs....
+cc1plus: error: unrecognized command line option '-std=c++11'
+cc1plus: error: unrecognized command line option '-std=c++11'
+
+make[4]: *** [DecoderManager.o] Error 1
+make[4]: *** [XBTFWriter.o] Error 1
+cc1plus: error: unrecognized command line option '-std=c++11'
+make[4]: *** [TexturePacker.o] Error 1
+cc1plus: error: unrecognized command line option '-std=c++11'
+make[4]: *** [decoder/PNGDecoder.o] Error 1
+make[3]: *** [all] Error 2
+make[2]: *** [native/TexturePacker] Error 2
+
+Using this patch the problem is fixed and a working TexturePacker host
+binary is created.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Patch sent upstream: https://github.com/xbmc/xbmc/pull/9378
+---
+ tools/depends/native/TexturePacker/src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/depends/native/TexturePacker/src/Makefile.am b/tools/depends/native/TexturePacker/src/Makefile.am
+index c1fc8be..d075290 100644
+--- a/tools/depends/native/TexturePacker/src/Makefile.am
++++ b/tools/depends/native/TexturePacker/src/Makefile.am
+@@ -2,7 +2,7 @@ AUTOMAKE_OPTIONS = subdir-objects
+ 
+ AM_CFLAGS = -DTARGET_POSIX -DUSE_LZO_PACKING
+ AM_CFLAGS += @EXTRA_DEFINES@
+-AM_CXXFLAGS = $(AM_CFLAGS) -std=c++11
++AM_CXXFLAGS = $(AM_CFLAGS) -std=c++0x
+ 
+ AM_CPPFLAGS = \
+   -I. \
+-- 
+2.7.0
+
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9590070..ff2e75c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -4,10 +4,11 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
-comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7"
+comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
 	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_HOST_GCC_AT_LEAST_4_6 \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
@@ -36,6 +37,7 @@ comment "kodi requires an OpenGL ES and EGL backend"
 menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
