From: Julien Olivain <juju@cotds.org>
Date: Tue, 30 Jun 2020 19:34:33 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/poco: bump to version 1.10.1
In-Reply-To: <20200630173435.7828-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200630173435.7828-1-juju@cotds.org>
Message-ID: <20200630173435.7828-2-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Poco >= 1.10.0 requires a C++14 compiler. GCC needs to be at least 5.0.
https://github.com/pocoproject/poco/blob/poco-1.10.1-release/CHANGELOG#L31

Since GCC 5.0 does not enable it by default, "-std=c++14" needs to be
added in cflags.

See poco 1.10.1 changelog:
https://github.com/pocoproject/poco/blob/poco-1.10.1-release/CHANGELOG

Poco 1.10.0 introduced a new JWT (JSON Web Tokens) component. It is
currently unconditionally disabled to prevent build failure (as it
re-enable Poco Crypto, which needs OpenSSL).

Package patches are rebased on poco version 1.10.1.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
Changes v1 -> v2:
Suggested by Thomas:
  - reformat attached patches with "git format-patch -N"
---
 ...oco-add-the-staging-path-to-search-path.patch | 10 ++++++----
 .../poco/0002-Add-support-for-m68000-1856.patch  | 12 +++++++-----
 ...c-utils.h-backport-double-conversion-ch.patch | 16 +++++++++-------
 package/poco/Config.in                           |  6 ++++--
 package/poco/poco.hash                           |  2 +-
 package/poco/poco.mk                             |  5 +++--
 6 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
index 5453cba13f..fbabfc8f26 100644
--- a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
+++ b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
@@ -1,4 +1,4 @@
-From a3cb6e42fc2cfa0620ba737148fcbea0cf96a984 Mon Sep 17 00:00:00 2001
+From a53f3fd64a0f36ec9bc1307d7e66cdc2dee4aeaa Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Tue, 4 Aug 2015 10:14:00 +0200
 Subject: [PATCH] poco: add the staging path to search path
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
index 1cf99bf09c..bc04a9bf69 100644
--- a/package/poco/0002-Add-support-for-m68000-1856.patch
+++ b/package/poco/0002-Add-support-for-m68000-1856.patch
@@ -1,4 +1,4 @@
-From e49753f7654dc62087e47731832d5992cc4d194e Mon Sep 17 00:00:00 2001
+From 221e308ad452035f4c1dc25e194f817a30f38f7b Mon Sep 17 00:00:00 2001
 From: Jochen Sprickerhof <github@jochen.sprickerhof.de>
 Date: Wed, 23 Aug 2017 16:50:51 +0200
 Subject: [PATCH] Add support for m68000 (#1856)
@@ -8,16 +8,18 @@ Originally taken from
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
index 8193457f97..c06eebe8b0 100644
--- a/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
+++ b/package/poco/0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
@@ -1,4 +1,4 @@
-From b077b4a5afbfde47288baed072152a6b7f318250 Mon Sep 17 00:00:00 2001
+From fe7d230da03a35725ef768c07ce064324f941863 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 1 Jul 2018 15:37:47 +0200
 Subject: [PATCH] Foundation/src/utils.h: backport double-conversion change for
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
index 13f7b3b0a3..cec48591ac 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_POCO
 	bool "poco"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
@@ -86,7 +87,8 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 
 endif # BR2_PACKAGE_POCO
 
-comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
+comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library, gcc >= 5 w/ C++14"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_PACKAGE_POCO_ARCH_SUPPORTS
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
index d2b668ae13..915d0dc400 100644
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
@@ -17,7 +17,7 @@ POCO_DEPENDENCIES = zlib pcre \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
-POCO_OMIT = Data/ODBC PageCompiler \
+POCO_OMIT = Data/ODBC JWT PageCompiler \
 	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
@@ -59,6 +59,7 @@ define POCO_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) ./configure \
 		--config=Linux \
 		--prefix=/usr \
+		--cflags=-std=c++14 \
 		--omit="$(POCO_OMIT)" \
 		$(POCO_CONF_OPTS) \
 		--unbundled \
-- 
2.26.2
