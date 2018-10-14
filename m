From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:59:24 +0200
Subject: [Buildroot] [git commit] xerces: fix static linking with curl
Message-ID: <20181014085806.0B7CA81002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e954ad62a61c4b552796c27e9a176e8453fd6b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When curl is statically built with openssl support, xerces needs to
link with openssl libraries so use pkg_check_modules to get any
needed dependencies

Fixes:
 - http://autobuild.buildroot.org/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../xerces/0002-fix-static-linking-with-curl.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/xerces/0002-fix-static-linking-with-curl.patch b/package/xerces/0002-fix-static-linking-with-curl.patch
new file mode 100644
index 0000000000..db38de79fc
--- /dev/null
+++ b/package/xerces/0002-fix-static-linking-with-curl.patch
@@ -0,0 +1,39 @@
+From 26e3f1440bbc75c704fc93ff43a2abbfbe4c0203 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Oct 2018 22:56:50 +0200
+Subject: [PATCH] fix static linking with curl
+
+When curl is statically built with openssl support, xerces needs to
+link with openssl libraries so use pkg_check_modules to get any
+needed dependencies
+
+Fixes:
+ - http://autobuild.buildroot.org/results/29ca90fff2c8e38f2edf7240eca3aa3fe7397c45
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ cmake/XercesNetAccessorSelection.cmake | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/XercesNetAccessorSelection.cmake b/cmake/XercesNetAccessorSelection.cmake
+index 7a63f1f6b..e90fcf034 100644
+--- a/cmake/XercesNetAccessorSelection.cmake
++++ b/cmake/XercesNetAccessorSelection.cmake
+@@ -31,7 +31,13 @@ if(network)
+ 
+   # Requires select() which is UNIX only
+   if(UNIX)
+-    find_package(CURL)
++    find_package(PkgConfig)
++    if (PkgConfig_FOUND)
++      pkg_check_modules(CURL libcurl)
++      if (NOT CURL_FOUND)
++        find_package(CURL)
++      endif()
++    endif()
+     if(CURL_FOUND)
+       list(APPEND netaccessors curl)
+     endif()
+-- 
+2.17.1
+
