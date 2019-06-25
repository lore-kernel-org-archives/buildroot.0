From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jun 2019 11:04:56 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libcdaudio: fix
 build with toolchains lacking C++ support
Message-ID: <20190625090353.2B5898270F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fe00cba0208a7af87af8dd9c55def7a034fcaa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

When the target toolchain does not support C++, the provided
libcdaudio configure script tries to run a check with the C++
pre-processor provided by the host (/lib/cpp) which may not exist on
some systems.

This issue is fixed by autoreconfiguring the package, as newly
generated configure scripts do not have this issue.

Fixes:

  http://autobuild.buildroot.net/results/f725a41ef992c42ceef7514d1a8dcac99e6b9114/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8307fd013292d6f02116b8f4054c70746dddc009)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-libcdaudio-enable-autoreconf.patch        | 43 ++++++++++++++++++++++
 package/libcdaudio/libcdaudio.mk                   |  3 ++
 2 files changed, 46 insertions(+)

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
index 5d421eba7a..651289d7e4 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -11,4 +11,7 @@ LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 LIBCDAUDIO_LICENSE = GPL-2.0+
 LIBCDAUDIO_LICENSE_FILES = COPYING
 
+# fix configure failure when the toolchain doesn't have C++ support
+LIBCDAUDIO_AUTORECONF = YES
+
 $(eval $(autotools-package))
