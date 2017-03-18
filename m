From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:16:49 +0100
Subject: [Buildroot] [git commit] polarssl: remove unmaintained package
Message-ID: <20170318131703.654198254F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d10b493e489da81e7867400f03c5111f7ecca172
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 1.2.x branch is no longer maintained, so remove it since it's
likely security-vulnerable.

mbedtls is the modern replacement which was renamed from polarssl when
ARM bought them up.
However major releases broke API so polarssl 1.2.x isn't always
interchangeable with polarssl/mbedtls 1.3.x (interim mixed naming
because of new ownership) or newer 2.x series.

Fortunately we don't have any package in the tree that uses polarssl
exclusively.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - Remove entry in DEVELOPERS file for this package. Noticed by Arnout.
 - Remove comment in bctoolbox.mk that no longer makes sense after
   polarssl removal. Noticed by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  9 +++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/bctoolbox/Config.in                        |  3 +-
 package/bctoolbox/bctoolbox.mk                     | 10 +-----
 package/polarssl/0001-no-test-suite.patch          | 27 ---------------
 ...he-standard-CMake-flag-to-drive-the-share.patch | 39 ----------------------
 package/polarssl/Config.in                         | 32 ------------------
 package/polarssl/polarssl.hash                     |  2 --
 package/polarssl/polarssl.mk                       | 32 ------------------
 10 files changed, 11 insertions(+), 145 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 090e60a..a45c4b3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_POLARSSL
+	bool "polarssl has been removed"
+	select BR2_LEGACY
+	help
+	  The polarssl crypto library has been removed since the 1.2.x
+	  release branch is no longer maintained. Newer upstream
+	  branches/releases (mbedtls) have API changes so they're not
+	  drop-in replacements.
+
 config BR2_NBD_CLIENT
 	bool "nbd client option was renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e08b65d..0665e5a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1552,7 +1552,6 @@ F:	package/ne10/
 F:	package/pkg-python.mk
 F:	package/pkg-autotools.mk
 F:	package/pkg-generic.mk
-F:	package/polarssl/
 F:	package/python/
 F:	package/python3/
 F:	package/python-mad/
diff --git a/package/Config.in b/package/Config.in
index 85e4dee..7308378 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,7 +948,6 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
-	source "package/polarssl/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/trousers/Config.in"
 	source "package/ustream-ssl/Config.in"
diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
index e9e6920..048d012 100644
--- a/package/bctoolbox/Config.in
+++ b/package/bctoolbox/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_BCTOOLBOX
 	  Utilities library used by Belledonne Communications
 	  softwares like belle-sip, mediastreamer2 and linphone.
 
-	  Select BR2_PACKAGE_MBEDTLS (preferred) or
-	  BR2_PACKAGE_POLARSSL for crypto support.
+	  Select BR2_PACKAGE_MBEDTLS for crypto support.
 
 	  https://github.com/BelledonneCommunications/bctoolbox
 
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 7826975..f972ab6 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -13,14 +13,13 @@ BCTOOLBOX_INSTALL_STAGING = YES
 # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
 # shared library.
 BCTOOLBOX_CONF_OPTS = \
+	-DENABLE_POLARSSL=OFF \
 	-DENABLE_STRICT=OFF \
 	-DENABLE_TESTS_COMPONENT=OFF \
 	-DENABLE_TESTS=OFF \
 	-DGIT_EXECUTABLE=OFF \
 	-DCMAKE_SKIP_RPATH=ON
 
-# bctoolbox can be build with mbedTLS or PolarSSL support. If both
-# libraries are present, mbedTLS is preferred over PolarSSL.
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 BCTOOLBOX_DEPENDENCIES += mbedtls
 BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
@@ -28,13 +27,6 @@ else
 BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_POLARSSL),y)
-BCTOOLBOX_DEPENDENCIES += polarssl
-BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=ON
-else
-BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=OFF
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
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
