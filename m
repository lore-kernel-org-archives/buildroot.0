From: Martin Bark <martin@barkynet.com>
Date: Tue, 18 Jul 2017 12:45:43 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/nodejs: use shared libuv
In-Reply-To: <1500378343-22978-1-git-send-email-martin@barkynet.com>
References: <1500378343-22978-1-git-send-email-martin@barkynet.com>
Message-ID: <1500378343-22978-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs requires libuv and by default will use an internal copy
bundled with the release.  Change to using a shared libuv library.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v1 -> v2:
 - always use shared libuv (Thomas Petazzoni)
---
 package/nodejs/Config.in | 9 ++++++---
 package/nodejs/nodejs.mk | 3 ++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index f02b9a7..d3cb006 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -5,15 +5,17 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	default y if BR2_mipsel && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
 
-comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
+comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 4.8, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_NODEJS
 	bool "nodejs"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
@@ -27,6 +29,7 @@ config BR2_PACKAGE_NODEJS
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBHTTPPARSER
+	select BR2_PACKAGE_LIBUV
 	help
 	  Event-driven I/O server-side JavaScript environment based on V8.
 
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index c97b793..4012b4d 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,7 @@ NODEJS_VERSION = 8.1.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-	c-ares libhttpparser \
+	c-ares libhttpparser libuv \
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
-- 
2.7.4
