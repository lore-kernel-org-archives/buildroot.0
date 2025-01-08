Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD93E7719B
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A86C8405C5;
	Wed,  8 Jan 2025 23:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OdGrtNEsBs4; Wed,  8 Jan 2025 23:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBD840595
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBD840595;
	Wed,  8 Jan 2025 23:05:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E40D1FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FFBD80DDF
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F84a4Kqq_x6U for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2B87480DDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B87480DDB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B87480DDB
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso2665505e9.2
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377528; x=1736982328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyadyqYeU2BGAr0Wlxumjhq63T6mOvKRwai2xF3OiOY=;
 b=tpRDuJhqqN0QcFk8AY8LB/K6psPDiUWdbH5DPs0cduO5PcfssNoM+JMVOy+xitAs/b
 BmwcwpCn84Q78HvNx+kAV8U0EfjT6mACspN8iBfINJgmMApp2xnCh881cNTJouR17wGN
 YgJCFGBQEmeihRqm5vKQIj80mIPzU2p0CbaL8BBA0c3utUFp6v6CAPgo54Ju3TNV4OrR
 tw6AnQJKoEvEUEnbIRfH6BMFJG6vVRhgLodoRA3k6xDMqamvt58AsVkbZuyqXI7d1HBJ
 VfxsBHGQy+VRH8y41rxzuIs/+hgJBEKVYs2uTfiPRTpyGkjt7sFlnUHVXLuDDXX6kF+6
 oYVg==
X-Gm-Message-State: AOJu0Yyxz0gxvpZDDF0avu9/N8zP+nVDAWir4siv+3ckGU/WW41iPHqM
 AQtlkOhZI+qZ2cvpoyVH8AHYvAWSlOSZ9bSmzTd5h5BjfcoUeya5A293KVFrIQfFO0vCLExQ5VR
 p
X-Gm-Gg: ASbGncsp8jxEl7CUl9tpfF0RyJmQ0aAN4A0pWUqDPB9GMPsTjYFODl+0ZS7I57bFxih
 ML5f7wdcd4upPxuLodRNWGHygaSywh7lkV663cWAqMf9bDiCCy7m3me1U7nQspYGDTJZcJ2LA6X
 tC3VjpDdgU0spNtiYExfSrYUjNp0clZhzhMRs8A/MLhGP/OICHn9MU92R/UH8G6OfJpC1/6urJt
 lyzEdy3x7lH1rPrJaIbjP4P2xVMkjWIoweUEDShwhJyfWCj/rtxJ0Ujgl0JsWDLc4U8c4YicnH/
 OAaEr/dKL2+0yMSJ9bTQzP+dYMgFMteP+SZAEwTszDyzfcu6DEC28A==
X-Google-Smtp-Source: AGHT+IHed/Bc0avOuqu+O/J3t5OANFvHZg3i1N1onKSj3CF6Lxl/1yzge9Ctz4kZjZ7kNyomVRApPQ==
X-Received: by 2002:a05:600c:1ca4:b0:434:9f81:76d5 with SMTP id
 5b1f17b1804b1-436e26d931bmr35562555e9.22.1736377528026; 
 Wed, 08 Jan 2025 15:05:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:27 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:13 +0100
Message-ID: <20250108230521.1345210-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377528; x=1736982328; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyadyqYeU2BGAr0Wlxumjhq63T6mOvKRwai2xF3OiOY=;
 b=LddAtTUNPmE1blGrY3dQ8mLLGXgYbilVotf/7VUMOde68GxDlKnJBiRkQUGohrRqzE
 74T7c5CFmFXwdfEaBinPvV4iIkEnoMJPjeE/qWau8kdvNZMYYzLrRuHscWDDN83ONnLx
 bEq5jgMDiRkxb67Nhq4TQUq7lbKWhiM9YG37E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=LddAtTUN
Subject: [Buildroot] [PATCH 04/12] package/glibc: remove nios2 support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Doing so, we remove nios2 support from the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 arch/Config.in          | 1 +
 package/glibc/Config.in | 1 -
 package/glibc/glibc.mk  | 4 ----
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa..7da2dc69e4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
 	  Nios II is a soft core processor from Altera Corporation.
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 6075d28874..d464b3def8 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cee03a16fd..e026c18762 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -143,10 +143,6 @@ endif
 # Glibc nowadays can be build with optimization flags f.e. -Os
 
 GLIBC_CFLAGS = $(TARGET_OPTIMIZATION)
-# crash in qemu-system-nios2 with -Os
-ifeq ($(BR2_nios2),y)
-GLIBC_CFLAGS += -O2
-endif
 
 # glibc can't be built without optimization
 ifeq ($(BR2_OPTIMIZE_0),y)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
