From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 22:01:39 +0200
Subject: [Buildroot] [git commit] package/nodejs: use shared libuv
Message-ID: <20170719202438.AC078817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b4a928d9020c93e06421b7903d0ece1525147b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nodejs requires libuv and by default will use an internal copy
bundled with the release.  Change to using a shared libuv library.

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 9 ++++++---
 package/nodejs/nodejs.mk | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index a96901a..345fe10 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -4,16 +4,18 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
 	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
+	# libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
@@ -26,6 +28,7 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBHTTPPARSER
+	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_ZLIB
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index f4e5969..bb4f984 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
-	libhttpparser zlib \
+	libhttpparser libuv zlib \
 	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
 HOST_NODEJS_DEPENDENCIES = host-python host-zlib
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
@@ -19,6 +19,7 @@ NODEJS_CONF_OPTS = \
 	--shared-zlib \
 	--shared-cares \
 	--shared-http-parser \
+	--shared-libuv \
 	--without-dtrace \
 	--without-etw \
 	--dest-os=linux
