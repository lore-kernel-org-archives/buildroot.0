From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:16:35 +0200
Subject: [Buildroot] [git commit] nginx: bump to version 1.15.0
Message-ID: <20180630201742.3C805838E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fe054a7ecf145be002ed2bf75c662fa397792d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following patches have been updated to apply on 1.15.0:

   0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
   0006-auto-lib-openssl-conf-use-pkg-config.patch

The follow patch has been removed, because it was applied upstream:

   0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch

The license file hash has changed because the copyright years were
updated in the LICENSE file:

  - * Copyright (C) 2002-2017 Igor Sysoev
  - * Copyright (C) 2011-2017 Nginx, Inc.
  + * Copyright (C) 2002-2018 Igor Sysoev
  + * Copyright (C) 2011-2018 Nginx, Inc.

Signed-off-by: Ignacy Gaw??dzki <ignacy.gawedzki@green-communications.fr>
[Thomas: drop unneeded patch updates, improve commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...x_feature_run_force_result-for-each-featu.patch |  56 ++---
 ...0006-auto-lib-openssl-conf-use-pkg-config.patch | 249 +++++++++++++++++++--
 ...nf-fix-PCRE-condition-WRT-the-http-and-ht.patch |  33 ---
 package/nginx/nginx.hash                           |   4 +-
 package/nginx/nginx.mk                             |   2 +-
 5 files changed, 265 insertions(+), 79 deletions(-)

diff --git a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
index be1df7fb33..f186becdf8 100644
--- a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
+++ b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
@@ -1,4 +1,4 @@
-From 71939b727a8fa9f722934700948a5b68960f6183 Mon Sep 17 00:00:00 2001
+From 57d9d632be9a9f7e3ac00f9eb10b069afd0b1543 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 29 May 2014 18:52:10 +0200
 Subject: [PATCH] auto/*: set ngx_feature_run_force_result for each feature
@@ -25,18 +25,18 @@ Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
  6 files changed, 20 insertions(+)
 
 diff --git a/auto/cc/conf b/auto/cc/conf
-index edc6d74..a61ade4 100644
+index afbca62b..ad42c800 100644
 --- a/auto/cc/conf
 +++ b/auto/cc/conf
-@@ -181,6 +181,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
-     ngx_feature="gcc builtin atomic operations"
-     ngx_feature_name=NGX_HAVE_GCC_ATOMIC
-     ngx_feature_run=yes
-+    ngx_feature_run_force_result="$ngx_force_gcc_have_atomic"
-     ngx_feature_incs=
-     ngx_feature_path=
-     ngx_feature_libs=
-@@ -201,6 +203,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+@@ -184,6 +184,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+         ngx_feature="gcc builtin atomic operations"
+         ngx_feature_name=NGX_HAVE_GCC_ATOMIC
+         ngx_feature_run=yes
++        ngx_feature_run_force_result="$ngx_force_gcc_have_atomic"
+         ngx_feature_incs=
+         ngx_feature_path=
+         ngx_feature_libs=
+@@ -205,6 +206,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
          ngx_feature="C99 variadic macros"
          ngx_feature_name="NGX_HAVE_C99_VARIADIC_MACROS"
          ngx_feature_run=yes
@@ -44,7 +44,7 @@ index edc6d74..a61ade4 100644
          ngx_feature_incs="#include <stdio.h>
  #define var(dummy, ...)  sprintf(__VA_ARGS__)"
          ngx_feature_path=
-@@ -215,6 +220,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+@@ -219,6 +221,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
      ngx_feature="gcc variadic macros"
      ngx_feature_name="NGX_HAVE_GCC_VARIADIC_MACROS"
      ngx_feature_run=yes
@@ -53,7 +53,7 @@ index edc6d74..a61ade4 100644
  #define var(dummy, args...)  sprintf(args)"
      ngx_feature_path=
 diff --git a/auto/cc/name b/auto/cc/name
-index 51a7ed9..d237d47 100644
+index ded93f5b..7c3cb74a 100644
 --- a/auto/cc/name
 +++ b/auto/cc/name
 @@ -8,6 +8,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
@@ -65,7 +65,7 @@ index 51a7ed9..d237d47 100644
      ngx_feature_path=
      ngx_feature_libs=
 diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
-index d1e484a..3724916 100644
+index d1e484ab..37249161 100644
 --- a/auto/lib/libatomic/conf
 +++ b/auto/lib/libatomic/conf
 @@ -15,6 +15,7 @@ else
@@ -77,10 +77,10 @@ index d1e484a..3724916 100644
                        #include <atomic_ops.h>"
      ngx_feature_path=
 diff --git a/auto/os/darwin b/auto/os/darwin
-index 1d3e3d3..11b7276 100644
+index 429468f7..1ed47cca 100644
 --- a/auto/os/darwin
 +++ b/auto/os/darwin
-@@ -30,6 +30,7 @@ NGX_KQUEUE_CHECKED=YES
+@@ -33,6 +33,7 @@ NGX_KQUEUE_CHECKED=YES
  ngx_feature="kqueue's EVFILT_TIMER"
  ngx_feature_name="NGX_HAVE_TIMER_EVENT"
  ngx_feature_run=yes
@@ -88,7 +88,7 @@ index 1d3e3d3..11b7276 100644
  ngx_feature_incs="#include <sys/event.h>
                    #include <sys/time.h>"
  ngx_feature_path=
-@@ -60,6 +61,7 @@ ngx_feature_test="int      kq;
+@@ -63,6 +64,7 @@ ngx_feature_test="int      kq;
  ngx_feature="Darwin 64-bit kqueue millisecond timeout bug"
  ngx_feature_name=NGX_DARWIN_KEVENT_BUG
  ngx_feature_run=bug
@@ -96,7 +96,7 @@ index 1d3e3d3..11b7276 100644
  ngx_feature_incs="#include <sys/event.h>
                    #include <sys/time.h>"
  ngx_feature_path=
-@@ -90,6 +92,7 @@ CC_AUX_FLAGS="$CC_AUX_FLAGS"
+@@ -92,6 +94,7 @@ ngx_feature_test="int  kq;
  ngx_feature="sendfile()"
  ngx_feature_name="NGX_HAVE_SENDFILE"
  ngx_feature_run=yes
@@ -105,7 +105,7 @@ index 1d3e3d3..11b7276 100644
                    #include <sys/socket.h>
                    #include <sys/uio.h>
 diff --git a/auto/os/linux b/auto/os/linux
-index 19bf832..16848b2 100644
+index 2c8a9bb8..eb4513ee 100644
 --- a/auto/os/linux
 +++ b/auto/os/linux
 @@ -37,6 +37,7 @@ fi
@@ -141,7 +141,7 @@ index 19bf832..16848b2 100644
  ngx_feature_path=
  ngx_feature_libs=
 diff --git a/auto/unix b/auto/unix
-index 6e54531..7dbf9d1 100755
+index 43d3b25a..3da00537 100644
 --- a/auto/unix
 +++ b/auto/unix
 @@ -100,6 +100,7 @@ if test -z "$NGX_KQUEUE_CHECKED"; then
@@ -152,7 +152,7 @@ index 6e54531..7dbf9d1 100755
          ngx_feature_incs="#include <sys/event.h>
                            #include <sys/time.h>"
          ngx_feature_path=
-@@ -702,6 +703,7 @@ ngx_feature_test="char buf[1]; ssize_t n; n = pwrite(1, buf, 1, 0);
+@@ -730,6 +731,7 @@ ngx_feature_test="char buf[1]; struct iovec vec[1]; ssize_t n;
  ngx_feature="sys_nerr"
  ngx_feature_name="NGX_SYS_NERR"
  ngx_feature_run=value
@@ -160,7 +160,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs='#include <errno.h>
                    #include <stdio.h>'
  ngx_feature_path=
-@@ -716,6 +718,7 @@ if [ $ngx_found = no ]; then
+@@ -744,6 +746,7 @@ if [ $ngx_found = no ]; then
      ngx_feature="_sys_nerr"
      ngx_feature_name="NGX_SYS_NERR"
      ngx_feature_run=value
@@ -168,7 +168,7 @@ index 6e54531..7dbf9d1 100755
      ngx_feature_incs='#include <errno.h>
                        #include <stdio.h>'
      ngx_feature_path=
-@@ -731,6 +734,7 @@ if [ $ngx_found = no ]; then
+@@ -759,6 +762,7 @@ if [ $ngx_found = no ]; then
      ngx_feature='maximum errno'
      ngx_feature_name=NGX_SYS_NERR
      ngx_feature_run=value
@@ -176,7 +176,7 @@ index 6e54531..7dbf9d1 100755
      ngx_feature_incs='#include <errno.h>
                        #include <string.h>
                        #include <stdio.h>'
-@@ -789,6 +793,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
+@@ -841,6 +845,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
  ngx_feature="mmap(MAP_ANON|MAP_SHARED)"
  ngx_feature_name="NGX_HAVE_MAP_ANON"
  ngx_feature_run=yes
@@ -184,7 +184,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/mman.h>"
  ngx_feature_path=
  ngx_feature_libs=
-@@ -802,6 +807,7 @@ ngx_feature_test="void *p;
+@@ -854,6 +859,7 @@ ngx_feature_test="void *p;
  ngx_feature='mmap("/dev/zero", MAP_SHARED)'
  ngx_feature_name="NGX_HAVE_MAP_DEVZERO"
  ngx_feature_run=yes
@@ -192,7 +192,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/mman.h>
                    #include <sys/stat.h>
                    #include <fcntl.h>"
-@@ -817,6 +823,7 @@ ngx_feature_test='void *p; int  fd;
+@@ -869,6 +875,7 @@ ngx_feature_test='void *p; int  fd;
  ngx_feature="System V shared memory"
  ngx_feature_name="NGX_HAVE_SYSVSHM"
  ngx_feature_run=yes
@@ -200,7 +200,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/ipc.h>
                    #include <sys/shm.h>"
  ngx_feature_path=
-@@ -831,6 +838,7 @@ ngx_feature_test="int  id;
+@@ -883,6 +890,7 @@ ngx_feature_test="int  id;
  ngx_feature="POSIX semaphores"
  ngx_feature_name="NGX_HAVE_POSIX_SEM"
  ngx_feature_run=yes
@@ -209,5 +209,5 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_path=
  ngx_feature_libs=
 -- 
-1.9.1
+2.17.1
 
diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
index 0bd4d337c8..4338729658 100644
--- a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
+++ b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
@@ -1,4 +1,4 @@
-From 756556d127da291cad8a2c007a89124a692aef7f Mon Sep 17 00:00:00 2001
+From 4ba4b1e0bd1b69e124eb34c95ae9e7c087370efa Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 14:48:31 +0100
 Subject: [PATCH] auto/lib/openssl/conf: use pkg-config
@@ -8,25 +8,244 @@ dependencies.
 
 Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
- auto/lib/openssl/conf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ auto/lib/openssl/conf | 187 +++++++++++++++++++++---------------------
+ 1 file changed, 94 insertions(+), 93 deletions(-)
 
 diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
-index 39d9602..995c6f3 100644
+index 4fb52df7..9f30490d 100644
 --- a/auto/lib/openssl/conf
 +++ b/auto/lib/openssl/conf
-@@ -58,8 +58,9 @@ else
-         ngx_feature_name="NGX_OPENSSL"
-         ngx_feature_run=no
-         ngx_feature_incs="#include <openssl/ssl.h>"
+@@ -1,4 +1,3 @@
+-
+ # Copyright (C) Igor Sysoev
+ # Copyright (C) Nginx, Inc.
+ 
+@@ -7,123 +6,125 @@ if [ $OPENSSL != NONE ]; then
+ 
+     case "$CC" in
+ 
+-        cl | bcc32)
+-            have=NGX_OPENSSL . auto/have
+-            have=NGX_SSL . auto/have
+-
+-            CFLAGS="$CFLAGS -DNO_SYS_TYPES_H"
+-
+-            CORE_INCS="$CORE_INCS $OPENSSL/openssl/include"
+-            CORE_DEPS="$CORE_DEPS $OPENSSL/openssl/include/openssl/ssl.h"
+-
+-            if [ -f $OPENSSL/ms/do_ms.bat ]; then
+-                # before OpenSSL 1.1.0
+-                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/ssleay32.lib"
+-                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libeay32.lib"
+-            else
+-                # OpenSSL 1.1.0+
+-                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libssl.lib"
+-                CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libcrypto.lib"
+-            fi
+-
+-            # libeay32.lib requires gdi32.lib
+-            CORE_LIBS="$CORE_LIBS gdi32.lib"
+-            # OpenSSL 1.0.0 requires crypt32.lib
+-            CORE_LIBS="$CORE_LIBS crypt32.lib"
+-        ;;
+-
+-        *)
+-            have=NGX_OPENSSL . auto/have
+-            have=NGX_SSL . auto/have
+-
+-            CORE_INCS="$CORE_INCS $OPENSSL/.openssl/include"
+-            CORE_DEPS="$CORE_DEPS $OPENSSL/.openssl/include/openssl/ssl.h"
+-            CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libssl.a"
+-            CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libcrypto.a"
+-            CORE_LIBS="$CORE_LIBS $NGX_LIBDL"
+-            CORE_LIBS="$CORE_LIBS $NGX_LIBPTHREAD"
+-
+-            if [ "$NGX_PLATFORM" = win32 ]; then
+-                CORE_LIBS="$CORE_LIBS -lgdi32 -lcrypt32 -lws2_32"
+-            fi
+-        ;;
++	cl | bcc32)
++	    have=NGX_OPENSSL . auto/have
++	    have=NGX_SSL . auto/have
++
++	    CFLAGS="$CFLAGS -DNO_SYS_TYPES_H"
++
++	    CORE_INCS="$CORE_INCS $OPENSSL/openssl/include"
++	    CORE_DEPS="$CORE_DEPS $OPENSSL/openssl/include/openssl/ssl.h"
++
++	    if [ -f $OPENSSL/ms/do_ms.bat ]; then
++		# before OpenSSL 1.1.0
++		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/ssleay32.lib"
++		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libeay32.lib"
++	    else
++		# OpenSSL 1.1.0+
++		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libssl.lib"
++		CORE_LIBS="$CORE_LIBS $OPENSSL/openssl/lib/libcrypto.lib"
++	    fi
++
++	    # libeay32.lib requires gdi32.lib
++	    CORE_LIBS="$CORE_LIBS gdi32.lib"
++	    # OpenSSL 1.0.0 requires crypt32.lib
++	    CORE_LIBS="$CORE_LIBS crypt32.lib"
++	;;
++
++	*)
++	    have=NGX_OPENSSL . auto/have
++	    have=NGX_SSL . auto/have
++
++	    CORE_INCS="$CORE_INCS $OPENSSL/.openssl/include"
++	    CORE_DEPS="$CORE_DEPS $OPENSSL/.openssl/include/openssl/ssl.h"
++	    CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libssl.a"
++	    CORE_LIBS="$CORE_LIBS $OPENSSL/.openssl/lib/libcrypto.a"
++	    CORE_LIBS="$CORE_LIBS $NGX_LIBDL"
++	    CORE_LIBS="$CORE_LIBS $NGX_LIBPTHREAD"
++
++	    if [ "$NGX_PLATFORM" = win32 ]; then
++		CORE_LIBS="$CORE_LIBS -lgdi32 -lcrypt32 -lws2_32"
++	    fi
++	;;
+     esac
+ 
+ else
+ 
+     if [ "$NGX_PLATFORM" != win32 ]; then
+ 
+-        OPENSSL=NO
++	OPENSSL=NO
+ 
+-        ngx_feature="OpenSSL library"
+-        ngx_feature_name="NGX_OPENSSL"
+-        ngx_feature_run=no
+-        ngx_feature_incs="#include <openssl/ssl.h>"
 -        ngx_feature_path=
--        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL"
-+        ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
-+			     sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
-+        ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
-         ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
-         . auto/feature
+-        ngx_feature_libs="-lssl -lcrypto $NGX_LIBDL $NGX_LIBPTHREAD"
+-        ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
+-        . auto/feature
++	ngx_feature="OpenSSL library"
++	ngx_feature_name="NGX_OPENSSL"
++	ngx_feature_run=no
++	ngx_feature_incs="#include <openssl/ssl.h>"
++	ngx_feature_path=
++	ngx_feature_path="$(${PKG_CONFIG:=pkg-config} --cflags-only-I openssl|
++			    sed -re 's/(^|\s)-I\s*(\S+)/\1\2/g')"
++	ngx_feature_libs="$(${PKG_CONFIG:=pkg-config} --libs openssl)"
++	ngx_feature_test="SSL_CTX_set_options(NULL, 0)"
++	. auto/feature
+ 
+-        if [ $ngx_found = no ]; then
++	if [ $ngx_found = no ]; then
+ 
+-            # FreeBSD port
++	    # FreeBSD port
+ 
+-            ngx_feature="OpenSSL library in /usr/local/"
+-            ngx_feature_path="/usr/local/include"
++	    ngx_feature="OpenSSL library in /usr/local/"
++	    ngx_feature_path="/usr/local/include"
+ 
+-            if [ $NGX_RPATH = YES ]; then
+-                ngx_feature_libs="-R/usr/local/lib -L/usr/local/lib -lssl -lcrypto"
+-            else
+-                ngx_feature_libs="-L/usr/local/lib -lssl -lcrypto"
+-            fi
++	    if [ $NGX_RPATH = YES ]; then
++		ngx_feature_libs="-R/usr/local/lib -L/usr/local/lib -lssl -lcrypto"
++	    else
++		ngx_feature_libs="-L/usr/local/lib -lssl -lcrypto"
++	    fi
+ 
+-            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
++	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
+ 
+-            . auto/feature
+-        fi
++	    . auto/feature
++	fi
+ 
+-        if [ $ngx_found = no ]; then
++	if [ $ngx_found = no ]; then
+ 
+-            # NetBSD port
++	    # NetBSD port
+ 
+-            ngx_feature="OpenSSL library in /usr/pkg/"
+-            ngx_feature_path="/usr/pkg/include"
++	    ngx_feature="OpenSSL library in /usr/pkg/"
++	    ngx_feature_path="/usr/pkg/include"
+ 
+-            if [ $NGX_RPATH = YES ]; then
+-                ngx_feature_libs="-R/usr/pkg/lib -L/usr/pkg/lib -lssl -lcrypto"
+-            else
+-                ngx_feature_libs="-L/usr/pkg/lib -lssl -lcrypto"
+-            fi
++	    if [ $NGX_RPATH = YES ]; then
++		ngx_feature_libs="-R/usr/pkg/lib -L/usr/pkg/lib -lssl -lcrypto"
++	    else
++		ngx_feature_libs="-L/usr/pkg/lib -lssl -lcrypto"
++	    fi
+ 
+-            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
++	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
+ 
+-            . auto/feature
+-        fi
++	    . auto/feature
++	fi
+ 
+-        if [ $ngx_found = no ]; then
++	if [ $ngx_found = no ]; then
+ 
+-            # MacPorts
++	    # MacPorts
+ 
+-            ngx_feature="OpenSSL library in /opt/local/"
+-            ngx_feature_path="/opt/local/include"
++	    ngx_feature="OpenSSL library in /opt/local/"
++	    ngx_feature_path="/opt/local/include"
+ 
+-            if [ $NGX_RPATH = YES ]; then
+-                ngx_feature_libs="-R/opt/local/lib -L/opt/local/lib -lssl -lcrypto"
+-            else
+-                ngx_feature_libs="-L/opt/local/lib -lssl -lcrypto"
+-            fi
++	    if [ $NGX_RPATH = YES ]; then
++		ngx_feature_libs="-R/opt/local/lib -L/opt/local/lib -lssl -lcrypto"
++	    else
++		ngx_feature_libs="-L/opt/local/lib -lssl -lcrypto"
++	    fi
+ 
+-            ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
++	    ngx_feature_libs="$ngx_feature_libs $NGX_LIBDL $NGX_LIBPTHREAD"
+ 
+-            . auto/feature
+-        fi
++	    . auto/feature
++	fi
+ 
+-        if [ $ngx_found = yes ]; then
+-            have=NGX_SSL . auto/have
+-            CORE_INCS="$CORE_INCS $ngx_feature_path"
+-            CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
+-            OPENSSL=YES
+-        fi
++	if [ $ngx_found = yes ]; then
++	    have=NGX_SSL . auto/have
++	    CORE_INCS="$CORE_INCS $ngx_feature_path"
++	    CORE_LIBS="$CORE_LIBS $ngx_feature_libs"
++	    OPENSSL=YES
++	fi
+     fi
+ 
+     if [ $OPENSSL != YES ]; then
+@@ -136,7 +137,7 @@ into the system, or build the OpenSSL library statically from the source
+ with nginx by using --with-openssl=<path> option.
+ 
+ END
+-        exit 1
++	exit 1
+     fi
  
+ fi
 -- 
-2.8.2
+2.17.1
 
diff --git a/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch b/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch
deleted file mode 100644
index 08456511dc..0000000000
--- a/package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9668f0d5ecd2382fd36b7ff6a3a29abd04f6533f Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 14 Jul 2017 11:50:08 +0200
-Subject: [PATCH] auto/lib/conf: fix PCRE condition WRT the http and
- http_rewrite options
-
-http_rewrite module cannot be selected when http server is disabled, so
-fix the PCRE check condition to avoid irrelevant check failure.
-
-Fixes:
-  http://autobuild.buildroot.net/results/bc7/bc7458b97a88785653845afd30fe9d5f3a69905b/build-end.log
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- auto/lib/conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/auto/lib/conf b/auto/lib/conf
-index 0b8545a3..2c7af104 100644
---- a/auto/lib/conf
-+++ b/auto/lib/conf
-@@ -7,7 +7,7 @@ if [ $USE_PCRE = YES -o $PCRE != NONE ]; then
-     . auto/lib/pcre/conf
- 
- else
--    if [ $USE_PCRE = DISABLED -a $HTTP_REWRITE = YES ]; then
-+    if [ $USE_PCRE = DISABLED -a $HTTP = YES -a $HTTP_REWRITE = YES ]; then
- 
- cat << END
- 
--- 
-2.13.2
-
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 9936ca1dfa..51284aefbe 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	305f379da1d5fb5aefa79e45c829852ca6983c7cd2a79328f8e084a324cf0416	nginx-1.12.2.tar.gz
+sha256	b0b58c9a3fd73aa8b89edf5cfadc6641a352e0e6d3071db1eb3215d72b7fb516	nginx-1.15.0.tar.gz
 # License files, locally calculated
-sha256	75820469c890db641e54078df018e497fde0542211aa704e15320316a2175780	LICENSE
+sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index e5652af6df..23cf2b46d5 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.12.2
+NGINX_VERSION = 1.15.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
