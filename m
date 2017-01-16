From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 11:53:13 +0100
Subject: [Buildroot] [git commit] package/libxmlrpc: bump to version 1.39.12
Message-ID: <20170116124620.5CCEE8179D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91888b306bf079a4bb81fb0515b5a7214214ae92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also:
* remove patch "Fix non C++ build" - merged upstream
* remove patch "Fix ar, ranlib handling" - merged upstream
* renumber remaining patches

Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...in-fix-shared-libraries-build-for-uClibc.patch} |  0
 .../libxmlrpc/0002-fix-non-cplusplus-build.patch   | 44 ----------------------
 ...ing.patch => 0003-fix-ar-ranlib-handling.patch} |  0
 package/libxmlrpc/0003-non-wchar-build.patch       | 24 ------------
 package/libxmlrpc/libxmlrpc.hash                   |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  2 +-
 6 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch b/package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
similarity index 100%
rename from package/libxmlrpc/0005-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
rename to package/libxmlrpc/0002-config.mk.in-fix-shared-libraries-build-for-uClibc.patch
diff --git a/package/libxmlrpc/0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
deleted file mode 100644
index 2d5bfcc..0000000
--- a/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Handle builds without C++
-
-libxmlrpc nicely handles the fact of being built without C++ support,
-except for two locations, fixed by this patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
-
-Index: b/lib/util/Makefile
-===================================================================
---- a/lib/util/Makefile
-+++ b/lib/util/Makefile
-@@ -41,11 +41,14 @@
- LIBOBJS = \
-   casprintf.o \
-   cmdline_parser.o \
--  cmdline_parser_cpp.o \
-   getoptx.o \
-   string_parser.o \
-   stripcaseeq.o \
- 
-+ifeq ($(ENABLE_CPLUSPLUS),yes)
-+LIBOBJS += cmdline_parser_cpp.o
-+endif
-+
- .PHONY: all
- all: $(LIBOBJS)
- 
-Index: b/lib/Makefile
-===================================================================
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -9,7 +9,10 @@
- 
- # Build up SUBDIRS:
- SUBDIRS = 
--SUBDIRS += util libutil libutil++
-+SUBDIRS += util libutil
-+ifeq ($(ENABLE_CPLUSPLUS),yes)
-+  SUBDIRS += libutil++
-+endif
- ifeq ($(ENABLE_ABYSS_SERVER),yes)
-   SUBDIRS += abyss
-   ifeq ($(ENABLE_CPLUSPLUS),yes)
diff --git a/package/libxmlrpc/0006-fix-ar-ranlib-handling.patch b/package/libxmlrpc/0003-fix-ar-ranlib-handling.patch
similarity index 100%
rename from package/libxmlrpc/0006-fix-ar-ranlib-handling.patch
rename to package/libxmlrpc/0003-fix-ar-ranlib-handling.patch
diff --git a/package/libxmlrpc/0003-non-wchar-build.patch b/package/libxmlrpc/0003-non-wchar-build.patch
deleted file mode 100644
index 1f04353..0000000
--- a/package/libxmlrpc/0003-non-wchar-build.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Disable wide-char specific code
-
-The vast majority of the libxmlrpc code nicely handles the absence of
-wide char support, except at one location, which is fixed by this
-patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/xmlrpc_decompose.c
-===================================================================
---- a/src/xmlrpc_decompose.c
-+++ b/src/xmlrpc_decompose.c
-@@ -217,7 +217,11 @@
-         xmlrpc_strfree(*decompRootP->store.Tstring.valueP);
-         break;
-     case 'w':
-+#if HAVE_UNICODE_WCHAR
-         free((void*)*decompRootP->store.TwideString.valueP);
-+#else
-+	XMLRPC_ASSERT(false);
-+#endif
-         break;
-     case '6':
-         free((void*)*decompRootP->store.TbitString.valueP);
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index 8ec1e14..3003622 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2e56cdcdd5c5fa564bcdc7a56bca108a88f5b78b34ccc85558366efabdc8b8e8 xmlrpc-c-1.39.11.tgz
+sha256 d830f3264a832dfe09f629cc64036acfd08121692526d0fabe090f7ff881ce08 xmlrpc-c-1.39.12.tgz
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index 53a5877..738ae9a 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXMLRPC_VERSION = 1.39.11
+LIBXMLRPC_VERSION = 1.39.12
 LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
 LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/$(LIBXMLRPC_VERSION)
 LIBXMLRPC_LICENSE = BSD-3c (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
