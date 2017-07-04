From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  4 Jul 2017 11:35:36 -0400
Subject: [Buildroot] [PATCH 1/1] nginx: bump to version 1.12.0
Message-ID: <20170704153536.20775-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the patch line numbers to work with 1.12.0

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 ...izeof-rework-autotest-to-be-cross-compila.patch | 22 +++++++------
 ...x_feature_run_force_result-for-each-featu.patch | 36 +++++++++++-----------
 ...nix-make-sys_nerr-guessing-cross-friendly.patch |  4 +--
 ...0006-auto-lib-openssl-conf-use-pkg-config.patch |  2 +-
 package/nginx/nginx.hash                           |  2 +-
 package/nginx/nginx.mk                             |  2 +-
 6 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
index 603f729..74545f1 100644
--- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
+++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -1,6 +1,6 @@
-From fe05ccf80afe5de33d4f9c5e5545390c450bcd2d Mon Sep 17 00:00:00 2001
+From fb158af083e72c9aa0a8dfd4c6965f950192a230 Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
-Date: Thu, 24 Apr 2014 23:27:32 +0200
+Date: Tue, 4 Jul 2017 11:09:20 -0400
 Subject: [PATCH] auto/type/sizeof: rework autotest to be cross-compilation
  friendly
 
@@ -8,6 +8,10 @@ Rework the sizeof test to do the checks at compile time instead of at
 runtime. This way, it does not break when cross-compiling for a
 different CPU architecture.
 
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+
+Refresh for 1.12.0
+
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
 Refresh for 1.8.0.
@@ -16,11 +20,11 @@ Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 [martin at barkynet.com: Updated for 1.10.0]
 Signed-off-by: Martin Bark <martin@barkynet.com>
 ---
- auto/types/sizeof | 42 ++++++++++++++++++++++++++++--------------
- 1 file changed, 28 insertions(+), 14 deletions(-)
+ auto/types/sizeof | 37 ++++++++++++++++++++++++++++---------
+ 1 file changed, 28 insertions(+), 9 deletions(-)
 
 diff --git a/auto/types/sizeof b/auto/types/sizeof
-index a5f66bb..c6f31ec 100644
+index 480d8cf..61dcd2d 100644
 --- a/auto/types/sizeof
 +++ b/auto/types/sizeof
 @@ -14,7 +14,7 @@ END
@@ -32,11 +36,11 @@ index a5f66bb..c6f31ec 100644
  
  #include <sys/types.h>
  #include <sys/time.h>
-@@ -25,22 +25,40 @@ $NGX_INCLUDE_UNISTD_H
+@@ -25,22 +25,41 @@ $NGX_INCLUDE_UNISTD_H
  $NGX_INCLUDE_INTTYPES_H
  $NGX_INCLUDE_AUTO_CONFIG_H
  
--int main() {
+-int main(void) {
 -    printf("%d", (int) sizeof($ngx_type));
 +#if !defined( PASTE)
 +#define PASTE2( x, y) x##y
@@ -55,9 +59,9 @@ index a5f66bb..c6f31ec 100644
  }
  
 -END
--
 +_EOF
  
+ 
 -ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
 -          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
 +_ngx_typename=`echo "$ngx_type" | sed 's/ /_/g;s/\*/p/'`
@@ -83,5 +87,5 @@ index a5f66bb..c6f31ec 100644
  fi
  
 -- 
-1.9.1
+2.9.4
 
diff --git a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
index ed67a67..be1df7f 100644
--- a/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
+++ b/package/nginx/0003-auto-set-ngx_feature_run_force_result-for-each-featu.patch
@@ -28,7 +28,7 @@ diff --git a/auto/cc/conf b/auto/cc/conf
 index edc6d74..a61ade4 100644
 --- a/auto/cc/conf
 +++ b/auto/cc/conf
-@@ -159,6 +159,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+@@ -181,6 +181,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
      ngx_feature="gcc builtin atomic operations"
      ngx_feature_name=NGX_HAVE_GCC_ATOMIC
      ngx_feature_run=yes
@@ -36,7 +36,7 @@ index edc6d74..a61ade4 100644
      ngx_feature_incs=
      ngx_feature_path=
      ngx_feature_libs=
-@@ -179,6 +180,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+@@ -201,6 +203,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
          ngx_feature="C99 variadic macros"
          ngx_feature_name="NGX_HAVE_C99_VARIADIC_MACROS"
          ngx_feature_run=yes
@@ -44,7 +44,7 @@ index edc6d74..a61ade4 100644
          ngx_feature_incs="#include <stdio.h>
  #define var(dummy, ...)  sprintf(__VA_ARGS__)"
          ngx_feature_path=
-@@ -193,6 +195,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
+@@ -215,6 +220,7 @@ if [ "$NGX_PLATFORM" != win32 ]; then
      ngx_feature="gcc variadic macros"
      ngx_feature_name="NGX_HAVE_GCC_VARIADIC_MACROS"
      ngx_feature_run=yes
@@ -80,7 +80,7 @@ diff --git a/auto/os/darwin b/auto/os/darwin
 index 1d3e3d3..11b7276 100644
 --- a/auto/os/darwin
 +++ b/auto/os/darwin
-@@ -27,6 +27,7 @@ NGX_KQUEUE_CHECKED=YES
+@@ -30,6 +30,7 @@ NGX_KQUEUE_CHECKED=YES
  ngx_feature="kqueue's EVFILT_TIMER"
  ngx_feature_name="NGX_HAVE_TIMER_EVENT"
  ngx_feature_run=yes
@@ -88,7 +88,7 @@ index 1d3e3d3..11b7276 100644
  ngx_feature_incs="#include <sys/event.h>
                    #include <sys/time.h>"
  ngx_feature_path=
-@@ -57,6 +58,7 @@ ngx_feature_test="int      kq;
+@@ -60,6 +61,7 @@ ngx_feature_test="int      kq;
  ngx_feature="Darwin 64-bit kqueue millisecond timeout bug"
  ngx_feature_name=NGX_DARWIN_KEVENT_BUG
  ngx_feature_run=bug
@@ -96,7 +96,7 @@ index 1d3e3d3..11b7276 100644
  ngx_feature_incs="#include <sys/event.h>
                    #include <sys/time.h>"
  ngx_feature_path=
-@@ -87,6 +89,7 @@ CC_AUX_FLAGS="$CC_AUX_FLAGS"
+@@ -90,6 +92,7 @@ CC_AUX_FLAGS="$CC_AUX_FLAGS"
  ngx_feature="sendfile()"
  ngx_feature_name="NGX_HAVE_SENDFILE"
  ngx_feature_run=yes
@@ -108,7 +108,7 @@ diff --git a/auto/os/linux b/auto/os/linux
 index 19bf832..16848b2 100644
 --- a/auto/os/linux
 +++ b/auto/os/linux
-@@ -49,6 +49,7 @@ fi
+@@ -37,6 +37,7 @@ fi
  ngx_feature="epoll"
  ngx_feature_name="NGX_HAVE_EPOLL"
  ngx_feature_run=yes
@@ -116,7 +116,7 @@ index 19bf832..16848b2 100644
  ngx_feature_incs="#include <sys/epoll.h>"
  ngx_feature_path=
  ngx_feature_libs=
-@@ -106,6 +107,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE"
+@@ -111,6 +112,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE"
  ngx_feature="sendfile()"
  ngx_feature_name="NGX_HAVE_SENDFILE"
  ngx_feature_run=yes
@@ -124,7 +124,7 @@ index 19bf832..16848b2 100644
  ngx_feature_incs="#include <sys/sendfile.h>
                    #include <errno.h>"
  ngx_feature_path=
-@@ -127,6 +129,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
+@@ -132,6 +134,7 @@ CC_AUX_FLAGS="$cc_aux_flags -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
  ngx_feature="sendfile64()"
  ngx_feature_name="NGX_HAVE_SENDFILE64"
  ngx_feature_run=yes
@@ -132,7 +132,7 @@ index 19bf832..16848b2 100644
  ngx_feature_incs="#include <sys/sendfile.h>
                    #include <errno.h>"
  ngx_feature_path=
-@@ -145,6 +148,7 @@ ngx_include="sys/prctl.h"; . auto/include
+@@ -150,6 +153,7 @@ ngx_include="sys/prctl.h"; . auto/include
  ngx_feature="prctl(PR_SET_DUMPABLE)"
  ngx_feature_name="NGX_HAVE_PR_SET_DUMPABLE"
  ngx_feature_run=yes
@@ -144,7 +144,7 @@ diff --git a/auto/unix b/auto/unix
 index 6e54531..7dbf9d1 100755
 --- a/auto/unix
 +++ b/auto/unix
-@@ -99,6 +99,7 @@ if test -z "$NGX_KQUEUE_CHECKED"; then
+@@ -100,6 +100,7 @@ if test -z "$NGX_KQUEUE_CHECKED"; then
          ngx_feature="kqueue's EVFILT_TIMER"
          ngx_feature_name="NGX_HAVE_TIMER_EVENT"
          ngx_feature_run=yes
@@ -152,7 +152,7 @@ index 6e54531..7dbf9d1 100755
          ngx_feature_incs="#include <sys/event.h>
                            #include <sys/time.h>"
          ngx_feature_path=
-@@ -589,6 +590,7 @@ ngx_feature_test="char buf[1]; ssize_t n; n = pwrite(1, buf, 1, 0);
+@@ -702,6 +703,7 @@ ngx_feature_test="char buf[1]; ssize_t n; n = pwrite(1, buf, 1, 0);
  ngx_feature="sys_nerr"
  ngx_feature_name="NGX_SYS_NERR"
  ngx_feature_run=value
@@ -160,7 +160,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs='#include <errno.h>
                    #include <stdio.h>'
  ngx_feature_path=
-@@ -603,6 +605,7 @@ if [ $ngx_found = no ]; then
+@@ -716,6 +718,7 @@ if [ $ngx_found = no ]; then
      ngx_feature="_sys_nerr"
      ngx_feature_name="NGX_SYS_NERR"
      ngx_feature_run=value
@@ -168,7 +168,7 @@ index 6e54531..7dbf9d1 100755
      ngx_feature_incs='#include <errno.h>
                        #include <stdio.h>'
      ngx_feature_path=
-@@ -618,6 +621,7 @@ if [ $ngx_found = no ]; then
+@@ -731,6 +734,7 @@ if [ $ngx_found = no ]; then
      ngx_feature='maximum errno'
      ngx_feature_name=NGX_SYS_NERR
      ngx_feature_run=value
@@ -176,7 +176,7 @@ index 6e54531..7dbf9d1 100755
      ngx_feature_incs='#include <errno.h>
                        #include <string.h>
                        #include <stdio.h>'
-@@ -676,6 +680,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
+@@ -789,6 +793,7 @@ ngx_feature_test="void *p; p = memalign(4096, 4096);
  ngx_feature="mmap(MAP_ANON|MAP_SHARED)"
  ngx_feature_name="NGX_HAVE_MAP_ANON"
  ngx_feature_run=yes
@@ -184,7 +184,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/mman.h>"
  ngx_feature_path=
  ngx_feature_libs=
-@@ -689,6 +694,7 @@ ngx_feature_test="void *p;
+@@ -802,6 +807,7 @@ ngx_feature_test="void *p;
  ngx_feature='mmap("/dev/zero", MAP_SHARED)'
  ngx_feature_name="NGX_HAVE_MAP_DEVZERO"
  ngx_feature_run=yes
@@ -192,7 +192,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/mman.h>
                    #include <sys/stat.h>
                    #include <fcntl.h>"
-@@ -704,6 +710,7 @@ ngx_feature_test='void *p; int  fd;
+@@ -817,6 +823,7 @@ ngx_feature_test='void *p; int  fd;
  ngx_feature="System V shared memory"
  ngx_feature_name="NGX_HAVE_SYSVSHM"
  ngx_feature_run=yes
@@ -200,7 +200,7 @@ index 6e54531..7dbf9d1 100755
  ngx_feature_incs="#include <sys/ipc.h>
                    #include <sys/shm.h>"
  ngx_feature_path=
-@@ -718,6 +725,7 @@ ngx_feature_test="int  id;
+@@ -831,6 +838,7 @@ ngx_feature_test="int  id;
  ngx_feature="POSIX semaphores"
  ngx_feature_name="NGX_HAVE_POSIX_SEM"
  ngx_feature_run=yes
diff --git a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index 2242d13..b4d8215 100644
--- a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -109,7 +109,7 @@ diff --git a/auto/unix b/auto/unix
 index 7dbf9d1..00a7370 100755
 --- a/auto/unix
 +++ b/auto/unix
-@@ -595,6 +595,10 @@ ngx_feature_incs='#include <errno.h>
+@@ -708,6 +708,10 @@ ngx_feature_incs='#include <errno.h>
                    #include <stdio.h>'
  ngx_feature_path=
  ngx_feature_libs=
@@ -120,7 +120,7 @@ index 7dbf9d1..00a7370 100755
  ngx_feature_test='printf("%d", sys_nerr);'
  . auto/feature
  
-@@ -643,6 +647,12 @@ if [ $ngx_found = no ]; then
+@@ -756,6 +760,12 @@ if [ $ngx_found = no ]; then
      . auto/feature
  fi
  
diff --git a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
index b826a3c..0c94890 100644
--- a/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
+++ b/package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch
@@ -15,7 +15,7 @@ diff --git a/auto/lib/openssl/conf b/auto/lib/openssl/conf
 index 39d9602..995c6f3 100644
 --- a/auto/lib/openssl/conf
 +++ b/auto/lib/openssl/conf
-@@ -50,8 +50,8 @@ else
+@@ -58,8 +58,8 @@ else
          ngx_feature_name="NGX_OPENSSL"
          ngx_feature_run=no
          ngx_feature_incs="#include <openssl/ssl.h>"
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 498d272..ffc5a27 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90	nginx-1.10.3.tar.gz
+sha256	b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30	nginx-1.12.0.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 88afc94..54126ab 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.10.3
+NGINX_VERSION = 1.12.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.9.4
