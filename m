From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 26 Jun 2016 16:48:17 -0300
Subject: [Buildroot] [PATCH] mpg123: bump to version 1.23.5
Message-ID: <1466970497-30351-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstreamed patch and related autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../0001-Makefile.am-don-t-override-LIBS.patch     | 46 ----------------------
 package/mpg123/mpg123.hash                         |  2 +-
 package/mpg123/mpg123.mk                           |  4 +-
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch

diff --git a/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch b/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch
deleted file mode 100644
index a5bfe80..0000000
--- a/package/mpg123/0001-Makefile.am-don-t-override-LIBS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 25c2e71c9ce762561eeacd35bf432c6692c0fb44 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Tue, 24 May 2016 17:34:32 +0200
-Subject: [PATCH] Makefile.am: don't override LIBS
-
-Patch status: posted upstream
-https://sourceforge.net/p/mpg123/mailman/message/35111696/
-
-The recent build system change broke custom LIBS handling. As opposed to the
-other internal variables, LIBS can be provided by the user when running
-configure, E.G.:
-
-LIBS="-lfoo -lbar" ./configure ..
-
-This is correctly used by the configure checks, but doesn't end up in the
-Makefile any more because of this override - Breaking static builds where
-the configure script needs a bit of help to link with -lpthread when
-alsa/portaudio is used (as those use pthreads internally).
-
-Fixes the following build issues from the Buildroot autobuilders:
-
-http://autobuild.buildroot.net/?reason=mpg123-1.23.3
-
-(see https://git.buildroot.net/buildroot/tree/package/mpg123/mpg123.mk for
-the build logic)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d695a3b..863f59f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -9,7 +9,6 @@
- ACLOCAL_AMFLAGS = -I m4
- bin_PROGRAMS =
- EXTRA_PROGRAMS =
--LIBS =
- EXTRA_DIST =
- pkglib_LTLIBRARIES =
- lib_LTLIBRARIES =
--- 
-2.7.0
-
diff --git a/package/mpg123/mpg123.hash b/package/mpg123/mpg123.hash
index 6732206..6429baa 100644
--- a/package/mpg123/mpg123.hash
+++ b/package/mpg123/mpg123.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3495e678dec9a60f29cbcd4fc698abc4c811ec60d1276e744f7a10ac35023b48	mpg123-1.23.4.tar.bz2
+sha256	b658df672813511ff9b68a1553917220b675067204cdb58dbb59a2b8179350b2	mpg123-1.23.5.tar.bz2
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index d943b08..37f207e 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPG123_VERSION = 1.23.4
+MPG123_VERSION = 1.23.5
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
 MPG123_CONF_OPTS = --disable-lfs-alias
@@ -12,8 +12,6 @@ MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
 MPG123_DEPENDENCIES = host-pkgconf
-# 0001-Makefile.am-don-t-override-LIBS.patch patches Makefile.am
-MPG123_AUTORECONF = YES
 
 MPG123_CPU = $(if $(BR2_SOFT_FLOAT),generic_nofpu,generic_fpu)
 
-- 
2.7.3
