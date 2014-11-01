From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:38:57 +0100
Subject: [Buildroot] [git commit] package/clamav: New package
Message-ID: <20141101145343.90B86B2A5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf3753064b4414fb984ee013acc320b5b4a277c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                               |    1 +
 package/clamav/Config.in                        |   16 ++++++
 package/clamav/clamav-0001-clamdscan.patch      |   21 ++++++++
 package/clamav/clamav-0002-static-linking.patch |   58 ++++++++++++++++++++++
 package/clamav/clamav.mk                        |   60 +++++++++++++++++++++++
 5 files changed, 156 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bb9d4b5..3b3c372 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -942,6 +942,7 @@ endmenu
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
+	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
 	source "package/googlefontdirectory/Config.in"
diff --git a/package/clamav/Config.in b/package/clamav/Config.in
new file mode 100644
index 0000000..7ec402d
--- /dev/null
+++ b/package/clamav/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_CLAMAV
+	bool "clamav"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  ClamAV is an open source antivirus engine for detecting trojans,
+	  viruses, malware & other malicious threats.
+
+	  http://www.clamav.net
+
+comment "clamav needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/clamav/clamav-0001-clamdscan.patch b/package/clamav/clamav-0001-clamdscan.patch
new file mode 100644
index 0000000..c395ae1
--- /dev/null
+++ b/package/clamav/clamav-0001-clamdscan.patch
@@ -0,0 +1,21 @@
+Fixes build error
+
+proto.c: In function ???dconnect???:
+proto.c:86:67: error: invalid application of ???sizeof??? to incomplete type ???struct sockaddr_un???
+             if (connect(sockd, (struct sockaddr *)&nixsock, sizeof(nixsock)) == 0)
+
+Patch sent upstream: http://lurker.clamav.net/message/20140928.130829.5494fd68.en.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr clamav-0.98.3.org/clamdscan/proto.c clamav-0.98.3/clamdscan/proto.c
+--- clamav-0.98.3.org/clamdscan/proto.c	2014-05-06 20:39:56.000000000 +0200
++++ clamav-0.98.3/clamdscan/proto.c	2014-05-10 10:41:44.000000000 +0200
+@@ -35,6 +35,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
++#include <sys/un.h>
+ #ifdef HAVE_SYS_SELECT_H
+ #include <sys/select.h>
+ #endif
diff --git a/package/clamav/clamav-0002-static-linking.patch b/package/clamav/clamav-0002-static-linking.patch
new file mode 100644
index 0000000..2369d09
--- /dev/null
+++ b/package/clamav/clamav-0002-static-linking.patch
@@ -0,0 +1,58 @@
+Fix detection of statically linked libraries
+
+Patch submitted upstream: https://bugzilla.clamav.net/show_bug.cgi?id=11132
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr clamav-0.98.4.org/m4/reorganization/libs/curl.m4 clamav-0.98.4/m4/reorganization/libs/curl.m4
+--- clamav-0.98.4.org/m4/reorganization/libs/curl.m4	2014-05-21 17:25:05.000000000 +0200
++++ clamav-0.98.4/m4/reorganization/libs/curl.m4	2014-09-28 15:39:26.714111527 +0200
+@@ -38,7 +38,7 @@
+     save_LDFLAGS="$LDFLAGS"
+     LDFLAGS="$CURL_LDFLAGS"
+     AC_CHECK_LIB([curl], [curl_easy_init], [curl_msg="";have_curl="yes";CLAMSUBMIT_LIBS="$CLAMSUBMIT_LIBS $CURL_LDFLAGS";CLAMSUBMIT_CFLAGS="$CLAMSUBMIT_CFLAGS $CURL_CPPFLAGS"],
+-            [AC_MSG_WARN([Your libcurl is misconfigured. Please use the web interface for submitting FPs/FNs.])])
++            [AC_MSG_WARN([Your libcurl is misconfigured. Please use the web interface for submitting FPs/FNs.])], [$CURL_LDFLAGS])
+     LDFLAGS="$save_LDFLAGS"
+ fi
+ 
+diff -uNr clamav-0.98.4.org/m4/reorganization/libs/openssl.m4 clamav-0.98.4/m4/reorganization/libs/openssl.m4
+--- clamav-0.98.4.org/m4/reorganization/libs/openssl.m4	2014-05-22 15:18:22.000000000 +0200
++++ clamav-0.98.4/m4/reorganization/libs/openssl.m4	2014-09-28 15:15:18.280323868 +0200
+@@ -26,7 +26,7 @@
+ save_CFLAGS="$CFLAGS"
+ save_LIBS="$LIBS"
+ 
+-SSL_LIBS="-lssl -lcrypto"
++SSL_LIBS="-lssl -lcrypto -lz"
+ 
+ if test "$LIBSSL_HOME" != "/usr"; then
+     SSL_LDFLAGS="-L$LIBSSL_HOME/lib"
+@@ -41,12 +41,12 @@
+ have_ssl="no"
+ have_crypto="no"
+ 
+-AC_CHECK_LIB([ssl], [SSL_library_init], [have_ssl="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto])
++AC_CHECK_LIB([ssl], [SSL_library_init], [have_ssl="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto -lz])
+ 
+-AC_CHECK_LIB([crypto], [EVP_EncryptInit], [have_crypto="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])])
++AC_CHECK_LIB([crypto], [EVP_EncryptInit], [have_crypto="yes"], [AC_MSG_ERROR([Your OpenSSL installation is misconfigured or missing])], [-lcrypto -lz])
+ 
+ dnl OpenSSL 0.9.8 is the minimum required version due to X509_VERIFY_PARAM
+-AC_CHECK_LIB([ssl], [X509_VERIFY_PARAM_new], [], [AC_MSG_ERROR([Your OpenSSL installation is missing the X509_VERIFY_PARAM function. Please upgrade to a more recent version of OpenSSL.])], [-lcrypto])
++AC_CHECK_LIB([ssl], [X509_VERIFY_PARAM_new], [], [AC_MSG_ERROR([Your OpenSSL installation is missing the X509_VERIFY_PARAM function. Please upgrade to a more recent version of OpenSSL.])], [-lcrypto -lz])
+ 
+ LDFLAGS="$save_LDFLAGS"
+ CFLAGS="$save_CFLAGS"
+diff -uNr clamav-0.98.4.org/m4/reorganization/libs/xml.m4 clamav-0.98.4/m4/reorganization/libs/xml.m4
+--- clamav-0.98.4.org/m4/reorganization/libs/xml.m4	2014-05-21 17:25:05.000000000 +0200
++++ clamav-0.98.4/m4/reorganization/libs/xml.m4	2014-09-28 15:57:41.836339462 +0200
+@@ -67,7 +67,7 @@
+     save_LDFLAGS="$LDFLAGS"
+     LDFLAGS="$LDFLAGS $XML_LIBS"
+ 
+-    AC_CHECK_LIB([xml2], [xmlTextReaderRead], [working_xml="yes"], [working_xml="no"])
++    AC_CHECK_LIB([xml2], [xmlTextReaderRead], [working_xml="yes"], [working_xml="no"], [$XML_LIBS])
+ 
+     CPPFLAGS="$save_CPPFLAGS"
+     LDFLAGS="$save_LDFLAGS"
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
new file mode 100644
index 0000000..c064d4e
--- /dev/null
+++ b/package/clamav/clamav.mk
@@ -0,0 +1,60 @@
+################################################################################
+#
+# clamav
+#
+################################################################################
+
+CLAMAV_VERSION = 0.98.4
+CLAMAV_SITE = http://sourceforge.net/projects/clamav/files/clamav/$(CLAMAV_VERSION)
+CLAMAV_LICENSE = GPLv2
+CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
+	COPYING.LGPL COPYING.llvm COPYING.lzma COPYING.regex COPYING.sha256 \
+	COPYING.unrar COPYING.zlib
+# clamav-0002-static-linking.patch touches configure.ac
+CLAMAV_AUTORECONF = YES
+CLAMAV_DEPENDENCIES = openssl zlib $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+
+# mmap cannot be detected when cross-compiling, needed for mempool support
+CLAMAV_CONF_ENV = \
+	ac_cv_c_mmap_private=yes
+
+CLAMAV_CONF_OPTS = \
+	--with-dbdir=/var/lib/clamav \
+	--with-openssl=$(STAGING_DIR)/usr \
+	--with-zlib=$(STAGING_DIR)/usr \
+	--disable-rpath \
+	--disable-clamuko \
+	--disable-clamav \
+	--disable-milter \
+	--disable-llvm \
+	--disable-clamdtop \
+	--enable-mempool
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+CLAMAV_DEPENDENCIES += bzip2
+else
+CLAMAV_CONF_OPTS += --disable-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+CLAMAV_CONF_OPTS += --with-xml=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += libxml2
+else
+CLAMAV_CONF_OPTS += --disable-xml
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+CLAMAV_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += libcurl
+else
+CLAMAV_CONF_OPTS += --without-libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+CLAMAV_CONF_OPTS += --with-iconv
+CLAMAV_DEPENDENCIES += libiconv
+else
+CLAMAV_CONF_OPTS += --without-iconv
+endif
+
+$(eval $(autotools-package))
