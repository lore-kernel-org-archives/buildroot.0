Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3116CEB2FA
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6754E83DA3;
	Sat, 15 Nov 2025 18:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74MCDT1Ft_aw; Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B9B983DA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B9B983DA4;
	Sat, 15 Nov 2025 18:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6E0D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2098A83D45
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDfAi8qXt0RM for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 18:21:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 407EA83D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407EA83D1D
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 407EA83D1D
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 18:21:24 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so4048079a12.3
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763230882; x=1763835682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uqR2w4AIWVTMMJ2sCu51ObBB+EiMbY6oyD4l4WFKbbs=;
 b=PPtJQXLwsPzkIA2wpdypkJNvs+KruqKvT99s1xOfxqzxqLYRKFlSCdwIu38t+P5Bwl
 Mt6ZF8GfeYsNF7S8G2NlpxdxPl9l1tqSLNoEW12TlwjEAojzvt6tjFGFJ1mjljKkP3yo
 1z9yaXNeCbdU42oASzGmXNzj89f2TDx7cFbS88shANx5UQlpWorliwSxjqL2OsYdX3qW
 6/J299B3hu0KeXA5jaHq/mMxEkf2/Mx2hayyR3MqEVmc1IHuUAwlgZ94ElWA44F1VIhX
 nf+pt6CZ8sNZiYm1A+YXlPCqpXcp4++NvLt2FsLDxOaHKv9jEbH5t+f0W+++o65A0W87
 YdGA==
X-Gm-Message-State: AOJu0Yy88el9Zt/sfcikOK5BJZaRLHNUSz9RomLE90sqWYm4YgGxYywH
 XPeB+fYrdWCoR54sn5mTj+nBski8vTUOFYRtn9lwskAEZ2MFOdYl1r7w1Jygfzo8oSKRd1QLZ3Z
 6Z3sE
X-Gm-Gg: ASbGncvW2Z8+HHJ+ZGWMUNOvsbxMRm/yjeoZelr7hRJGutlktMmTCLH7GSTKNe00ybV
 m9xQfmbXX2OkRNrgl464oNoXpeICIiZobk9p9pHQAmsfGRTBNGlpmqQ0FEoT3fpE3USyQrsJkq/
 4JejREQV+UEWcxVMk2DPrmaN8DHv/HrLKkpQfWX0JTBRk2AEqvIrEBhyLfy0us9kyc/Iv8E1xtx
 l8VYgX0yb1BIPNVhLZGoHlWR/dAXkYdLYEobBKt6upiq13jrbQLxePnGQhLoKuCzIT7+Rvx7xAA
 ShphBD7Cf/BmgguQfVV+B0sfuzTQUqP2ozV7/gt2WO4mQDkCV3ukUeL+M73Mgc7Ej8GF7z6uxTs
 JP8zFpVX/H9iePfnQSI/oxq6qQ/zMBRmkd5AR09mO9pxNeRBGYlWdZ7fZ35ZAMS+Ig6gyGhk4xM
 YJwOhJ6SIFKUYEZuwl8FPBanpFC2WWsaUOVdKszZYsRhbiBqUDZNz6BVqzhFv3d++bjmSi4nD0h
 LZ07TocvlulKPNclwRpPKGBUrLF9Yqa8Nz70Ua3vm+Ii1mHNIX7J+A=
X-Google-Smtp-Source: AGHT+IEDemsjVwtdk11/y7D8D1VgOXP0zmkteFQONpFp6DB/CRHAWPirx3ptR251vfCVeC4J4DcJoA==
X-Received: by 2002:a05:6402:3553:b0:640:bd21:242f with SMTP id
 4fb4d7f45d1cf-64350e06e88mr6897070a12.1.1763230881718; 
 Sat, 15 Nov 2025 10:21:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4c5834sm6088324a12.33.2025.11.15.10.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 10:21:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 19:21:09 +0100
Message-ID: <20251115182110.464345-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
References: <20251115182110.464345-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763230882; x=1763835682;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqR2w4AIWVTMMJ2sCu51ObBB+EiMbY6oyD4l4WFKbbs=;
 b=BWGf+73LNBmqJ39nKYqvqnaYpBxTSsx9snMPNSg/R324x22526vlCuDjAbxBeaTuSh
 UG/qoMxXRNvhJWbt+MjklSocMEufAXE56Tu0zFH8J8r99ByBXe2rHYCV5CwFkjtPPfRr
 XLwCRs9dZbeA6+lf5aP27+KzsvqTAC+IvkRjs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BWGf+73L
Subject: [Buildroot] [PATCH 3/4] package/sysrepo: bump version to 3.7.11
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 663769e08df3..d0f654622210 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  07faa220dd409382a8a4e2fd411f961ef6c05cc1bb7f616579013836734033c4  sysrepo-3.6.11.tar.gz
+sha256  c897206797427c79c4646baa1d8abe539bbc70af884ac869e827ff9f09d7fcc8  sysrepo-3.7.11.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index de5441f01cd7..59dc59a5df95 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 3.6.11
+SYSREPO_VERSION = 3.7.11
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
