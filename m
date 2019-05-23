From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 11:08:07 +0200
Subject: [Buildroot] [git commit] package/domoticz: bump to version 4.10717
Message-ID: <20190602201235.71D208EDA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=527e8ca4b629be6bdd16f9d9f3c05f2690cd97bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove all patches (already in version)
- Add patch to fix version

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/0001-Bumped-version.patch         | 20 ------
 ...-appversion.default-bump-version-to-10717.patch | 23 +++++++
 ...s.txt-fix-build-with-python-and-cmake-3.7.patch | 40 ------------
 ...03-Fix-for-boot-1-70-get_io_service.patch.patch | 74 ----------------------
 package/domoticz/domoticz.hash                     |  2 +-
 package/domoticz/domoticz.mk                       |  2 +-
 6 files changed, 25 insertions(+), 136 deletions(-)

diff --git a/package/domoticz/0001-Bumped-version.patch b/package/domoticz/0001-Bumped-version.patch
deleted file mode 100644
index 70426ba1aa..0000000000
--- a/package/domoticz/0001-Bumped-version.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From 98723b7da9467a49222b8a7ffaae276c5bc075c1 Mon Sep 17 00:00:00 2001
-From: gizmocuz <gizmocuz@users.noreply.github.com>
-Date: Thu, 28 Jun 2018 08:00:58 +0200
-Subject: [PATCH] Bumped version
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from https://github.com/domoticz/domoticz/commit/98723b7da9467a49222b8a7ffaae276c5bc075c1]
----
- appversion.default | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/appversion.default b/appversion.default
-index beaa069bb..7d3530590 100644
---- a/appversion.default
-+++ b/appversion.default
-@@ -1,3 +1,3 @@
--#define APPVERSION 5876
-+#define APPVERSION 9700
- #define APPHASH "b97777b"
- #define APPDATE 1478691222
diff --git a/package/domoticz/0001-appversion.default-bump-version-to-10717.patch b/package/domoticz/0001-appversion.default-bump-version-to-10717.patch
new file mode 100644
index 0000000000..df0f1b339a
--- /dev/null
+++ b/package/domoticz/0001-appversion.default-bump-version-to-10717.patch
@@ -0,0 +1,23 @@
+From 4d8bbaf4bdffe4fa77a060cd7fa848f3001d46a8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 May 2019 21:08:13 +0200
+Subject: [PATCH] appversion.default: bump version to 10717
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/domoticz/domoticz/pull/3251]
+---
+ appversion.default | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/appversion.default b/appversion.default
+index 7d3530590..6fc5766c2 100644
+--- a/appversion.default
++++ b/appversion.default
+@@ -1,3 +1,3 @@
+-#define APPVERSION 9700
++#define APPVERSION 10717
+ #define APPHASH "b97777b"
+ #define APPDATE 1478691222
+-- 
+2.20.1
+
diff --git a/package/domoticz/0002-CMakeLists.txt-fix-build-with-python-and-cmake-3.7.patch b/package/domoticz/0002-CMakeLists.txt-fix-build-with-python-and-cmake-3.7.patch
deleted file mode 100644
index a0adbdfed9..0000000000
--- a/package/domoticz/0002-CMakeLists.txt-fix-build-with-python-and-cmake-3.7.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4b77662232c806b8aba7680405144ad51ac3671b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 29 Nov 2018 00:36:00 +0100
-Subject: [PATCH] CMakeLists.txt: fix build with python and cmake <= 3.7
-
-domoticz will fail to build with python and older cmake
-Indeed, find_package(PythonLibs 3.4) will not recognize python 3.7 until
-cmake 3.7 and the following commit:
-https://github.com/Kitware/CMake/commit/c31573b9641e0f1bc7a34149506db51f3494323b
-
-To fix this, add a call to find_package(PythonInterp 3.4). Indeed, if
-FindPythonInterp has already found the major and minor version, that
-version will be inserted between the user supplied versions and the
-stock version list since cmake in version 3.1 and
-https://github.com/Kitware/CMake/commit/3816cd2dc7a7cc220e4f1b1e87fee986545b9cb3
-
-Fixes:
- - http://autobuild.buildroot.org/results/8e82501a7b49da628ec026132ffca44c0c813040
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/domoticz/domoticz/pull/2889]
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f4e38b88..41003a0c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -125,6 +125,7 @@ ENDIF(USE_BUILTIN_SQLITE)
- 
- option(USE_PYTHON "Use Python for Plugins and Event-Scripts" YES)
- IF(USE_PYTHON)
-+  find_package(PythonInterp 3.4)
-   find_package(PythonLibs 3.4)
-   IF(PYTHONLIBS_FOUND)
-     MESSAGE(STATUS "Python3 includes found at: ${PYTHON_INCLUDE_PATH}")
--- 
-2.14.1
-
diff --git a/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch b/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch
deleted file mode 100644
index 28807fc0b0..0000000000
--- a/package/domoticz/0003-Fix-for-boot-1-70-get_io_service.patch.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 9d226dab339f5767ec01ea1bcc9043ceee185cca Mon Sep 17 00:00:00 2001
-From: Rob Peters <info@domoticz.com>
-Date: Mon, 25 Mar 2019 08:50:23 +0100
-Subject: [PATCH] Fix for boot 1.70 get_io_service, fixed #3117
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/domoticz/domoticz/commit/9d226dab339f5767ec01ea1bcc9043ceee185cca]
----
- hardware/Pinger.cpp                   | 10 ++++++++--
- hardware/TCPProxy/tcpproxy_server.cpp |  8 +++++++-
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/hardware/Pinger.cpp b/hardware/Pinger.cpp
-index 01a955ba4..184378738 100644
---- a/hardware/Pinger.cpp
-+++ b/hardware/Pinger.cpp
-@@ -18,6 +18,12 @@
- 
- #include <iostream>
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s).get_io_service())
-+#endif
-+
- class pinger
- 	: private domoticz::noncopyable
- {
-@@ -76,7 +82,7 @@ class pinger
- 				num_tries_++;
- 				if (num_tries_ > 4)
- 				{
--					resolver_.get_io_service().stop();
-+					GET_IO_SERVICE(resolver_).stop();
- 				}
- 				else
- 				{
-@@ -118,7 +124,7 @@ class pinger
- 			if (num_replies_++ == 0)
- 				timer_.cancel();
- 			m_PingState = true;
--			resolver_.get_io_service().stop();
-+			GET_IO_SERVICE(resolver_).stop();
- 		}
- 		else
- 		{
-diff --git a/hardware/TCPProxy/tcpproxy_server.cpp b/hardware/TCPProxy/tcpproxy_server.cpp
-index fddac08de..60445d9c2 100644
---- a/hardware/TCPProxy/tcpproxy_server.cpp
-+++ b/hardware/TCPProxy/tcpproxy_server.cpp
-@@ -15,6 +15,12 @@
- #include "stdafx.h"
- #include "tcpproxy_server.h"
- 
-+#if BOOST_VERSION >= 107000
-+#define GET_IO_SERVICE(s) ((boost::asio::io_context&)(s).get_executor().context())
-+#else
-+#define GET_IO_SERVICE(s) ((s).get_io_service())
-+#endif
-+
- namespace tcp_proxy
- {
- 	bridge::bridge(boost::asio::io_service& ios)
-@@ -38,7 +44,7 @@ namespace tcp_proxy
- 		boost::asio::ip::tcp::endpoint end;
- 
- 
--		boost::asio::io_service &ios=downstream_socket_.get_io_service();
-+		boost::asio::io_service &ios= GET_IO_SERVICE(downstream_socket_);
- 		boost::asio::ip::tcp::resolver resolver(ios);
- 		boost::asio::ip::tcp::resolver::query query(upstream_host, upstream_port, boost::asio::ip::resolver_query_base::numeric_service);
- 		boost::asio::ip::tcp::resolver::iterator i = resolver.resolve(query);
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 106d242d0d..3d974b3f8d 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	c31f185a1ffac01b86a77bf33e059a4403d814e826c9d6639c63c2e9afa55a46	domoticz-4.9700.tar.gz
+sha256	c053a2161942529f56b748945ec297dcd67f449e68029fc886893a528891ad86	domoticz-4.10717.tar.gz
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 7f094d0976..9636e208d0 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 4.9700
+DOMOTICZ_VERSION = 4.10717
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
