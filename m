From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 18:28:41 +0100
Subject: [Buildroot] [git commit] package/nodejs: bump 4.x branch to version
	4.2.3
Message-ID: <20151212173106.A72D97FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=584d777dda153927f4cf32d9b0de266e7a521ef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/4.1.2/0004-fix-arm-vfpv2.patch      | 18 ---------
 ...01-Remove-dependency-on-Python-bz2-module.patch |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
 ...hon-variable-instead-of-hardcoding-Python.patch |  0
 package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch      | 46 ++++++++++++++++++++++
 package/nodejs/Config.in                           |  6 +--
 package/nodejs/nodejs.hash                         |  4 +-
 7 files changed, 51 insertions(+), 23 deletions(-)

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
diff --git a/package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch b/package/nodejs/4.2.3/0001-Remove-dependency-on-Python-bz2-module.patch
similarity index 100%
rename from package/nodejs/4.1.2/0001-Remove-dependency-on-Python-bz2-module.patch
rename to package/nodejs/4.2.3/0001-Remove-dependency-on-Python-bz2-module.patch
diff --git a/package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch b/package/nodejs/4.2.3/0002-gyp-force-link-command-to-use-CXX.patch
similarity index 100%
rename from package/nodejs/4.1.2/0002-gyp-force-link-command-to-use-CXX.patch
rename to package/nodejs/4.2.3/0002-gyp-force-link-command-to-use-CXX.patch
diff --git a/package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch b/package/nodejs/4.2.3/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
similarity index 100%
rename from package/nodejs/4.1.2/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
rename to package/nodejs/4.2.3/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch
diff --git a/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch b/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch
new file mode 100644
index 0000000..7ff280b
--- /dev/null
+++ b/package/nodejs/4.2.3/0004-fix-arm-vfpv2.patch
@@ -0,0 +1,46 @@
+From 0b07d813adcfdc13ef6a0c56f88b864eb3dc4be9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 8 Dec 2015 21:53:06 +0100
+Subject: [PATCH] configure: fix arm vfpv2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The gcc -mfpu flag for VFPv2 is 'vfp', not 'vfpv2' [1].
+
+Patch status: Sent upstream [2]
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
+[2] https://github.com/nodejs/node/pull/4202
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[J??rg Krause: adapt to version 4.2.3]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index d4aff36..c783bab 100755
+--- a/configure
++++ b/configure
+@@ -30,7 +30,7 @@ valid_os = ('win', 'mac', 'solaris', 'freebsd', 'openbsd', 'linux',
+ valid_arch = ('arm', 'arm64', 'ia32', 'mips', 'mipsel', 'ppc', 'ppc64', 'x32',
+               'x64', 'x86')
+ valid_arm_float_abi = ('soft', 'softfp', 'hard')
+-valid_arm_fpu = ('vfp', 'vfpv2', 'vfpv3', 'vfpv3-d16', 'neon')
++valid_arm_fpu = ('vfp', 'vfpv3', 'vfpv3-d16', 'neon')
+ valid_mips_arch = ('loongson', 'r1', 'r2', 'r6', 'rx')
+ valid_mips_fpu = ('fp32', 'fp64', 'fpxx')
+ valid_mips_float_abi = ('soft', 'hard')
+@@ -622,7 +622,7 @@ def configure_arm(o):
+   else:
+     arm_float_abi = 'default'
+
+-  arm_fpu = 'vfpv2'
++  arm_fpu = 'vfp'
+
+   if is_arch_armv7():
+     arm_fpu = 'vfpv3'
+--
+2.6.3
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 6ffe1f1..b0f4f2b 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -49,11 +49,11 @@ config BR2_BR2_PACKAGE_NODEJS_0_12_X
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 
 config BR2_BR2_PACKAGE_NODEJS_4_X
-	bool "v4.1.2"
+	bool "v4.2.3"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
-comment "v4.1.2 needs a toolchain w/ gcc >= 4.8"
+comment "v4.2.3 needs a toolchain w/ gcc >= 4.8"
 	depends on BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
@@ -63,7 +63,7 @@ config BR2_PACKAGE_NODEJS_VERSION_STRING
 	string
 	default "0.10.41"	if BR2_BR2_PACKAGE_NODEJS_0_10_X
 	default "0.12.9"	if BR2_BR2_PACKAGE_NODEJS_0_12_X
-	default "4.1.2"		if BR2_BR2_PACKAGE_NODEJS_4_X
+	default "4.2.3"		if BR2_BR2_PACKAGE_NODEJS_4_X
 
 menu "Module Selection"
 
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 800af73..7d58a54 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -4,5 +4,5 @@ sha256	79f694e2a5c42543b75d0c69f6860499d7593136d0f6b59e7163b9e66fb2c995  node-v0
 # From upstream URL: http://nodejs.org/dist/v0.12.9/SHASUMS256.txt
 sha256	35daad301191e5f8dd7e5d2fbb711d081b82d1837d59837b8ee224c256cfe5e4  node-v0.12.9.tar.gz
 
-# From upstream URL: http://nodejs.org/dist/v4.1.2/SHASUMS256.txt
-sha256  443c8251e812b1f2c4b3e9152a47df23c55567ade739e017e2c0ca0869b71e74  node-v4.1.2.tar.xz
+# From upstream URL: http://nodejs.org/dist/v4.2.3/SHASUMS256.txt
+sha256  9e8aef1e47b317575c421c8d10a80e6c319b26969b566d3b84e49e65a92837f4  node-v4.2.3.tar.xz
