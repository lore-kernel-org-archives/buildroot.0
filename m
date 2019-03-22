From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Mar 2019 21:34:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: use pkg-config to find
 openssl
Message-ID: <20190322203459.27576-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl can have multiples dependencies such as libatomic on sparcv8
32 bits so drop first patch and add a new patch to use pkg-config

Fixes:
 - http://autobuild.buildroot.org/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ressl.patch => 0001-enable-libressl.patch} |  0
 .../0001-fix-openssl-static-link.patch        | 30 --------
 ...re.ac-use-pkg-config-to-find-openssl.patch | 69 +++++++++++++++++++
 package/fetchmail/fetchmail.mk                |  7 +-
 4 files changed, 70 insertions(+), 36 deletions(-)
 rename package/fetchmail/{0002-enable-libressl.patch => 0001-enable-libressl.patch} (100%)
 delete mode 100644 package/fetchmail/0001-fix-openssl-static-link.patch
 create mode 100644 package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch

diff --git a/package/fetchmail/0002-enable-libressl.patch b/package/fetchmail/0001-enable-libressl.patch
similarity index 100%
rename from package/fetchmail/0002-enable-libressl.patch
rename to package/fetchmail/0001-enable-libressl.patch
diff --git a/package/fetchmail/0001-fix-openssl-static-link.patch b/package/fetchmail/0001-fix-openssl-static-link.patch
deleted file mode 100644
index 1a5f4d6f71..0000000000
--- a/package/fetchmail/0001-fix-openssl-static-link.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix checking for statically build OpenSSL with libz dependency
-
-Fixes
-http://autobuild.buildroot.net/results/48a/48ad6d3659cf1f04581b7e3d115bebf454ff17fd/
-
-configure: Enabling OpenSSL support in /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr.
-checking for additional library dependencies of SSL... error
-configure: error: cannot link with SSL - check config.log
-
-In config.log multiple linking errors to libz can be found:
-
-configure:10099: /home/br/br/output/host/usr/bin/i486-ctng-linux-uclibc-gcc -o
-  conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64
-  /home/br/br/output/host/usr/i486-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o):
-  In function `zlib_stateful_c_zlib.c:(.text+0x56): undefined reference to `inflate'
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr fetchmail-6.3.26.org/configure.ac fetchmail-6.3.26/configure.ac
---- fetchmail-6.3.26.org/configure.ac	2013-04-23 22:51:10.000000000 +0200
-+++ fetchmail-6.3.26/configure.ac	2014-07-27 09:20:25.000000000 +0200
-@@ -778,7 +778,7 @@
-     AC_MSG_ERROR([SSL support enabled, but OpenSSL not found])
-   fi
-   LDFLAGS="$LDFLAGS -L$with_ssl/lib"
--  LIBS="$LIBS -lssl -lcrypto"
-+  LIBS="-lssl -lcrypto $LIBS"
-   dnl check if -ldl is needed
-   AC_MSG_CHECKING([for additional library dependencies of SSL])
-   found=0
diff --git a/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch b/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
new file mode 100644
index 0000000000..dd48783922
--- /dev/null
+++ b/package/fetchmail/0002-configure.ac-use-pkg-config-to-find-openssl.patch
@@ -0,0 +1,69 @@
+From 1ed0af7f1bbcaccbd7356bd90596f5c942b64720 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 22 Mar 2019 20:24:54 +0100
+Subject: [PATCH 1/1] configure.ac: use pkg-config to find openssl
+
+openssl can have multiples dependencies such as libatomic on sparcv8
+32 bits
+
+Fixes:
+ - http://autobuild.buildroot.org/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/fetchmail/fetchmail/merge_requests/14]
+---
+ configure.ac | 37 +++++++++++++++++++------------------
+ 1 file changed, 19 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 16b0fcba..3a75ec6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -778,24 +778,25 @@ then
+   else
+     AC_MSG_ERROR([SSL support enabled, but OpenSSL not found])
+   fi
+-  LDFLAGS="$LDFLAGS -L$with_ssl/lib"
+-  LIBS="$LIBS -lssl -lcrypto"
+-  dnl check if -ldl is needed
+-  AC_MSG_CHECKING([for additional library dependencies of SSL])
+-  found=0
+-  save_LIBS="$LIBS"
+-  for i in "" "-ldl" ; do
+-      LIBS="$LDFLAGS $save_LIBS $i"
+-      AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <openssl/ssl.h>],[SSL_library_init()])],[found=1; break])
+-  done
+-  if test $found = 0 ; then
+-      AC_MSG_RESULT([error])
+-      AC_MSG_ERROR([cannot link with SSL - check config.log])
+-  fi
+-  LIBS="$save_LIBS $i"
+-  if test "$i" = "" ; then i="(none)" ; fi
+-  AC_MSG_RESULT($i)
+-  dnl XXX FIXME: use pkg-config if available!
++  PKG_CHECK_MODULES([SSL],[libssl],[LIBS="$LIBS $SSL_LIBS"],[
++    LDFLAGS="$LDFLAGS -L$with_ssl/lib"
++    LIBS="$LIBS -lssl -lcrypto"
++    dnl check if -ldl is needed
++    AC_MSG_CHECKING([for additional library dependencies of SSL])
++    found=0
++    save_LIBS="$LIBS"
++    for i in "" "-ldl" ; do
++        LIBS="$LDFLAGS $save_LIBS $i"
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <openssl/ssl.h>],[SSL_library_init()])],[found=1; break])
++    done
++    if test $found = 0 ; then
++        AC_MSG_RESULT([error])
++        AC_MSG_ERROR([cannot link with SSL - check config.log])
++    fi
++    LIBS="$save_LIBS $i"
++    if test "$i" = "" ; then i="(none)" ; fi
++    AC_MSG_RESULT($i)
++  ])
+   AC_DEFINE(SSL_ENABLE)
+ else
+   AC_MSG_WARN(Disabling SSL support.)
+-- 
+2.20.1
+
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 37bbeabf62..41505e8637 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -13,17 +13,12 @@ FETCHMAIL_LICENSE_FILES = COPYING
 FETCHMAIL_AUTORECONF = YES
 FETCHMAIL_GETTEXTIZE = YES
 
-# needed to help fetchmail detecting the availability of openssl,
-# because it doesn't use pkg-config
-ifeq ($(BR2_STATIC_LIBS),y)
-FETCHMAIL_CONF_ENV += LIBS="-lz"
-endif
-
 FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
 
 FETCHMAIL_DEPENDENCIES = \
 	ca-certificates \
+	host-pkgconf \
 	openssl \
 	$(TARGET_NLS_DEPENDENCIES)
 
-- 
2.20.1
