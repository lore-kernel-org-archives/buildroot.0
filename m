Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC9CCD199
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C8EB614F7;
	Mon, 20 Oct 2025 16:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QGMwLIwedoZ; Mon, 20 Oct 2025 16:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8206A6150F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8206A6150F;
	Mon, 20 Oct 2025 16:52:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2C4443F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA10941441
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeEnoj2YrMYw for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 16:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DEEB4141B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEEB4141B
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DEEB4141B
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 16:52:54 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so582984066b.2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 09:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760979173; x=1761583973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EjwPSMfsHpsxoQWuMq1k79jYPsLHHWo4fYC0jiIrmM4=;
 b=T3+PRAcZUMjK4E3OionybZl/7hhVFlLH0Gb044OlSalj24TEolxAJyx9L4jaH2d4Nv
 g7TMpo5YZidNwmIt7vR/o7sVGoU7fUCJNzqxL9m47l8PHZOrRz6Vyn8xp26pqwb/ZZf2
 GokmDWn7JNn0wON4QOdFdrmoABOyVMoHrO+VoEx33mDDIgU6m9WTq0m5bIV7xlqOqfSH
 kRgqtOJId9RnITmxZs4EaQ3E9itmej5S0Xkd/5/eWJBpXUpyEla3hZbcPHeg8tjpHdyg
 3xIPYt5w0FDBnsrOS1ThSy77pq0s7ueEo5OYo/B+tzSaQah6UOtJacPKlu9Z09HMYSy6
 g8UA==
X-Gm-Message-State: AOJu0YwyNLC+wZbPbiswUxZVv1wUvxdTGsFQB4HSwc3oNg+VTcwv2iZI
 rQ+2ZTFifnylf9Cz4xH1/xDZQObS7zaI3/nna81lF3+ylQ/TuR1Pc/FuZfRo6vd05v5YOceJ/GX
 NNI82
X-Gm-Gg: ASbGncsIR5Ra7hbCGyYgLQ8PCuag/Blw+9h+QnRjNQsMZ0vJqXQjq7WGF2FnnN/50Xo
 vD0+RpGqkb17elbWu0+4tMlYZLn1t724mAeXOkKh5z9SNbyB05cLJ1gV7yY01F1V+5+hG4MCuzb
 SLwTRBrjys/Cf7xLnsqDL67iOn50rnHleWNhcowFcaxkveQlAQkf4jOIF2YWsPRT/DpOpU7mmGG
 ioGVk3+kGv4ARIaPBi2lDtvaWl3HQvR10Zkf+MT8Xz1JSUWVJgeWpIEqp+flcwRz5Nk/x6h9gJG
 JKneSO6/NZDRAqV4EjraRyq+yK6kMrXTHzEiQbkXWIGDlmnY6IoQE9v5jav2+o9AqEtE+9MqjzZ
 VA8jJskDDmzHkZm8kKasFGPFloBUxaU4PMQWldQkj2GYDEi25R2Bq4vd2hOZeriyuG42kU8E2gH
 iVDjAYsOTym6LwVABaB201txmKCmEFhEp5rdaOs5o=
X-Google-Smtp-Source: AGHT+IHs3bemg0aodEXJNp3rAA8LVNmsCbKSt9/UsLQ6fv77mclw8szuPrkCn9ldqZZe0D8J2kR+HA==
X-Received: by 2002:a17:906:fd8b:b0:b3c:1bfc:c552 with SMTP id
 a640c23a62f3a-b6475ff39b7mr1363363066b.42.1760979172811; 
 Mon, 20 Oct 2025 09:52:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.40.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb0365e1sm836484366b.48.2025.10.20.09.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 09:52:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 20 Oct 2025 18:52:49 +0200
Message-ID: <20251020165249.1714204-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760979173; x=1761583973;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EjwPSMfsHpsxoQWuMq1k79jYPsLHHWo4fYC0jiIrmM4=;
 b=b9TMJnY7c7ccfZ0dTPcfqZ2s1tIHqQfI7AZpQxP423KST/FDTkdIkE2/jQ06/lCVg6
 6tc679tWfSdCHpg4kxvbH/c0iI7fSV/2HL5AV+bgR3kNfjVIZqcwUFTsH25VDw0Zr3kX
 86M+Tc1NGeNW2u8Zua/kCeOyZHboJ/PAQqTVs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=b9TMJnY7
Subject: [Buildroot] [PATCH 1/1] package/pocketpy: bump to version 2.1.3
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

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.hash | 2 +-
 package/pocketpy/pocketpy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index 4032fda442f8..0c96bf2a55c5 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  34976a5eb099869b134d93bd4c801cb330bb17466f2b1f4543a5217034a867cd  pocketpy-2.1.1.tar.gz
+sha256  7e2afd6eafcf72c5797492107558e4b1d6407dccd66e7da4a62b1054eddd2ce3  pocketpy-2.1.3.tar.gz
 sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 74e6b4910deb..d20e1e0e205e 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.1.1
+POCKETPY_VERSION = 2.1.3
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
