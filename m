From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Apr 2012 20:36:28 +0200
Subject: [Buildroot] [git commit] libmpeg2: fix ppc altivec.h detection
Message-ID: <20120422183702.AF4BA96B8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19a19a39971d8c0a436693bf056a84957da3d449
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from Gentoo.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libmpeg2/libmpeg2-0.5.1-altivec.patch          |   23 ++++++++++++++++++++
 package/multimedia/libmpeg2/libmpeg2.mk            |    1 +
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/libmpeg2/libmpeg2-0.5.1-altivec.patch b/package/multimedia/libmpeg2/libmpeg2-0.5.1-altivec.patch
new file mode 100644
index 0000000..4928a62
--- /dev/null
+++ b/package/multimedia/libmpeg2/libmpeg2-0.5.1-altivec.patch
@@ -0,0 +1,23 @@
+[PATCH] fix altivec.h detection
+
+Patch from Gentoo:
+
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libmpeg2/files/libmpeg2-0.5.1-altivec.patch?revision=1.1&view=markup
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+--- a/configure.ac.bak	2010-05-25 17:12:14.756245990 +0000
++++ b/configure.ac	2010-05-25 17:11:51.629581723 +0000
+@@ -79,11 +79,10 @@
+ 		 CFLAGS="$OPT_CFLAGS $TRY_CFLAGS $CFLAGS"
+ 		 AC_MSG_CHECKING([if <altivec.h> is needed])
+ 		 AC_TRY_COMPILE([],
+-		    [typedef vector int t;
+-		     vec_ld(0, (unsigned char *)0);],
++		    [vector int t; t = vec_add(t,t);],
+ 		    [have_altivec=yes; AC_MSG_RESULT(no)],
+ 		    [AC_TRY_COMPILE([#include <altivec.h>],
+-			[typedef vector int t; vec_ld(0, (unsigned char *)0);],
++			[vector int t; t = vec_add(t,t);],
+ 			[AC_DEFINE([HAVE_ALTIVEC_H],,
+ 			    [Define to 1 if you have the <altivec.h> header.])
+ 			 have_altivec=yes; AC_MSG_RESULT(yes)],
diff --git a/package/multimedia/libmpeg2/libmpeg2.mk b/package/multimedia/libmpeg2/libmpeg2.mk
index 8713c87..5290af1 100644
--- a/package/multimedia/libmpeg2/libmpeg2.mk
+++ b/package/multimedia/libmpeg2/libmpeg2.mk
@@ -7,6 +7,7 @@ LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
 LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files/
 LIBMPEG2_INSTALL_STAGING = YES
+LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPT = --without-x --disable-directx
 
 ifeq ($(BR2_PACKAGE_SDL),y)
