From: =?UTF-8?q?Ignacy=20Gaw=C4=99dzki?= <ignacy.gawedzki@green-communications.fr>
Date: Wed, 27 Jun 2018 15:51:46 +0200
Subject: [Buildroot] [PATCH 1/1] nginx: Bump to version 1.15.0
Message-ID: <20180627135146.11364-1-ignacy.gawedzki@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
---
 ...-rework-autotest-to-be-cross-compila.patch |   6 +-
 ...-mechanism-allowing-to-force-feature.patch |   8 +-
 ...ture_run_force_result-for-each-featu.patch |  56 ++--
 ...auto-lib-libxslt-conf-use-pkg-config.patch |  10 +-
 ...ake-sys_nerr-guessing-cross-friendly.patch |  16 +-
 ...auto-lib-openssl-conf-use-pkg-config.patch | 249 ++++++++++++++++--
 ...7-auto-lib-libgd-conf-use-pkg-config.patch |   6 +-
 ...linux_config.h-only-include-dlfcn.h-.patch |   6 +-
 ...x-PCRE-condition-WRT-the-http-and-ht.patch |  33 ---
 package/nginx/nginx.hash                      |   4 +-
 package/nginx/nginx.mk                        |   2 +-
 11 files changed, 291 insertions(+), 105 deletions(-)
 delete mode 100644 package/nginx/0009-auto-lib-conf-fix-PCRE-condition-WRT-the-http-and-ht.patch

diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
index 5b1a50b264..52c8da38c0 100644
--- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
+++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -1,4 +1,4 @@
-From fb158af083e72c9aa0a8dfd4c6965f950192a230 Mon Sep 17 00:00:00 2001
+From 218eab509628bffd494516803fdef9585b2e30d8 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Tue, 4 Jul 2017 11:09:20 -0400
 Subject: [PATCH] auto/type/sizeof: rework autotest to be cross-compilation
@@ -22,7 +22,7 @@ Refresh for 1.12.0
  1 file changed, 28 insertions(+), 9 deletions(-)
 
 diff --git a/auto/types/sizeof b/auto/types/sizeof
-index 480d8cf..61dcd2d 100644
+index 480d8cfa..61dcd2de 100644
 --- a/auto/types/sizeof
 +++ b/auto/types/sizeof
 @@ -14,7 +14,7 @@ END
@@ -85,5 +85,5 @@ index 480d8cf..61dcd2d 100644
  fi
  
 -- 
-2.9.4
+2.17.1
 
diff --git a/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
index 13bef5ffdb..3d04ef14cc 100644
--- a/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
+++ b/package/nginx/0002-auto-feature-add-mechanism-allowing-to-force-feature.patch
@@ -1,4 +1,4 @@
-From ef72be22ad6d58e230f75553d80b470b80c3303a Mon Sep 17 00:00:00 2001
+From cf8a5c215f691ec8a2c43d8451d9efdcc2b270f5 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 4 May 2014 00:40:49 +0200
 Subject: [PATCH] auto/feature: add mechanism allowing to force feature run
@@ -13,11 +13,11 @@ This mechanism aims to make easier cross-compilation support.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 ---
- auto/feature | 80 ++++++++++++++++++++++++++++++++++++++++++++----------------
+ auto/feature | 80 ++++++++++++++++++++++++++++++++++++++--------------
  1 file changed, 59 insertions(+), 21 deletions(-)
 
 diff --git a/auto/feature b/auto/feature
-index 1145f28..a194b85 100644
+index 3561f594..8016d802 100644
 --- a/auto/feature
 +++ b/auto/feature
 @@ -52,50 +52,88 @@ if [ -x $NGX_AUTOTEST ]; then
@@ -131,5 +131,5 @@ index 1145f28..a194b85 100644
          ;;
  
 -- 
-1.9.2
+2.17.1
 
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
 
diff --git a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
index 103f90b305..3ac9081389 100644
--- a/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
+++ b/package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch
@@ -1,4 +1,4 @@
-From 211b9f19a3a62826fadef55d2f89d6f66fbf4aa6 Mon Sep 17 00:00:00 2001
+From ecd7d378e0d68d37e077087a4ed47c72d5d0e586 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Thu, 29 May 2014 19:22:27 +0200
 Subject: [PATCH] auto/lib/libxslt/conf: use pkg-config
@@ -8,11 +8,11 @@ dependencies.
 
 Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
- auto/lib/libxslt/conf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ auto/lib/libxslt/conf | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
-index 3a0f37b..3c2a60e 100644
+index 3a0f37be..94a531f1 100644
 --- a/auto/lib/libxslt/conf
 +++ b/auto/lib/libxslt/conf
 @@ -12,8 +12,9 @@
@@ -28,5 +28,5 @@ index 3a0f37b..3c2a60e 100644
                        xsltStylesheetPtr   sheet = NULL;
                        xmlDocPtr           doc;
 -- 
-2.8.2
+2.17.1
 
diff --git a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index b4d8215b34..8169876f1d 100644
--- a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -1,4 +1,4 @@
-From 08617a8d29ee22831175697555558fec8f52772c Mon Sep 17 00:00:00 2001
+From e0cfa9d2dc13d1acc2b70dff2e72cd943e028524 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 1 Jun 2014 16:05:04 +0200
 Subject: [PATCH] auto/unix: make sys_nerr guessing cross-friendly
@@ -16,14 +16,14 @@ Refresh for 1.8.0.
 
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 ---
- auto/os/sys_nerr | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- auto/unix        | 10 ++++++++
+ auto/os/sys_nerr | 78 ++++++++++++++++++++++++++++++++++++++++++++++++
+ auto/unix        | 10 +++++++
  2 files changed, 88 insertions(+)
  create mode 100644 auto/os/sys_nerr
 
 diff --git a/auto/os/sys_nerr b/auto/os/sys_nerr
 new file mode 100644
-index 0000000..8970f5f
+index 00000000..8970f5f6
 --- /dev/null
 +++ b/auto/os/sys_nerr
 @@ -0,0 +1,78 @@
@@ -106,10 +106,10 @@ index 0000000..8970f5f
 +
 +echo " $ngx_sys_nerr"
 diff --git a/auto/unix b/auto/unix
-index 7dbf9d1..00a7370 100755
+index 3da00537..a67ee3e2 100644
 --- a/auto/unix
 +++ b/auto/unix
-@@ -708,6 +708,10 @@ ngx_feature_incs='#include <errno.h>
+@@ -736,6 +736,10 @@ ngx_feature_incs='#include <errno.h>
                    #include <stdio.h>'
  ngx_feature_path=
  ngx_feature_libs=
@@ -120,7 +120,7 @@ index 7dbf9d1..00a7370 100755
  ngx_feature_test='printf("%d", sys_nerr);'
  . auto/feature
  
-@@ -756,6 +760,12 @@ if [ $ngx_found = no ]; then
+@@ -784,6 +788,12 @@ if [ $ngx_found = no ]; then
      . auto/feature
  fi
  
@@ -134,5 +134,5 @@ index 7dbf9d1..00a7370 100755
  ngx_feature="localtime_r()"
  ngx_feature_name="NGX_HAVE_LOCALTIME_R"
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
 
diff --git a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
index 34e7981c8f..0be7a4de71 100644
--- a/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
+++ b/package/nginx/0007-auto-lib-libgd-conf-use-pkg-config.patch
@@ -1,4 +1,4 @@
-From fd9885fe5fef5826034547ca6be7299863f99769 Mon Sep 17 00:00:00 2001
+From d472e1de47b21f9df940066afb5e8f306a98e9bf Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 14:48:49 +0100
 Subject: [PATCH] auto/lib/libgd/conf: use pkg-config
@@ -12,7 +12,7 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/auto/lib/libgd/conf b/auto/lib/libgd/conf
-index 6e4e91c..1c536a2 100644
+index 87761f14..4c74d8f3 100644
 --- a/auto/lib/libgd/conf
 +++ b/auto/lib/libgd/conf
 @@ -7,8 +7,8 @@
@@ -27,5 +27,5 @@ index 6e4e91c..1c536a2 100644
      . auto/feature
  
 -- 
-2.8.2
+2.17.1
 
diff --git a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
index c10fcd11c9..f0b4aad3cc 100644
--- a/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
+++ b/package/nginx/0008-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -1,4 +1,4 @@
-From 8dc9dffc1f99ac951865f3135dfb5061a08d1f85 Mon Sep 17 00:00:00 2001
+From 668028d7d22f130ce1cdfe8bc425663f50e2b9c1 Mon Sep 17 00:00:00 2001
 From: Martin Bark <martin@barkynet.com>
 Date: Fri, 6 May 2016 16:29:17 +0100
 Subject: [PATCH] src/os/unix/ngx_linux_config.h: only include dlfcn.h if
@@ -10,7 +10,7 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
-index 2f6129d..4244086 100644
+index 3036caeb..e282a1f7 100644
 --- a/src/os/unix/ngx_linux_config.h
 +++ b/src/os/unix/ngx_linux_config.h
 @@ -55,10 +55,12 @@
@@ -29,5 +29,5 @@ index 2f6129d..4244086 100644
  
  #if (NGX_HAVE_POSIX_SEM)
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
-- 
2.17.1
