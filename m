From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:24:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/libopenssl: move target arch
 selection to Config.in
In-Reply-To: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
References: <20191027102420.15560-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191027102420.15560-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The logic to select the proper OpenSSL target arch in libopenssl.mk is
not easy to read, so let's move it to Config.in where we have some
nice constructs for that kind of value selection.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/Config.in     | 29 ++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk | 35 +-------------------------------
 package/openssl/Config.in        |  2 ++
 3 files changed, 32 insertions(+), 34 deletions(-)
 create mode 100644 package/libopenssl/Config.in

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
new file mode 100644
index 0000000000..732da5b4ef
--- /dev/null
+++ b/package/libopenssl/Config.in
@@ -0,0 +1,29 @@
+# 4xx PowerPC cores seem to have trouble with openssl's ASM
+# optimizations
+config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
+	bool
+	default y if BR2_powerpc
+	depends on !BR2_powerpc_401
+	depends on !BR2_powerpc_403
+	depends on !BR2_powerpc_405
+	depends on !BR2_powerpc_405fp
+	depends on !BR2_powerpc_440
+	depends on !BR2_powerpc_440fp
+
+config BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH
+	string
+	# Use "gcc" minimalistic target to disable DSO
+	# no-asm is needed with generic architectures such as gcc, see
+	# https://github.com/openssl/openssl/issues/9839
+	default "gcc no-asm"			if BR2_STATIC_LIBS
+	# Doesn't work for thumb-only (Cortex-M?)
+	default "linux-armv4"			if BR2_ARM_CPU_HAS_ARM
+	default "linux-aarch64"			if BR2_aarch64
+	default "linux-ppc"			if BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH_LINUX_PPC
+	default "linux-ppc64"			if BR2_powerpc64
+	default "linux-ppc64le"			if BR2_powerpc64le
+	default "linux-x86_64"			if BR2_x86_64
+	# no-asm is needed with generic architectures such as
+	# linux-generic32, see
+	# https://github.com/openssl/openssl/issues/9839
+	default "linux-generic32 no-asm"
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a1bbf9a900..da4ae291c0 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -12,9 +12,7 @@ LIBOPENSSL_LICENSE_FILES = LICENSE
 LIBOPENSSL_INSTALL_STAGING = YES
 LIBOPENSSL_DEPENDENCIES = zlib
 HOST_LIBOPENSSL_DEPENDENCIES = host-zlib
-# no-asm is needed with generic architectures such as linux-generic32, see
-# https://github.com/openssl/openssl/issues/9839
-LIBOPENSSL_TARGET_ARCH = linux-generic32 no-asm
+LIBOPENSSL_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH))
 LIBOPENSSL_CFLAGS = $(TARGET_CFLAGS)
 LIBOPENSSL_PROVIDES = openssl
 
@@ -55,37 +53,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_UCONTEXT),)
 LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ASYNC
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-# Use "gcc" minimalistic target to disable DSO
-# no-asm is needed with generic architectures such as gcc, see
-# https://github.com/openssl/openssl/issues/9839
-LIBOPENSSL_TARGET_ARCH = gcc no-asm
-else
-# Some architectures are optimized in OpenSSL
-# Doesn't work for thumb-only (Cortex-M?)
-ifeq ($(BR2_ARM_CPU_HAS_ARM),y)
-LIBOPENSSL_TARGET_ARCH = linux-armv4
-endif
-ifeq ($(ARCH),aarch64)
-LIBOPENSSL_TARGET_ARCH = linux-aarch64
-endif
-ifeq ($(ARCH),powerpc)
-# 4xx cores seem to have trouble with openssl's ASM optimizations
-ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-LIBOPENSSL_TARGET_ARCH = linux-ppc
-endif
-endif
-ifeq ($(ARCH),powerpc64)
-LIBOPENSSL_TARGET_ARCH = linux-ppc64
-endif
-ifeq ($(ARCH),powerpc64le)
-LIBOPENSSL_TARGET_ARCH = linux-ppc64le
-endif
-ifeq ($(ARCH),x86_64)
-LIBOPENSSL_TARGET_ARCH = linux-x86_64
-endif
-endif
-
 define HOST_LIBOPENSSL_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index a64660bea3..4d37a3ecf9 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -43,6 +43,8 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  Install additional encryption engine libraries.
 
+source "package/libopenssl/Config.in"
+
 endif
 
 config BR2_PACKAGE_LIBRESSL
-- 
2.21.0
