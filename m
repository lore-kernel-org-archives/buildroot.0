From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:43:35 +0200
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.1.4
Message-ID: <20170601202853.0A376807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9e41d1620a68193ed6a5ee9fe94d9d10eabf279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:

0005-remove-powerpc64-workaround.patch
http://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=3bad0a21b4d13d8d10691f382c836897fa7a7cb9

0006-ucm-parser-needs-limits.h.patch
http://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=9ed4075f05a4242f32331f7f2c365767970f5003

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0005-remove-powerpc64-workaround.patch         | 67 ----------------------
 .../alsa-lib/0006-ucm-parser-needs-limits.h.patch  | 30 ----------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 4 files changed, 2 insertions(+), 99 deletions(-)

diff --git a/package/alsa-lib/0005-remove-powerpc64-workaround.patch b/package/alsa-lib/0005-remove-powerpc64-workaround.patch
deleted file mode 100644
index 57a369e..0000000
--- a/package/alsa-lib/0005-remove-powerpc64-workaround.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-Linking currently fails on powerpc64 and powerpc64le when configured
-with --without-versioned, as follows:
-../src/.libs/libasound.so: undefined reference to `.__snd_pcm_hw_params_set_format_first'
-(And many similar messages.)
-
-This appears to be due to a very old (2003) workaround for powerpc64,
-(introduced by commit 06221f86) in include/alsa-symbols.h which alters
-symbol names. While it was probably necessary at the time, it does not
-appear to be necessary now and removing it fixes the build.
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- include/alsa-symbols.h | 25 ++++---------------------
- 1 file changed, 4 insertions(+), 21 deletions(-)
-
-diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
-index 51cb982..0cb0b9f 100644
---- a/include/alsa-symbols.h
-+++ b/include/alsa-symbols.h
-@@ -29,19 +29,10 @@
- #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
- #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
- 
--#ifdef __powerpc64__
--# define symbol_version(real, name, version) 			\
--	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version);	\
--	__asm__ (".symver ." ASM_NAME(#real) ",." ASM_NAME(#name) "@" #version)
--# define default_symbol_version(real, name, version) 		\
--	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version);	\
--	__asm__ (".symver ." ASM_NAME(#real) ",." ASM_NAME(#name) "@@" #version)
--#else
--# define symbol_version(real, name, version) \
--	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version)
--# define default_symbol_version(real, name, version) \
--	__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version)
--#endif
-+#define symbol_version(real, name, version) \
-+__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@" #version)
-+#define default_symbol_version(real, name, version) \
-+__asm__ (".symver " ASM_NAME(#real) "," ASM_NAME(#name) "@@" #version)
- 
- #ifdef USE_VERSIONED_SYMBOLS
- #define use_symbol_version(real, name, version) \
-@@ -50,13 +41,6 @@
- 		default_symbol_version(real, name, version)
- #else
- #define use_symbol_version(real, name, version) /* nothing */
--#ifdef __powerpc64__
--#define use_default_symbol_version(real, name, version) \
--	__asm__ (".weak " ASM_NAME(#name)); 			\
--	__asm__ (".weak ." ASM_NAME(#name)); 			\
--	__asm__ (".set " ASM_NAME(#name) "," ASM_NAME(#real));		\
--	__asm__ (".set ." ASM_NAME(#name) ",." ASM_NAME(#real))
--#else
- #if defined(__alpha__) || defined(__mips__)
- #define use_default_symbol_version(real, name, version) \
-         __asm__ (".weak " ASM_NAME(#name)); \
-@@ -67,6 +51,5 @@
- 	__asm__ (".set " ASM_NAME(#name) "," ASM_NAME(#real))
- #endif
- #endif
--#endif
- 
- #endif /* __ALSA_SYMBOLS_H */
--- 
-2.10.0.297.gf6727b0
-
diff --git a/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch b/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch
deleted file mode 100644
index b47dedb..0000000
--- a/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 13a796b4bd00defa9f9297fd23d508b430682aed Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 21 Dec 2016 19:41:26 -0300
-Subject: [PATCH] ucm: parser needs limits.h
-
-It's using PATH_MAX which is defined there, otherwise the build fails on
-musl libc.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: sent to alsa-devel ML.
-
- src/ucm/parser.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ucm/parser.c b/src/ucm/parser.c
-index c98373a..f520abc 100644
---- a/src/ucm/parser.c
-+++ b/src/ucm/parser.c
-@@ -32,6 +32,7 @@
- 
- #include "ucm_local.h"
- #include <dirent.h>
-+#include <limits.h>
- 
- /** The name of the environment variable containing the UCM directory */
- #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
--- 
-2.10.2
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 6f56a76..bcfadce 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c  alsa-lib-1.1.3.tar.bz2
+sha256 82f50a09487079755d93e4c9384912196995bade6280bce9bfdcabf094bfb515  alsa-lib-1.1.4.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 8651653..049c28f 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.3
+ALSA_LIB_VERSION = 1.1.4
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
