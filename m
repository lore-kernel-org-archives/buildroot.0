Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6A9C001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 588B842067;
	Fri, 28 Jul 2023 19:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 588B842067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qU-eMuAIlp_P; Fri, 28 Jul 2023 19:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D044208A;
	Fri, 28 Jul 2023 19:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D044208A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17B961BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A32844C0
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A32844C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VMLSBsTr1nn for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:32:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E884E84184
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E884E84184
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4581838A0; Fri, 28 Jul 2023 19:32:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:31:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a9ad16ed8e5048a11d19dc411995137b154870a
X-Git-Newrev: a70e226ac1cbfcab3efb16a44d8e5c7bd6a520f1
X-Patchwork-Hint: ignore
Message-Id: <20230728193212.D4581838A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: fix build without c++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a70e226ac1cbfcab3efb16a44d8e5c7bd6a520f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

FLB_{IN,OUT}_KAFKA is enabled by default since v2.1.5,
causing compile errors if no c++ support.

These patches allow the Kafka plugin to be build without C++.

Fixes:
 - http://autobuild.buildroot.net/results/d63/d638390da721eb3bdfcc7a4229114b492aaead99/
 - http://autobuild.buildroot.net/results/709/70960056479eab860e94eed993566fcb78c4dbbe/
 - http://autobuild.buildroot.net/results/366/3667126ee954f927f83ccfbaae3c6fb8ebd07dbb/
 - http://autobuild.buildroot.net/results/9bd/9bd090216b9a8005fc3d020a9c0adf5e825bea59/
 - ...

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fka-CMakeLists.txt-allow-compilation-with.patch | 117 +++++++++++++++++++++
 ...txt-disable-cxx-support-for-librdkafka-77.patch |  29 +++++
 2 files changed, 146 insertions(+)

diff --git a/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
new file mode 100644
index 0000000000..a315fbf7ef
--- /dev/null
+++ b/package/fluent-bit/0002-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
@@ -0,0 +1,117 @@
+From d5492ae7a0fa4e2c19b1d091ad28133fed53d8e2 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 25 Jul 2023 09:10:41 +0200
+Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
+ CXX support #7741
+
+e.g. fluent-bit is a c-only library, so allow compilation without cxx
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/4366
+Upstream: https://github.com/fluent/fluent-bit/pull/7765
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ lib/librdkafka-2.1.0/CMakeLists.txt          | 18 ++++++++++--
+ lib/librdkafka-2.1.0/examples/CMakeLists.txt | 30 +++++++++++++-------
+ 2 files changed, 35 insertions(+), 13 deletions(-)
+
+diff --git a/lib/librdkafka-2.1.0/CMakeLists.txt b/lib/librdkafka-2.1.0/CMakeLists.txt
+index 7f3dd0fc6..c1ee93062 100644
+--- a/lib/librdkafka-2.1.0/CMakeLists.txt
++++ b/lib/librdkafka-2.1.0/CMakeLists.txt
+@@ -3,7 +3,12 @@ cmake_minimum_required(VERSION 3.2)
+ include("packaging/cmake/parseversion.cmake")
+ parseversion("src/rdkafka.h")
+ 
+-project(RdKafka VERSION ${RDKAFKA_VERSION})
++project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
++
++option(RDKAFKA_BUILD_CXX "Enable CXX support" ON)
++if(RDKAFKA_BUILD_CXX)
++  enable_language(CXX)
++endif()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
+ 
+@@ -181,7 +186,11 @@ endif()
+ 
+ option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
+ option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
+-option(RDKAFKA_BUILD_TESTS "Build tests" ON)
++
++if(RDKAFKA_BUILD_CXX)
++    option(RDKAFKA_BUILD_TESTS "Build tests" ON)
++endif()
++
+ if(WIN32)
+     option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
+ endif(WIN32)
+@@ -279,7 +288,10 @@ install(
+ )
+ 
+ add_subdirectory(src)
+-add_subdirectory(src-cpp)
++
++if(RDKAFKA_BUILD_CXX)
++  add_subdirectory(src-cpp)
++endif()
+ 
+ if(RDKAFKA_BUILD_EXAMPLES)
+   add_subdirectory(examples)
+diff --git a/lib/librdkafka-2.1.0/examples/CMakeLists.txt b/lib/librdkafka-2.1.0/examples/CMakeLists.txt
+index bbbb89ad9..51b8b04be 100644
+--- a/lib/librdkafka-2.1.0/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.1.0/examples/CMakeLists.txt
+@@ -5,8 +5,10 @@ endif(WIN32)
+ add_executable(producer producer.c ${win32_sources})
+ target_link_libraries(producer PUBLIC rdkafka)
+ 
+-add_executable(producer_cpp producer.cpp ${win32_sources})
+-target_link_libraries(producer_cpp PUBLIC rdkafka++)
++if(RDKAFKA_BUILD_CXX)
++    add_executable(producer_cpp producer.cpp ${win32_sources})
++    target_link_libraries(producer_cpp PUBLIC rdkafka++)
++endif()
+ 
+ add_executable(consumer consumer.c ${win32_sources})
+ target_link_libraries(consumer PUBLIC rdkafka)
+@@ -14,14 +16,20 @@ target_link_libraries(consumer PUBLIC rdkafka)
+ add_executable(rdkafka_performance rdkafka_performance.c ${win32_sources})
+ target_link_libraries(rdkafka_performance PUBLIC rdkafka)
+ 
+-add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++if(RDKAFKA_BUILD_CXX)
++    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++endif()
+ 
+-add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++if(RDKAFKA_BUILD_CXX)
++    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++endif()
+ 
+-add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
+-target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++if(RDKAFKA_BUILD_CXX)
++    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
++    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++endif()
+ 
+ add_executable(misc misc.c ${win32_sources})
+ target_link_libraries(misc PUBLIC rdkafka)
+@@ -35,6 +43,8 @@ if(NOT WIN32)
+     add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
+     target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
+ 
+-    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
+-    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    if(RDKAFKA_BUILD_CXX)
++        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
++        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    endif()
+ endif(NOT WIN32)
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch b/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
new file mode 100644
index 0000000000..0022d5929c
--- /dev/null
+++ b/package/fluent-bit/0003-CMakeLists.txt-disable-cxx-support-for-librdkafka-77.patch
@@ -0,0 +1,29 @@
+From f5303533fb64bf038dbd8203ac52d94819346239 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Tue, 25 Jul 2023 10:00:36 +0200
+Subject: [PATCH] CMakeLists.txt: disable cxx support for librdkafka #7741
+
+Fluent-bit is c only, so no need to compile cxx.
+This fixes also a compile error in buildroot.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/7765/commits
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index df6b283cf..10e6071f3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -967,6 +967,7 @@ if(FLB_BACKTRACE)
+ endif()
+ 
+ if(FLB_IN_KAFKA OR FLB_OUT_KAFKA)
++    FLB_OPTION(RDKAFKA_BUILD_CXX      Off)
+     FLB_OPTION(RDKAFKA_BUILD_STATIC    On)
+     FLB_OPTION(RDKAFKA_BUILD_EXAMPLES Off)
+     FLB_OPTION(RDKAFKA_BUILD_TESTS    Off)
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
