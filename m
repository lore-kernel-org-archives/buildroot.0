From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 13 Jan 2019 22:47:22 +0100
Subject: [Buildroot] [PATCH v1] libcdaudio: fix compile on host systems
 without C++ support
Message-ID: <20190113214722.15104-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Delivered libcdaudio configure tries to run a C++ check with the
host C preprocessor. Fix it by enabling autoreconf  (needs
a patch for configure.ac/Makefile.am removing ancient lines).

Fixes [1]:

  checking how to run the C++ preprocessor... /lib/cpp
  configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-libcdaudio-enable-autoreconf.patch   | 43 +++++++++++++++++++
 package/libcdaudio/libcdaudio.mk              |  3 ++
 2 files changed, 46 insertions(+)
 create mode 100644 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch

diff --git a/package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch b/package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch
new file mode 100644
index 0000000000..ab2296c042
--- /dev/null
+++ b/package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch
@@ -0,0 +1,43 @@
+From 9c2873b1d9292bcf43c862b6777d41c40521424c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 13 Jan 2019 22:27:42 +0100
+Subject: [PATCH] libcdaudio: enable autoreconf
+
+Fixes the following two autoreconf errors (by simple removing of the
+two offending lines):
+
+  configure.ac:20: error: automatic de-ANSI-fication support has been removed
+
+  Makefile.am:2: error: automatic de-ANSI-fication support has been removed
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Makefile.am  | 1 -
+ configure.ac | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f639dd8..a32cfe6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,4 @@
+ ## Process this file with automake to produce Makefile.in
+-AUTOMAKE_OPTIONS = ansi2knr
+ SUBDIRS = src
+ 
+ bin_SCRIPTS = libcdaudio-config
+diff --git a/configure.ac b/configure.ac
+index bbdd42d..6699ceb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,6 @@ AM_CONFIG_HEADER(config.h)
+ AC_PROG_AWK
+ AC_PROG_CC
+ AC_PROG_CPP
+-AM_C_PROTOTYPES
+ AM_PROG_CC_STDC
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
+-- 
+2.20.1
+
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 5d421eba7a..e2c1496287 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -11,4 +11,7 @@ LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 LIBCDAUDIO_LICENSE = GPL-2.0+
 LIBCDAUDIO_LICENSE_FILES = COPYING
 
+# fix configure failure on host systems without C++ support
+LIBCDAUDIO_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.20.1
