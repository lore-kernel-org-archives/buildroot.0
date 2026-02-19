Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA273C531E5
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 22:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9417A60A94;
	Thu, 19 Feb 2026 22:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBDrypN0UqmY; Thu, 19 Feb 2026 22:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66E660AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771539183;
	bh=SDZtndSoNUKR3vSlYiPIY0BzY08clmXCGYs4E8529rA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sRLhkdXm15L/BHtad3sbALvbNvpPXDnNrulGYzZ9nfPskf7IeTzTHgiVN8OsTKVd1
	 RLUKGD4t+C2BNnis0O+4L1gouDyki/XfWPJ2ArZwpui+Lx7VKjadJLL7zc1RRn8Egl
	 lqC4Wt22evNGSMTD6Y0LSatYT91tCT3Xowyj17R3YZxhiCI5gCz5Hq8c5KV/xPufWu
	 ub7s5Hw9cdWff2ihqXFy7n4jkVzM4leNwqnB8adozGV7MwyPxWLBcQSTZ8r2uIfy12
	 SD8Sul5hzjy1MGQNUv2E8LgbM9k0UTFraUlYkrubcJuFV4l0tHQE+t+S/7FGUL4vRH
	 9heZPUzrawXTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66E660AAD;
	Thu, 19 Feb 2026 22:13:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D253206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E73240CD6
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vz9IE64os2ui for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 22:13:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.43;
 helo=mail-ej1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C5D240887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5D240887
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C5D240887
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 22:12:59 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8fb6ad3243so241435666b.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 14:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771539177; x=1772143977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PKR5z8P+T6Kj+FOMp4LzKYug8PqOnoW4a7xvE/8aes=;
 b=ozZhSa2ga0xZnaPinW2xSaNXbng1A8etZQfCtSO0adCb29ZbK9Sr0gNwPZDi/29laa
 7sEUo2Y3/VZer7aeAQCOrXpSpPSmvMxSpO1PVAnQZtMqiHpo1monEY3mYxZ+Qgq5yddU
 xH/zvWQp3OX49HfiJo/JoCOfYw28bgF9zQmpHCSmvVaKkbUJPNXBUmgQ+unz5gFJf6OT
 IyJnra7UwRa/QnAv6oYMWidIKItbMMdRrQ1gOnUe1ETmz0TAb0kv5TKdT/lQNZVR0M+l
 S0DZoDcOKrQ4YDfjFNyYmt4bNlAggJBaWkS8+UOGXvo6JwhttThkzXHekqvr8nQQEuWV
 3lWw==
X-Gm-Message-State: AOJu0Yz4m3/mymn/LDKesXDp/WGf/dycfjJCq2NxWtoNeMLHJH8hog4E
 CsPE+1/gK14h64C7h84+QUoOB5ktqkz8lFzpoK9fYdCSZ506YAzdcBDHJLafaw==
X-Gm-Gg: AZuq6aJxcUk4YnqlRQoyJVCLG5rZgnuMkBUE69b+C509cc6H3J5Wro+p0OYQhVrjAkz
 /z13uAo5utckDP8FKrZk8TY0B/VYCW3+M2pkG6GF0OPNSLDwzZ5rkqGvVLnqyG3hrC02e3+TjZX
 AMg5HMcQqHwqQL+hmVqoO/CQYFe3pryuQWDoiW7ZHjro6V6dyso9El64x4fFC4+SxDQOOvWPu/z
 ulGNR3D4QijNlWkvodwIS38GumMYe7WiX64De/eADMydMZmu8L11uBA7klNhItFHb+ga6jUOv4A
 P6kbASvaM5w/cnC9Dv+36SZ40pnP0YzWvFjtTRIDOPgbexinAGZc5wjZQqHgqFmdu+sznggpIp0
 BuyRyiBoIQr2VD4f5r6mq5WV0JesTGScPYKjwQ6HVxd4l1JXUDYYGfKDPRRQ7m2mlUZTRabO3GM
 oUtxEIxkAlUqHhAQ87YsFrsSxX+wJcnMbtaMYcqvr+CfZ2snEUWDV8HVXdJyuWqpG7xcHaGce2
X-Received: by 2002:a17:907:6d17:b0:b73:667e:bb29 with SMTP id
 a640c23a62f3a-b8fb41936a8mr1172909366b.8.1771539177015; 
 Thu, 19 Feb 2026 14:12:57 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:eb5f:fa00:b2c8:3544:a853:192e])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8fc7627fa7sm624323566b.38.2026.02.19.14.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 14:12:56 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 19 Feb 2026 23:12:50 +0100
Message-ID: <20260219221253.2217784-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/3] package/librdkafka: add new package
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
 ...d.c-add-proper-HAVE_GETENTROPY-check.patch |  37 +++++
 package/librdkafka/Config.in                  |  14 ++
 package/librdkafka/librdkafka.hash            |   4 +
 package/librdkafka/librdkafka.mk              |  51 +++++++
 8 files changed, 267 insertions(+)
 create mode 100644 package/librdkafka/0001-CMakeLists.txt-allow-compilation-without-C-support.patch
 create mode 100644 package/librdkafka/0002-src-rdkafka_conf.c-fix-curl-curl.h-include-when-WITH.patch
 create mode 100644 package/librdkafka/0003-src-rdrand.c-add-proper-HAVE_GETENTROPY-check.patch
 create mode 100644 package/librdkafka/Config.in
 create mode 100644 package/librdkafka/librdkafka.hash
 create mode 100644 package/librdkafka/librdkafka.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 87854f3760c..61c455fb638 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3191,6 +3191,7 @@ F:	package/fcgiwrap/
 
 N:	Thomas Devoogdt <thomas@devoogdt.com>
 F:	package/fluent-bit/
+F:	package/librdkafka/
 F:	package/libsoup3/
 F:	package/yq/
 
diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1f..ef1746f80a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2498,6 +2498,7 @@ endif
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
diff --git a/package/librdkafka/0003-src-rdrand.c-add-proper-HAVE_GETENTROPY-check.patch b/package/librdkafka/0003-src-rdrand.c-add-proper-HAVE_GETENTROPY-check.patch
new file mode 100644
index 00000000000..fc946958910
--- /dev/null
+++ b/package/librdkafka/0003-src-rdrand.c-add-proper-HAVE_GETENTROPY-check.patch
@@ -0,0 +1,37 @@
+From 692d1dc27b58231af9f0b96816f3445a66bfdbf3 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Sun, 15 Feb 2026 19:08:27 +0100
+Subject: [PATCH] src/rdrand.c: add proper HAVE_GETENTROPY check
+
+/home/thomas/br-test-pkg/bootlin-aarch64-glibc-old/build/librdkafka-2.13.0/src/rdrand.c:37:24: fatal error: sys/random.h: No such file or directory
+ #include <sys/random.h>
+                        ^
+
+This should be covered by packaging/cmake/try_compile/getentropy_test.c.
+
+Upstream: https://github.com/confluentinc/librdkafka/pull/5310
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ src/rdrand.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/rdrand.c b/src/rdrand.c
+index 77d02cfc..4bdc7885 100644
+--- a/src/rdrand.c
++++ b/src/rdrand.c
+@@ -32,10 +32,12 @@
+ #include "tinycthread.h"
+ #include "rdmurmur2.h"
+ #ifndef _WIN32
++#if HAVE_GETENTROPY
+ /* getentropy() can be present in one of these two */
+ #include <unistd.h>
+ #include <sys/random.h>
+ #endif
++#endif
+ 
+ #ifdef HAVE_OSSL_SECURE_RAND_BYTES
+ #include <openssl/rand.h>
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
index 00000000000..b0975b8481a
--- /dev/null
+++ b/package/librdkafka/librdkafka.hash
@@ -0,0 +1,4 @@
+# From https://github.com/confluentinc/librdkafka/releases/tag/v2.13.0
+sha256  3bd351601d8ebcbc99b9a1316cae1b83b00edbcf9411c34287edf1791c507600  librdkafka-2.13.0.tar.gz
+# Locally computed
+sha256  b9e4616bb9dd0c9ce3fa52e81c7bfc596e60b8855a1df5dce5fa50732b1ccdec  LICENSES.txt
diff --git a/package/librdkafka/librdkafka.mk b/package/librdkafka/librdkafka.mk
new file mode 100644
index 00000000000..348562b0f32
--- /dev/null
+++ b/package/librdkafka/librdkafka.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# librdkafka
+#
+################################################################################
+
+LIBRDKAFKA_VERSION = 2.13.0
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
