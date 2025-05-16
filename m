Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27162C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 07:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7610683C22;
	Fri, 16 May 2025 07:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVeO9KYS9rB2; Fri, 16 May 2025 07:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006F783C3B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006F783C3B;
	Fri, 16 May 2025 07:20:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A9A13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B957D60B24
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsgY_WO7EVdW for <buildroot@buildroot.org>;
 Fri, 16 May 2025 07:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F2A51607A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A51607A0
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A51607A0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 07:20:52 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so19176495e9.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 00:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747380051; x=1747984851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO0SMJjt0OgfMRNNAeUcwlec5rqsGyDE78JjKludzCk=;
 b=RCQnfCb2LvR9054/Vfbi03ctdA+ZaZRUB/3It+3qLd57aL76EBRu7JyThztG/qKfry
 hRbpwF2GO8B+6+OOn9UDTKZjo+V9GcBExiRYJNiyaaaLBDXEnLfmROA1ZLTGOBaNGtiH
 3dt7ygqNeEza+c4NPaikNaBCZLeuVt1k0sOVjPp3qjBV8cS9lSS5EajJgy0XUE6niQqt
 08cmjpTrJVmt6gCjWWL8h9Gkgt18SAh6ohWjlaNfg57aEST9iTPV2JEXMXvIoav+rF2g
 r4fWAcnG8wkAtjX+6eHk6PC+xgbiYY0lg/O/O16n7slvkqVgCm3PQJtSKxdhKyoj/KNR
 pJow==
X-Gm-Message-State: AOJu0YziAhf0Hzu/04AoV/PdIdmGG8A8AOaI5Z4QmZkY17z5DsZFX2Nf
 CGgXm9qEaWlihuYaq8N3EGMl0hy/RmGNmplMxD3jYlAapSQtmjZfgDsVVs1tXg==
X-Gm-Gg: ASbGncu89ZikM93wbR/6e4nG8WxZJ+jxIoSxvopFw71pwkDb2AHuhznOGm6B/Stee2s
 4HudyHoxE/kkjt/R7r1Gr27LuOT208lAIe6v3XHdSSpvMFwtsIs/oT1Bc1o6XG7T5+uC3jzhtE/
 US6L+9piQEYZwxcB14of2j/2A79PrUCy9tDGDS+ZdfXDeEiyBHE6Jy9pNvlDZ7y+n/Lgr7c0EW6
 O6bSH6LS5XrUuO/5Q01nuHKJUr8DlLK/a//2ctlIUqwvaOuASZ62J0q2JKuqZX7iifVWEPRUv5q
 kZefHSsHUQqKdRNVySVbopKu47UdtrSGSeSLkacUWamGvr5R0ph3+ZYykSEJTRoW3cTYJxcDyA=
 =
X-Google-Smtp-Source: AGHT+IFLBqVbmXO1VeYNMB+ZRhVO0MePpLlfSjB4wI4T6+AOaJs8JOQfaYzdN+dtMSOVZPucfEsO1A==
X-Received: by 2002:a05:6000:2aa:b0:3a0:8ae7:e2ad with SMTP id
 ffacd0b85a97d-3a35ffd2ad9mr1094208f8f.37.1747380050370; 
 Fri, 16 May 2025 00:20:50 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88a13sm1865522f8f.74.2025.05.16.00.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 00:20:49 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Fri, 16 May 2025 09:20:47 +0200
Message-ID: <20250516072047.3667158-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: bump to 4.0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
- https://fluentbit.io/announcements/v4.0.1/
- https://fluentbit.io/announcements/v4.0.2/

Other remarks:
- Drop the FLB_UNICODE_ENCODER option, as it is no longer needed. [1]

- Added support for FLB_OUT_PGSQL.

- Compile against the buildroot provided zstd package. [2]

- Dropped some patches as they are obsolete. (We use the buildroot packages for them.)
   - 0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
   - 0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
   - 0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch

- Synced the other patches with their upstream equivalent.

[1] https://github.com/fluent/fluent-bit/commit/92de130cead75f66bd565496947263168d2d5c37
[2] https://github.com/fluent/fluent-bit/commit/5f409f55ec667b525716be4afd54b5485c9d55c1

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...kafka-fix-cmake-cross-compile-error.patch} |  5 +-
 ...able-cxx-support-for-librdkafka-7741.patch | 27 ------
 ...ibrdkafka-only-require-a-C-compiler.patch} | 60 ++++++------
 ...lib-miniz-only-require-a-C-compiler.patch} | 12 ++-
 ...eLists.txt-do-not-require-a-CXX-comp.patch | 91 -------------------
 ...-CMakeLists.txt-do-not-require-a-CXX.patch | 37 --------
 ...able-CXX-support-if-tests-are-requir.patch | 34 -------
 package/fluent-bit/Config.in                  |  1 +
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              | 20 ++--
 10 files changed, 54 insertions(+), 235 deletions(-)
 rename package/fluent-bit/{0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch => 0001-plugins-kafka-fix-cmake-cross-compile-error.patch} (92%)
 delete mode 100644 package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
 rename package/fluent-bit/{0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch => 0002-lib-librdkafka-only-require-a-C-compiler.patch} (72%)
 rename package/fluent-bit/{0007-lib-miniz-only-require-a-C-compiler.patch => 0003-lib-miniz-only-require-a-C-compiler.patch} (57%)
 delete mode 100644 package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
 delete mode 100644 package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
 delete mode 100644 package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch

diff --git a/package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
similarity index 92%
rename from package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
rename to package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
index 787129eb4c..de5dc54e75 100644
--- a/package/fluent-bit/0005-plugins-in-out-_kafka-CMakeLists.txt-fix-cross-compi.patch
+++ b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
@@ -1,8 +1,7 @@
-From 845076d4e8b480da41f80efafd97c199adbb831e Mon Sep 17 00:00:00 2001
+From f32c4e909ec4a4872c2c5fc186f27d1f7e4e8c2a Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sat, 16 Nov 2024 19:46:28 +0100
-Subject: [PATCH] plugins/{in,out}_kafka/CMakeLists.txt: fix cross compile
- error
+Subject: [PATCH] plugins: kafka: fix cmake cross compile error
 
 KAFKA_INCLUDEDIR is not set if FLB_PREFER_SYSTEM_LIB_KAFKA is not used,
 when cross-compiling, it just translates to -I/librdkafka, which is not allowed.
diff --git a/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch b/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
deleted file mode 100644
index afba3d58eb..0000000000
--- a/package/fluent-bit/0002-build-disable-cxx-support-for-librdkafka-7741.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 16dadccb7e718edc27797fa47e251547264c4285 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Tue, 25 Jul 2023 10:00:36 +0200
-Subject: [PATCH] build: disable cxx support for librdkafka #7741
-
-Fluent-bit is c only, so no need to compile cxx.
-This fixes also a compile error in buildroot.
-
-Upstream: https://github.com/fluent/fluent-bit/pull/9277
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- cmake/kafka.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cmake/kafka.cmake b/cmake/kafka.cmake
-index 3a0ebfed2..af0e2f460 100644
---- a/cmake/kafka.cmake
-+++ b/cmake/kafka.cmake
-@@ -1,4 +1,5 @@
- # kafka cmake
-+FLB_OPTION(RDKAFKA_BUILD_CXX      Off)
- FLB_OPTION(RDKAFKA_BUILD_STATIC    On)
- FLB_OPTION(RDKAFKA_BUILD_EXAMPLES Off)
- FLB_OPTION(RDKAFKA_BUILD_TESTS    Off)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
similarity index 72%
rename from package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
rename to package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
index 21e8de4236..d7c6bba20b 100644
--- a/package/fluent-bit/0001-lib-librdkafka-CMakeLists.txt-allow-compilation-with.patch
+++ b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
@@ -1,73 +1,73 @@
-From 73832f5b7b6c3971d5a7a5cd2c0bcd429cd779c6 Mon Sep 17 00:00:00 2001
+From dea6fb0138d9356ebdc4983a61c185bc759d86b0 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
-Subject: [PATCH] lib: librdkafka: CMakeLists.txt: allow compilation without
- CXX support #7741
-
-e.g. fluent-bit is a c-only library, so allow compilation without cxx
+Subject: [PATCH] lib: librdkafka: only require a C compiler
 
 Upstream: https://github.com/confluentinc/librdkafka/pull/4366
-Upstream: https://github.com/fluent/fluent-bit/pull/9277
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
- lib/librdkafka-2.4.0/CMakeLists.txt          | 18 ++++++++++--
- lib/librdkafka-2.4.0/examples/CMakeLists.txt | 31 +++++++++++++-------
- 2 files changed, 35 insertions(+), 14 deletions(-)
+ lib/librdkafka-2.8.0/CMakeLists.txt          | 22 ++++++++++++--
+ lib/librdkafka-2.8.0/examples/CMakeLists.txt | 31 +++++++++++++-------
+ 2 files changed, 39 insertions(+), 14 deletions(-)
 
-diff --git a/lib/librdkafka-2.4.0/CMakeLists.txt b/lib/librdkafka-2.4.0/CMakeLists.txt
-index 7f3dd0fc6..c1ee93062 100644
---- a/lib/librdkafka-2.4.0/CMakeLists.txt
-+++ b/lib/librdkafka-2.4.0/CMakeLists.txt
-@@ -3,7 +3,12 @@ cmake_minimum_required(VERSION 3.2)
+diff --git a/lib/librdkafka-2.8.0/CMakeLists.txt b/lib/librdkafka-2.8.0/CMakeLists.txt
+index f3d05bad7..8ef47053a 100644
+--- a/lib/librdkafka-2.8.0/CMakeLists.txt
++++ b/lib/librdkafka-2.8.0/CMakeLists.txt
+@@ -3,7 +3,16 @@ cmake_minimum_required(VERSION 3.5)
  include("packaging/cmake/parseversion.cmake")
  parseversion("src/rdkafka.h")
  
 -project(RdKafka VERSION ${RDKAFKA_VERSION})
 +project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
 +
-+option(RDKAFKA_BUILD_CXX "Enable CXX support" ON)
-+if(RDKAFKA_BUILD_CXX)
++# Check for CXX support
++include(CheckLanguage)
++check_language(CXX)
++if(CMAKE_CXX_COMPILER)
 +  enable_language(CXX)
++else()
++  message(STATUS "C++ compiler not found, skipping C++ support")
 +endif()
  
  set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
  
-@@ -181,7 +186,11 @@ endif()
+@@ -181,7 +190,11 @@ endif()
  
  option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
  option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
 -option(RDKAFKA_BUILD_TESTS "Build tests" ON)
 +
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +    option(RDKAFKA_BUILD_TESTS "Build tests" ON)
 +endif()
 +
  if(WIN32)
      option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
  endif(WIN32)
-@@ -279,7 +288,10 @@ install(
+@@ -279,7 +292,10 @@ install(
  )
  
  add_subdirectory(src)
 -add_subdirectory(src-cpp)
 +
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +  add_subdirectory(src-cpp)
 +endif()
  
  if(RDKAFKA_BUILD_EXAMPLES)
    add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.4.0/examples/CMakeLists.txt b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
-index 8c0079abe..c9336b729 100644
---- a/lib/librdkafka-2.4.0/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.4.0/examples/CMakeLists.txt
+diff --git a/lib/librdkafka-2.8.0/examples/CMakeLists.txt b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
+index 91851d2cb..6874195ce 100644
+--- a/lib/librdkafka-2.8.0/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
  add_executable(producer producer.c ${win32_sources})
  target_link_libraries(producer PUBLIC rdkafka)
  
 -add_executable(producer_cpp producer.cpp ${win32_sources})
 -target_link_libraries(producer_cpp PUBLIC rdkafka++)
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +    add_executable(producer_cpp producer.cpp ${win32_sources})
 +    target_link_libraries(producer_cpp PUBLIC rdkafka++)
 +endif()
@@ -80,35 +80,35 @@ index 8c0079abe..c9336b729 100644
  
 -add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
 -target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
 +    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
 +endif()
  
 -add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
 -target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
 +    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
 +endif()
  
 -add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
 -target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
-+if(RDKAFKA_BUILD_CXX)
++if(CMAKE_CXX_COMPILER)
 +    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
 +    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
 +endif()
  
  add_executable(misc misc.c ${win32_sources})
  target_link_libraries(misc PUBLIC rdkafka)
-@@ -70,7 +78,8 @@ if(NOT WIN32)
+@@ -73,7 +81,8 @@ if(NOT WIN32)
      add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
      target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
  
 -    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
 -    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
 -
-+    if(RDKAFKA_BUILD_CXX)
++    if(CMAKE_CXX_COMPILER)
 +        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
 +        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
 +    endif()
diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch
similarity index 57%
rename from package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
rename to package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch
index bfd32d6b68..29c2d9e220 100644
--- a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
+++ b/package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch
@@ -1,16 +1,20 @@
-From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
+From abb3b388aaf7ea72ea1fcad77ead52f15a0cf543 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Tue, 1 Apr 2025 23:01:13 +0200
+Date: Tue, 1 Apr 2025 22:56:00 +0200
 Subject: [PATCH] lib: miniz: only require a C compiler
 
-Upstream: https://github.com/richgel999/miniz/pull/338
+Commit https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
+"Add some catch2 tests" dropped that C flag, but should instead only have added a simple
+enable_language call for the tests only.
+
+Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
 Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
 ---
  lib/miniz/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
-index ce6ade1c0..91012b36a 100644
+index 859133ad0..f3d80f80a 100644
 --- a/lib/miniz/CMakeLists.txt
 +++ b/lib/miniz/CMakeLists.txt
 @@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
diff --git a/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch b/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
deleted file mode 100644
index 339e9b50d2..0000000000
--- a/package/fluent-bit/0003-lib-nghttp2-CMakeLists.txt-do-not-require-a-CXX-comp.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From ecd0e822c64c3f0a8194f8c24be15606f47f8d59 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 25 Aug 2024 20:09:21 +0200
-Subject: [PATCH] lib: nghttp2: CMakeLists.txt: do not require a CXX compiler
-
-Upstream: https://github.com/nghttp2/nghttp2/commit/d9d266124c9f851bab7927321da6637d930367e2
-Upstream: https://github.com/fluent/fluent-bit/pull/9277
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/nghttp2/CMakeLists.txt | 50 ++++++++++++++++++++------------------
- 1 file changed, 26 insertions(+), 24 deletions(-)
-
-diff --git a/lib/nghttp2/CMakeLists.txt b/lib/nghttp2/CMakeLists.txt
-index ee4cb0a4a..90c00b1dd 100644
---- a/lib/nghttp2/CMakeLists.txt
-+++ b/lib/nghttp2/CMakeLists.txt
-@@ -24,7 +24,7 @@
- 
- cmake_minimum_required(VERSION 3.0)
- # XXX using 1.8.90 instead of 1.9.0-DEV
--project(nghttp2 VERSION 1.58.90)
-+project(nghttp2 VERSION 1.58.90 LANGUAGES C)
- 
- # See versioning rule:
- #  https://www.gnu.org/software/libtool/manual/html_node/Updating-version-info.html
-@@ -122,29 +122,31 @@ else()
-   set(HINT_NORETURN)
- endif()
- 
--include(ExtractValidFlags)
--foreach(_cxx1x_flag -std=c++14)
--  extract_valid_cxx_flags(_cxx1x_flag_supported ${_cxx1x_flag})
--  if(_cxx1x_flag_supported)
--    set(CXX1XCXXFLAGS ${_cxx1x_flag})
--    break()
--  endif()
--endforeach()
-+if(NOT ENABLE_LIB_ONLY)
-+  include(ExtractValidFlags)
-+  foreach(_cxx1x_flag -std=c++14)
-+    extract_valid_cxx_flags(_cxx1x_flag_supported ${_cxx1x_flag})
-+    if(_cxx1x_flag_supported)
-+      set(CXX1XCXXFLAGS ${_cxx1x_flag})
-+      break()
-+    endif()
-+  endforeach()
- 
--include(CMakePushCheckState)
--include(CheckCXXSourceCompiles)
--cmake_push_check_state()
--set(CMAKE_REQUIRED_DEFINITIONS "${CXX1XCXXFLAGS}")
--# Check that std::future is available.
--check_cxx_source_compiles("
--#include <vector>
--#include <future>
--int main() { std::vector<std::future<int>> v; }" HAVE_STD_FUTURE)
--# Check that std::map::emplace is available for g++-4.7.
--check_cxx_source_compiles("
--#include <map>
--int main() { std::map<int, int>().emplace(1, 2); }" HAVE_STD_MAP_EMPLACE)
--cmake_pop_check_state()
-+  include(CMakePushCheckState)
-+  include(CheckCXXSourceCompiles)
-+  cmake_push_check_state()
-+  set(CMAKE_REQUIRED_DEFINITIONS "${CXX1XCXXFLAGS}")
-+  # Check that std::future is available.
-+  check_cxx_source_compiles("
-+  #include <vector>
-+  #include <future>
-+  int main() { std::vector<std::future<int>> v; }" HAVE_STD_FUTURE)
-+  # Check that std::map::emplace is available for g++-4.7.
-+  check_cxx_source_compiles("
-+  #include <map>
-+  int main() { std::map<int, int>().emplace(1, 2); }" HAVE_STD_MAP_EMPLACE)
-+  cmake_pop_check_state()
-+endif()
- 
- 
- # Checks for libraries.
-@@ -177,7 +179,7 @@ endif()
- # openssl (for src)
- include(CheckSymbolExists)
- set(HAVE_OPENSSL    ${OPENSSL_FOUND})
--if(OPENSSL_FOUND)
-+if(NOT ENABLE_LIB_ONLY AND OPENSSL_FOUND)
-   set(OPENSSL_INCLUDE_DIRS  ${OPENSSL_INCLUDE_DIR})
-   cmake_push_check_state()
-   set(CMAKE_REQUIRED_INCLUDES   "${OPENSSL_INCLUDE_DIR}")
--- 
-2.43.0
-
diff --git a/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch b/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
deleted file mode 100644
index 39d235f3d4..0000000000
--- a/package/fluent-bit/0004-lib-luajit-cmake-CMakeLists.txt-do-not-require-a-CXX.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From eee42b2b0998555b035bdd71b1a815db16c0449f Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sun, 25 Aug 2024 20:10:27 +0200
-Subject: [PATCH] lib: luajit-cmake: CMakeLists.txt: do not require a CXX
- compiler
-
-Upstream: https://github.com/fluent/fluent-bit/pull/9277
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/luajit-cmake/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/luajit-cmake/CMakeLists.txt b/lib/luajit-cmake/CMakeLists.txt
-index 7baf878c7..051a800f5 100644
---- a/lib/luajit-cmake/CMakeLists.txt
-+++ b/lib/luajit-cmake/CMakeLists.txt
-@@ -13,7 +13,7 @@ endif()
- 
- get_directory_property(hasParent PARENT_DIRECTORY)
- if(LUAJIT_DIR)
--  project(luajit)
-+  project(luajit LANGUAGES C)
-   include(LuaJIT.cmake)
-   if (hasParent)
-     set(LUA_TARGET $<TARGET_FILE:luajit> PARENT_SCOPE)
-@@ -24,7 +24,7 @@ if(LUAJIT_DIR)
-     endif()
-   endif()
- elseif(LUA_DIR)
--  project(lua)
-+  project(lua LANGUAGES C)
-   include(lua.cmake)
-   if (hasParent)
-     set(LUA_TARGET $<TARGET_FILE:lua> PARENT_SCOPE)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
deleted file mode 100644
index f7b282165c..0000000000
--- a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Tue, 1 Apr 2025 22:43:30 +0200
-Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
-
-Upstream: https://github.com/facebook/zstd/pull/4357/files
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
-index 347d41c0f..70e233df3 100644
---- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
-+++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
-@@ -37,7 +37,6 @@ project(zstd
-   VERSION "${ZSTD_FULL_VERSION}"
-   LANGUAGES C   # Main library is in C
-             ASM # And ASM
--            CXX # Testing contributed code also utilizes CXX
-   )
- 
- message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
-@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
- endif ()
- 
- if (ZSTD_BUILD_TESTS)
-+    enable_language(CXX)
-     enable_testing()
-     if (NOT ZSTD_BUILD_STATIC)
-         message(SEND_ERROR "You need to build static library to build tests")
--- 
-2.43.0
-
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 420e40c9c4..71488afd73 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
 	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_ZSTD
 	help
 	  Fast and Lightweight Logs and Metrics processor.
 
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index e4394f69d1..37943c6a4f 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ef9a479c8cc12e01de6682e0cfd21a0a5d335a0ab9be14bbca37211fbf428cad  fluent-bit-4.0.0.tar.gz
+sha256  aa0577ba7251081c8d5398b2a905b5b0585bb657ca13b39a5e12931437516f08  fluent-bit-4.0.2.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 915ec692b3..23b899e1dd 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.0.0
+FLUENT_BIT_VERSION = 4.0.2
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml nghttp2 openssl
+FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml nghttp2 openssl \
+	zstd
 
 FLUENT_BIT_CMAKE_BACKEND = ninja
 
@@ -21,12 +22,8 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
-	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes
-
-ifeq ($(BR2_INSTALL_LIBSTDCPP),)
-FLUENT_BIT_CONF_OPTS += \
-	-DFLB_UNICODE_ENCODER=No
-endif
+	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_ZSTD=Yes
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
@@ -68,6 +65,13 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+FLUENT_BIT_CONF_OPTS += -DFLB_OUT_PGSQL=Yes
+FLUENT_BIT_DEPENDENCIES += postgresql
+else
+FLUENT_BIT_CONF_OPTS += -DFLB_OUT_PGSQL=No
+endif
+
 # Force bundled miniz to be linked statically.
 # https://github.com/fluent/fluent-bit/issues/6711
 FLUENT_BIT_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
