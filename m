From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Dec 2017 12:59:32 +0100
Subject: [Buildroot] [PATCH 1/1] vlc: fix build with libupnp above 1.6.23
Message-ID: <20171217115932.24429-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport patch already available upstream

Fixes:
 - http://autobuild.buildroot.net/results/d98bdcc745a2480d4664db2427f0ae1c9c5ea71e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0012-Fix-build-with-libupnp-above-1.6.23.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch

diff --git a/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch b/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
new file mode 100644
index 0000000000..8490cbdaa2
--- /dev/null
+++ b/package/vlc/0012-Fix-build-with-libupnp-above-1.6.23.patch
@@ -0,0 +1,64 @@
+From 0c8d631f4f9fa24f1bbd56a4dbe9d6f1e2360685 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Dec 2017 12:26:33 +0100
+Subject: [PATCH] Fix build with libupnp above 1.6.23
+
+Starting from this release, libupnp has its own compat functions,
+backport patch from mainstream:
+https://github.com/videolan/vlc/commit/f9c5a343f1a8cad9c2c153f9c05e4e7201675a43#diff-2e66eb8b4fb06845a6426bd4a541d2f7
+
+Move UpnpEventPtr declaration in upnp.hpp as done in:
+https://github.com/videolan/vlc/commit/3eb4e03512f45c1fa27c7f9a6759e8e7d3905720#diff-ac39568c5e5e1c68776a93dfe0b3c1e6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ modules/services_discovery/upnp.cpp | 5 +----
+ modules/services_discovery/upnp.hpp | 6 ++++++
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/modules/services_discovery/upnp.cpp b/modules/services_discovery/upnp.cpp
+index 9b6ed8727a..cf846602b8 100644
+--- a/modules/services_discovery/upnp.cpp
++++ b/modules/services_discovery/upnp.cpp
+@@ -40,11 +40,10 @@
+ #include <assert.h>
+ #include <limits.h>
+ 
+-#if UPNP_VERSION < 10800
++#if UPNP_VERSION < 10623
+ /*
+  * Compat functions and typedefs for libupnp prior to 1.8
+  */
+-typedef void* UpnpEventPtr;
+ typedef Upnp_Discovery UpnpDiscovery;
+ typedef Upnp_Action_Complete UpnpActionComplete;
+ typedef Upnp_Event UpnpEvent;
+@@ -74,8 +73,6 @@ static const char* UpnpEventSubscribe_get_SID_cstr( const UpnpEventSubscribe* p_
+ {
+   return p_s->Sid;
+ }
+-#else
+-typedef const void* UpnpEventPtr;
+ #endif
+ 
+ /*
+diff --git a/modules/services_discovery/upnp.hpp b/modules/services_discovery/upnp.hpp
+index 23fe4db9ab..c369a04da6 100644
+--- a/modules/services_discovery/upnp.hpp
++++ b/modules/services_discovery/upnp.hpp
+@@ -33,6 +33,12 @@
+ 
+ #include <vlc_common.h>
+ 
++#if UPNP_VERSION < 10800
++typedef void* UpnpEventPtr;
++#else
++typedef const void* UpnpEventPtr;
++#endif
++
+ // Classes
+ class Container;
+ 
+-- 
+2.14.1
+
-- 
2.14.1
