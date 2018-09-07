From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:28 -0000
Subject: [Buildroot] [git commit] package/botan: bump version to 2.7.0
Message-ID: <20180907111535.EA7E880030@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70ff2eec598070f3c8221a69e41a7273ebc5ce66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depends on gcc >= 4.8:
https://github.com/randombit/botan/blob/master/readme.rst

Rebased patch 0001, added license hash and updated license path.

Updated configure options for shared/static libraries after commit
https://github.com/randombit/botan/commit/299119f02c09e7d3e657b13e1706cb653eff560c

Added configure for ssp support after commit
https://github.com/randombit/botan/commit/ebeae68aba0d3384a00fddde77a561bb0cd88102
This fixes a build error with toolchains without ssp support.

Removed dependency to gmp:
https://github.com/randombit/botan/issues/719

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../botan/0001-remove-mips64-explicit-mabi.patch   | 10 +++++---
 package/botan/Config.in                            |  6 +++--
 package/botan/botan.hash                           |  4 ++-
 package/botan/botan.mk                             | 30 +++++++++++++++-------
 4 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/package/botan/0001-remove-mips64-explicit-mabi.patch b/package/botan/0001-remove-mips64-explicit-mabi.patch
index 3fddd54e9a..9c9317755a 100644
--- a/package/botan/0001-remove-mips64-explicit-mabi.patch
+++ b/package/botan/0001-remove-mips64-explicit-mabi.patch
@@ -3,15 +3,17 @@ Remove explicit mips64 -mabi parameter
 This breaks when building for n32 ABI on mips64.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Bernd: rebased for botan-2.7.0]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
 
 diff -Nuar Botan-1.10.8-orig/src/build-data/cc/gcc.txt Botan-1.10.8/src/build-data/cc/gcc.txt
 --- Botan-1.10.8-orig/src/build-data/cc/gcc.txt	2014-04-10 17:11:44.000000000 +0300
 +++ Botan-1.10.8/src/build-data/cc/gcc.txt	2014-10-23 09:20:34.506722323 +0300
-@@ -92,7 +92,6 @@
- # The 'linking' bit means "use this for both compiling *and* linking"
- <mach_abi_linking>
- x86_64  -> "-m64"
+@@ -83,7 +83,6 @@
+ 
+ openmp  -> "-fopenmp"
+ 
 -mips64  -> "-mabi=64"
  s390    -> "-m31"
  s390x   -> "-m64"
diff --git a/package/botan/Config.in b/package/botan/Config.in
index 733dc8965a..db2b33dfbe 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	help
@@ -15,6 +16,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "botan needs a toolchain w/ C++, threads,gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 3d46a13584..df804bc1ef 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 6c5472401d06527e87adcb53dd270f3c9b1fb688703b04dd7a7cfb86289efe52  Botan-1.10.16.tgz
+sha256 e42df91556317588c6ca0e41bf796f9bd5ec5c70e0668e6c97c608c697c24a90  Botan-2.7.0.tgz
+# Locally computed
+sha256 40cfd35a9e34d18463806f57553c968fdbaf254a2e2a636d1d8e32ff6b698495  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e42bb61cbe..21a66adff1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 1.10.16
+BOTAN_VERSION = 2.7.0
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tgz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
-BOTAN_LICENSE_FILES = doc/license.txt
+BOTAN_LICENSE_FILES = license.txt
 
 BOTAN_INSTALL_STAGING = YES
 
@@ -19,8 +19,25 @@ BOTAN_CONF_OPTS = \
 	--cc-bin="$(TARGET_CXX)" \
 	--prefix=/usr
 
-ifeq ($(BR2_STATIC_LIBS),y)
-BOTAN_CONF_OPTS += --disable-shared --no-autoload
+ifeq ($(BR2_SHARED_LIBS),y)
+BOTAN_CONF_OPTS += \
+	--disable-static-library \
+	--enable-shared-library
+else ifeq ($(BR2_STATIC_LIBS),y)
+BOTAN_CONF_OPTS += \
+	--disable-shared-library \
+	--enable-static-library \
+	--no-autoload
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+BOTAN_CONF_OPTS += \
+	--enable-shared-library \
+	--enable-static-library
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+BOTAN_CONF_OPTS += --with-stack-protector
+else
+BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
@@ -28,11 +45,6 @@ BOTAN_DEPENDENCIES += bzip2
 BOTAN_CONF_OPTS += --with-bzip2
 endif
 
-ifeq ($(BR2_PACKAGE_GMP),y)
-BOTAN_DEPENDENCIES += gmp
-BOTAN_CONF_OPTS += --with-gnump
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 BOTAN_DEPENDENCIES += openssl
 BOTAN_CONF_OPTS += --with-openssl
