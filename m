From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 21:29:32 +0200
Subject: [Buildroot] [git commit] libpcap: drop libnl headers patch
Message-ID: <20161026195442.F01CA81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2d9202f6f9119e1cea44a913306e361b03d90e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can avoid host headers using a --with-libnl parameter to override the
default host headers path. The configure script adds /include suffix to the
include path. So we still need to manually add -I with the correct path to
CFLAGS because libnl headers are under the libnl3/ directory.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libpcap/0001-remove-libnl-include-path.patch   | 25 ----------------------
 package/libpcap/libpcap.mk                         |  1 +
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/package/libpcap/0001-remove-libnl-include-path.patch b/package/libpcap/0001-remove-libnl-include-path.patch
deleted file mode 100644
index d0760d4..0000000
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
index 4c7a66c..0a74de7 100644
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
