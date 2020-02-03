From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 3 Feb 2020 11:11:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/gensio: bump to version 1.4.1
In-Reply-To: <20200203095121.34940-1-james.hilliard1@gmail.com>
References: <20200203095121.34940-1-james.hilliard1@gmail.com>
Message-ID: <CAPi7W81RWWd3BoguNGW8MUd+q7Z9KjGRYm-8tVZhaHTZ0U2jyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

Le lun. 3 f?vr. 2020 ? 10:51, James Hilliard
<james.hilliard1@gmail.com> a ?crit :
>
> Removed patches that are now upstream.
As all patches are removed, I assume that GENSIO_AUTORECONF could also
be dropped.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...sue-compiling-with-pthreads-disabled.patch |  27 ---
>  ...tor.c-fix-definition-of-pthread_mute.patch |  42 -----
>  ...ify--with-openssl-to-take-yes-and-no.patch | 163 ------------------
>  package/gensio/gensio.hash                    |   8 +-
>  package/gensio/gensio.mk                      |   4 +-
>  5 files changed, 6 insertions(+), 238 deletions(-)
>  delete mode 100644 package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch
>  delete mode 100644 package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch
>  delete mode 100644 package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch
>
> diff --git a/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch b/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch
> deleted file mode 100644
> index d7af0acb97..0000000000
> --- a/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 2e1a982ed0eef1188ad15995e177e7d40746685f Mon Sep 17 00:00:00 2001
> -From: Corey Minyard <cminyard@mvista.com>
> -Date: Tue, 7 Jan 2020 11:34:33 -0600
> -Subject: [PATCH] Fix an issue compiling with pthreads disabled
> -
> -Define PTHREAD_MUTEX_INITIALIZER in this case.
> -
> -Signed-off-by: Corey Minyard <cminyard@mvista.com>
> -[Retrieved from:
> -https://github.com/cminyard/gensio/commit/2e1a982ed0eef1188ad15995e177e7d40746685f]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - lib/gensio_selector.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/lib/gensio_selector.c b/lib/gensio_selector.c
> -index c050df0..66ada01 100644
> ---- a/lib/gensio_selector.c
> -+++ b/lib/gensio_selector.c
> -@@ -30,6 +30,7 @@
> - #define pthread_mutex_unlock(l) do { } while (0)
> - #define pthread_mutex_init(l, n) do { } while (0)
> - #define pthread_mutex_destroy(l, n) do { } while (0)
> -+#define PTHREAD_MUTEX_INITIALIZER 0
> - #endif
> -
> - #include <gensio/gensio_selector.h>
> diff --git a/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch b/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch
> deleted file mode 100644
> index 1c90bf3711..0000000000
> --- a/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From f1582f417aaf8f4fa7f1828f2504ba2f03909819 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 25 Jan 2020 23:35:54 +0100
> -Subject: [PATCH] lib/gensio_selector.c: fix definition of
> - pthread_mutex_destroy
> -
> -Fix definition of pthread_mutex_destroy otherwise build without threads
> -will fail on:
> -
> -gensio_selector.c: In function 'gensio_sel_free_lock':
> -gensio_selector.c:82:38: error: macro "pthread_mutex_destroy" requires 2 arguments, but only 1 given
> -     pthread_mutex_destroy(&lock->lock);
> -                                      ^
> -gensio_selector.c:82:5: error: 'pthread_mutex_destroy' undeclared (first use in this function)
> -     pthread_mutex_destroy(&lock->lock);
> -     ^~~~~~~~~~~~~~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/b5847ac9e818571b746e2a81cf830b6caf50a7d7
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/cminyard/gensio/pull/8]
> ----
> - lib/gensio_selector.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/gensio_selector.c b/lib/gensio_selector.c
> -index a3bec38..615ab61 100644
> ---- a/lib/gensio_selector.c
> -+++ b/lib/gensio_selector.c
> -@@ -29,7 +29,7 @@
> - #define pthread_mutex_lock(l) do { } while (0)
> - #define pthread_mutex_unlock(l) do { } while (0)
> - #define pthread_mutex_init(l, n) do { } while (0)
> --#define pthread_mutex_destroy(l, n) do { } while (0)
> -+#define pthread_mutex_destroy(l) do { } while (0)
> - #define PTHREAD_MUTEX_INITIALIZER 0
> - #endif
> -
> ---
> -2.24.1
> -
> diff --git a/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch b/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch
> deleted file mode 100644
> index d5875e4a38..0000000000
> --- a/package/gensio/0003-configure-Modify--with-openssl-to-take-yes-and-no.patch
> +++ /dev/null
> @@ -1,163 +0,0 @@
> -From 5009fc3c273622c35a31ba5d600124117b484fd9 Mon Sep 17 00:00:00 2001
> -From: Corey Minyard <cminyard@mvista.com>
> -Date: Sun, 26 Jan 2020 21:26:07 -0600
> -Subject: [PATCH] configure: Modify --with-openssl to take yes and no
> -
> -Allow openssl to be disabled with --with-openssl=no.  Otherwise works as
> -before.
> -
> -Signed-off-by: Corey Minyard <cminyard@mvista.com>
> -[Retrieved from:
> -https://github.com/cminyard/gensio/commit/5009fc3c273622c35a31ba5d600124117b484fd9]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - m4/ax_check_openssl.m4 | 117 ++++++++++++++++++++++-------------------
> - 1 file changed, 63 insertions(+), 54 deletions(-)
> -
> -diff --git a/m4/ax_check_openssl.m4 b/m4/ax_check_openssl.m4
> -index a87c5a6..489fd88 100644
> ---- a/m4/ax_check_openssl.m4
> -+++ b/m4/ax_check_openssl.m4
> -@@ -37,18 +37,25 @@
> - AU_ALIAS([CHECK_SSL], [AX_CHECK_OPENSSL])
> - AC_DEFUN([AX_CHECK_OPENSSL], [
> -     found=false
> -+    tryopenssl=true
> -+    ssldirs=""
> -     AC_ARG_WITH([openssl],
> --        [AS_HELP_STRING([--with-openssl=DIR],
> --            [root of the OpenSSL directory])],
> -+        [AS_HELP_STRING([--with-openssl[[=yes|no|PATH]]],
> -+            [Look for OpenSSL, with optional root of the OpenSSL directory])],
> -         [
> -             case "$withval" in
> --            "" | y | ye | yes | n | no)
> --            AC_MSG_ERROR([Invalid --with-openssl value])
> -+          "" | y | ye | yes)
> -+              ;;
> -+            n | no)
> -+              tryopenssl=false
> -               ;;
> -             *) ssldirs="$withval"
> -               ;;
> -             esac
> --        ], [
> -+        ], [])
> -+
> -+    if $tryopenssl; then
> -+        if test x"$ssldirs" == x""; then
> -             # if pkg-config is installed and openssl has installed a .pc file,
> -             # then use that information and don't search ssldirs
> -             AC_PATH_PROG([PKG_CONFIG], [pkg-config])
> -@@ -65,60 +72,62 @@ AC_DEFUN([AX_CHECK_OPENSSL], [
> -             if ! $found; then
> -                 ssldirs="/usr/local/ssl /usr/lib/ssl /usr/ssl /usr/pkg /usr/local /usr"
> -             fi
> --        ]
> --        )
> -+        fi
> -
> -+        # note that we #include <openssl/foo.h>, so the OpenSSL headers have to be in
> -+        # an 'openssl' subdirectory
> -
> --    # note that we #include <openssl/foo.h>, so the OpenSSL headers have to be in
> --    # an 'openssl' subdirectory
> --
> --    if ! $found; then
> --        OPENSSL_INCLUDES=
> --        for ssldir in $ssldirs; do
> --            AC_MSG_CHECKING([for openssl/ssl.h in $ssldir])
> --            if test -f "$ssldir/include/openssl/ssl.h"; then
> --                OPENSSL_INCLUDES="-I$ssldir/include"
> --                OPENSSL_LDFLAGS="-L$ssldir/lib"
> --                OPENSSL_LIBS="-lssl -lcrypto"
> --                found=true
> --                AC_MSG_RESULT([yes])
> --                break
> --            else
> --                AC_MSG_RESULT([no])
> --            fi
> --        done
> -+        if ! $found; then
> -+            OPENSSL_INCLUDES=
> -+            for ssldir in $ssldirs; do
> -+                AC_MSG_CHECKING([for openssl/ssl.h in $ssldir])
> -+                if test -f "$ssldir/include/openssl/ssl.h"; then
> -+                    OPENSSL_INCLUDES="-I$ssldir/include"
> -+                    OPENSSL_LDFLAGS="-L$ssldir/lib"
> -+                    OPENSSL_LIBS="-lssl -lcrypto"
> -+                    found=true
> -+                    AC_MSG_RESULT([yes])
> -+                    break
> -+                else
> -+                    AC_MSG_RESULT([no])
> -+                fi
> -+            done
> -
> --        # if the file wasn't found, well, go ahead and try the link anyway -- maybe
> --        # it will just work!
> --    fi
> -+            # if the file wasn't found, well, go ahead and try the link anyway -- maybe
> -+            # it will just work!
> -+        fi
> -
> --    # try the preprocessor and linker with our new flags,
> --    # being careful not to pollute the global LIBS, LDFLAGS, and CPPFLAGS
> -+        # try the preprocessor and linker with our new flags,
> -+        # being careful not to pollute the global LIBS, LDFLAGS, and CPPFLAGS
> -
> --    AC_MSG_CHECKING([whether compiling and linking against OpenSSL works])
> --    echo "Trying link with OPENSSL_LDFLAGS=$OPENSSL_LDFLAGS;" \
> --        "OPENSSL_LIBS=$OPENSSL_LIBS; OPENSSL_INCLUDES=$OPENSSL_INCLUDES" >&AS_MESSAGE_LOG_FD
> -+        AC_MSG_CHECKING([whether compiling and linking against OpenSSL works])
> -+        echo "Trying link with OPENSSL_LDFLAGS=$OPENSSL_LDFLAGS;" \
> -+            "OPENSSL_LIBS=$OPENSSL_LIBS; OPENSSL_INCLUDES=$OPENSSL_INCLUDES" >&AS_MESSAGE_LOG_FD
> -
> --    save_LIBS="$LIBS"
> --    save_LDFLAGS="$LDFLAGS"
> --    save_CPPFLAGS="$CPPFLAGS"
> --    LDFLAGS="$LDFLAGS $OPENSSL_LDFLAGS"
> --    LIBS="$OPENSSL_LIBS $LIBS"
> --    CPPFLAGS="$OPENSSL_INCLUDES $CPPFLAGS"
> --    AC_LINK_IFELSE(
> --        [AC_LANG_PROGRAM([#include <openssl/ssl.h>], [SSL_new(NULL)])],
> --        [
> --            AC_MSG_RESULT([yes])
> --            $1
> --        ], [
> --            AC_MSG_RESULT([no])
> --            $2
> --        ])
> --    CPPFLAGS="$save_CPPFLAGS"
> --    LDFLAGS="$save_LDFLAGS"
> --    LIBS="$save_LIBS"
> -+        save_LIBS="$LIBS"
> -+        save_LDFLAGS="$LDFLAGS"
> -+        save_CPPFLAGS="$CPPFLAGS"
> -+        LDFLAGS="$LDFLAGS $OPENSSL_LDFLAGS"
> -+        LIBS="$OPENSSL_LIBS $LIBS"
> -+        CPPFLAGS="$OPENSSL_INCLUDES $CPPFLAGS"
> -+        AC_LINK_IFELSE(
> -+            [AC_LANG_PROGRAM([#include <openssl/ssl.h>], [SSL_new(NULL)])],
> -+            [
> -+                AC_MSG_RESULT([yes])
> -+                $1
> -+            ], [
> -+                AC_MSG_RESULT([no])
> -+                $2
> -+            ])
> -+        CPPFLAGS="$save_CPPFLAGS"
> -+        LDFLAGS="$save_LDFLAGS"
> -+        LIBS="$save_LIBS"
> -
> --    AC_SUBST([OPENSSL_INCLUDES])
> --    AC_SUBST([OPENSSL_LIBS])
> --    AC_SUBST([OPENSSL_LDFLAGS])
> -+        AC_SUBST([OPENSSL_INCLUDES])
> -+        AC_SUBST([OPENSSL_LIBS])
> -+        AC_SUBST([OPENSSL_LDFLAGS])
> -+    else
> -+        AC_MSG_NOTICE([Skipping openssl check, openssl disabled])
> -+      $2
> -+    fi
> - ])
> diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
> index e3c0f02067..fcf5662f67 100644
> --- a/package/gensio/gensio.hash
> +++ b/package/gensio/gensio.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/ser2net/files/ser2net/
> -md5 34e1d41fff06fe7d3b98887fff6c2e90  gensio-1.3.3.tar.gz
> -sha1 50f3901378cab229594cfab4dafe4b6846957524  gensio-1.3.3.tar.gz
> +# From https://sourceforge.net/projects/ser2net/files/
> +md5 3a84895e41b9ca85801d2d5727977356  gensio-1.4.1.tar.gz
> +sha1 3b268b7c37edabd87547f98d03ecf4929f3e5381  gensio-1.4.1.tar.gz
>  # Locally computed:
> -sha256 26f94b4fb8d689fc381c5fa7aa04db84b97785016c00e2bad8803d1bc668aa9b  gensio-1.3.3.tar.gz
> +sha256 a0608921c6ccec115a1298d02423b9d8482b444f5772d8a8fde7ceabbadd679a  gensio-1.4.1.tar.gz
>  sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
>  sha256 dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
> diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
> index a386b9f85f..077ebe2f14 100644
> --- a/package/gensio/gensio.mk
> +++ b/package/gensio/gensio.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -GENSIO_VERSION = 1.3.3
> -GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
> +GENSIO_VERSION = 1.4.1
> +GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net
>  GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>  GENSIO_LICENSE_FILES = COPYING.LIB COPYING
>  GENSIO_INSTALL_STAGING = YES
> --
> 2.20.1
>
Best Regards,

Fabrice
