From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jan 2018 23:51:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/exim: bump version to 4.90
In-Reply-To: <20180127225123.28166-1-bernd.kuhls@t-online.de>
References: <20180127225123.28166-1-bernd.kuhls@t-online.de>
Message-ID: <20180127225123.28166-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/Exim/exim/commit/d185889f47b9b27088e777f7d382295c51271586
added new code to "Prebuild the data structure for builtin macros".

This function needs a host-built binary called macro_predef, it depends
on host-berkeleydb, host-pcre and optionally on host-openssl.

Removed patch applied upstream:
https://github.com/Exim/exim/commit/98913c8ea2be5188dd22ec652da1182017e8edb7

Added license hash, switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/0004-glibc.patch | 27 ---------------------------
 package/exim/exim.hash        |  3 ++-
 package/exim/exim.mk          | 16 ++++++++++++----
 3 files changed, 14 insertions(+), 32 deletions(-)
 delete mode 100644 package/exim/0004-glibc.patch

diff --git a/package/exim/0004-glibc.patch b/package/exim/0004-glibc.patch
deleted file mode 100644
index 7ae2ef8c70..0000000000
--- a/package/exim/0004-glibc.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-uClibc does not contain gnu/libc-version.h
-
-Patch sent upstream: https://bugs.exim.org/show_bug.cgi?id=2070
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr exim-4.88.org/src/exim.c exim-4.88/src/exim.c
---- exim-4.88.org/src/exim.c	2016-12-18 15:02:28.000000000 +0100
-+++ exim-4.88/src/exim.c	2016-12-26 12:12:57.000000000 +0100
-@@ -12,7 +12,7 @@
- 
- #include "exim.h"
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
- # include <gnu/libc-version.h>
- #endif
- 
-@@ -1044,7 +1044,7 @@
-   fprintf(f, "Compiler: <unknown>\n");
- #endif
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !defined(__UCLIBC__)
-   fprintf(f, "Library version: Glibc: Compile: %d.%d\n",
- 	       	__GLIBC__, __GLIBC_MINOR__);
-   if (__GLIBC_PREREQ(2, 1))
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 41f51b15eb..3d11089f15 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 1a21322a10e2da9c0bd6a2a483b6e7ef8fa7f16efcab4c450fd73e7188f5fa94  exim-4.89.1.tar.xz
+sha256 93548b529d0301629106001d73611c6098a676733f742f61ef626f1fb3f23a80  exim-4.90.tar.xz
+sha256 49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 37eab501a4..5b692afbda 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.89.1
+EXIM_VERSION = 4.90
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
-EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
+EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
 EXIM_LICENSE_FILES = LICENCE
-EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
+EXIM_DEPENDENCIES = host-berkeleydb host-pcre pcre berkeleydb host-pkgconf
 
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
@@ -65,7 +65,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-EXIM_DEPENDENCIES += openssl
+EXIM_DEPENDENCIES += host-openssl openssl
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 	$(call exim-config-change,SUPPORT_TLS,yes)
 	$(call exim-config-change,USE_OPENSSL_PC,openssl)
@@ -120,9 +120,17 @@ ifeq ($(BR2_STATIC_LIBS),y)
 EXIM_STATIC_FLAGS = LFLAGS="-pthread --static"
 endif
 
+# We need the host version of macro_predef during the build, before
+# building it we need to prepare the makefile.
 # "The -j (parallel) flag must not be used with make"
 # (http://www.exim.org/exim-html-current/doc/html/spec_html/ch04.html)
 define EXIM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) makefile
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)/build-br macro_predef \
+		CC=$(HOSTCC) \
+		LNCC=$(HOSTCC) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LFLAGS="-fPIC $(HOST_LDFLAGS)"
 	$(TARGET_MAKE_ENV) build=br $(MAKE1) -C $(@D) $(EXIM_STATIC_FLAGS)
 endef
 
-- 
2.11.0
