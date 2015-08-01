From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 16:20:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtheora: Fix dynamic linking
Message-ID: <1438438841-31219-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libtheoraenc.so needs to be linked to libtheoradec.so in order to avoid

symbol 'th_comment_query_count': can't resolve symbol in lib '/usr/lib/libtheoraenc.so.1'

when starting Freeswitch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libtheora/0001-link-libtheoradec.patch | 21 ++++++++++++
 package/libtheora/0002-fix-autoreconf.patch    | 46 ++++++++++++++++++++++++++
 package/libtheora/libtheora.mk                 |  1 +
 3 files changed, 68 insertions(+)
 create mode 100644 package/libtheora/0001-link-libtheoradec.patch
 create mode 100644 package/libtheora/0002-fix-autoreconf.patch

diff --git a/package/libtheora/0001-link-libtheoradec.patch b/package/libtheora/0001-link-libtheoradec.patch
new file mode 100644
index 0000000..c38d32b
--- /dev/null
+++ b/package/libtheora/0001-link-libtheoradec.patch
@@ -0,0 +1,21 @@
+libtheoraenc.so needs to be linked to libtheoradec.so in order to avoid
+
+symbol 'th_comment_query_count': can't resolve symbol in lib '/usr/lib/libtheoraenc.so.1'
+
+when starting Freeswitch.
+
+Patch downloaded from
+http://www.sisyphus.ru/en/srpm/Sisyphus/libtheora/patches/0
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- libtheora/lib/Makefile.am
++++ libtheora/lib/Makefile.am
+@@ -153,6 +153,7 @@ libtheoraenc_la_SOURCES = \
+ libtheoraenc_la_LDFLAGS = \
+   -version-info @THENC_LIB_CURRENT@:@THENC_LIB_REVISION@:@THENC_LIB_AGE@ \
+   @THEORAENC_LDFLAGS@ $(OGG_LIBS)
++libtheoraenc_la_LIBADD = libtheoradec.la
+ 
+ libtheora_la_SOURCES = \
+ 	$(decoder_sources) \
diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
new file mode 100644
index 0000000..dd3f473
--- /dev/null
+++ b/package/libtheora/0002-fix-autoreconf.patch
@@ -0,0 +1,46 @@
+Fix broken autoreconf
+
+Downloaded from upstream git
+https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From: Tim Terriberry <tterribe@xiph.org>
+Date: Fri, 20 May 2011 20:41:50 +0000 (+0000)
+Subject: Make autoreconf -i -f work.
+X-Git-Url: https://git.xiph.org/?p=theora.git;a=commitdiff_plain;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
+
+Make autoreconf -i -f work.
+
+Patch from David Schleef.
+
+svn path=/trunk/theora/; revision=17990
+---
+
+diff --git a/Makefile.am b/Makefile.am
+index 89fd753..1783857 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -4,6 +4,8 @@
+ #AUTOMAKE_OPTIONS = foreign 1.7 dist-zip dist-bzip2
+ AUTOMAKE_OPTIONS = foreign 1.11 dist-zip dist-xz
+ 
++ACLOCAL_AMFLAGS=-I m4
++
+ if THEORA_ENABLE_EXAMPLES
+ EXAMPLES_DIR = examples
+ else
+diff --git a/configure.ac b/configure.ac
+index 1cbec1a..456b603 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,7 +68,7 @@ AC_LIBTOOL_WIN32_DLL
+ AM_PROG_LIBTOOL
+ 
+ dnl Add parameters for aclocal
+-AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
++AC_CONFIG_MACRO_DIR([m4])
+ 
+ dnl Check for doxygen
+ AC_ARG_ENABLE([doc],
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 480af75..11f2c3e 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -8,6 +8,7 @@ LIBTHEORA_VERSION = 1.1.1
 LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.xz
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
+LIBTHEORA_AUTORECONF = YES
 LIBTHEORA_LICENSE = BSD-3c
 LIBTHEORA_LICENSE_FILES = COPYING LICENSE
 
-- 
2.1.4
