From: Daniel Mack <daniel@zonque.org>
Date: Fri, 13 Jan 2017 11:55:25 +0100
Subject: [Buildroot] [PATCH] package/nodejs: add support for building on
	aarch64 architectures
Message-ID: <20170113105525.20933-1-daniel@zonque.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 package/nodejs/Config.in | 4 ++--
 package/nodejs/nodejs.mk | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index d2262be..b8c45f5 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -1,6 +1,6 @@
 comment "nodejs needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.8, wchar"
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NODEJS
 	bool "nodejs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 5806c56..682da78 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -89,6 +89,8 @@ else ifeq ($(BR2_mipsel),y)
 NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
+else ifeq ($(BR2_aarch64),y)
+NODEJS_CPU = arm64
 # V8 needs to know what floating point ABI the target is using.
 NODEJS_ARM_FP = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 endif
-- 
2.9.3
