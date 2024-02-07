Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A77C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3163D80DCD;
	Wed,  7 Feb 2024 09:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu8W3xrdiGB3; Wed,  7 Feb 2024 09:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689EF80DD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689EF80DD3;
	Wed,  7 Feb 2024 09:21:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAFC51BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 980B141BD6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xfHNY09qQiKf for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 09:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B37694190E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37694190E
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B37694190E
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 09:21:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b4e06c239so331864f8f.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 01:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297675; x=1707902475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ycg48Imx20dMFJ58VX17HPR0gtyFFqEI/+4kUe/bBfM=;
 b=ZoKFYJzhGXm+H9aIJwmOEa25F2vBIpG5qtiBIyJGwGOIKgVTn8VHIGM5fIVYRBK4JV
 J1XJJ2ZRARmoaAd5qsvPZ8cl1EBsinJ1dRvrce+XNPT66UGqMmqWIjHnsdzwpnlAcvY9
 1lVpYimosm3rmHUqFc7dznQMNkwbdkVc9sAYGtlwe/u3LINcl2ufvfu+5WM0Z2Czc6Qt
 HGpDuBDMF237WEYbXyCzxNT+g/nIo9xfd+OKNepzL4lSIHcriRhowJDdo7kZ56MmH4Fa
 DG8F/c3HI2D/uMggvKV9jrGXPvNT5NduClxfHNxHzcszLmnpyw3O0l08mgG/cmbATE5F
 AofQ==
X-Gm-Message-State: AOJu0YwKTp4pLZ3PMvFfqb+fYbzqma6j3T5cTyTvPvIPPfLN2bx4tc4a
 wNlnLSr302xha8HS5lS4R7mbcp6VLbZuTzspn+FPVU/lgT+Q57PLMorawGX3TgPgvn6nnjuAq1U
 KYeY=
X-Google-Smtp-Source: AGHT+IHLNFuHqcA/OQAfvQhST0rahiXfGeccdwQsoCMQvOO5eEct0JvRIPAdZB1XPJJn5oOwqt61hw==
X-Received: by 2002:a5d:680f:0:b0:33b:4ebd:144f with SMTP id
 w15-20020a5d680f000000b0033b4ebd144fmr935300wru.36.1707297674824; 
 Wed, 07 Feb 2024 01:21:14 -0800 (PST)
Received: from P-NTS-Evian.. ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 m29-20020adfa3dd000000b0033b07e4cadbsm998559wrb.115.2024.02.07.01.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 01:21:14 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 10:21:10 +0100
Message-ID: <20240207092111.236577-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707297675; x=1707902475;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ycg48Imx20dMFJ58VX17HPR0gtyFFqEI/+4kUe/bBfM=;
 b=m217RINDOAROc34X2BJbLuoIoRwmRTeOYLZiqVUskW+GqDgzlkESNYnIfXmm7ROC8Y
 WHh4+k6BL4nJeEBNJblAu9LangVdps4kIEnQlLf76m5GMW+dMuM2w4POxbh+KfYkBMLG
 BZXGAkcm+CWxfvXJk24fAGNrwNHE8g7qT7Ys6v8Fq4PI0TLd7maifK0Am6zXGQVDjRVC
 ljTVrhDTJe8SBRsA/8NkoEubo78+xFPTuVF0ymAbQZ+IM01ixq3z4bsQrK6xwaV+Ksq/
 XOy1Yoz8pE/T7YJ+A/umgTJvLafQMNj0cX6ruNJp1bw+xq8qnSxLMAxJU7OU5Qnpv4Ze
 Iipg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=m217RIND
Subject: [Buildroot] [PATCH 1/2] configs/ti_am64x_sk_defconfig: explicitly
 set the kernel version
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

Commit 6b2329bb80 ("configs/ti_am64x_sk: new defconfig") forgot to
specify the Linux kernel version, so do that now.

When the defconfig was added, the default version was 6.4.x, so use
version 6.4.16.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am64x_sk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 052c440093..b3e69e9e93 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,7 +1,10 @@
 BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
