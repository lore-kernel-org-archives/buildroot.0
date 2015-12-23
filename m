From: Martin Bark <martin@barkynet.com>
Date: Wed, 23 Dec 2015 12:16:06 +0000
Subject: [Buildroot] [PATCH v3 5/7] package/nodejs: remove version choice
In-Reply-To: <1450872968-5834-1-git-send-email-martin@barkynet.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
Message-ID: <1450872968-5834-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the choice of nodejs version.  Now automatically pick nodejs 0.10.x
for armv5 architectures only and the latest nodejs for all other
supported architectures.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v2 -> v3
 - New in v3.
---
 package/nodejs/Config.in | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index eb3aeec..1aac38e 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
+	depends on BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X
 	# uses fork()
 	depends on BR2_USE_MMU
 	# uses dlopen(). On ARMv5, we could technically support static
@@ -22,9 +23,8 @@ comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-
-if BR2_PACKAGE_NODEJS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| (!BR2_PACKAGE_NODEJS_0_10_X && !BR2_PACKAGE_NODEJS_5_X)
 
 # Starting with 0.12.x, on ARM, V8 (the JS engine)
 # now requires an armv6+ and a VFPv2+.
@@ -35,18 +35,14 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	# On ARM, at least ARMv6+ with VFPv2+ is needed
 	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
 
-choice
-	prompt "Node.js version"
-	default BR2_PACKAGE_NODEJS_0_10_X if BR2_ARM_CPU_ARMV5
-	default BR2_PACKAGE_NODEJS_5_X
-	help
-	  Select the version of Node.js you wish to use.
-
 config BR2_PACKAGE_NODEJS_0_10_X
-	bool "v0.10.41"
+	bool
+	# Only support 0.10.x on ARMv5
+	default y if BR2_ARM_CPU_ARMV5
 
 config BR2_PACKAGE_NODEJS_5_X
-	bool "v5.3.0"
+	bool
+	default y
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_USE_WCHAR
@@ -55,7 +51,7 @@ comment "v5.3.0 needs a toolchain w/ gcc >= 4.8, wchar"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_USE_WCHAR
 
-endchoice
+if BR2_PACKAGE_NODEJS
 
 config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
-- 
2.5.0
