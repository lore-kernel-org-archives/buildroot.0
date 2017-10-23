From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:51:37 +0200
Subject: [Buildroot] [git commit] boost: add fiber module
Message-ID: <20171023200255.044BB81003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=657dbfa00af724c2539a08eaaf0c8044dd4051d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module requires NPTL. Without support for the module, it is built
unconditionally, which was causing the following build errors:
http://autobuild.buildroot.net/results/029/0298038fc126d15733d81c54e0bb7cb00be48b92/build-end.log
http://autobuild.buildroot.net/results/6f3/6f3a218c47204e431100799482a3ed0ec159fa15/build-end.log
http://autobuild.buildroot.net/results/63e/63e5569a90d3ace97cb6102509cbd04aeab6f5f7/build-end.log

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Arnout: add empty line in Config.in, reword commit message]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boost/Config.in | 7 +++++++
 package/boost/boost.mk  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 3b3c89b..37a7e73 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -79,6 +79,13 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 
+config BR2_PACKAGE_BOOST_FIBER
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	bool "boost-fiber"
+
+comment "boost-fiber needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 598ffbe..0fd6c4d 100644
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
