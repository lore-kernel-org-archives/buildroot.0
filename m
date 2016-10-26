From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Oct 2016 20:03:09 +0300
Subject: [Buildroot] [PATCH 1/2] libpcap: drop libnl headers patch
Message-ID: <806b12235b685b37dced54464cbd380abf091c33.1477501390.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We can avoid host headers using a --with-libnl parameter to override the
default host headers path. The configure script adds /include suffix to the
include path. So we still need to manually add -I with the correct path to
CFLAGS because libnl headers are under the libnl3/ directory.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../libpcap/0001-remove-libnl-include-path.patch   | 25 ----------------------
 package/libpcap/libpcap.mk                         |  1 +
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 package/libpcap/0001-remove-libnl-include-path.patch

diff --git a/package/libpcap/0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
deleted file mode 100644
index d0760d4f9d86..000000000000
--- a/package/libpcap/0001-remove-libnl-include-path.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Remove hardcoded path to libnl3 include directory
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Gustavo: update for 1.7.2]
-
-diff -Nura libpcap-1.7.2.orig/configure.in libpcap-1.7.2/configure.in
---- libpcap-1.7.2.orig/configure.in	2015-03-14 08:02:05.538706347 -0300
-+++ libpcap-1.7.2/configure.in	2015-03-14 08:17:22.637519050 -0300
-@@ -461,14 +461,13 @@
- 			#
- 			# Yes, we have libnl 3.x.
- 			#
--			LIBS="${libnldir} -lnl-genl-3 -lnl-3 $LIBS"
-+			LIBS="-lnl-genl-3 -lnl-3 $LIBS"
- 			AC_DEFINE(HAVE_LIBNL,1,[if libnl exists])
- 			AC_DEFINE(HAVE_LIBNL_3_x,1,[if libnl exists and is version 3.x])
- 			AC_DEFINE(HAVE_LIBNL_NLE,1,[libnl has NLE_FAILURE])
- 			AC_DEFINE(HAVE_LIBNL_SOCKETS,1,[libnl has new-style socket api])
--			V_INCLS="$V_INCLS ${incdir}"
- 			have_any_nl="yes"
--		],[], ${incdir} ${libnldir} -lnl-genl-3 -lnl-3 )
-+		],[], -lnl-genl-3 -lnl-3 )
- 
- 		if test x$have_any_nl = xno ; then
- 			#
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 4c7a66c09d13..0a74de7b8ea7 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -51,6 +51,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
 LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
+LIBPCAP_CONF_OPTS += --with-libnl=$(STAGING_DIR)/usr
 else
 LIBPCAP_CONF_OPTS += --without-libnl
 endif
-- 
2.9.3
