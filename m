From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 23 Oct 2017 14:48:24 -0400
Subject: [Buildroot] [PATCH 1/1] boost: add fiber module
Message-ID: <20171023184824.14896-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

requires NPTL which was causing the following build errors:
http://autobuild.buildroot.net/results/029/0298038fc126d15733d81c54e0bb7cb00be48b92/build-end.log
http://autobuild.buildroot.net/results/6f3/6f3a218c47204e431100799482a3ed0ec159fa15/build-end.log
http://autobuild.buildroot.net/results/63e/63e5569a90d3ace97cb6102509cbd04aeab6f5f7/build-end.log

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/boost/Config.in | 6 ++++++
 package/boost/boost.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 3b3c89b8c1..fab31a2e8f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -79,6 +79,12 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 
+config BR2_PACKAGE_BOOST_FIBER
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	bool "boost-fiber"
+
+comment "boost-fiber needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 598ffbe10e..0fd6c4d0de 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -26,6 +26,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,fiber)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
-- 
2.13.6
