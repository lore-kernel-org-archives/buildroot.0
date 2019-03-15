From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 11:14:12 +0100
Subject: [Buildroot] [git commit] package/gerbera: fix static build with
 curl and libidn2
Message-ID: <20190315101120.40D108EFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7553b6ad23961be3f91798328fa8e955658dbd72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/be5893b507d22a23951efeea20c18642742cef5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-fix-static-build-with-curl-and-libidn.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch b/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch
new file mode 100644
index 0000000000..94f742c3f8
--- /dev/null
+++ b/package/gerbera/0001-CMakeLists.txt-fix-static-build-with-curl-and-libidn.patch
@@ -0,0 +1,41 @@
+From de0e7fe3b56cff79c11aedc89448814fab8d1877 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Mar 2019 19:11:11 +0100
+Subject: [PATCH] MakeLists.txt: fix static build with curl and libidn2
+
+curl can be statically linked with libidn2, in this case, build fails:
+/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/libcurl.a(libcurl_la-url.o): In function `free_idnconverted_hostname.isra.1':
+url.c:(.text+0xf4): undefined reference to `idn2_free'
+
+To fix this issue, add a call to pkg_check_modules to retrieve any
+needed dependencies
+
+Fixes:
+ - http://autobuild.buildroot.org/results/be5893b507d22a23951efeea20c18642742cef5a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/gerbera/gerbera/pull/429]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d0eed230..e6b62c96 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -443,7 +443,11 @@ if(WITH_MYSQL)
+ endif()
+ 
+ if(WITH_CURL)
+-    find_package (CURL REQUIRED)
++    find_package(PkgConfig QUIET)
++    pkg_check_modules (CURL QUIET libcurl)
++    if (NOT CURL_FOUND)
++        find_package (CURL REQUIRED)
++    endif()
+     if (CURL_FOUND)
+         include_directories(${CURL_INCLUDE_DIRS})
+         target_link_libraries (gerbera ${CURL_LIBRARIES})
+-- 
+2.20.1
+
