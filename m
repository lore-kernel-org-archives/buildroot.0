From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Mar 2019 22:25:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/libhtp: new package
Message-ID: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LibHTP is a security-aware parser for the HTTP protocol and the related
bits and pieces.

https://github.com/OISF/libhtp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-fix-build-without-GNU-libiconv.patch      | 60 ++++++++++++++++++++++
 package/libhtp/Config.in                           |  9 ++++
 package/libhtp/libhtp.hash                         |  3 ++
 package/libhtp/libhtp.mk                           | 20 ++++++++
 6 files changed, 94 insertions(+)
 create mode 100644 package/libhtp/0001-fix-build-without-GNU-libiconv.patch
 create mode 100644 package/libhtp/Config.in
 create mode 100644 package/libhtp/libhtp.hash
 create mode 100644 package/libhtp/libhtp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 36e2295d2d..24737b858f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -784,6 +784,7 @@ F:	package/libgee/
 F:	package/libglib2/
 F:	package/libgtk2/
 F:	package/libgtk3/
+F:	package/libhtp/
 F:	package/libidn/
 F:	package/libidn2/
 F:	package/libjpeg/
diff --git a/package/Config.in b/package/Config.in
index 85a37f2c0b..bb57afab08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1534,6 +1534,7 @@ menu "Networking"
 	source "package/libeXosip2/Config.in"
 	source "package/libfcgi/Config.in"
 	source "package/libgsasl/Config.in"
+	source "package/libhtp/Config.in"
 	source "package/libhttpparser/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libidn2/Config.in"
diff --git a/package/libhtp/0001-fix-build-without-GNU-libiconv.patch b/package/libhtp/0001-fix-build-without-GNU-libiconv.patch
new file mode 100644
index 0000000000..8f6cddf2da
--- /dev/null
+++ b/package/libhtp/0001-fix-build-without-GNU-libiconv.patch
@@ -0,0 +1,60 @@
+From 1531a8e9b91b567979a2a0d7fd6a4c2e9126b01c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Mar 2019 23:06:54 +0100
+Subject: [PATCH] fix build without GNU libiconv
+
+iconvctl is only defined in GNU libiconv so check for the availability
+of this function before using it
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OISF/libhtp/pull/193]
+---
+ configure.ac         | 18 ++++++++++++++++++
+ htp/htp_transcoder.c |  2 +-
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7f0a58d..388ec7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -155,6 +155,24 @@ sinclude(m4/lib-link.m4)
+ sinclude(m4/lib-prefix.m4)
+ AM_ICONV
+ 
++# iconvctl is not standard, it is defined only in GNU libiconv
++AC_MSG_CHECKING(for iconvctl)
++TMPLIBS="${LIBS}"
++LIBS="${LIBS} ${LIBICONV}"
++
++AC_TRY_LINK([#include <stdlib.h>
++             #include <iconv.h>],
++            [int iconv_param = 0;
++             iconv_t cd = iconv_open("","");
++             iconvctl(cd, ICONV_SET_DISCARD_ILSEQ, &iconv_param);
++             iconv_close(cd);],
++            [ac_cv_func_iconvctl=yes])
++AC_MSG_RESULT($ac_cv_func_iconvctl)
++if test "$ac_cv_func_iconvctl" == yes; then
++    AC_DEFINE(HAVE_ICONVCTL,1,"Define to 1 if you have the `iconvctl' function.")
++fi
++LIBS="${TMPLIBS}"
++
+ dnl -----------------------------------------------
+ dnl Check and enable the GCC opts we want to use.
+ dnl We may need to add more checks
+diff --git a/htp/htp_transcoder.c b/htp/htp_transcoder.c
+index 57ff74c..d8e8280 100644
+--- a/htp/htp_transcoder.c
++++ b/htp/htp_transcoder.c
+@@ -64,7 +64,7 @@ int htp_transcode_params(htp_connp_t *connp, htp_table_t **params, int destroy_o
+         return HTP_ERROR;
+     }
+ 
+-    #if (_LIBICONV_VERSION >= 0x0108)
++    #if (_LIBICONV_VERSION >= 0x0108 && HAVE_ICONVCTL)
+     int iconv_param = 0;
+     iconvctl(cd, ICONV_SET_TRANSLITERATE, &iconv_param);
+     iconv_param = 1;
+-- 
+2.14.1
+
diff --git a/package/libhtp/Config.in b/package/libhtp/Config.in
new file mode 100644
index 0000000000..98b9e2adea
--- /dev/null
+++ b/package/libhtp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBHTP
+	bool "libhtp"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_ZLIB
+	help
+	  LibHTP is a security-aware parser for the HTTP protocol and
+	  the related bits and pieces.
+
+	  https://github.com/OISF/libhtp
diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
new file mode 100644
index 0000000000..be68547be2
--- /dev/null
+++ b/package/libhtp/libhtp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	7384f8461ad0431e9247c49b37a73929b284f39408d1f11b80949b188069b638	libhtp-0.5.30.tar.gz
+sha256	87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15	LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
new file mode 100644
index 0000000000..7606684b31
--- /dev/null
+++ b/package/libhtp/libhtp.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libhtp
+#
+################################################################################
+
+LIBHTP_VERSION = 0.5.30
+LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
+LIBHTP_LICENSE = BSD-3-Clause
+LIBHTP_LICENSE_FILES = LICENSE 
+LIBHTP_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	zlib
+LIBHTP_INSTALL_STAGING = YES
+# From git
+LIBHTP_AUTORECONF = YES
+
+LIBHTP_CONF_ENV = NO_STACK_PROTECTOR=$(if $(BR2_TOOLCHAIN_HAS_SSP),no,true)
+
+$(eval $(autotools-package))
-- 
2.14.1
