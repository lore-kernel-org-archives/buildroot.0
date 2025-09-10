Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7F4CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C6C41839;
	Wed, 10 Sep 2025 11:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntxOwkEYXg6y; Wed, 10 Sep 2025 11:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD5A4183A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDD5A4183A;
	Wed, 10 Sep 2025 11:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E01A10E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 143AD80F31
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIhxfAwslWqM for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:19:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.47;
 helo=mail-ej1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDB8D80ED2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB8D80ED2
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDB8D80ED2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:19:50 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aff0775410eso112582766b.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 04:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503189; x=1758107989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gh38e0SRkZTHlAytW3fbnJKgty3+VX+ayyiFwVsrOA4=;
 b=sG4GCra/eKVxPRa8F7zBwoBqWbde9lmfeA2i/JqoXdWQMzQ4T7OFexJkbswKVigyc0
 xnNrYM7UOxUPoQSalNdVWI10ZtYvkIDePJh5Pf+o1d5UJgb9m5ye8j47837qoI0koZaO
 YfOpBrb002zsOkyXzlst08lm8LdEmtoFiujn+dC3yTah3fIOpmLMH+7KpKsgzOwWBM9B
 G8WAueQkh+pXP6cxgW/EAUdkF4FaRQr8+sL1Slz5QiJx5Z7sB3RnInsNjhLK7/prwqcK
 m0iVe7xiykCac8NxO+om7at2TQ0FFNBVDkPRm8YTl24p6BOIzN5YND3h9m4XoxkwBZhz
 slUg==
X-Gm-Message-State: AOJu0YwwLSVUyTPtILGMqQ6B3tg9Cgw900byrduT9G2rE4yKVUhp5iWr
 xUnvSDTc589y4fBJcKx2/DYLhh2IsotAl4NGQEstfcGNcydXu/kBfrYznyzaiAMw
X-Gm-Gg: ASbGncv2X+Ur1Vns8W6BOhtSDDcINlZMk8XVd3xXTKHF/Tz32PMRfY89f7g6PhuWz45
 Odd3uiNqe0o1BjX6H3I5gK6Z9PRn6hMQiTHZfBaEoMFJBX9VqUr2SEGN4czsW1zCOdNlbZyfZ4H
 Bh6oa4BDkLabwTv5NGPgXgdO6Qw6bfmQJbhhGoQ7KhNR+/zIHR+LaUCzaCOptMw8zAO+ClY8slZ
 0kjB2jlcdZXDIFGvYwbt8qrEuvlBLXQtgDqlicJL/yOX438ji9QjWcqAWpBtRNpmAyYDC3S/MrO
 osT+SR7smRhuflFmrCJN4NFaot2W7r1paBvnqH62wPny+ZvDL7+wWpLMaKEs35qQ6ZjY0kKEW/5
 +9DhpLUCbYZOcJal3zRBPIFvYxhANKmaA+On9QKA4vhL9njO6i2xoNw4yv6KZed6d0v1Y3TnyOF
 OGH6o1SYwR9AxuiWtispUmWByCmdoFVeeO
X-Google-Smtp-Source: AGHT+IH+iXWqbR96WiPVBRW/4443WLaAFbya6YUXGhvpKPiR3M3QaThPOBf9n3Tjif7fM1HHRvwiPw==
X-Received: by 2002:a17:907:1ca3:b0:b04:5bb5:2745 with SMTP id
 a640c23a62f3a-b04b1f0cfa0mr1440729866b.21.1757503188251; 
 Wed, 10 Sep 2025 04:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb6f:7900:4f:f8b0:4863:3492])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07833ecf7asm152993766b.86.2025.09.10.04.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 04:19:47 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 10 Sep 2025 13:19:44 +0200
Message-ID: <20250910111944.2685069-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: bump to 4.0.9
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
 - https://fluentbit.io/announcements/v4.0.4/
 - https://fluentbit.io/announcements/v4.0.5/
 - https://fluentbit.io/announcements/v4.0.6/
 - https://fluentbit.io/announcements/v4.0.7/
 - https://fluentbit.io/announcements/v4.0.8/
 - https://fluentbit.io/announcements/v4.0.9/

Fixes:
 - https://autobuild.buildroot.org/results/770/770e9106a0c92f02e0f699505e69b35ac0e6cd41/build-end.log

   /home/buildroot/instance-0/output-1/build/fluent-bit-4.0.3/plugins/out_cloudwatch_logs/cloudwatch_api.c:1540:66: error: implicit declaration of function 'strcasestr'; did you mean 'strcasecmp'? [-Wimplicit-function-declaration]

   Fix commit: https://github.com/fluent/fluent-bit/pull/10452

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...s-kafka-fix-cmake-cross-compile-error.patch | 10 +++++-----
 ...-librdkafka-only-require-a-C-compiler.patch | 18 +++++++++---------
 package/fluent-bit/fluent-bit.hash             |  2 +-
 package/fluent-bit/fluent-bit.mk               |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
index de5dc54e75..8b74d5911d 100644
--- a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
+++ b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
@@ -1,4 +1,4 @@
-From f32c4e909ec4a4872c2c5fc186f27d1f7e4e8c2a Mon Sep 17 00:00:00 2001
+From a21de9cb95f2199270a6ac6922ffa4ca8d453f26 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas@devoogdt.com>
 Date: Sat, 16 Nov 2024 19:46:28 +0100
 Subject: [PATCH] plugins: kafka: fix cmake cross compile error
@@ -17,26 +17,26 @@ Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
-index ede0831f9..02e2dc786 100644
+index 928266b57..dc251276e 100644
 --- a/plugins/in_kafka/CMakeLists.txt
 +++ b/plugins/in_kafka/CMakeLists.txt
 @@ -3,5 +3,7 @@ set(src
    )
  
- FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES})
+ FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
 -target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
 +if(DEFINED KAFKA_INCLUDEDIR)
 +  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
 +endif()
  target_link_libraries(flb-plugin-in_kafka -lpthread)
 diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
-index 01c96529b..54b14fc2a 100644
+index 9d8b34642..1c967329f 100644
 --- a/plugins/out_kafka/CMakeLists.txt
 +++ b/plugins/out_kafka/CMakeLists.txt
 @@ -5,5 +5,7 @@ set(src
    kafka.c)
  
- FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES})
+ FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
 -target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
 +if(DEFINED KAFKA_INCLUDEDIR)
 +  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
diff --git a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
index d7c6bba20b..83c77ff70c 100644
--- a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
+++ b/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
@@ -1,4 +1,4 @@
-From dea6fb0138d9356ebdc4983a61c185bc759d86b0 Mon Sep 17 00:00:00 2001
+From c33d6bd392c5c8bbd231b2a9d00d4959cc553c44 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: only require a C compiler
@@ -6,14 +6,14 @@ Subject: [PATCH] lib: librdkafka: only require a C compiler
 Upstream: https://github.com/confluentinc/librdkafka/pull/4366
 Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 ---
- lib/librdkafka-2.8.0/CMakeLists.txt          | 22 ++++++++++++--
- lib/librdkafka-2.8.0/examples/CMakeLists.txt | 31 +++++++++++++-------
+ lib/librdkafka-2.10.1/CMakeLists.txt          | 22 +++++++++++--
+ lib/librdkafka-2.10.1/examples/CMakeLists.txt | 31 ++++++++++++-------
  2 files changed, 39 insertions(+), 14 deletions(-)
 
-diff --git a/lib/librdkafka-2.8.0/CMakeLists.txt b/lib/librdkafka-2.8.0/CMakeLists.txt
+diff --git a/lib/librdkafka-2.10.1/CMakeLists.txt b/lib/librdkafka-2.10.1/CMakeLists.txt
 index f3d05bad7..8ef47053a 100644
---- a/lib/librdkafka-2.8.0/CMakeLists.txt
-+++ b/lib/librdkafka-2.8.0/CMakeLists.txt
+--- a/lib/librdkafka-2.10.1/CMakeLists.txt
++++ b/lib/librdkafka-2.10.1/CMakeLists.txt
 @@ -3,7 +3,16 @@ cmake_minimum_required(VERSION 3.5)
  include("packaging/cmake/parseversion.cmake")
  parseversion("src/rdkafka.h")
@@ -57,10 +57,10 @@ index f3d05bad7..8ef47053a 100644
  
  if(RDKAFKA_BUILD_EXAMPLES)
    add_subdirectory(examples)
-diff --git a/lib/librdkafka-2.8.0/examples/CMakeLists.txt b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
+diff --git a/lib/librdkafka-2.10.1/examples/CMakeLists.txt b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
 index 91851d2cb..6874195ce 100644
---- a/lib/librdkafka-2.8.0/examples/CMakeLists.txt
-+++ b/lib/librdkafka-2.8.0/examples/CMakeLists.txt
+--- a/lib/librdkafka-2.10.1/examples/CMakeLists.txt
++++ b/lib/librdkafka-2.10.1/examples/CMakeLists.txt
 @@ -5,8 +5,10 @@ endif(WIN32)
  add_executable(producer producer.c ${win32_sources})
  target_link_libraries(producer PUBLIC rdkafka)
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index ec820416ed..3a4e637d88 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7d276238d25242467218941842d8cd4df6cfa52cc9379ae5755220cdefd1dc1  fluent-bit-4.0.3.tar.gz
+sha256  0031f74b616b4669064a59902559da2f87174aa8007e749b5df19ed79c534f5b  fluent-bit-4.0.9.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 3e7e04907e..73bd686b27 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.0.3
+FLUENT_BIT_VERSION = 4.0.9
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
