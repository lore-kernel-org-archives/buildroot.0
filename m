From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Mar 2019 17:12:05 +0200
Subject: [Buildroot] [PATCH v2,1/2] package/oniguruma: new package
Message-ID: <20190331151206.23277-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oniguruma is a modern and flexible regular expressions
library. It encompasses features from different regular
expression implementations that traditionally exist in
different languages.

https://github.com/kkos/oniguruma

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Remove host variant

 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/oniguruma/0001-fix-cross-compilation.patch | 61 ++++++++++++++++++++++
 package/oniguruma/Config.in                        |  9 ++++
 package/oniguruma/oniguruma.hash                   |  3 ++
 package/oniguruma/oniguruma.mk                     | 15 ++++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/oniguruma/0001-fix-cross-compilation.patch
 create mode 100644 package/oniguruma/Config.in
 create mode 100644 package/oniguruma/oniguruma.hash
 create mode 100644 package/oniguruma/oniguruma.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cea8755104..8230ad6bb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -826,6 +826,7 @@ F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
 F:	package/ncmpc/
+F:	package/oniguruma/
 F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/python-backcall/
diff --git a/package/Config.in b/package/Config.in
index 88bf65b9f2..e617120397 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1771,6 +1771,7 @@ menu "Text and terminal handling"
 	source "package/linenoise/Config.in"
 	source "package/ncurses/Config.in"
 	source "package/newt/Config.in"
+	source "package/oniguruma/Config.in"
 	source "package/pcre/Config.in"
 	source "package/pcre2/Config.in"
 	source "package/popt/Config.in"
diff --git a/package/oniguruma/0001-fix-cross-compilation.patch b/package/oniguruma/0001-fix-cross-compilation.patch
new file mode 100644
index 0000000000..9186cfd625
--- /dev/null
+++ b/package/oniguruma/0001-fix-cross-compilation.patch
@@ -0,0 +1,61 @@
+From 39619b1c04640375b2fc2c29991137b741a47976 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 20 Mar 2019 20:33:11 +0100
+Subject: [PATCH] fix cross-compilation
+
+Don't add -I$(includedir) to CPPFLAGS or cross-compilation will fail on:
+
+libtool: compile: /home/fabrice/buildroot/output/host/bin/m68k-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
+-D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-dwarf2-cfi-asm -Wl,-elf2flt -c regparse.c -o regparse.o
+m68k-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kkos/oniguruma/pull/137]
+---
+ sample/Makefile.am | 2 +-
+ src/Makefile.am    | 2 +-
+ test/Makefile.am   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sample/Makefile.am b/sample/Makefile.am
+index fd809fa..320afcf 100644
+--- a/sample/Makefile.am
++++ b/sample/Makefile.am
+@@ -4,7 +4,7 @@ lib_onig = ../src/libonig.la
+ LDADD  = $(lib_onig)
+ 
+ AM_LDFLAGS  = -L$(prefix)/lib
+-AM_CPPFLAGS = -I$(top_srcdir)/src -I$(includedir)
++AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+ TESTS = encode listcap names posix simple sql syntax user_property callout echo count bug_fix
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index ba7807a..1330620 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -2,7 +2,7 @@
+ libname = libonig.la
+ 
+ AM_CFLAGS = -Wall
+-AM_CPPFLAGS = -I$(top_srcdir) -I$(includedir)
++AM_CPPFLAGS = -I$(top_srcdir)
+ 
+ include_HEADERS = oniguruma.h oniggnu.h
+ 
+diff --git a/test/Makefile.am b/test/Makefile.am
+index c623aa3..67b5d1e 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -3,7 +3,7 @@ lib_onig = ../src/libonig.la
+ 
+ AM_LDFLAGS  = -L$(prefix)/lib
+ AM_CFLAGS = -Wall -Wno-invalid-source-encoding
+-AM_CPPFLAGS = -I$(top_srcdir)/src -I$(includedir)
++AM_CPPFLAGS = -I$(top_srcdir)/src
+ 
+ if ENABLE_POSIX_API
+ TESTS = test_utf8 testc testp testcu
+-- 
+2.14.1
+
diff --git a/package/oniguruma/Config.in b/package/oniguruma/Config.in
new file mode 100644
index 0000000000..2e8b41c1d6
--- /dev/null
+++ b/package/oniguruma/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ONIGURUMA
+	bool "oniguruma"
+	help
+	  Oniguruma is a modern and flexible regular expressions
+	  library. It encompasses features from different regular
+	  expression implementations that traditionally exist in
+	  different languages.
+
+	  https://github.com/kkos/oniguruma
diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
new file mode 100644
index 0000000000..4d3392c972
--- /dev/null
+++ b/package/oniguruma/oniguruma.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  733a91e257c20cb17b81596db48fd0fbd2e0074fe922ae4c2bc4fefcec110aae  oniguruma-6.9.1.tar.gz
+sha256  84e55812150474adf4170d4656744dfcc5f260ff7602e447a70bf13c56203e4b  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
new file mode 100644
index 0000000000..1f992c2b94
--- /dev/null
+++ b/package/oniguruma/oniguruma.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# oniguruma
+#
+################################################################################
+
+ONIGURUMA_VERSION = 6.9.1
+ONIGURUMA_SITE = $(call github,kkos,oniguruma,v$(ONIGURUMA_VERSION))
+ONIGURUMA_LICENSE = BSD-2-Clause
+ONIGURUMA_LICENSE_FILES = COPYING
+# From git
+ONIGURUMA_AUTORECONF = YES
+ONIGURUMA_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.14.1
