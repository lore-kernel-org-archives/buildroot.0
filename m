From: Martin Bark <martin@barkynet.com>
Date: Sun, 22 Nov 2015 21:40:00 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 4.2.2
Message-ID: <1448228400-25407-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4.2.2 is the current Long Term Support (LTS) version

Moved all v4.1.2 patches to v4.2.2 except 0004-fix-arm-vfpv2.patch as this
is no longer needed.  Instead use the new --with-arm-fpu configure option.
See https://github.com/nodejs/node/issues/2942 and
https://github.com/nodejs/node/pull/3228.

Also, with the introduction of --with-arm-fpu rename NODEJS_ARM_FP to
NODEJS_ARM_FLOAT_ABI to make nodejs.mk more readable.

Signed-off-by: Martin Bark <martin@barkynet.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Jaap Crezee <jaap@jcz.nl>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch          | 18 ------------------
 .../0001-Remove-dependency-on-Python-bz2-module.patch  |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch       |  0
 ...-python-variable-instead-of-hardcoding-Python.patch |  0
 package/nodejs/Config.in                               |  6 +++---
 package/nodejs/nodejs.hash                             |  4 ++--
 package/nodejs/nodejs.mk                               |  6 ++++--
 7 files changed, 9 insertions(+), 25 deletions(-)
 delete mode 100644 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch
 rename package/nodejs/{4.1.2 => 4.2.2}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{4.1.2 => 4.2.2}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{4.1.2 => 4.2.2}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)

diff --git a/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch b/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch
deleted file mode 100644
index b753dfe..0000000
--- a/package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-configure: fix ARM VFPv2
-
-The gcc -mfpu flag for VFPv2 is 'vfp', not 'vfpv2'.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -611,7 +611,7 @@
-     o['variables']['arm_fpu'] = 'vfpv3'
-     o['variables']['arm_version'] = '7'
-   else:
--    o['variables']['arm_fpu'] = 'vfpv2'
-+    o['variables']['arm_fpu'] = 'vfp'
-     o['variables']['arm_version'] = '6' if is_arch_armv6() else 'default'
- 
-   o['variables']['arm_thumb'] = 0      # -marm
diff --git a/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/4.2.2/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/4.2.2/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/4.2.2/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/4.2.2/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/4.2.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/4.2.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5128901..1e3eb37 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -49,11 +49,11 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_BR2_PACKAGE_NODEJS_4_X
-	bool "v4.1.2"
+	bool "v4.2.2"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
-comment "v4.1.2 needs a toolchain w/ gcc >= 4.8"
+comment "v4.2.2 needs a toolchain w/ gcc >= 4.8"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
@@ -63,7 +63,7 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.40"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.7"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
-	default "4.1.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
+	default "4.2.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index ab506df..74fb1c3 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -4,5 +4,5 @@ sha256	bae79c2fd959aebe1629af36077bebbb760128db753da226d2344cd91499149f  node-v0
 # From upstream URL: http://nodejs.org/dist/v0.12.7/SHASUMS256.txt
 sha256	b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d  node-v0.12.7.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v4.1.2/SHASUMS256.txt
-sha256  443c8251e812b1f2c4b3e9152a47df23c55567ade739e017e2c0ca0869b71e74  node-v4.1.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v4.2.2/SHASUMS256.txt
+sha256  b016c3d2f434f86d8d3da9ad90ffb2fd35b32223e9081e3d4f67b8de0370ce69  node-v4.2.2.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 7b6ae6b..4c217e6 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -61,7 +61,8 @@ NODEJS_CPU = mipsel
 else ifeq ($(BR2_arm),y)
 NODEJS_CPU = arm
 # V8 needs to know what floating point ABI the target is using.
-NODEJS_ARM_FP = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+NODEJS_ARM_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+NODEJS_ARM_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 endif
 
 define NODEJS_CONFIGURE_CMDS
@@ -78,7 +79,8 @@ define NODEJS_CONFIGURE_CMDS
 		--without-dtrace \
 		--without-etw \
 		--dest-cpu=$(NODEJS_CPU) \
-		$(if $(NODEJS_ARM_FP),--with-arm-float-abi=$(NODEJS_ARM_FP)) \
+		$(if $(NODEJS_ARM_FLOAT_ABI),--with-arm-float-abi=$(NODEJS_ARM_FLOAT_ABI)) \
+		$(if $(NODEJS_ARM_FPU),--with-arm-fpu=$(NODEJS_ARM_FPU)) \
 		--dest-os=linux \
 	)
 endef
-- 
2.5.0
