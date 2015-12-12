From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 12:05:29 +0100
Subject: [Buildroot] [git commit] package/clamav: bump to version 0.99
Message-ID: <20151212125015.5569680826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2abe487cd6b5fe2c56b8f450c43a0eff08036a8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- removed autoreconf and two patches applied upstream
https://github.com/vrtadmin/clamav-devel/commit/b20eeffadb7675bf1a74e35b0aef80e26e1c0462
https://github.com/vrtadmin/clamav-devel/commit/785e4a90e0b5bf60f55eb0987300da2e1e12abbb

- removed clamuko configure option
- disabled fanotify support because UCLIBC_HAS_FTS is disabled
https://github.com/vrtadmin/clamav-devel/blob/master/README
"Support for on-access scanning using Clamuko/Dazuko has been replaced
 with fanotify."

- added host-pkgconf dependency, used by configure
- added optional dependency to pcre
- added sha256 hash

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/clamav/0002-static-linking.patch   | 58 ------------------------------
 package/clamav/0004-fix-static-build.patch | 21 -----------
 package/clamav/clamav.hash                 |  6 ++--
 package/clamav/clamav.mk                   | 20 ++++++++---
 4 files changed, 19 insertions(+), 86 deletions(-)

diff --git a/package/clamav/0002-static-linking.patch b/package/clamav/0002-static-linking.patch
deleted file mode 100644
index 2369d09..0000000
--- a/package/clamav/0002-static-linking.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Fix detection of statically linked libraries
-
-Patch submitted upstream: https://bugzilla.clamav.net/show_bug.cgi?id=11132
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr clamav-0.98.4.org/m4/reorganization/libs/curl.m4 clamav-0.98.4/m4/reorganization/libs/curl.m4
---- clamav-0.98.4.org/m4/reorganization/libs/curl.m4	2014-05-21 17:25:05.000000000 +0200
-+++ clamav-0.98.4/m4/reorganization/libs/curl.m4	2014-09-28 15:39:26.714111527 +0200
-@@ -38,7 +38,7 @@
-     save_LDFLAGS="$LDFLAGS"
-     LDFLAGS="$CURL_LDFLAGS"
-     AC_CHECK_LIB([curl], [curl_easy_init], [curl_msg="";have_curl="yes";CLAMSUBMIT_LIBS="$CLAMSUBMIT_LIBS $CURL_LDFLAGS";CLAMSUBMIT_CFLAGS="$CLAMSUBMIT_CFLAGS $CURL_CPPFLAGS"],
--            [AC_MSG_WARN([Your libcurl is misconfigured. Please use the web interface for submitting FPs/FNs.])])
-+            [AC_MSG_WARN([Your libcurl is misconfigured. Please use the web interface for submitting FPs/FNs.])], [$CURL_LDFLAGS])
-     LDFLAGS="$save_LDFLAGS"
- fi
- 
-diff -uNr clamav-0.98.4.org/m4/reorganization/libs/openssl.m4 clamav-0.98.4/m4/reorganization/libs/openssl.m4
---- clamav-0.98.4.org/m4/reorganization/libs/openssl.m4	2014-05-22 15:18:22.000000000 +0200
-+++ clamav-0.98.4/m4/reorganization/libs/openssl.m4	2014-09-28 15:15:18.280323868 +0200
-@@ -26,7 +26,7 @@
- save_CFLAGS="$CFLAGS"
- save_LIBS="$LIBS"
- 
--SSL_LIBS="-lssl -lcrypto"
-+SSL_LIBS="-lssl -lcrypto -lz"
- 
- if test "$LIBSSL_HOME" != "/usr"; then
-     SSL_LDFLAGS="-L$LIBSSL_HOME/lib"
-@@ -41,12 +41,12 @@
- have_ssl="no"
- have_crypto="no"
- 
--AC_CHECK_LIB([ssl], [SSL_library_init], [have_ssl="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto])
-+AC_CHECK_LIB([ssl], [SSL_library_init], [have_ssl="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto -lz])
- 
--AC_CHECK_LIB([crypto], [EVP_EncryptInit], [have_crypto="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])])
-+AC_CHECK_LIB([crypto], [EVP_EncryptInit], [have_crypto="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto -lz])
- 
- dnl OpenSSL 0.9.8 is the minimum required version due to X509_VERIFY_PARAM
--AC_CHECK_LIB([ssl], [X509_VERIFY_PARAM_new], [], [AC_MSG_ERROR([Your OpenSSL installation is missing the X509_VERIFY_PARAM function. Please upgrade to a more recent version of OpenSSL.])], [-lcrypto])
-+AC_CHECK_LIB([ssl], [X509_VERIFY_PARAM_new], [], [AC_MSG_ERROR([Your OpenSSL installation is missing the X509_VERIFY_PARAM function. Please upgrade to a more recent version of OpenSSL.])], [-lcrypto -lz])
- 
- LDFLAGS="$save_LDFLAGS"
- CFLAGS="$save_CFLAGS"
-diff -uNr clamav-0.98.4.org/m4/reorganization/libs/xml.m4 clamav-0.98.4/m4/reorganization/libs/xml.m4
---- clamav-0.98.4.org/m4/reorganization/libs/xml.m4	2014-05-21 17:25:05.000000000 +0200
-+++ clamav-0.98.4/m4/reorganization/libs/xml.m4	2014-09-28 15:57:41.836339462 +0200
-@@ -67,7 +67,7 @@
-     save_LDFLAGS="$LDFLAGS"
-     LDFLAGS="$LDFLAGS $XML_LIBS"
- 
--    AC_CHECK_LIB([xml2], [xmlTextReaderRead], [working_xml="yes"], [working_xml="no"])
-+    AC_CHECK_LIB([xml2], [xmlTextReaderRead], [working_xml="yes"], [working_xml="no"], [$XML_LIBS])
- 
-     CPPFLAGS="$save_CPPFLAGS"
-     LDFLAGS="$save_LDFLAGS"
diff --git a/package/clamav/0004-fix-static-build.patch b/package/clamav/0004-fix-static-build.patch
deleted file mode 100644
index 9c7850a..0000000
--- a/package/clamav/0004-fix-static-build.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-stats: fix static link
-
-The stats.c file does not use the dlopen() familly of functions, but
-includes dlfcn.h, which is missing on uClibc when it is configured as
-a static-only C library.
-
-so, simply do not include dlfcn.h.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -durN clamav-0.98.5.orig/libclamav/stats.c clamav-0.98.5/libclamav/stats.c
---- clamav-0.98.5.orig/libclamav/stats.c	2014-11-13 23:30:43.000000000 +0100
-+++ clamav-0.98.5/libclamav/stats.c	2014-11-25 19:57:14.344291266 +0100
-@@ -41,7 +41,6 @@
- #include <sys/sysctl.h>
- #endif
- #endif
--#include <dlfcn.h>
- #else
- #include <Windows.h>
- #include <tchar.h>
diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 21983f9..f1931ad 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,2 +1,4 @@
-# From http://sourceforge.net/projects/clamav/files/clamav/0.98.7/
-sha1	c9793d67c041e2b944116d912f8681c8bd6e4432	clamav-0.98.7.tar.gz
+# From http://sourceforge.net/projects/clamav/files/clamav/0.99/
+sha1	7834baf3ce4898dd856e652c9d0301a8e14b4615	clamav-0.99.tar.gz
+# Locally computed
+sha256	d2792c8cfadd685fffc40b2199679628815df031fd3149ccf961649fc8787ea9	clamav-0.99.tar.gz
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index e6a1195..75d88bc 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,28 +4,31 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.98.7
+CLAMAV_VERSION = 0.99
 CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
 CLAMAV_LICENSE = GPLv2
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
 	COPYING.unrar COPYING.zlib
-# clamav-0002-static-linking.patch touches configure.ac
-CLAMAV_AUTORECONF = YES
-CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+CLAMAV_DEPENDENCIES = \
+	host-pkgconf \
+	openssl \
+	zlib \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # mmap cannot be detected when cross-compiling, needed for mempool support
 CLAMAV_CONF_ENV = \
 	ac_cv_c_mmap_private=yes \
 	have_cv_ipv6=yes
 
+# UCLIBC_HAS_FTS is disabled, therefore disable fanotify (missing fts.h)
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
 	--with-openssl=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
 	--disable-rpath \
-	--disable-clamuko \
 	--disable-clamav \
+	--disable-fanotify \
 	--disable-milter \
 	--disable-llvm \
 	--disable-clamdtop \
@@ -62,4 +65,11 @@ else
 CLAMAV_CONF_OPTS += --without-iconv
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+CLAMAV_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += pcre
+else
+CLAMAV_CONF_OPTS += --without-pcre
+endif
+
 $(eval $(autotools-package))
