Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AA9C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 23:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F4D407FB;
	Sat, 23 Mar 2024 23:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TdiIqJto4aX; Sat, 23 Mar 2024 23:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760CB4089E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 760CB4089E;
	Sat, 23 Mar 2024 23:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 895691BF5A8
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 23:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D76A40373
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 23:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RX5UYWX3at4 for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 23:21:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.47;
 helo=mail-wm1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30C2A400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30C2A400FB
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30C2A400FB
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 23:21:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4147e135f4dso11245525e9.2
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 16:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711236079; x=1711840879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6UY/oyenfnoU9g/b6snSjkvpJOV3iSMDci+BAUXJgqg=;
 b=BPJtSFQmxLFK/95Fb7N7CK3/ZPAZ/t5QLi3V2R3twUnBseEV2vYQVquxMPd00ct96P
 Hf9S+phUmY6GFLD5tQoq8Eo/6gXwTJotFcomULKC8TNOm7sCh/vEReTBgCmL1vCL5L0S
 gmvdvMfDcVKXEdORncFMhYFsLqHnmwJhsbeES8JANXVn2al+xV67+nEf7Mb38NdMfZyg
 Dt+fW8/oo8gNj+q7Ia88FNhGN+FUgbxfnBoPdg+hDkqMG35JKdsgUT1q7lyIdvPXLZCb
 hn/3WfV2K8bQvMb8zwkQ+57xgBaYOTLigATzM8U96MmpMwFliTtiXJlggCtkFr+4jG3+
 y1nQ==
X-Gm-Message-State: AOJu0YxM+SZ3xyMiRb4sNCEg1GbFpTdsQeEMgNC3GwSkzRHv9Mzjq29h
 1HyMeh+sAy1RyXv1iNhxmFADOzCEFyPyqLtVMDiXGYW7tD3ni0bfnU5u7K8QR6c=
X-Google-Smtp-Source: AGHT+IHueQBfBT/GauuYQTRcC5AHRvPq+dPGAN8ZE2nAhUm2yUptc9mKn+oKUk55UXWF9zuOHubP7Q==
X-Received: by 2002:a05:600c:1551:b0:412:f81a:48c4 with SMTP id
 f17-20020a05600c155100b00412f81a48c4mr2136114wmg.13.1711236079052; 
 Sat, 23 Mar 2024 16:21:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:a3b6:f617:900f:8287])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b004147c8dd13fsm3651491wmo.30.2024.03.23.16.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 16:21:18 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 00:21:16 +0100
Message-Id: <20240323232116.3071446-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: bump to v3.0.0
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
- https://fluentbit.io/announcements/v3.0.0/

Also drop 0004-wasm-restore-support-for-some-targets-8401.patch,
which was accepted upstream.
(See: https://github.com/fluent/fluent-bit/commit/40bb0fbe17efa6b4b1a96940e9ff7374b1a0c3eb)

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 ...estore-support-for-some-targets-8401.patch | 43 -------------------
 package/fluent-bit/fluent-bit.hash            |  2 +-
 package/fluent-bit/fluent-bit.mk              |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch

diff --git a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch b/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
deleted file mode 100644
index ed6206268f..0000000000
--- a/package/fluent-bit/0004-wasm-restore-support-for-some-targets-8401.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4a6c5f56cd1a979b91c168fb8e245587c2927aca Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 22 Jan 2024 19:27:56 +0100
-Subject: [PATCH] wasm: restore support for some targets (#8401)
-
-Somehow, support for ARC, MIPS, and XTENSA got dropped by bumping to v1.3.0,
-so restore it now. Remark that those targets are mentioned in the section above.
-
-See commit fa6a248746f9f481b5f6aef49716141fa0222650.
-
-Upstream: https://github.com/fluent/fluent-bit/pull/8401
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/wasm/CMakeLists.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/wasm/CMakeLists.txt b/src/wasm/CMakeLists.txt
-index a258dc063..4ea7eba65 100644
---- a/src/wasm/CMakeLists.txt
-+++ b/src/wasm/CMakeLists.txt
-@@ -51,6 +51,10 @@ elseif (WAMR_BUILD_TARGET MATCHES "AARCH64.*")
- elseif (WAMR_BUILD_TARGET MATCHES "ARM.*")
-   add_definitions(-DBUILD_TARGET_ARM)
-   add_definitions(-DBUILD_TARGET="${WAMR_BUILD_TARGET}")
-+elseif (WAMR_BUILD_TARGET STREQUAL "MIPS")
-+  add_definitions(-DBUILD_TARGET_MIPS)
-+elseif (WAMR_BUILD_TARGET STREQUAL "XTENSA")
-+  add_definitions(-DBUILD_TARGET_XTENSA)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64" OR WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64D")
-   add_definitions(-DBUILD_TARGET_RISCV64_LP64D)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV64_LP64")
-@@ -59,6 +63,8 @@ elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32" OR WAMR_BUILD_TARGET STREQUAL "RISC
-   add_definitions(-DBUILD_TARGET_RISCV32_ILP32D)
- elseif (WAMR_BUILD_TARGET STREQUAL "RISCV32_ILP32")
-   add_definitions(-DBUILD_TARGET_RISCV32_ILP32)
-+elseif (WAMR_BUILD_TARGET STREQUAL "ARC")
-+  add_definitions(-DBUILD_TARGET_ARC)
- else ()
-   message (FATAL_ERROR "-- Build target isn't set")
- endif ()
--- 
-2.34.1
-
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 2c34583f7a..cc9c976d60 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e7e951b2907e9d29508699c71c8949a4a22d750d54ffa5ee5b96537e59371dd  fluent-bit-2.2.2.tar.gz
+sha256  e70ae5be2f0ca1cb842a1c8d2762437907c522765f79b5c0c391eaa1b57c9f4c  fluent-bit-3.0.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 00a8904c55..33054bea66 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 2.2.2
+FLUENT_BIT_VERSION = 3.0.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
