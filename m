From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 10:36:51 -0300
Subject: [Buildroot] [PATCH] polarssl: remove on security grounds
Message-ID: <1477661811-32653-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 1.2.x branch is no longer maintained and the latest release from the
maintained branches (2.3, 2.1, 1.3) were security releases, so more
likely than not 1.2 is affected.
In consequence switch shairport-sync to the openssl backend.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                   | 10 ++++++
 package/Config.in                                  |  1 -
 package/polarssl/0001-no-test-suite.patch          | 27 ---------------
 ...he-standard-CMake-flag-to-drive-the-share.patch | 39 ----------------------
 package/polarssl/Config.in                         | 32 ------------------
 package/polarssl/polarssl.hash                     |  2 --
 package/polarssl/polarssl.mk                       | 32 ------------------
 package/shairport-sync/Config.in                   |  2 +-
 package/shairport-sync/shairport-sync.mk           | 13 ++------
 9 files changed, 13 insertions(+), 145 deletions(-)
 delete mode 100644 package/polarssl/0001-no-test-suite.patch
 delete mode 100644 package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 delete mode 100644 package/polarssl/Config.in
 delete mode 100644 package/polarssl/polarssl.hash
 delete mode 100644 package/polarssl/polarssl.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8c41b05..b4cd9d6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,16 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
++config BR2_PACKAGE_POLARSSL
+	bool "PolarSSL has been removed"
+	select BR2_LEGACY
+	help
+	  Upstream isn't maintaining the 1.2 branch any more and there
+	  has been a release in the maintained branches (2.3, 2.1, 1.3)
+	  that contains security fixes, so 1.2 is likely affected to a
+	  certain degree, and even if it isn't any future security fix
+	  will likely go unnoticed.
+
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
 	bool "PHP CGI and CLI options are now seperate"
 	select BR2_PACKAGE_PHP_SAPI_CLI
diff --git a/package/Config.in b/package/Config.in
index eca3e71..8da3e04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -908,7 +908,6 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
-	source "package/polarssl/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
 endmenu
diff --git a/package/polarssl/0001-no-test-suite.patch b/package/polarssl/0001-no-test-suite.patch
deleted file mode 100644
index 4c8552a..0000000
--- a/package/polarssl/0001-no-test-suite.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Add BUILD_TESTS option to disable test suite
-
-By default, PolarSSL builds a fairly extensive test suite to validate
-the library. In the context of Buildroot, building this test suite is
-not really useful, so we add a BUILD_TESTS to disable its build.
-
-[Gustavo: update for 1.2.11]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura polarssl-1.2.11.orig/CMakeLists.txt polarssl-1.2.11/CMakeLists.txt
---- polarssl-1.2.11.orig/CMakeLists.txt	2014-07-11 17:14:43.414651327 -0300
-+++ polarssl-1.2.11/CMakeLists.txt	2014-07-11 17:23:00.573498626 -0300
-@@ -49,9 +49,11 @@
- add_subdirectory(library)
- add_subdirectory(include)
- 
--if(CMAKE_COMPILER_IS_GNUCC)
-+option(BUILD_TESTS "Build tests." ON)
-+
-+if(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
-   add_subdirectory(tests)
--endif(CMAKE_COMPILER_IS_GNUCC)
-+endif(CMAKE_COMPILER_IS_GNUCC AND BUILD_TESTS)
- if(CMAKE_COMPILER_IS_CLANG)
-   add_subdirectory(tests)
- endif(CMAKE_COMPILER_IS_CLANG)
diff --git a/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
deleted file mode 100644
index d241ae2..0000000
--- a/package/polarssl/0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a14028b0878c1ba27f7c7a6d0962874d0f7f3801 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 11:54:37 +0200
-Subject: [PATCH 3/3] cmake: use the standard CMake flag to drive the shared
- object build
-
-If BUILD_SHARED_LIBS is set and not USE_SHARED_POLARSSL_LIBRARY, then
-drive USE_SHARED_POLARSSL_LIBRARY with the BUILD_SHARED_LIBS value.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- library/CMakeLists.txt | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/library/CMakeLists.txt b/library/CMakeLists.txt
-index 27bd2e0..2ae0aba 100644
---- a/library/CMakeLists.txt
-+++ b/library/CMakeLists.txt
-@@ -1,5 +1,15 @@
--option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
--option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
-+# Use the standard CMake flag to drive the shared object build.
-+if(DEFINED BUILD_SHARED_LIBS AND NOT DEFINED USE_STATIC_POLARSSL_LIBRARY AND NOT DEFINED USE_SHARED_POLARSSL_LIBRARY)
-+  set(USE_STATIC_POLARSSL_LIBRARY ON)
-+  if(BUILD_SHARED_LIBS)
-+    set(USE_SHARED_POLARSSL_LIBRARY ON)
-+  else()
-+    set(USE_SHARED_POLARSSL_LIBRARY OFF)
-+  endif()
-+else()
-+  option(USE_STATIC_POLARSSL_LIBRARY "Build PolarSSL static library." ON)
-+  option(USE_SHARED_POLARSSL_LIBRARY "Build PolarSSL shared library." OFF)
-+endif()
- 
- set(src
-      aes.c
--- 
-2.1.0
-
diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
deleted file mode 100644
index 17125a3..0000000
--- a/package/polarssl/Config.in
+++ /dev/null
@@ -1,32 +0,0 @@
-config BR2_PACKAGE_POLARSSL
-	bool "polarssl"
-	help
-	  PolarSSL is an SSL library written in ANSI C. PolarSSL makes
-	  it easy for developers to include cryptographic and SSL/TLS
-	  capabilities in their (embedded) products with as little
-	  hassle as possible. It is designed to be readable,
-	  documented, tested, loosely coupled and portable.
-
-	  Warning: PolarSSL is licensed under the GPL. If you want to
-	  use it in your own proprietary applications, you have to
-	  purchase a commercial license.
-
-	  https://tls.mbed.org/
-
-if BR2_PACKAGE_POLARSSL
-
-config BR2_PACKAGE_POLARSSL_PROGRAMS
-	bool "polarssl programs"
-	depends on BR2_USE_MMU # fork()
-	help
-	  This option enables the installation and the build of
-	  PolarSSL companion programs: aescrypt2, benchmark, cert_app,
-	  crl_app, crypt_and_hash, dh_client, dh_genprime, dh_server,
-	  gen_entropy, generic_sum, gen_random_ctr_drbg,
-	  gen_random_havege, hello, key_app, md5sum, mpi_demo,
-	  rsa_decrypt, rsa_encrypt, rsa_genkey, rsa_sign, rsa_verify,
-	  selftest, sha1sum, sha2sum, ssi-cgi, ssl_cert_test,
-	  ssl_client1, ssl_client2, ssl_fork_server, ssl_mail_client,
-	  ssl_server, ssl_test
-
-endif
diff --git a/package/polarssl/polarssl.hash b/package/polarssl/polarssl.hash
deleted file mode 100644
index 3f1871c..0000000
--- a/package/polarssl/polarssl.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.1-2.1.4-1.3.16-and-polarssl.1.2.19-released
-sha256	24cb1608a160101ead3c7240f35fc447fe7880cd60f7ed6c9db7a1d773ccd4b8	polarssl-1.2.19-gpl.tgz
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
deleted file mode 100644
index 7f4c582..0000000
--- a/package/polarssl/polarssl.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# polarssl
-#
-################################################################################
-
-POLARSSL_SITE = https://tls.mbed.org/code/releases
-POLARSSL_VERSION = 1.2.19
-POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
-POLARSSL_CONF_OPTS = \
-	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
-
-POLARSSL_INSTALL_STAGING = YES
-POLARSSL_LICENSE = GPLv2
-POLARSSL_LICENSE_FILES = LICENSE
-
-define POLARSSL_DISABLE_ASM
-	$(SED) '/^#define POLARSSL_HAVE_ASM/d' $(@D)/include/polarssl/config.h
-endef
-
-# ARM in thumb mode breaks debugging with asm optimizations
-# Microblaze asm optimizations are broken in general
-# MIPS R6 asm is not yet supported
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
-POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_microblaze),y)
-POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
-else ifeq ($(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
-POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
-endif
-
-$(eval $(cmake-package))
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index c558a64..6c377f5 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 	select BR2_PACKAGE_LIBCONFIG
 	select BR2_PACKAGE_LIBDAEMON
-	select BR2_PACKAGE_POLARSSL if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
 	  Shairport Sync emulates an AirPort Express for the purpose of
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 7af030b..7f3005b 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -6,10 +6,9 @@
 
 SHAIRPORT_SYNC_VERSION = 2.8.5
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
-
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
-SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon popt host-pkgconf
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libconfig libdaemon openssl popt host-pkgconf
 
 # git clone, no configure
 SHAIRPORT_SYNC_AUTORECONF = YES
@@ -17,6 +16,7 @@ SHAIRPORT_SYNC_AUTORECONF = YES
 SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
 	--with-metadata \
 	--with-pipe \
+	--with-ssl=openssl \
 	--with-stdout
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
@@ -31,15 +31,6 @@ else
 SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
 endif
 
-# OpenSSL or PolarSSL
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SHAIRPORT_SYNC_DEPENDENCIES += openssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
-else
-SHAIRPORT_SYNC_DEPENDENCIES += polarssl
-SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=polarssl
-endif
-
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
-- 
2.7.3
