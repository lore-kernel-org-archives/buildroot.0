From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:18:19 +0200
Subject: [Buildroot] [git commit] package/mariadb: handle missing ucontext_t
Message-ID: <20181008081825.42FAD8E0E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7956757c11a8eb6aa6c4d27fcf7fa55aee60c2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some archs uclibc does not provide ucontext_t, for details see
https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262

This patch fixes a build error

In file included from /home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/plugins/pvio/pvio_socket.c:32:0:
/home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/include/ma_context.h:62:3: error: unknown type name ???ucontext_t???
   ucontext_t base_context;
   ^~~~~~~~~~

using this defconfig:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-926-gb393c24.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-cmake-fix-ucontext-detection.patch        | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/mariadb/0002-cmake-fix-ucontext-detection.patch b/package/mariadb/0002-cmake-fix-ucontext-detection.patch
new file mode 100644
index 0000000000..fff43e821e
--- /dev/null
+++ b/package/mariadb/0002-cmake-fix-ucontext-detection.patch
@@ -0,0 +1,44 @@
+From 3c8d309616295045745e778000c0185eec4b21d9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 7 Oct 2018 14:25:59 +0200
+Subject: [PATCH] cmake: fix ucontext detection
+
+On some archs uclibc does not provide the ucontext structure despite
+providing ucontext.h, for details see
+https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262
+
+This patch improves the detection of ucontext by making sure that
+HAVE_UCONTEXT_H is only set when makecontext() was found.
+
+Patch sent upstream: https://github.com/MariaDB/server/pull/878
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.cmake | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/configure.cmake b/configure.cmake
+index d840dd4e565..a5df355ac42 100644
+--- a/configure.cmake
++++ b/configure.cmake
+@@ -986,12 +986,12 @@ CHECK_STRUCT_HAS_MEMBER("struct sockaddr_in6" sin6_len
+ 
+ SET(CMAKE_EXTRA_INCLUDE_FILES) 
+ 
+-CHECK_INCLUDE_FILE(ucontext.h HAVE_UCONTEXT_H)
+-IF(NOT HAVE_UCONTEXT_H)
+-  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_UCONTEXT_H)
++CHECK_INCLUDE_FILE(ucontext.h HAVE_FILE_UCONTEXT_H)
++IF(NOT HAVE_FILE_UCONTEXT_H)
++  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_FILE_UCONTEXT_H)
+ ENDIF()
+-IF(HAVE_UCONTEXT_H)
+-  CHECK_FUNCTION_EXISTS(makecontext HAVE_UCONTEXT_H)
++IF(HAVE_FILE_UCONTEXT_H)
++  CHECK_FUNCTION_EXISTS(makecontext HAVE_UCONTEXT_H)
+ ENDIF()
+ 
+ CHECK_STRUCT_HAS_MEMBER("struct timespec" tv_sec "time.h" STRUCT_TIMESPEC_HAS_TV_SEC)
+-- 
+2.19.0
+
