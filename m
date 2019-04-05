From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:41:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gerbera: fix
 static build with openssl
Message-ID: <20190405153921.1590D8D67D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0f8bcf2dc7ef9479d2bb75c38728148609eba4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/10098c8972725d54b717ddc8ea41f4de5e5b066d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 38730bfdf6101c1a9e8d4eef8331e12aca145ea0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...make-FindLibUpnp.cmake-fix-static-linking.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch b/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch
new file mode 100644
index 0000000000..510bf2837f
--- /dev/null
+++ b/package/gerbera/0003-cmake-FindLibUpnp.cmake-fix-static-linking.patch
@@ -0,0 +1,44 @@
+From e2f8e6c30e43c1818a6677d17de87f53c9414405 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 2 Apr 2019 10:44:06 +0200
+Subject: [PATCH] cmake/FindLibUpnp.cmake: fix static linking
+
+Fix static linking with an openssl enabled upnp:
+ - remove libupnp-1.8 from pkg_check_modules call otherwise test will
+   fail if libupnp-1.8.pc is not found
+ - add PC_UPNP_LIBRARIES to UPNP_LIBRARIES
+
+Fixes:
+ - http://autobuild.buildroot.org/results/10098c8972725d54b717ddc8ea41f4de5e5b066d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/gerbera/gerbera/pull/443]
+---
+ cmake/FindLibUpnp.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindLibUpnp.cmake b/cmake/FindLibUpnp.cmake
+index ec198d4d..5d2b032d 100644
+--- a/cmake/FindLibUpnp.cmake
++++ b/cmake/FindLibUpnp.cmake
+@@ -8,7 +8,7 @@
+ #  UPNP_HAS_REUSEADDR - If LinUPnP was built with SO_REUSEADDR support
+ 
+ find_package(PkgConfig QUIET)
+-pkg_check_modules (PC_UPNP QUIET libupnp-1.8 libupnp)
++pkg_search_module (PC_UPNP QUIET libupnp-1.8 libupnp)
+ 
+ find_path(UPNP_INCLUDE_DIR upnp.h
+     HINTS ${PC_UPNP_INCLUDEDIR} ${PC_UPNP_INCLUDE_DIRS}
+@@ -41,7 +41,7 @@ FIND_PACKAGE_HANDLE_STANDARD_ARGS(UPnP
+     VERSION_VAR UPNP_VERSION_STRING)
+ 
+ if (UPNP_FOUND)
+-    set (UPNP_LIBRARIES ${UPNP_UPNP_LIBRARY} ${UPNP_IXML_LIBRARY})
++    set (UPNP_LIBRARIES ${UPNP_UPNP_LIBRARY} ${UPNP_IXML_LIBRARY} ${PC_UPNP_LIBRARIES})
+     set (UPNP_INCLUDE_DIRS ${UPNP_INCLUDE_DIR} )
+ endif ()
+ 
+-- 
+2.14.1
+
