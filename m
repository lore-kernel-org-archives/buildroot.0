Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42197F55138
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 08:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55EAC81706;
	Sun,  8 Mar 2026 08:12:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZZmrC7UWZei; Sun,  8 Mar 2026 08:12:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A3981495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772957544;
	bh=jwRLWBOgSwCjy83J3jBS9qS3vMPdfM7qMNGo2BpC/1U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+vDWrMyJR73RCPapdtUL5tUTiUn15PzRdFnxkKhfZE1W03a6wpVjIa7u6JfdPlz4
	 QX6AbFuMT/d1dtDr2cKCWEvrjH1tN8iigGzZrmROrrFF1C92e1nS7tHxr68sHhkEsf
	 /wi521OTeMaiqpGdyWWZmx+RpeOpzN0cZ5Te/OsVEfQcEJdHlcwTuHuQTxF9eNvNsj
	 y5B34iz/ZolwDraHJvnmBNutCjb3bUALHV3GCJveiAhtqqQa+gunEz5/WfvGXSSLB0
	 uYWWXLy8c4gSaAX3TMBEJtKFVkUtaNqdJUqd8MUvmT2TpbwCdmvXHXs7cZbKZm77es
	 Z7LifN/YxfsAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A3981495;
	Sun,  8 Mar 2026 08:12:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97F5A158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89B948133F
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srHU9pVLpSL4 for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 08:12:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.43;
 helo=mail-wr1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58F6E81301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F6E81301
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58F6E81301
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:22 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so5129201f8f.3
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 00:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772957540; x=1773562340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BOhWaMCoCoo5YJMMVjvshzxRfGdj1zHVnOgw4Fne13U=;
 b=LQ4xMFsupq1Xe5yL2aUvYC/FeKOqRQ4WKuD24zorkZcDkVMQ6BIBxQR5Dn7CYnMW4n
 9xp1m1E4nnTNTIDyXJpm86dL3lvsgfv8mPjmT2SMHKHgi0t5t9SvzaPVmC95K3bTeV2G
 0+CmR02aKn3FE57RR9myLwZclUYRw2Plgpz+yprrC9AXxFwjJqBhg1Zp4DaCv4IynHgC
 LYy5j/MHajIF51YOWS866tbfMzavsod8ueDA9ZWq+Le7rUX8vR9XHE6bOom6UHIYToKM
 ziwiG1lgPmVKe0BxM5BRirf3ytdrbDkA6busJPeSzvPzVtdriSbzEnLsvGOB01au94SV
 JwIA==
X-Gm-Message-State: AOJu0YwxoXjyKI1A/xVy6xk0hwQCpgCD0Vn4FtHR9rUcuXtYwQCp1yC4
 /g4NDyl6/aXi3TpA+Xg3jYoxDwR8ipfDZPUg8fcbzrB7NaAkjj1OVal3GnBR6g==
X-Gm-Gg: ATEYQzzJ6GSDGQ97yzOtdugu0RuKcoQxPJRBfPy9B5tgdBHoR57L7xXDwMdA/LR3gkD
 rrBw87nncinBf/EdgmJswhnv/v8xI+5w7UtCHo5EEGM0/CLWEwdmAE0p+HrqK39KEBOtGcY5RHn
 /XtVVtbaptk4iwoehC/FnLIx5gcSsPbs65LvFu+83SeGrHtAAcf8h1+q1uhk3ymA1/wIREoUg9j
 aTMRDXtyHse3acIrbTIpcBEPP9wQkE4MhXEAEMYRT0qG+wa90HeiqwGeaehi0vC4dIbB1QwJCkr
 /356TL6PsXE3XstwzHhXKN/2Ms5AADp/rfjq3s7bigJjr+4MeTRWQ+mPJjm7w5x/xthMbToAJ0F
 IwgiVjp1zbYsckto1M8cikd62cziJF7kq1JWBLOIlWOxj+CtUzBEf7mtUkxu8+4lLBtrT2KZLbn
 AGAgEW1TZDa6WvsHwhFRWulCHnHG1MkJsqmJGbQ8tRQnMeVzMswxQM3rzOI/dt8FI5jJqFb3U5u
 IP8phXGYGGdMLEO9iBcWWDjC8OsfQiSP49nchX2L8CXZA2Dmut4I1awnm1HKA==
X-Received: by 2002:a05:6000:2886:b0:439:b7c9:2edb with SMTP id
 ffacd0b85a97d-439da35c8e3mr13241222f8f.25.1772957539963; 
 Sun, 08 Mar 2026 00:12:19 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:eed7:f3f8:4231:158f])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm18170732f8f.32.2026.03.08.00.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 00:12:18 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 09:12:11 +0100
Message-ID: <20260308081212.777547-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308081212.777547-1-thomas@devoogdt.com>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
 <20260308081212.777547-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 2/3] package/fluent-bit: link against the new
 librdkafka package
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

By this, we can drop 0001-lib-librdkafka-only-require-a-C-compiler.patch.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: no change
---
 ...librdkafka-only-require-a-C-compiler.patch | 118 ------------------
 package/fluent-bit/Config.in                  |   2 +-
 package/fluent-bit/fluent-bit.mk              |   5 +-
 3 files changed, 4 insertions(+), 121 deletions(-)
 delete mode 100644 package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch

diff --git a/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
deleted file mode 100644
index 660ed7bed49..00000000000
--- a/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 7329316bdcc72aceb6bbbdf8711f5bf8894c2a15 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Tue, 25 Jul 2023 09:10:41 +0200
-Subject: [PATCH] lib: librdkafka: only require a C compiler
-
-Upstream: https://github.com/confluentinc/librdkafka/pull/4366
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
----
- lib/librdkafka-2.10.1/CMakeLists.txt          | 22 +++++++++++--
- lib/librdkafka-2.10.1/examples/CMakeLists.txt | 31 ++++++++++++-------
- 2 files changed, 39 insertions(+), 14 deletions(-)
-
-diff --git a/lib/librdkafka-2.10.1/CMakeLists.txt b/lib/librdkafka-2.10.1/CMakeLists.txt
-index f3d05bad7..8ef47053a 100644
---- a/lib/librdkafka-2.10.1/CMakeLists.txt
-+++ b/lib/librdkafka-2.10.1/CMakeLists.txt
-@@ -3,7 +3,16 @@ cmake_minimum_required(VERSION 3.5)
- include("packaging/cmake/parseversion.cmake")
- parseversion("src/rdkafka.h")
- 
--project(RdKafka VERSION ${RDKAFKA_VERSION})
-+project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
-+
-+# Check for CXX support
-+include(CheckLanguage)
-+check_language(CXX)
-+if(CMAKE_CXX_COMPILER)
-+  enable_language(CXX)
-+else()
-+  message(STATUS "C++ compiler not found, skipping C++ support")
-+endif()
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
- 
-@@ -181,7 +190,11 @@ endif()
- 
- option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
- option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
--option(RDKAFKA_BUILD_TESTS "Build tests" ON)
-+
-+if(CMAKE_CXX_COMPILER)
-+    option(RDKAFKA_BUILD_TESTS "Build tests" ON)
-+endif()
-+
- if(WIN32)
-     option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
- endif(WIN32)
-@@ -279,7 +292,10 @@ install(
- )
- 
- add_subdirectory(src)
--add_subdirectory(src-cpp)
-+
-+if(CMAKE_CXX_COMPILER)
-+  add_subdirectory(src-cpp)
-+endif()
- 
- if(RDKAFKA_BUILD_EXAMPLES)
-   add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.10.1/examples/CMakeLists.txt b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-index 91851d2cb..6874195ce 100644
---- a/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
-@@ -5,8 +5,10 @@ endif(WIN32)
- add_executable(producer producer.c ${win32_sources})
- target_link_libraries(producer PUBLIC rdkafka)
- 
--add_executable(producer_cpp producer.cpp ${win32_sources})
--target_link_libraries(producer_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(producer_cpp producer.cpp ${win32_sources})
-+    target_link_libraries(producer_cpp PUBLIC rdkafka++)
-+endif()
- 
- add_executable(consumer consumer.c ${win32_sources})
- target_link_libraries(consumer PUBLIC rdkafka)
-@@ -14,14 +16,20 @@ target_link_libraries(consumer PUBLIC rdkafka)
- add_executable(rdkafka_performance rdkafka_performance.c ${win32_sources})
- target_link_libraries(rdkafka_performance PUBLIC rdkafka)
- 
--add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
--target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
-+    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
-+endif()
- 
--add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
--target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
-+    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
-+endif()
- 
--add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
--target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
-+if(CMAKE_CXX_COMPILER)
-+    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
-+    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
-+endif()
- 
- add_executable(misc misc.c ${win32_sources})
- target_link_libraries(misc PUBLIC rdkafka)
-@@ -73,7 +81,8 @@ if(NOT WIN32)
-     add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
-     target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
- 
--    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
--    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
--
-+    if(CMAKE_CXX_COMPILER)
-+        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
-+        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
-+    endif()
- endif(NOT WIN32)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 2af62797447..f8494064acc 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_C_ARES
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
+	select BR2_PACKAGE_LIBRDKAFKA
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_MSGPACK_C
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index f571896797c..a3a44b8dbe7 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -10,8 +10,8 @@ FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml msgpack-c \
-	nghttp2 openssl sqlite zstd
+FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex librdkafka libyaml \
+	msgpack-c nghttp2 openssl sqlite zstd
 
 FLUENT_BIT_CMAKE_BACKEND = ninja
 
@@ -22,6 +22,7 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_KAFKA=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_MSGPACK=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_SQLITE=Yes \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
