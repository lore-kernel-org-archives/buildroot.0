Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B52DF55126
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 08:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC3A81570;
	Sun,  8 Mar 2026 08:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ji1OXMeLwqF1; Sun,  8 Mar 2026 08:12:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7325881339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772957543;
	bh=E6lGhx7wm8Lq1qnJdw4EGHPBCO4U52mSYckJJ/nprOE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P1y/RCk5PzyBmylRMUAN+1tIz/+SsoSS/vCsTdf56sv2bTy2M6o2WVNJ7JZuLBqNk
	 4hFqCsRQHZ/nmL2ElWlHBo4lOGI4hfbvqlXC6IdhMeofCDYlxNRTi/EKrPnic3w2JZ
	 p+GwBK8QHihAGXXViNKAd6jJuiC2MkUpJlyPChePLVYwUF+y8p780ocK4ckEpa9Td8
	 cN4DUXFPMagoAH81QEFduIZrgp5D4qw7iMzcjrbYD9vxp9vIiKktv3yn5g0NH5rJf4
	 yyBBzJMadhRDSfDeqWZAhv/SBuYpDH9U3vNBw33pueIgDlTmzf8eykSQpAqeXfdeoY
	 OTo4dnRls+DDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7325881339;
	Sun,  8 Mar 2026 08:12:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A23D223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97A0C401EA
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlwGpeOdQGnB for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 08:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1962B400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1962B400E0
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1962B400E0
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 08:12:19 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso1059367f8f.3
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 00:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772957538; x=1773562338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s9K8uuajIBJzYueg+2zDR93btElrWavviQE2xLccH1M=;
 b=JnpC/J67cnW2VUhj7ieOH7trwQsUT/PQ6n2k4uvXRrQeP+By2/2c9x9cACfOS3UhRL
 aSLnHrb4N5f9wTZ2kGt0rUiDe9NuYpbnpc/dIgXP6L1izBvtqMVfyk+FWcqNuAt7LM2o
 LOuaXPmBDglYagbMdE2SdIL2nD4QKiQR1QeIZflzzLu65slM7/UbROYSitYu17fvjRzQ
 RJ2iaJfW4Q4RCx8Jx9YahWnZQ5gpQbKYa26wzfUapfZ9PyHg4Gl7lYF81swXiR8LJFt0
 bpJIT+hRVWO5sc+kFHfl6U+xjh7MxU6YNMmnPgNTt1f6KcnQDqoo75xsb6wNAKnF+Wk8
 YO2g==
X-Gm-Message-State: AOJu0YwGFRLmQz7jTC0wTVOjriQmLJH5ckcwktAzdFONh3m9A5R2hp6b
 mmCRzeLZY357YJcYla/LZYCc0CxiVs0YXu1nD2bnK09zo/RDguju2q+ifAeuKQ==
X-Gm-Gg: ATEYQzxfIlEEhubuKwNDcDrPFC7vVrHBcIOOFrNT0el0a+fVv1qqzEn3GHJoaJifr7i
 v9bZfzqrAT3wIhfQXYaaSgWqGurqhirXeqLI7uCeL8xY8R+tCsHcBjj4V1fFPK1Q8zCJejmXZvi
 4VL5dgZkI4LNpnX9BgXg28MAAYLnv4451uyK55r3Gz8v4LZVBUyYGoowDy1249WomcTfPXnTL9p
 xX1BRwESNk1rTiuZgBU55Zs08wGC1IRvp6H34sjnvG7F5jr7rT5nd8UNIq0RrTFcJblIFn9l27v
 Stf8T0MuzAGqTVgW2tsKHspZEUABvZqBp6P5fhV4OY29F6pM9KelNG4aLU3MaKpYmlAkMTh3O5T
 LF3Yjcx1cbcdQb4C4l2LFbVAPzkwJ7snkwexByqQLSwNYIf4C2UiPdDskUlBE+5yeV+wXO88tBa
 1qPJLBQ/d9W7pSrUhFjmgzSYyn3hYikgGZ9Z0ta4ekSehvMvJuqh9m8/aEiFrzmGLvzW2SwGAjo
 nyyoCziXy7PsT9kUWOenQ/7OovQ5Xek5TGPU4fZofoz7ZPEo5XM78UfOyO0ptITDEw9FdWa
X-Received: by 2002:a05:6000:288a:b0:439:abcd:b2fb with SMTP id
 ffacd0b85a97d-439da67c00emr12558100f8f.32.1772957537507; 
 Sun, 08 Mar 2026 00:12:17 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:eed7:f3f8:4231:158f])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm18170732f8f.32.2026.03.08.00.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 00:12:17 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 09:12:10 +0100
Message-ID: <20260308081212.777547-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219221253.2217784-1-thomas@devoogdt.com>
References: <20260219221253.2217784-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2 1/3] package/librdkafka: add new package
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

Will be a dependency of fluent-bit.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: bump to 2.13.2
---
$ ./utils/test-pkg -p librdkafka -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: OK
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: OK
32 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
$ ./utils/test-pkg -p librdkafka -c librdkafka.config -a
                             arm-aarch64 [ 1/32]: OK
                   bootlin-aarch64-glibc [ 2/32]: OK
               bootlin-aarch64-glibc-old [ 3/32]: OK
               bootlin-arcle-hs38-uclibc [ 4/32]: OK
                    bootlin-armv5-uclibc [ 5/32]: OK
                     bootlin-armv7-glibc [ 6/32]: OK
                   bootlin-armv7m-uclibc [ 7/32]: OK
                      bootlin-armv7-musl [ 8/32]: OK
                bootlin-m68k-5208-uclibc [ 9/32]: SKIPPED
               bootlin-m68k-68040-uclibc [10/32]: OK
             bootlin-microblazeel-uclibc [11/32]: OK
                  bootlin-mips64el-glibc [12/32]: OK
                bootlin-mipsel32r6-glibc [13/32]: OK
                   bootlin-mipsel-uclibc [14/32]: OK
                 bootlin-openrisc-uclibc [15/32]: OK
        bootlin-powerpc64le-power8-glibc [16/32]: OK
           bootlin-powerpc-e500mc-uclibc [17/32]: OK
                   bootlin-riscv32-glibc [18/32]: OK
                   bootlin-riscv64-glibc [19/32]: OK
                    bootlin-riscv64-musl [20/32]: OK
                 bootlin-s390x-z13-glibc [21/32]: OK
                      bootlin-sh4-uclibc [22/32]: OK
                   bootlin-sparc64-glibc [23/32]: OK
                    bootlin-sparc-uclibc [24/32]: OK
                    bootlin-x86-64-glibc [25/32]: OK
                     bootlin-x86-64-musl [26/32]: OK
                   bootlin-x86-64-uclibc [27/32]: OK
                   bootlin-x86-i686-musl [28/32]: OK
                   bootlin-xtensa-uclibc [29/32]: OK
                            br-arm-basic [30/32]: OK
                    br-arm-full-nothread [31/32]: SKIPPED
                      br-arm-full-static [32/32]: OK
32 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
$ cat librdkafka.config
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_ZSTD=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBRDKAFKA=y
---
 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...-allow-compilation-without-C-support.patch | 127 ++++++++++++++++++
 ....c-fix-curl-curl.h-include-when-WITH.patch |  32 +++++
 package/librdkafka/Config.in                  |  14 ++
 package/librdkafka/librdkafka.hash            |   4 +
 package/librdkafka/librdkafka.mk              |  51 +++++++
 7 files changed, 230 insertions(+)
 create mode 100644 package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
 create mode 100644 package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
 create mode 100644 package/librdkafka/Config.in
 create mode 100644 package/librdkafka/librdkafka.hash
 create mode 100644 package/librdkafka/librdkafka.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6bd420ae31e..f7c5b077067 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3194,6 +3194,7 @@ F:	package/fcgiwrap/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
+F:	package/librdkafka/
 F:	package/libsoup3/
 F:	package/yq/
 
diff --git a/package/Config.in b/package/Config.in
index 5c7ab571014..07d7e49ae7b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2499,6 +2499,7 @@ endif
 	source "package/leafnode2/Config.in"
 	source "package/lft/Config.in"
 	source "package/lftp/Config.in"
+	source "package/librdkafka/Config.in"
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
 	source "package/links/Config.in"
diff --git a/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
new file mode 100644
index 00000000000..9615aef408c
--- /dev/null
+++ b/package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
@@ -0,0 +1,127 @@
+From 4584734fc039e06dea71c94045283f3108c7fae8 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Feb 2026 20:41:10 +0100
+Subject: [PATCH] CMakeLists.txt: allow compilation without C++ support
+
+$ CXX=/bin/false cmake . && make
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5311
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CMakeLists.txt          | 25 ++++++++++++++++++++-----
+ examples/CMakeLists.txt | 30 ++++++++++++++++++++----------
+ 2 files changed, 40 insertions(+), 15 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f3d05bad..7676f897 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,15 @@ cmake_minimum_required(VERSION 3.5)
+ include("packaging/cmake/parseversion.cmake")
+ parseversion("src/rdkafka.h")
+ 
+-project(RdKafka VERSION ${RDKAFKA_VERSION})
++project(RdKafka VERSION ${RDKAFKA_VERSION} LANGUAGES C)
++
++include(CheckLanguage)
++check_language(CXX)
++if(CMAKE_CXX_COMPILER)
++  enable_language(CXX)
++else()
++  message(STATUS "C++ compiler not found, skipping C++ support")
++endif()
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/packaging/cmake/Modules/")
+ 
+@@ -181,7 +189,7 @@ endif()
+ 
+ option(RDKAFKA_BUILD_STATIC "Build static rdkafka library" OFF)
+ option(RDKAFKA_BUILD_EXAMPLES "Build examples" ON)
+-option(RDKAFKA_BUILD_TESTS "Build tests" ON)
++option(RDKAFKA_BUILD_TESTS "Build tests" CMAKE_CXX_COMPILER)
+ if(WIN32)
+     option(WITHOUT_WIN32_CONFIG "Avoid including win32_config.h on cmake builds" ON)
+ endif(WIN32)
+@@ -279,13 +287,20 @@ install(
+ )
+ 
+ add_subdirectory(src)
+-add_subdirectory(src-cpp)
++
++if(CMAKE_CXX_COMPILER)
++  add_subdirectory(src-cpp)
++endif()
+ 
+ if(RDKAFKA_BUILD_EXAMPLES)
+   add_subdirectory(examples)
+ endif()
+ 
+ if(RDKAFKA_BUILD_TESTS)
+-  enable_testing()
+-  add_subdirectory(tests)
++  if(CMAKE_CXX_COMPILER)
++    enable_testing()
++    add_subdirectory(tests)
++  else()
++    message(FATAL_ERROR "Building tests needs C++ suport")
++  endif()
+ endif()
+diff --git a/examples/CMakeLists.txt b/examples/CMakeLists.txt
+index 91851d2c..28ce6e79 100644
+--- a/examples/CMakeLists.txt
++++ b/examples/CMakeLists.txt
+@@ -5,8 +5,10 @@ endif(WIN32)
+ add_executable(producer producer.c ${win32_sources})
+ target_link_libraries(producer PUBLIC rdkafka)
+ 
+-add_executable(producer_cpp producer.cpp ${win32_sources})
+-target_link_libraries(producer_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(producer_cpp producer.cpp ${win32_sources})
++    target_link_libraries(producer_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+ add_executable(consumer consumer.c ${win32_sources})
+ target_link_libraries(consumer PUBLIC rdkafka)
+@@ -14,14 +16,20 @@ target_link_libraries(consumer PUBLIC rdkafka)
+ add_executable(rdkafka_performance rdkafka_performance.c ${win32_sources})
+ target_link_libraries(rdkafka_performance PUBLIC rdkafka)
+ 
+-add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(rdkafka_example_cpp rdkafka_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+-add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
+-target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(rdkafka_complex_consumer_example_cpp rdkafka_complex_consumer_example.cpp ${win32_sources})
++    target_link_libraries(rdkafka_complex_consumer_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+-add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
+-target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++if(CMAKE_CXX_COMPILER)
++    add_executable(openssl_engine_example_cpp openssl_engine_example.cpp ${win32_sources})
++    target_link_libraries(openssl_engine_example_cpp PUBLIC rdkafka++)
++endif(CMAKE_CXX_COMPILER)
+ 
+ add_executable(misc misc.c ${win32_sources})
+ target_link_libraries(misc PUBLIC rdkafka)
+@@ -73,7 +81,9 @@ if(NOT WIN32)
+     add_executable(rdkafka_complex_consumer_example rdkafka_complex_consumer_example.c)
+     target_link_libraries(rdkafka_complex_consumer_example PUBLIC rdkafka)
+ 
+-    add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
+-    target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    if(CMAKE_CXX_COMPILER)
++        add_executable(kafkatest_verifiable_client kafkatest_verifiable_client.cpp)
++        target_link_libraries(kafkatest_verifiable_client PUBLIC rdkafka++)
++    endif(CMAKE_CXX_COMPILER)
+ 
+ endif(NOT WIN32)
+-- 
+2.43.0
+
diff --git a/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch b/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
new file mode 100644
index 00000000000..dec80d538c9
--- /dev/null
+++ b/package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
@@ -0,0 +1,32 @@
+From 5061a5b33dce11ada740e2a34137dce6934b731a Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Feb 2026 18:37:16 +0100
+Subject: [PATCH] src/rdkafka_conf.c: fix curl/curl.h include when
+ WITH_CURL=OFF
+
+Change #ifdef to #if for WITH_OAUTHBEARER_OIDC preprocessor check.
+When using CMake's cmakedefine01, the macro is always defined (as 0 or 1),
+so #ifdef always evaluates to true. Using #if correctly checks the value.
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5309
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/rdkafka_conf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rdkafka_conf.c b/src/rdkafka_conf.c
+index 0e346e74..f8f0d0ca 100644
+--- a/src/rdkafka_conf.c
++++ b/src/rdkafka_conf.c
+@@ -56,7 +56,7 @@
+ #include <windows.h>
+ #endif
+ 
+-#ifdef WITH_OAUTHBEARER_OIDC
++#if WITH_OAUTHBEARER_OIDC
+ #include <curl/curl.h>
+ #endif
+ 
+-- 
+2.43.0
+
diff --git a/package/librdkafka/Config.in b/package/librdkafka/Config.in
new file mode 100644
index 00000000000..54380e2d6e0
--- /dev/null
+++ b/package/librdkafka/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBRDKAFKA
+	bool "librdkafka"
+	depends on !BR2_m68k_cf # assembler "out of range" error
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LZ4
+	help
+	  librdkafka is a C library implementation of the
+	  Apache Kafka protocol, providing Producer, Consumer
+	  and Admin clients.
+
+	  https://github.com/confluentinc/librdkafka
+
+comment "librdkafka needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/librdkafka/librdkafka.hash b/package/librdkafka/librdkafka.hash
new file mode 100644
index 00000000000..f745e55b819
--- /dev/null
+++ b/package/librdkafka/librdkafka.hash
@@ -0,0 +1,4 @@
+# From https://github.com/confluentinc/librdkafka/releases/tag/v2.13.2
+sha256  14972092e4115f6e99f798a7cb420cbf6daa0c73502b3c52ae42fb5b418eea8f  librdkafka-2.13.2.tar.gz
+# Locally computed
+sha256  b9e4616bb9dd0c9ce3fa52e81c7bfc596e60b8855a1df5dce5fa50732b1ccdec  LICENSES.txt
diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
new file mode 100644
index 00000000000..0cbab11d496
--- /dev/null
+++ b/package/librdkafka/librdkafka.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# librdkafka
+#
+################################################################################
+
+LIBRDKAFKA_VERSION = 2.13.2
+LIBRDKAFKA_SITE = $(call github,confluentinc,librdkafka,v$(LIBRDKAFKA_VERSION))
+LIBRDKAFKA_LICENSE = BSD-2-Clause
+LIBRDKAFKA_LICENSE_FILES = LICENSES.txt
+LIBRDKAFKA_INSTALL_STAGING = YES
+LIBRDKAFKA_DEPENDENCIES = lz4
+LIBRDKAFKA_CONF_OPTS = \
+	-DRDKAFKA_BUILD_EXAMPLES=OFF \
+	-DRDKAFKA_BUILD_TESTS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBRDKAFKA_CONF_OPTS += -DRDKAFKA_BUILD_STATIC=ON
+else
+LIBRDKAFKA_CONF_OPTS += -DRDKAFKA_BUILD_STATIC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZLIB=ON
+LIBRDKAFKA_DEPENDENCIES += zlib
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZLIB=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_CURL=ON
+LIBRDKAFKA_DEPENDENCIES += libcurl
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_CURL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=ON
+LIBRDKAFKA_DEPENDENCIES += zstd
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_ZSTD=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=ON
+LIBRDKAFKA_DEPENDENCIES += openssl
+else
+LIBRDKAFKA_CONF_OPTS += -DWITH_SSL=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
