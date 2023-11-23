Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E590C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 13:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CF74023F;
	Thu, 23 Nov 2023 13:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0CF74023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TW4d7WM2YrDH; Thu, 23 Nov 2023 13:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114BB4116F;
	Thu, 23 Nov 2023 13:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114BB4116F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CF5E1BF368
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22ACC40500
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22ACC40500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuuRG9aueiK5 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 13:41:12 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AAE4403AF
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 13:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AAE4403AF
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so112517766b.3
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 05:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700746870; x=1701351670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sw/r99MwxJLSHG3Hi/OXGFPP2a7nKKzWZLYLKURqqQc=;
 b=hCcwLBZEcsD1hZRgnmQ5vDoUAzzx5ZvLkKAhupE2jSYwsp/bptabuSgjednHGRK3J6
 thtZayHoedY4hIk/LjRbmdT3z7DBqGnz18YY4LYRFZtex3YaU+NhmHDy+Dj2YpYTDuof
 qt5cJgleyZAxRVRfmWGnzAkVnUnlvGyn5raKgS7wNwEawE/2P6uaVF/ZCvydVnxh4NMb
 875TZ9XBqfR8Q2Gygv+iAwswjyzxYRlMp69hMSH1V38qwv+uYAYi2UADYc17aTyf7FOq
 Dgu79vEGA/s8b3syxl7daeQREE/E9KWhO6cNQ3cAez3k3yUIafA4hz7uTXUmKZcDdDLs
 V3Qg==
X-Gm-Message-State: AOJu0YyhykfUNym7iJu+E7ll3buRzFqKBbCpCY0fg4LDYiSW4dd1JbEe
 +dDk91dId0t29ewpVfS29Y48HRmk1MhDvhZ5w0CYrQ==
X-Google-Smtp-Source: AGHT+IEshxJ3H/2SUY7j3lEkBmjANIk7iRgPlRR+5+OSXO4GP+fDDWkwnWIf4UKRCafiE2np04Q2Mg==
X-Received: by 2002:a17:906:14d:b0:9e0:5d5c:aa6d with SMTP id
 13-20020a170906014d00b009e05d5caa6dmr3826180ejh.20.1700746869710; 
 Thu, 23 Nov 2023 05:41:09 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a27e:f878:7504:438])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a170906595900b009ddc90505desm799604ejr.141.2023.11.23.05.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 05:41:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 14:40:52 +0100
Message-ID: <20231123134052.239690-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700746870; x=1701351670;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sw/r99MwxJLSHG3Hi/OXGFPP2a7nKKzWZLYLKURqqQc=;
 b=p+egFIiqQlQoGEGFB8MBS7cUYmU1p3YjiY+VQrQrMxfpHYog1+KrT7V4WUXpU/pxhU
 zTb0LhE8v8wMmr/ChK16txV3QrIXwbhiwNLsKTULDLl/+JgCanBDg/Ns7hFdAsprgobk
 5gnVEjqzh5HUbsZ1Rm3+1Wr46nfomJ/gt5AHU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p+egFIiq
Subject: [Buildroot] [PATCH 2/2] configs/ti_am62x_sk_defconfig: drop
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfig choice is the default one, so it is redundant and can be
removed without effect.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 6610e6fcf890..130d092e304f 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -24,7 +24,6 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
