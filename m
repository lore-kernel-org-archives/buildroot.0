From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jan 2020 23:20:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/gensio: fix detection of openssl
 with -latomic
Message-ID: <20200128222045.86722-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix --with-openssl argument and allow gensio to use
pkg-config to retrieve openssl dependencies otherwise the detection of
openssl will fail on architecture that needs to link with -latomic such
as sparc v8 32 bits:

configure:9379: checking for openssl/ssl.h in /home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr
configure:9386: result: yes
configure:9402: checking whether compiling and linking against OpenSSL works
Trying link with OPENSSL_LDFLAGS=-L/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib; OPENSSL_LIBS=-lssl -lcrypto; OPENSSL_INCLUDES=-I/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/include
configure:9424: /home/fabrice/buildroot/output/host/bin/sparc-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -I/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -L/home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lssl -lcrypto  -lpthread >&5
/home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/8.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/fabrice/buildroot/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_lib.o): in function `CRYPTO_UP_REF.isra.6':
ssl_lib.c:(.text+0x3c8): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - No autobuilder failures (silent error)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ify--with-openssl-to-take-yes-and-no.patch | 163 ++++++++++++++++++
 package/gensio/gensio.mk                      |  13 +-
 2 files changed, 169 insertions(+), 7 deletions(-)
 create mode 100644 package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch

diff --git a/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch b/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch
new file mode 100644
index 0000000000..d5875e4a38
--- /dev/null
+++ b/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch
@@ -0,0 +1,163 @@
+From 5009fc3c273622c35a31ba5d600124117b484fd9 Mon Sep 17 00:00:00 2001
+From: Corey Minyard <cminyard@mvista.com>
+Date: Sun, 26 Jan 2020 21:26:07 -0600
+Subject: [PATCH] configure: Modify --with-openssl to take yes and no
+
+Allow openssl to be disabled with --with-openssl=no.  Otherwise works as
+before.
+
+Signed-off-by: Corey Minyard <cminyard@mvista.com>
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/5009fc3c273622c35a31ba5d600124117b484fd9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/ax_check_openssl.m4 | 117 ++++++++++++++++++++++-------------------
+ 1 file changed, 63 insertions(+), 54 deletions(-)
+
+diff --git a/m4/ax_check_openssl.m4 b/m4/ax_check_openssl.m4
+index a87c5a6..489fd88 100644
+--- a/m4/ax_check_openssl.m4
++++ b/m4/ax_check_openssl.m4
+@@ -37,18 +37,25 @@
+ AU_ALIAS([CHECK_SSL], [AX_CHECK_OPENSSL])
+ AC_DEFUN([AX_CHECK_OPENSSL], [
+     found=false
++    tryopenssl=true
++    ssldirs=""
+     AC_ARG_WITH([openssl],
+-        [AS_HELP_STRING([--with-openssl=DIR],
+-            [root of the OpenSSL directory])],
++        [AS_HELP_STRING([--with-openssl[[=yes|no|PATH]]],
++            [Look for OpenSSL, with optional root of the OpenSSL directory])],
+         [
+             case "$withval" in
+-            "" | y | ye | yes | n | no)
+-            AC_MSG_ERROR([Invalid --with-openssl value])
++	    "" | y | ye | yes)
++              ;;
++            n | no)
++              tryopenssl=false
+               ;;
+             *) ssldirs="$withval"
+               ;;
+             esac
+-        ], [
++        ], [])
++
++    if $tryopenssl; then
++        if test x"$ssldirs" == x""; then 
+             # if pkg-config is installed and openssl has installed a .pc file,
+             # then use that information and don't search ssldirs
+             AC_PATH_PROG([PKG_CONFIG], [pkg-config])
+@@ -65,60 +72,62 @@ AC_DEFUN([AX_CHECK_OPENSSL], [
+             if ! $found; then
+                 ssldirs="/usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/local /usr"
+             fi
+-        ]
+-        )
++        fi
+ 
++        # note that we #include <openssl/foo.h>, so the OpenSSL headers have to be in
++        # an 'openssl' subdirectory
+ 
+-    # note that we #include <openssl/foo.h>, so the OpenSSL headers have to be in
+-    # an 'openssl' subdirectory
+-
+-    if ! $found; then
+-        OPENSSL_INCLUDES=
+-        for ssldir in $ssldirs; do
+-            AC_MSG_CHECKING([for openssl/ssl.h in $ssldir])
+-            if test -f "$ssldir/include/openssl/ssl.h"; then
+-                OPENSSL_INCLUDES="-I$ssldir/include"
+-                OPENSSL_LDFLAGS="-L$ssldir/lib"
+-                OPENSSL_LIBS="-lssl -lcrypto"
+-                found=true
+-                AC_MSG_RESULT([yes])
+-                break
+-            else
+-                AC_MSG_RESULT([no])
+-            fi
+-        done
++        if ! $found; then
++            OPENSSL_INCLUDES=
++            for ssldir in $ssldirs; do
++                AC_MSG_CHECKING([for openssl/ssl.h in $ssldir])
++                if test -f "$ssldir/include/openssl/ssl.h"; then
++                    OPENSSL_INCLUDES="-I$ssldir/include"
++                    OPENSSL_LDFLAGS="-L$ssldir/lib"
++                    OPENSSL_LIBS="-lssl -lcrypto"
++                    found=true
++                    AC_MSG_RESULT([yes])
++                    break
++                else
++                    AC_MSG_RESULT([no])
++                fi
++            done
+ 
+-        # if the file wasn't found, well, go ahead and try the link anyway -- maybe
+-        # it will just work!
+-    fi
++            # if the file wasn't found, well, go ahead and try the link anyway -- maybe
++            # it will just work!
++        fi
+ 
+-    # try the preprocessor and linker with our new flags,
+-    # being careful not to pollute the global LIBS, LDFLAGS, and CPPFLAGS
++        # try the preprocessor and linker with our new flags,
++        # being careful not to pollute the global LIBS, LDFLAGS, and CPPFLAGS
+ 
+-    AC_MSG_CHECKING([whether compiling and linking against OpenSSL works])
+-    echo "Trying link with OPENSSL_LDFLAGS=$OPENSSL_LDFLAGS;" \
+-        "OPENSSL_LIBS=$OPENSSL_LIBS; OPENSSL_INCLUDES=$OPENSSL_INCLUDES" >&AS_MESSAGE_LOG_FD
++        AC_MSG_CHECKING([whether compiling and linking against OpenSSL works])
++        echo "Trying link with OPENSSL_LDFLAGS=$OPENSSL_LDFLAGS;" \
++            "OPENSSL_LIBS=$OPENSSL_LIBS; OPENSSL_INCLUDES=$OPENSSL_INCLUDES" >&AS_MESSAGE_LOG_FD
+ 
+-    save_LIBS="$LIBS"
+-    save_LDFLAGS="$LDFLAGS"
+-    save_CPPFLAGS="$CPPFLAGS"
+-    LDFLAGS="$LDFLAGS $OPENSSL_LDFLAGS"
+-    LIBS="$OPENSSL_LIBS $LIBS"
+-    CPPFLAGS="$OPENSSL_INCLUDES $CPPFLAGS"
+-    AC_LINK_IFELSE(
+-        [AC_LANG_PROGRAM([#include <openssl/ssl.h>], [SSL_new(NULL)])],
+-        [
+-            AC_MSG_RESULT([yes])
+-            $1
+-        ], [
+-            AC_MSG_RESULT([no])
+-            $2
+-        ])
+-    CPPFLAGS="$save_CPPFLAGS"
+-    LDFLAGS="$save_LDFLAGS"
+-    LIBS="$save_LIBS"
++        save_LIBS="$LIBS"
++        save_LDFLAGS="$LDFLAGS"
++        save_CPPFLAGS="$CPPFLAGS"
++        LDFLAGS="$LDFLAGS $OPENSSL_LDFLAGS"
++        LIBS="$OPENSSL_LIBS $LIBS"
++        CPPFLAGS="$OPENSSL_INCLUDES $CPPFLAGS"
++        AC_LINK_IFELSE(
++            [AC_LANG_PROGRAM([#include <openssl/ssl.h>], [SSL_new(NULL)])],
++            [
++                AC_MSG_RESULT([yes])
++                $1
++            ], [
++                AC_MSG_RESULT([no])
++                $2
++            ])
++        CPPFLAGS="$save_CPPFLAGS"
++        LDFLAGS="$save_LDFLAGS"
++        LIBS="$save_LIBS"
+ 
+-    AC_SUBST([OPENSSL_INCLUDES])
+-    AC_SUBST([OPENSSL_LIBS])
+-    AC_SUBST([OPENSSL_LDFLAGS])
++        AC_SUBST([OPENSSL_INCLUDES])
++        AC_SUBST([OPENSSL_LIBS])
++        AC_SUBST([OPENSSL_LDFLAGS])
++    else
++        AC_MSG_NOTICE([Skipping openssl check, openssl disabled])
++	$2
++    fi
+ ])
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 4d8ee9f614..a386b9f85f 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,19 +9,18 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+# We're ptching configure.ac
+GENSIO_AUTORECONF = YES
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
 	--without-python
 
-# configure script by default searches host paths for openssl,
-# breaking cross compilation. Disable this by explicitly pointing it
-# at STAGING_DIR no matter if we have openssl enabled or not as it
-# will correctly disable openssl support if not found there
-GENSIO_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-GENSIO_DEPENDENCIES += openssl
+GENSIO_DEPENDENCIES += host-pkgconf openssl
+GENSIO_CONF_OPTS += --with-openssl
+else
+GENSIO_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.24.1
