Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E322AC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 05:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5B3960ADB;
	Sat, 13 Jul 2024 05:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JW1dOWaIjt3m; Sat, 13 Jul 2024 05:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0B36080F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0B36080F;
	Sat, 13 Jul 2024 05:44:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22A151BF847
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B29281F1C
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 05:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn58nJQuJ3lz for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 05:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40A5B80F7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A5B80F7D
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40A5B80F7D
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 05:44:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so3357275a12.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720849458; x=1721454258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MT35i5FhAG8LqByZhzI05zsMrTiT2K2Gve3fvJWbFbw=;
 b=K9wqM6yP81hrgV828caI7dufgSTap3GTFsr9n4OhE0FQWB5NPhsbu4+ei8OTzObxJC
 2VEBh2PUZl9xzk6aRPrPEPYmXx+mXQxRUPH4csNVjYLWUHGq0yHDTedruW1/9TnJbWt8
 0LJiDf9MjhM2r7DtEdsZYLN9Z4VB48Obak4RaOY0KAOkObKEnA2YoI/r1s+HwkzczRz7
 dgHF5wGeX01n5jKk/BwV2tfCOLZCTaoTKY7sh5oHhLJgtpVSvQSE4XLHbjiPZm5hRBOY
 scDJ1155T68FQkqjw0qyYQZoCsOCLd3v5kT5/N6zvnKkCUoPdwhg4gwoL5H0hMRRcBMf
 5dXA==
X-Gm-Message-State: AOJu0Yw06uBtXe+EmiIa+u56pRTvpe1cxmJ7GfDfS3mOQI02Lw8I6mbV
 bKWxw4ok4b8xC4ule7Z+zjE8VHeSfO4KJf/3edzgCVzbFqQq4FN/qitb+g==
X-Google-Smtp-Source: AGHT+IFUPnOPvGDhbRDsyNR4JgsSGZAeYUEMHW3r8w0w39+0N3APS/cxGErpV8BKsnOg5JTpQqSUbA==
X-Received: by 2002:a05:6402:4307:b0:582:5195:3a79 with SMTP id
 4fb4d7f45d1cf-594ba98f268mr10416668a12.6.1720849457769; 
 Fri, 12 Jul 2024 22:44:17 -0700 (PDT)
Received: from hthiery.fritz.box ([95.91.160.230])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26f61ffcsm289997a12.83.2024.07.12.22.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 22:44:17 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 07:44:08 +0200
Message-Id: <20240713054407.229084-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720849458; x=1721454258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MT35i5FhAG8LqByZhzI05zsMrTiT2K2Gve3fvJWbFbw=;
 b=VVt/mgy7MRWCUT/nWWxRB4oofKqHXTZHxCGb8wY7X2tb6+0tON5+/fVQqmEAu5ElQE
 lW4hNTWbmk+RgHFfkHYg/kcmYVVNw5uWtPZAhBm8I8HYBTpnsuxStvJWwXOEumuc0KD1
 9SVRXdwLPx0QtVavc3ncpWRj925/QJDwAb5RPetLWOnnRWsib6ZYRrwhFBJQ1iPbJNzH
 RoT/iN8h/97I0LY4dXNGrix1RslV/MPQILuA90xSMydqfRrqnZDPiAcDo9NgRu0TaOik
 e68uLax6KjXG96sh7ZrxD7EBCMV48q/wFQ1BN+IohIkMcglpqfpOLeUJmgGTuE1f440c
 /4Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VVt/mgy7
Subject: [Buildroot] [PATCH 2/2] package/llvm-project/llvm: remove
 overriding the ASM compiler
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There was an error in the pkg-cmake infra file regarding the selection
of the ASM compiler. Now that this has been fixed, overwriting the
ASM compiler selection is no longer necessary.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/llvm-project/llvm/llvm.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 6598d8b6c1..b0515474d8 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -20,10 +20,6 @@ LLVM_DEPENDENCIES = host-llvm
 HOST_LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 LLVM_CONF_OPTS += -DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm
 
-# Assembly files for x64 in lib/Support/BLAKE3 need to be compiled
-# by a C compiler
-HOST_LLVM_CONF_OPTS += -DCMAKE_ASM_COMPILER="$(CMAKE_HOST_C_COMPILER)"
-
 # Don't build clang libcxx libcxxabi lldb compiler-rt lld polly as llvm subprojects
 # This flag assumes that projects are checked out side-by-side and not nested
 HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_PROJECTS=""
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
