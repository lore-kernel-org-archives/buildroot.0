From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 15:21:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcue: update upstream URL
Message-ID: <1454163715-20488-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to http://sourceforge.net/projects/libcue the project moved
to github.com, all source tarballs were removed from Sourceforge.

Adjust project and download URLs, update hash and remove
0001-_unused-fix.patch because there is no trace of "__unused" in the
upstream tarball anymore, the patch fails to apply.

Add autoreconf because the new upstream tarball does not contain a
configure script, autoreconf also needs a tweak because it fails when
config/ is not present.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcue/0001-_unused-fix.patch | 50 -----------------------------------
 package/libcue/Config.in              |  2 +-
 package/libcue/libcue.hash            |  2 +-
 package/libcue/libcue.mk              | 12 ++++++---
 4 files changed, 11 insertions(+), 55 deletions(-)
 delete mode 100644 package/libcue/0001-_unused-fix.patch

diff --git a/package/libcue/0001-_unused-fix.patch b/package/libcue/0001-_unused-fix.patch
deleted file mode 100644
index 8a58919..0000000
--- a/package/libcue/0001-_unused-fix.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-[PATCH] fix build on uClibc
-
-Use cue_unused / cue_dead2 for the unused/non-returning annotation macros,
-as uClibc defines a struct member called __unused in stdio.h when built
-with locale support, breaking the build.
-
-According to ANSI C 4.1.2.1, defines beginning with '__' are reserved
-for the implementation, so shouldn't be used in user code.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/libcue/cue_scanner.c |   10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-Index: libcue-1.4.0/src/libcue/cue_scanner.c
-===================================================================
---- libcue-1.4.0.orig/src/libcue/cue_scanner.c
-+++ libcue-1.4.0/src/libcue/cue_scanner.c
-@@ -7,9 +7,11 @@
- 
- #if defined(__FreeBSD__)
- #include <sys/cdefs.h>
-+#define cue_unused __unused
-+#define cue_dead2 __dead2
- #else
--#define __unused
--#define __dead2
-+#define cue_unused
-+#define cue_dead2
- #endif
- 
- #define FLEX_SCANNER
-@@ -248,7 +250,7 @@
- YY_BUFFER_STATE yy_scan_bytes YY_PROTO(( yyconst char *bytes, int len ));
- 
- static void *yy_flex_alloc YY_PROTO(( yy_size_t ));
--static void *yy_flex_realloc YY_PROTO(( void *, yy_size_t )) __unused;
-+static void *yy_flex_realloc YY_PROTO(( void *, yy_size_t )) cue_unused;
- static void yy_flex_free YY_PROTO(( void * ));
- 
- #define yy_new_buffer yy_create_buffer
-@@ -285,7 +287,7 @@
- static yy_state_type yy_get_previous_state YY_PROTO(( void ));
- static yy_state_type yy_try_NUL_trans YY_PROTO(( yy_state_type current_state ));
- static int yy_get_next_buffer YY_PROTO(( void ));
--static void yy_fatal_error YY_PROTO(( yyconst char msg[] )) __dead2;
-+static void yy_fatal_error YY_PROTO(( yyconst char msg[] )) cue_dead2;
- 
- /* Done after the current pattern has been matched and before the
-  * corresponding action - sets up yytext.
diff --git a/package/libcue/Config.in b/package/libcue/Config.in
index 6121746..69e6495 100644
--- a/package/libcue/Config.in
+++ b/package/libcue/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBCUE
 	help
 	  CUE Sheet Parser Library
 
-	  http://libcue.sourceforge.net/
+	  https://github.com/lipnitsk/libcue
diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 0fa7100..779cda0 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  8b7276ec2a2b3918cbc59a3cc03c68dc0775965cc20e4b88757b852ff369729e  libcue-1.4.0.tar.bz2
+sha256	c3c46d58cebf15b3fe07e6f649014694d338ddd880e941bfb1fd3cedae66c62f	libcue-v1.4.0.tar.gz
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index e2cf630..de8f792 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,12 +4,18 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = 1.4.0
-LIBCUE_SITE = http://downloads.sourceforge.net/project/libcue/libcue/$(LIBCUE_VERSION)
-LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
+LIBCUE_VERSION = v1.4.0
+LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPLv2, BSD-2c (rem.c)
 LIBCUE_LICENSE_FILES = COPYING
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
+LIBCUE_AUTORECONF = YES
+
+# Needed for autoreconf
+define LIBCUE_MAKE_CONFIG_DIR
+	mkdir $(@D)/config
+endef
+LIBCUE_POST_EXTRACT_HOOKS += LIBCUE_MAKE_CONFIG_DIR
 
 $(eval $(autotools-package))
-- 
2.7.0.rc3
