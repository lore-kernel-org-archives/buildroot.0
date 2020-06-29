From: Julien Olivain <juju@cotds.org>
Date: Mon, 29 Jun 2020 21:06:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/poco: bump to version 1.10.1
Message-ID: <20200629190624.120114-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also rebased patches.

Also re-enable riscv64 support, which was added upstream in commit:
https://github.com/pocoproject/poco/commit/26fa1b9e6bbe3a5d2d559d0e8bd5772a4e8fdfef
which is included in version >= 1.10.0.

Poco >= 1.10.0 requires a C++14 compiler. GCC needs to be at least 5.0.
https://github.com/pocoproject/poco/blob/poco-1.10.1-release/CHANGELOG#L31

Since GCC 5.0 does not enable it by default, "-std=c++14" needs to be
added in cflags.

Also add a new Poco JWT component (JSON Web Tokens).

Also update the Config.in comment depends condition, to be the same as
the package (BR_riscv was missing).

See poco 1.10.1 changelog:
https://github.com/pocoproject/poco/blob/poco-1.10.1-release/CHANGELOG

./utils/test-pkg -a --package poco
                             andes-nds32 [ 1/44]: SKIPPED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: SKIPPED
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: OK
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: SKIPPED
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: OK
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: SKIPPED
                    br-microblazeel-full [16/44]: SKIPPED
                 br-mips32r6-el-hf-glibc [17/44]: SKIPPED
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: SKIPPED
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: SKIPPED
               br-powerpc-603e-basic-cpp [23/44]: SKIPPED
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: OK
                              br-riscv32 [27/44]: SKIPPED
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: OK
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: OK
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: OK
                          br-xtensa-full [34/44]: SKIPPED
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: SKIPPED
                            sourcery-arm [39/44]: SKIPPED
                     sourcery-arm-thumb2 [40/44]: SKIPPED
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 18 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 ...-add-the-staging-path-to-search-path.patch | 12 ++++++-----
 .../0002-Add-support-for-m68000-1856.patch    | 14 +++++++------
 ...tils.h-backport-double-conversion-ch.patch | 20 ++++++++++---------
 package/poco/Config.in                        | 18 +++++++++++++----
 package/poco/poco.hash                        |  2 +-
 package/poco/poco.mk                          |  6 ++++--
 6 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
index 5453cba13f..200e80228d 100644
--- a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
+++ b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
@@ -1,7 +1,7 @@
-From a3cb6e42fc2cfa0620ba737148fcbea0cf96a984 Mon Sep 17 00:00:00 2001
+From 9a344b0361112198d04d8b0110419ee0c55e55cb Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Tue, 4 Aug 2015 10:14:00 +0200
-Subject: [PATCH] poco: add the staging path to search path
+Subject: [PATCH 1/3] poco: add the staging path to search path
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -14,19 +14,21 @@ must be set from the make command line.
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 [J?rg: Update to version 1.6.1 from github]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+[Julien: Rebased on version 1.10.1]
+Signed-off-by: Julien Olivain <juju@cotds.org>
 ---
  Data/MySQL/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makefile
-index c6fc2ac1c..955fee2d4 100644
+index 64a7d3f82..955fee2d4 100644
 --- a/Data/MySQL/Makefile
 +++ b/Data/MySQL/Makefile
 @@ -6,8 +6,8 @@
  
  include $(POCO_BASE)/build/rules/global
  
--SYSLIBS += -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX) -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
+-SYSLIBS += -L/usr/local/lib -L/usr/local/lib$(LIB64SUFFIX)/mysql -L/usr/lib$(LIB64SUFFIX)/mysql -L/usr/mysql/lib$(LIB64SUFFIX) -L/usr/mysql/lib$(LIB64SUFFIX)/mysql -L/usr/local/mysql/lib$(LIB64SUFFIX) -lmysqlclient
 -INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql/ -I/usr/mysql/include/mysql -I/usr/local/mysql/include
 +SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
 +INCLUDE += -I$(MYSQL_INCDIR)
@@ -34,5 +36,5 @@ index c6fc2ac1c..955fee2d4 100644
  
  objects = Binder Extractor SessionImpl Connector \
 -- 
-2.14.4
+2.26.2
 
diff --git a/package/poco/0002-Add-support-for-m68000-1856.patch b/package/poco/0002-Add-support-for-m68000-1856.patch
index 1cf99bf09c..ee8e1c6879 100644
--- a/package/poco/0002-Add-support-for-m68000-1856.patch
+++ b/package/poco/0002-Add-support-for-m68000-1856.patch
@@ -1,23 +1,25 @@
-From e49753f7654dc62087e47731832d5992cc4d194e Mon Sep 17 00:00:00 2001
+From 521104776b0258de99d2376153bf457f875d3769 Mon Sep 17 00:00:00 2001
 From: Jochen Sprickerhof <github@jochen.sprickerhof.de>
 Date: Wed, 23 Aug 2017 16:50:51 +0200
-Subject: [PATCH] Add support for m68000 (#1856)
+Subject: [PATCH 2/3] Add support for m68000 (#1856)
 
 Originally taken from
 
 https://github.com/google/double-conversion/commit/da11179623145f53b204105a93b8bbca431141da
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Julien: rebased on version 1.10.1]
+Signed-off-by: Julien Olivain <juju@cotds.org>
 ---
  Foundation/src/utils.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index 69cea1aca..a7bda0171 100644
+index c87cee13c..e891c0f10 100644
 --- a/Foundation/src/utils.h
 +++ b/Foundation/src/utils.h
-@@ -65,6 +65,8 @@
-     defined(__AARCH64EL__) || \
+@@ -66,6 +66,8 @@
+ 	defined(__AARCH64EL__) || \
      defined(nios2) || defined(__nios2) || defined(__nios2__)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
 +#elif defined(__mc68000__)
@@ -26,5 +28,5 @@ index 69cea1aca..a7bda0171 100644
  #if defined(_WIN32)
  // Windows uses a 64bit wide floating point stack.
 -- 
-2.14.4
+2.26.2
 
diff --git a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
index 8193457f97..0d7a8e821b 100644
--- a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
+++ b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
@@ -1,8 +1,8 @@
-From b077b4a5afbfde47288baed072152a6b7f318250 Mon Sep 17 00:00:00 2001
+From 8aee152e421573bf9c4149b4b3e9b9bef03de397 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 1 Jul 2018 15:37:47 +0200
-Subject: [PATCH] Foundation/src/utils.h: backport double-conversion change for
- AArch64 BE support
+Subject: [PATCH 3/3] Foundation/src/utils.h: backport double-conversion change
+ for AArch64 BE support
 
 This commit, identical to upstream double-conversion commit
 https://github.com/google/double-conversion/commit/cb2beeb6771025377c665d1c3ea08388bc6e619a
@@ -10,23 +10,25 @@ allows Poco to build on AArch64 big-endian.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Upstream: https://github.com/pocoproject/poco/pull/2378
+[Julien: rebased on version 1.10.1]
+Signed-off-by: Julien Olivain <juju@cotds.org>
 ---
  Foundation/src/utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Foundation/src/utils.h b/Foundation/src/utils.h
-index a7bda0171..fd49e1768 100644
+index e891c0f10..892f7db18 100644
 --- a/Foundation/src/utils.h
 +++ b/Foundation/src/utils.h
-@@ -62,7 +62,7 @@
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+@@ -63,7 +63,7 @@
      defined(__SH4__) || defined(__alpha__) || \
      defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__) || \
-+    defined(__AARCH64EL__) || defined(__aarch64__) || \
+     defined(__riscv) || \
+-	defined(__AARCH64EL__) || \
++	defined(__AARCH64EL__) || defined(__aarch64__) || \
      defined(nios2) || defined(__nios2) || defined(__nios2__)
  #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
  #elif defined(__mc68000__)
 -- 
-2.14.4
+2.26.2
 
diff --git a/package/poco/Config.in b/package/poco/Config.in
index f8f921de04..1a3b0ceeed 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+		|| BR2_or1k || (BR2_riscv && !BR2_RISCV_64) \
+		|| BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
@@ -80,10 +82,18 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 	select BR2_PACKAGE_POCO_DATA
 	select BR2_PACKAGE_MYSQL
 
+config BR2_PACKAGE_POCO_JWT
+	bool "jwt"
+	select BR2_PACKAGE_POCO_JSON
+	select BR2_PACKAGE_POCO_CRYPTO
+	select BR2_PACKAGE_OPENSSL
+
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_xtensa)
+		|| BR2_or1k || (BR2_riscv && !BR2_RISCV_64) \
+		|| BR2_xtensa)
diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 0cdaf0d3f3..2a2629733d 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  367014cdbcfe9df8f1d746239902149d2398af9b49ba2c1aaaa88616fd538f61  poco-1.9.4.tar.gz
+sha256  44592a488d2830c0b4f3bfe4ae41f0c46abbfad49828d938714444e858a00818  poco-1.10.1.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index d2b668ae13..c605044ba3 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.9.4
+POCO_VERSION = 1.10.1
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
@@ -31,7 +31,8 @@ POCO_OMIT = Data/ODBC PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
+	$(if $(BR2_PACKAGE_POCO_JWT),,JWT)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POCO_CONF_OPTS += --no-fpenvironment --no-wstring
@@ -59,6 +60,7 @@ define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux \
 		--prefix=/usr \
+		--cflags=-std=c++14 \
 		--omit="$(POCO_OMIT)" \
 		$(POCO_CONF_OPTS) \
 		--unbundled \
-- 
2.26.2
