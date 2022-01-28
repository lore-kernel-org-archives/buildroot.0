Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DBAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B241941660;
	Fri, 28 Jan 2022 12:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clwor0dIYv82; Fri, 28 Jan 2022 12:45:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAD2B41640;
	Fri, 28 Jan 2022 12:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7CD1BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C6BF84C68
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5i4j6sLzRGCX for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E55D084C69
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643373940;
 bh=ksgiYQ0iyJ4KvfW4HlDsgJKIGG00tr3gEgdEJ2OjAhg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LLndDTA4qRN0jVtwBEgPIA+GxWcv0AGde4puF48QPXOprJ0gibH+f0JlB4l2r6PbM
 uOib/O5mvY94ScuxNSEcC1QJ+6UIaFYf1h3lueSe7ThuBXnCAyOlCDEy5fEPvb0jDg
 iS9St0C3SNFsx7pROLOAp2KhqK5faJGRgTdvssmQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.233]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAOJV-1n5ym71s5b-00BpxM; Fri, 28 Jan 2022 13:45:40 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 13:45:38 +0100
Message-Id: <20220128124538.31789-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128124538.31789-1-ps.report@gmx.net>
References: <20220128124538.31789-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LpzOFTXZ+F7bgZUK8xUNi+WBYjqMAb0rg7w/7AGjxvGoDrTyET0
 ljYSqPGCKBSrKxOmVBjTtoGKUSK9pgd5CE61pyZtlTwxJ8BKSE5ThiEE76aED7h1zUuyVP1
 IOVPVPwn3OmkNeMGX5NwQLHgxDAH9Cs6xs4a/9BMf9iq6nCoJA+ediSMAwr9qdUq99YoW54
 7spZR4Ydc/Z+nHMu5kSUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mn/60EU8Ow0=:vLMq2j69ZB8Zw02suf0Bo/
 AEEJh4CAl5MOkfOwlR/c5ybuoUTYakLVWm69nK3s0fv2FItYUrAsVw+O5UZrTJUwQz6jW4ze2
 beCbBYScKVtgd/Fjb347cYcDLfu3IXCbeqEWk5UCJrZuFovb1RhGVYg6Pg02rgXRaSbfIe8jF
 3nXkHTZfJ/rVtfGcr07bSTbZydx+cRnqeq9rh2JmVViQon6iB9L92GhiKWiFBXC9tbbr8Gu3z
 osOeqvotZLygReNcfpKHUqpvINi2XHzvYSJ4rg1LiCu896FTmXSnHtgJCszgAfq8YvXNpTQo5
 C9wehpj5bZmjnuuWIbmge72AtG6TBboTu5fyDw/Ze+fTSCyDw9o3dDoLf6qoUSt8WzQ7DJL0a
 yC38MGsI4AOHyxtMay/641XgaIGSbHDJcmSeWAsFry3qjM1gHbSujZKmPY7TP/nMA5gQkFxLP
 CfjK1rF+rzCDqqTS9yrWjwSYCllfRr6FhebqPVoZAFRa75K0y6uHZKXoXPkD7cgyb4jTPbTZJ
 q7QSyWwEpksF9hxVwHWsZsV9d3wQBjRxH31rTk4oVkpv+lN5GLGPMlNSI61cS3H97EHoOvEXi
 SBbfi+BtHZVNu5aqPgsCclJu3ZHGo7EPZm/5C+sU+lUquslAQ473LABqYBGegpczylu+Uv3hc
 elWzWoFtKIgHhoCAGCcWU07QXVUUsitDpvTfIzRYlXw19yZElmKQQU9LnDt7tfkcO0Fw+7Xb+
 ILKiBSEDE3uH8sdZu8WBm5f9s+wZtU7H4Rm4b6/V+Or7oDvjbvlvN+8iiNNnSBvxaAZIdEro2
 6BHsgmkSI7mPKDArW0qhuFpgH+ZdeJCPphbwBCDvzFtEpRcP7x/Bb5O+eJXemdAwJYF7Z4/i9
 VQKPwL34CnPylP4Zw2ZwQh+PZLNk0X6HpB8KwrL2K+TlYIeL2yPt2etvCCu807NMOzWvZ6deM
 DQnBOg8cRmzq8Kl+UAffpyf0KPcANfi/JzfcNHEgTKfI27k47HeHiHn5c0HiAtvy20FJe3+Yc
 WuKyPpLUSegwkA/DFxNdDgq8QBEKeqQZipuYts0oZP1FI/vfplJNA2jzHK3fDAX5v8rxb9cdv
 wRNkxhX2Q+1fOY=
Subject: [Buildroot] [PATCH v1 3/3] package/log4cxx: bump version to 0.12.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- drop 0001-LOGCXX-528.patch (from upstream [1])
- renumber remainnig patch

Changelog (for deteils see [2]):

- This is a minor bugfix release to fix issues found with 0.12.0. Notably,
  this version fixes a bug where a multithreaded application would crash
  when using a rolling file.

  [LOGCXX-534] - Crashed in log->forcedLog function when running with multi-thread
  [LOGCXX-528] - log4cxx fails to build on Centos 7.6 / g++ 4.8.5 / Boost 1.53

[1] https://github.com/apache/logging-log4cxx/commit/249dd85494a430d95fd69d89f42b02fd950cda51
[2] https://logging.apache.org/log4cxx/latest_stable/changelog.html#0.12.1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/log4cxx/0001-LOGCXX-528.patch         | 189 ------------------
 ...ly-check-for-boost-if-really-needed.patch} |   0
 package/log4cxx/log4cxx.hash                  |   4 +-
 package/log4cxx/log4cxx.mk                    |   2 +-
 4 files changed, 3 insertions(+), 192 deletions(-)
 delete mode 100644 package/log4cxx/0001-LOGCXX-528.patch
 rename package/log4cxx/{0002-boost-fallback-only-check-for-boost-if-really-needed.patch => 0001-boost-fallback-only-check-for-boost-if-really-needed.patch} (100%)

diff --git a/package/log4cxx/0001-LOGCXX-528.patch b/package/log4cxx/0001-LOGCXX-528.patch
deleted file mode 100644
index d1d3189024..0000000000
--- a/package/log4cxx/0001-LOGCXX-528.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 249dd85494a430d95fd69d89f42b02fd950cda51 Mon Sep 17 00:00:00 2001
-From: Robert Middleton <rm5248@users.noreply.github.com>
-Date: Thu, 22 Jul 2021 15:27:50 -0700
-Subject: [PATCH] LOGCXX-528 (#66)
-
-Fixes for checking that C++11 is available.  Fix for older compilers.
-
-[Retrieved from:
-https://github.com/apache/logging-log4cxx/commit/249dd85494a430d95fd69d89f42b02fd950cda51]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt                                | 10 +++++++++
- src/cmake/boost-fallback/boost-fallback.cmake | 21 ++++++++++---------
- src/main/cpp/hierarchy.cpp                    |  4 ++--
- src/main/include/CMakeLists.txt               |  2 +-
- .../log4cxx/helpers/appenderattachableimpl.h  |  1 +
- .../include/log4cxx/helpers/aprinitializer.h  |  1 +
- src/main/include/log4cxx/helpers/loglog.h     |  1 +
- .../include/log4cxx/helpers/serversocket.h    |  1 +
- src/main/include/log4cxx/level.h              |  1 +
- src/main/include/log4cxx/rolling/action.h     |  1 +
- 10 files changed, 30 insertions(+), 13 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e5b44ef1a..9c6e63902 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -41,6 +41,9 @@ if( NOT "${CMAKE_CXX_STANDARD}")
-     set(CMAKE_CXX_STANDARD 17)
- endif()
- 
-+# Don't allow for compiler-specific extensions
-+set(CMAKE_CXX_EXTENSIONS OFF)
-+
- # Building
- add_subdirectory(src)
- 
-@@ -185,6 +188,13 @@ if(APACHE_MAINTAINER)
- 	)
- endif()
- 
-+#
-+# Check for any fatal configuration errors
-+#
-+if( "${SHARED_MUTEX_IMPL}" STREQUAL "NONE" )
-+    message( FATAL_ERROR "No shared_mutex implementation found.  Requires Boost or C++17" )
-+endif()
-+
- #
- # Output configuration information
- # Similar to APR CMake configuration
-diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
-index a8d7d441b..8285b0b99 100644
---- a/src/cmake/boost-fallback/boost-fallback.cmake
-+++ b/src/cmake/boost-fallback/boost-fallback.cmake
-@@ -56,16 +56,17 @@ try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
- 
- find_package(Boost COMPONENTS thread)
--try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
--    "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedptr.cpp")
--try_compile(Boost_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
--    "${CMAKE_CURRENT_LIST_DIR}/test-boostmutex.cpp")
--try_compile(Boost_SHARED_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
--    "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedmutex.cpp"
--    LINK_LIBRARIES Threads::Threads
--)
--try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
--    "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
-+if( ${Boost_FOUND} )
-+    try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-+        "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedptr.cpp")
-+    try_compile(Boost_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-+        "${CMAKE_CURRENT_LIST_DIR}/test-boostmutex.cpp")
-+    try_compile(Boost_SHARED_MUTEX_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-+        "${CMAKE_CURRENT_LIST_DIR}/test-boostsharedmutex.cpp"
-+        LINK_LIBRARIES Threads::Threads Boost::thread)
-+    try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-+        "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
-+endif( ${Boost_FOUND} )
- 
- # Link the target with the appropriate boost libraries(if required)
- function(boostfallback_link target)
-diff --git a/src/main/cpp/hierarchy.cpp b/src/main/cpp/hierarchy.cpp
-index 4f5174448..c70d39dbb 100644
---- a/src/main/cpp/hierarchy.cpp
-+++ b/src/main/cpp/hierarchy.cpp
-@@ -223,7 +223,7 @@ LoggerPtr Hierarchy::getLogger(const LogString& name,
- 	else
- 	{
- 		LoggerPtr logger(factory->makeNewLoggerInstance(pool, name));
--		logger->setHierarchy(weak_from_this());
-+		logger->setHierarchy(shared_from_this());
- 		loggers->insert(LoggerMap::value_type(name, logger));
- 
- 		ProvisionNodeMap::iterator it2 = provisionNodes->find(name);
-@@ -423,6 +423,6 @@ void Hierarchy::configureRoot(){
- 	// LOGCXX-322 we need to turn the repositroy into a weak_ptr, and we
- 	// can't use weak_from_this() in the constructor.
- 	if( !root->getLoggerRepository().lock() ){
--		root->setHierarchy(weak_from_this());
-+		root->setHierarchy(shared_from_this());
- 	}
- }
-diff --git a/src/main/include/CMakeLists.txt b/src/main/include/CMakeLists.txt
-index 8183660a5..584941c97 100644
---- a/src/main/include/CMakeLists.txt
-+++ b/src/main/include/CMakeLists.txt
-@@ -133,7 +133,7 @@ if( ${STD_SHARED_MUTEX_FOUND} )
- elseif( ${Boost_SHARED_MUTEX_FOUND} )
-     set( SHARED_MUTEX_IMPL "boost::shared_mutex" )
- else()
--    set( SMART_PTR_IMPL "NONE" )
-+    set( SHARED_MUTEX_IMPL "NONE" )
- endif()
- 
- if( ${STD_ATOMIC_FOUND} )
-diff --git a/src/main/include/log4cxx/helpers/appenderattachableimpl.h b/src/main/include/log4cxx/helpers/appenderattachableimpl.h
-index 40e77d93c..b80b5aade 100644
---- a/src/main/include/log4cxx/helpers/appenderattachableimpl.h
-+++ b/src/main/include/log4cxx/helpers/appenderattachableimpl.h
-@@ -28,6 +28,7 @@
- #include <log4cxx/helpers/object.h>
- #include <log4cxx/helpers/pool.h>
- #include <log4cxx/log4cxx.h>
-+#include <mutex>
- 
- namespace log4cxx
- {
-diff --git a/src/main/include/log4cxx/helpers/aprinitializer.h b/src/main/include/log4cxx/helpers/aprinitializer.h
-index 6f3f55070..fccd18e0f 100644
---- a/src/main/include/log4cxx/helpers/aprinitializer.h
-+++ b/src/main/include/log4cxx/helpers/aprinitializer.h
-@@ -30,6 +30,7 @@ extern "C" {
- }
- 
- #include <apr_time.h>
-+#include <mutex>
- 
- namespace log4cxx
- {
-diff --git a/src/main/include/log4cxx/helpers/loglog.h b/src/main/include/log4cxx/helpers/loglog.h
-index d54785ddc..a4c92416a 100644
---- a/src/main/include/log4cxx/helpers/loglog.h
-+++ b/src/main/include/log4cxx/helpers/loglog.h
-@@ -20,6 +20,7 @@
- 
- #include <log4cxx/logstring.h>
- #include <exception>
-+#include <mutex>
- 
- namespace log4cxx
- {
-diff --git a/src/main/include/log4cxx/helpers/serversocket.h b/src/main/include/log4cxx/helpers/serversocket.h
-index e6e6d475e..7da75b969 100644
---- a/src/main/include/log4cxx/helpers/serversocket.h
-+++ b/src/main/include/log4cxx/helpers/serversocket.h
-@@ -19,6 +19,7 @@
- #define _LOG4CXX_HELPERS_SERVER_SOCKET_H
- 
- #include <log4cxx/helpers/socket.h>
-+#include <mutex>
- 
- namespace log4cxx
- {
-diff --git a/src/main/include/log4cxx/level.h b/src/main/include/log4cxx/level.h
-index 4ca4bf28c..7848c902a 100644
---- a/src/main/include/log4cxx/level.h
-+++ b/src/main/include/log4cxx/level.h
-@@ -22,6 +22,7 @@
- #include <log4cxx/logstring.h>
- #include <limits.h>
- #include <log4cxx/helpers/object.h>
-+#include <mutex>
- 
- #if defined(_MSC_VER)
- 	#pragma warning ( push )
-diff --git a/src/main/include/log4cxx/rolling/action.h b/src/main/include/log4cxx/rolling/action.h
-index 0e8d55f36..fc4497813 100644
---- a/src/main/include/log4cxx/rolling/action.h
-+++ b/src/main/include/log4cxx/rolling/action.h
-@@ -21,6 +21,7 @@
- #include <log4cxx/portability.h>
- #include <log4cxx/helpers/object.h>
- #include <log4cxx/helpers/pool.h>
-+#include <mutex>
- 
- namespace log4cxx
- {
diff --git a/package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
similarity index 100%
rename from package/log4cxx/0002-boost-fallback-only-check-for-boost-if-really-needed.patch
rename to package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 6fc0d8836e..12633c8e57 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/0.12.0/apache-log4cxx-0.12.0.tar.gz.sha512
-sha512  00fe571f9c511bf93b17cac8269ce00f7e817e8d723acf62bddff1bbe0e7facd0ab2fd75c01a93870f7e5c66718b2b73fc22c5f193bfd204e34d052b1123e60d  apache-log4cxx-0.12.0.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/0.12.1/apache-log4cxx-0.12.1.tar.gz.sha512
+sha512  807058734cebf7c92e99484313becbc6be63e48bd930889c733318bb78dfec498b66aaa12255ed30879abb005b32e2b965f9dd87ec50d0421ca067f3f66280d9  apache-log4cxx-0.12.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 7612774583..d20cc792a6 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.12.0
+LOG4CXX_VERSION = 0.12.1
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
