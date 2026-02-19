Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FC1C531E1
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 22:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CAFE417CE;
	Thu, 19 Feb 2026 22:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJkG8wNRODZ1; Thu, 19 Feb 2026 22:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5F2417BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771539185;
	bh=3P7Pp1tO9fC8n/YYVMhfeCquxybxhaUDSFXhYBw3nu8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bt+RBf2QmfeBSyfSDk/e+mj+RUz9XxZ9WpKNHcTxoMidU23BHmxGYjK4Ba5bOI7k6
	 siSOs3GOZU/rz2M0K3rPs3SwY054gvwf+/0YfW4yAV84S0nMLZVEgxFkkVQLpOSFbd
	 whBbp1m9nx/qlWl9d9d2Y3HnUABdvbsqvKdzQt67JQYSgFMikhugllA1oDmGpcigvX
	 A0HFoxOMuCbbjzVqX62pCjlELBzlStbOFjxDwh2W6HT4yqFeSbXYJnIt3UurRIkNcx
	 uPMj2hSKxaYEen9tQn+Uaa2aR73pX/CYcrF8uszlgzVAC6QpUQTXFJ5aYdmhOQa45t
	 FIQL9km1imVAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5F2417BD;
	Thu, 19 Feb 2026 22:13:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6385B206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5479683CBC
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uWVM_kW69B1a for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 22:13:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.41;
 helo=mail-ej1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25B5D83C35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B5D83C35
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25B5D83C35
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:01 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b884d5c787bso243614466b.0
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:13:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771539179; x=1772143979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j5QLgOM/ViuDah935AarGu62YOpVQdVMXjYgO6bbeww=;
 b=s3/eMvvMc+zD7S+aEzzM7yigbsdbwTarTNzkCwy+jLt3EPr9JgiD01T3j0lWCIPFXq
 WQyAJ4di8ez7nt1ZXjoDX0rpOI4bVC+3LLSnO2VeT6R+WBfelB31Gxjsg04a6uvT1JyJ
 rhiSEM1lBjlfs7i31iCzR1tFhJSBjbAfwFej41g4YyZDHLsVoo6RD4WIdHoSofqmTyGA
 /P+k+563K1G6GOaf6lhtqm5/WIri0M8mulPHMeBck8CU4D4MUUWMzqjJDw5A1iM773wu
 1tUAB4Rwjv6Kcj6gdkfeOuJ0F1eh2q0nh64Qh1VvA+/q+isNP6zlYEVGODAXAf9zs/zd
 G6fQ==
X-Gm-Message-State: AOJu0YxOOUzijx2lNpDbEI5K5IyGCXyvfY7Kd5zK2qY4axp3mJp81fNl
 0BOxKJ/F8iLfot+IDY07rw5ujwZmwB/2wn52p+XkQYfpnNYssmQAyvbmdnFkuQ==
X-Gm-Gg: AZuq6aKwlscf56jJH0Oyvla4Zc6raNJhChes0SOZiXd49n+9FDMf/n8CB3XOqk63Bbj
 JrC14S6Nd3CqBWH6U4HXgsI9UjSL9eSD2Gut5ji3z/50XN6LgHl83zE33upbYLsBTbEEIqDobRp
 0rihHJ5vcCMZ3KhTo+hceodOrvwqkD6ol4GaprwfA1XidYbEE7Zeo8804BYvd26Wy+F6jCWIbw+
 FN/5JzecRTRwUUqAasim2y2Y8m0JUMmAV8WIZkcfxtjO1AHmVEe8P2tzm0OdWWb0y9CrBV5F5dQ
 ORi51vBqktzVojwS50WH5tPN35HOWSSsgouOZmHHx+hNeiOHIKuzxpRI+aPXgPBU+nRZjCb71iF
 ODHX8jaLkFbx8Aff1qBmPwvWyvm5m9fWd4aWhbKcdx1kFjoE0sQpqx4iC2g94vnvr0mtqSVAhV5
 vxiUyM0Da7azkvkRo/65nKpbwt6DPDOHyEXCCrncgZO4gBLb4mrdF6KoY+70cEGNiCkMU3Xg06Q
 2ZogCeaNyM=
X-Received: by 2002:a17:907:971b:b0:b8e:d260:caf8 with SMTP id
 a640c23a62f3a-b8fc3c7b7ecmr1206348766b.33.1771539178580; 
 Thu, 19 Feb 2026 14:12:58 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:b2c8:3544:a853:192e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8fc7627fa7sm624323566b.38.2026.02.19.14.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 14:12:58 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Feb 2026 23:12:51 +0100
Message-ID: <20260219221253.2217784-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219221253.2217784-1-thomas@devoogdt.com>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 2/3] package/fluent-bit: link against the new
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
