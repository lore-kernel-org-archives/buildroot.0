Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720F2C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE2B80E13;
	Wed,  7 Feb 2024 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xt7h41PmvkDZ; Wed,  7 Feb 2024 09:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 725D380E59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 725D380E59;
	Wed,  7 Feb 2024 09:21:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C9CA1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC1B34190E
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYMW-am18t2w for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E34A41B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E34A41B55
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E34A41B55
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b436dbdcfso326915f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297675; x=1707902475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3gLSnN1BCckk4gOxGMPVr5cm4IBwzIN4P7YxCT41Lg=;
 b=rEvy8I3rS6Hb6Rh31JHLaKvSCCjIRTKmQ4KIQJ7CE2GaTxd/8npnn3bNvkM4l3bhhD
 qBNHnaJlR6YcgBxeSc8mNG2e3rBKin9QW6ZUGCwNrBOwO6JCTHJMVSGnIPk5WU6N24D1
 Oky/8yyS4YlgPgq6Fl2obZ23eDWZVS4c+VvfipxrcsvRbB3qFGTHcRNH6mh77kfJkeVl
 pg/IS5dwtF8w7s+2hxLAVbj59ibWs2CiCn4w4PtAeqlVI7ank693ETe71R7E+/RHTfJM
 NWP1uXcZb2VrB5lgPxDcqdyPx6EUiWp4u4RotgaMM/Ni/gK2+Lrn3JEdunRMvQ2bH5tM
 eybA==
X-Gm-Message-State: AOJu0YzNXR5UnLbrvhC2YKiKArvBJ20c5fptDAVW8zIo0pLc9vVipIMt
 Vr/gmuJ0Eb0d6hXa6rr7NL4SzWI/DirqoIi+4g3kc2fTyc1bjIRXv1qNjEjvRGlspNPKv5JJBFL
 Y+jI=
X-Google-Smtp-Source: AGHT+IEw/7FeR1ecuoqo3x1QfVHNMysbCBMPCg+2aCPnESy5P2diBoUZRI6iWTP8PyBi5gVqs7aDMA==
X-Received: by 2002:a5d:4052:0:b0:33b:4808:3d39 with SMTP id
 w18-20020a5d4052000000b0033b48083d39mr2906218wrp.69.1707297675212; 
 Wed, 07 Feb 2024 01:21:15 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m29-20020adfa3dd000000b0033b07e4cadbsm998559wrb.115.2024.02.07.01.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:21:15 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 10:21:11 +0100
Message-ID: <20240207092111.236577-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207092111.236577-1-romain.naour@smile.fr>
References: <20240207092111.236577-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707297675; x=1707902475;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3gLSnN1BCckk4gOxGMPVr5cm4IBwzIN4P7YxCT41Lg=;
 b=qdsppURSW4gXMCLpciquqtyMX0BP+t0MsOM9nP27MmcOv7bAr9IaC87iEinEzckU8h
 3Va5U29W8wu0QofEidP72TT7jNamOpd+cHYXngkgrgXrzA+UzdkaKFwV53a4Bp8oJl2X
 CA3k/rxn9w88CxtquV6gPMZYuuUHefm5Jqkutr1+8oJX/0ETJagE+B9ef/3a4rh0LqzV
 U00XgVUUS2BQFnhZrBiZYHPteEFEVSK4OeEYzDk/ZU/Hb/dH+Trrm8t60vRoSq24+nP6
 6M4YEwPJIROBSiobWj7c48nAZbSL1PAmThyIWCfXGGsDT9+OMuNUkHLmHD+optUT01AM
 yLWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qdsppURS
Subject: [Buildroot] [PATCH 2/2] configs/ti_am64x_sk_defconfig: drop
 redundant defconfig choice
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfig choice is the default one, so it is redundant and can be
removed without effect.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am64x_sk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index b3e69e9e93..4bfd31f0c8 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -24,7 +24,6 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
