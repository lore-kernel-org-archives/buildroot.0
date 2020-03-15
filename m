From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:07:04 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libvncserver:
 needs dynamic library
Message-ID: <20200315095840.5578E83F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=598027e3f5f8902f2cf1e63f6d37fab15a743cf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Disable libvncserver for static builds and drop second patch following
upstream feedback on patch fixing openssl issue:
https://github.com/LibVNC/libvncserver/pull/319

This will also fix build failure when building statically with libgcrypt

Don't update x11vnc, the reverse dependency of libvncserver, because
BR2_PACKAGE_XORG7 already depends on !BR2_STATIC_LIBS

Fixes:
 - http://autobuild.buildroot.org/results/8d7b109d085e3931a874c4fb99f465789485565a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 726dcc6eeef70cf70d9deefa71fec118284ca05e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...keLists.txt-use-pkgconfig-to-find-openssl.patch | 34 ----------------------
 package/libvncserver/Config.in                     |  6 ++++
 2 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch b/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch
deleted file mode 100644
index c51b725469..0000000000
--- a/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ab512233c88022fec67fabec1fb00a833c466c9e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 23 Jun 2019 22:54:57 +0200
-Subject: [PATCH] CMakeLists.txt: use pkgconfig to find openssl
-
-find_package(openssl) fails to find openssl dependencies such as -lz so
-use pkgconfig to fix static build
-
-Fixes:
- - http://autobuild.buildroot.org/results/c3f75480cb4b8b042cdf6a34cc5568ea13e51342
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/LibVNC/libvncserver/pull/318]
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ad609ae..11103d8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -125,7 +125,8 @@ endif(WITH_GNUTLS)
- 
- 
- if(WITH_OPENSSL)
--  find_package(OpenSSL)
-+  find_package(PkgConfig)
-+  pkg_check_modules(OPENSSL "openssl")
- endif(WITH_OPENSSL)
- 
- 
--- 
-2.14.1
-
diff --git a/package/libvncserver/Config.in b/package/libvncserver/Config.in
index c8042905ce..2d5bf8a182 100644
--- a/package/libvncserver/Config.in
+++ b/package/libvncserver/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBVNCSERVER
 	depends on BR2_USE_MMU # VNCommand.c uses fork()
 	# binutils issue (bad expression)
 	depends on !BR2_nios2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LZO
 	help
 	  libvncserver is a VNC server/client library.
@@ -22,3 +23,8 @@ config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
 	  http://wiki.qemu.org/VNC_Tight_PNG
 
 endif
+
+comment "libvncserver needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_nios
+	depends on BR2_STATIC_LIBS
