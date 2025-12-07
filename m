Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6253D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 20:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4074056D;
	Sun,  7 Dec 2025 20:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfrwO8Vmb2sZ; Sun,  7 Dec 2025 20:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DFB54056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765138633;
	bh=3uKh7PF3Xhedy46velU7QylgpwfsKzp8FQYzEYMY8rg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nmvHPv9qITq10r7KKuYUeiVZMwmPBUcLoJnLkyKoHe/jdSLSEJAlwIQs3j/Eo0QKG
	 +X/KLWM9Wrz+8r9IhQWp/kZkn89LDBEggUop4rQZyW/cx2htEJjXPOS0QIX5Il5pBY
	 H9wP7XW+C2omVLan87Jy8HuGlyKnQzKCkRfMzPVZ47GfLnTmfndLrmV2YshjHID3Bx
	 liBd3336Z3XvaqMKs2nq5XNP5Cjn/a1dl2mCZETGVVHpyO804F5cgr8B9J0cxykK+r
	 TvoL2F5eiSWrnZVHOh1/FR60XNmu5rrddxgnlhDtS7eOHonR1jF2RmswYp9FnIOOj1
	 XQAELwajuvmBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DFB54056F;
	Sun,  7 Dec 2025 20:17:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87005151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6575C4057A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSun-2gd-6SU for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 20:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.50;
 helo=mail-wr1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31B924053D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B924053D
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31B924053D
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 20:17:11 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b3d7c1321so2259809f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 12:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765138629; x=1765743429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fbZpvPqQCoCSgY0ANaQjXGonKKd/cca1lcksyPhZ+Sg=;
 b=oOMvETCW0OTmYZcm2iYFUoyAiky20DG6O93yARv+MCbwyWDy3G0B6+gek9zLfQqmf+
 t8VDg8xb2H5fp6A12f+WV9bKPIaZteDRh3TSxa8pEwtxtwoE4s510/pKiWBwU1246E/Z
 lcvpu/9VmcmOnxt2Uv2qXx7RdZY1AAfYdx7FNJlskC7zhmo37hznvWqEfwQ0TX+ccaNT
 TvR0ndlnIT9cB0bOPU+CzNg511wXqDrTE4D5swNIU6Azme7wwsQ6Z5M5Z9p/FOnfeOXK
 Hf9TlRQ5aEQd/OzpvElpTwm9jX1X+WYLKPOwV93+8Qge9sTKTBWPxT/t2Go8QD3PiZRc
 ZgrQ==
X-Gm-Message-State: AOJu0YxDdPhPPmMsQoMfqzZ1Y5nD+MWwdO2fLaAs5E/NtzZoCWSvlyso
 4J/BmdJ4RN3MQLMwnWnqH5b9JAf5nhW1BMz94u/uC9JtmH6KWeXxjOAopcVoTw==
X-Gm-Gg: ASbGncuDfZhR8MdcniQyWW71cHl2xfNcyNF0vd3JtB89Syi9ylRxcOpbwfcvO8hQoCn
 oLQw38G0z1Vmdn9daCFEc482CtuvI7T20/dn4+pT9O7xJTwkF8NHzWXNZUUAyPTPTP+mLnklbnu
 232d7f06V8StYU1bY546P1bJQBEHmXQXH68O0eadHL2hcJCfSTFRgrutug+8LcDLPyr38S5XHPV
 oXePHC0Xm3brYWxhYe8cwxwG+ZQtSKPLeoVBrUJgrNbvSGBJ9Y1aKb06gwbjgghetg38BkQbU7C
 US38u+zIbOC/HRDh+EGy2/HSzk3jcSGP5GlOh49BKnthdOFBCD+wMTuO8ylpLsJySFyiUJUsLpx
 ukKd3u8DmVrOcCoOpJF0Y9dvGxbEx+xe4MUnALIWma+3+GOU8xWoM638zlgi7Q711wcdRBjbBJb
 5j15z3kB7dc3VV8GQ0/Qdq5NSlQg==
X-Google-Smtp-Source: AGHT+IH/lPclT5qKZDa07GQEUYk1ajpVZdxPgbjEQBLBbztHReZmgfUV1Q1K255W2IlHCPmc6TNneQ==
X-Received: by 2002:a05:6000:2311:b0:42c:b8fd:21b3 with SMTP id
 ffacd0b85a97d-42f89f5a098mr6172537f8f.57.1765138628681; 
 Sun, 07 Dec 2025 12:17:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb5f:fa00:1e54:730:e6c2:7264])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe90fdsm20649552f8f.3.2025.12.07.12.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Dec 2025 12:17:08 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Grim Delcour <grim.delcour@barco.com>
Date: Sun,  7 Dec 2025 21:17:05 +0100
Message-ID: <20251207201705.4154936-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/fluent-bit: bump to 4.2.0
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

This is a major release that introduces new features,
including one highlighted in the release notes:

"The v4.2 release introduces a powerful new Direct Routing
 capability that allows inputs to specify routes directly to
 outputs, bypassing the traditional routing mechanism."

But it also brings some security fixes. Not all of
them are relevant, but some piece of lecture can be found here [1].

News:
- https://fluentbit.io/announcements/v4.1.0/
- https://fluentbit.io/announcements/v4.1.1/
- https://fluentbit.io/announcements/v4.2.0/

The patch 0001-plugins-kafka-fix-cmake-cross-compile-error.patch
can be dropped as it has been merged upstream [2].

[1] https://www.theregister.com/2025/11/24/fluent_bit_cves/
[2] https://github.com/fluent/fluent-bit/pull/9600

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...ibrdkafka-only-require-a-C-compiler.patch} |  2 +-
 ...-kafka-fix-cmake-cross-compile-error.patch | 47 -------------------
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  2 +-
 4 files changed, 3 insertions(+), 50 deletions(-)
 rename package/fluent-bit/{0002-lib-librdkafka-only-require-a-C-compiler.patch => 0001-lib-librdkafka-only-require-a-C-compiler.patch} (98%)
 delete mode 100644 package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch

diff --git a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
similarity index 98%
rename from package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
rename to package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
index 83c77ff70ce..660ed7bed49 100644
--- a/package/fluent-bit/0002-lib-librdkafka-only-require-a-C-compiler.patch
+++ b/package/fluent-bit/0001-lib-librdkafka-only-require-a-C-compiler.patch
@@ -1,4 +1,4 @@
-From c33d6bd392c5c8bbd231b2a9d00d4959cc553c44 Mon Sep 17 00:00:00 2001
+From 7329316bdcc72aceb6bbbdf8711f5bf8894c2a15 Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Tue, 25 Jul 2023 09:10:41 +0200
 Subject: [PATCH] lib: librdkafka: only require a C compiler
diff --git a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch b/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
deleted file mode 100644
index 8b74d5911d9..00000000000
--- a/package/fluent-bit/0001-plugins-kafka-fix-cmake-cross-compile-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a21de9cb95f2199270a6ac6922ffa4ca8d453f26 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Sat, 16 Nov 2024 19:46:28 +0100
-Subject: [PATCH] plugins: kafka: fix cmake cross compile error
-
-KAFKA_INCLUDEDIR is not set if FLB_PREFER_SYSTEM_LIB_KAFKA is not used,
-when cross-compiling, it just translates to -I/librdkafka, which is not allowed.
-Fix this by only including KAFKA_INCLUDEDIR if really set.
-
-x86_64-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/librdkafka'
-
-Upstream: https://github.com/fluent/fluent-bit/pull/9600
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- plugins/in_kafka/CMakeLists.txt  | 4 +++-
- plugins/out_kafka/CMakeLists.txt | 4 +++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/plugins/in_kafka/CMakeLists.txt b/plugins/in_kafka/CMakeLists.txt
-index 928266b57..dc251276e 100644
---- a/plugins/in_kafka/CMakeLists.txt
-+++ b/plugins/in_kafka/CMakeLists.txt
-@@ -3,5 +3,7 @@ set(src
-   )
- 
- FLB_PLUGIN(in_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
--target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+if(DEFINED KAFKA_INCLUDEDIR)
-+  target_include_directories(flb-plugin-in_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+endif()
- target_link_libraries(flb-plugin-in_kafka -lpthread)
-diff --git a/plugins/out_kafka/CMakeLists.txt b/plugins/out_kafka/CMakeLists.txt
-index 9d8b34642..1c967329f 100644
---- a/plugins/out_kafka/CMakeLists.txt
-+++ b/plugins/out_kafka/CMakeLists.txt
-@@ -5,5 +5,7 @@ set(src
-   kafka.c)
- 
- FLB_PLUGIN(out_kafka "${src}" ${KAFKA_LIBRARIES} flb-aws)
--target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+if(DEFINED KAFKA_INCLUDEDIR)
-+  target_include_directories(flb-plugin-out_kafka PUBLIC ${KAFKA_INCLUDEDIR}/librdkafka)
-+endif()
- target_link_libraries(flb-plugin-out_kafka -lpthread)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 3a4e637d885..be02761ed53 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0031f74b616b4669064a59902559da2f87174aa8007e749b5df19ed79c534f5b  fluent-bit-4.0.9.tar.gz
+sha256  44fe0f52e89a63b213695748f99691d0a6247a4bd05065f1b517c798d9f89bcc  fluent-bit-4.2.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 73bd686b279..f571896797c 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.0.9
+FLUENT_BIT_VERSION = 4.2.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
