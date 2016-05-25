From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 07:44:46 +0200
Subject: [Buildroot] [git commit] mpg123: unbreak static linking with
	alsa/portaudio
Message-ID: <20160525054522.4EDDE81F51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9419d752de00a06acf1d02ad2bc18c023e851bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/b2b/b2bc143fbd0b34e75a44af41ab6899dd9fa3c21a/
http://autobuild.buildroot.org/results/60d/60d56b0a75d209f2cfeff0727c2f900abc89d263/
http://autobuild.buildroot.org/results/6a8/6a8729ce69055821fdf0b91adcea2ea201d40189/

And many more.

A recent upstream build system change caused LIBS to be ignored at build
time (but still used a configure time), causing our static linking
workarounds to no longer work.

Fix it by adding a patch to cause it to no longer ignore LIBS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile.am-don-t-override-LIBS.patch     | 46 ++++++++++++++++++++++
 package/mpg123/mpg123.mk                           |  2 +
 2 files changed, 48 insertions(+)

diff --git a/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch b/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch
new file mode 100644
index 0000000..a5bfe80
--- /dev/null
+++ b/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch
@@ -0,0 +1,46 @@
+From 25c2e71c9ce762561eeacd35bf432c6692c0fb44 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Tue, 24 May 2016 17:34:32 +0200
+Subject: [PATCH] Makefile.am: don't override LIBS
+
+Patch status: posted upstream
+https://sourceforge.net/p/mpg123/mailman/message/35111696/
+
+The recent build system change broke custom LIBS handling. As opposed to the
+other internal variables, LIBS can be provided by the user when running
+configure, E.G.:
+
+LIBS="-lfoo -lbar" ./configure ..
+
+This is correctly used by the configure checks, but doesn't end up in the
+Makefile any more because of this override - Breaking static builds where
+the configure script needs a bit of help to link with -lpthread when
+alsa/portaudio is used (as those use pthreads internally).
+
+Fixes the following build issues from the Buildroot autobuilders:
+
+http://autobuild.buildroot.net/?reason=mpg123-1.23.3
+
+(see https://git.buildroot.net/buildroot/tree/package/mpg123/mpg123.mk for
+the build logic)
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d695a3b..863f59f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -9,7 +9,6 @@
+ ACLOCAL_AMFLAGS = -I m4
+ bin_PROGRAMS =
+ EXTRA_PROGRAMS =
+-LIBS =
+ EXTRA_DIST =
+ pkglib_LTLIBRARIES =
+ lib_LTLIBRARIES =
+-- 
+2.7.0
+
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 00bb971..19a0de1 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -12,6 +12,8 @@ MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
 MPG123_DEPENDENCIES = host-pkgconf
+# 0001-Makefile.am-don-t-override-LIBS.patch patches Makefile.am
+MPG123_AUTORECONF = YES
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
