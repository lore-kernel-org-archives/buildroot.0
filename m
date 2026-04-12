Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C8BE937E1
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 12:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36741843B1;
	Sun, 12 Apr 2026 12:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4isZ-_Ch3QJ0; Sun, 12 Apr 2026 12:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6639E843AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775996189;
	bh=iRr3oOYv9RcXlUByD5rk/F0HkURODS2H+kH/jQSkC+E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LDSlvNkjmwlhPAgX6WtYpCUIZws0TVHQaTwbqWkYN5bYYmgo8noshHHZsdV0oqCkM
	 oA8qeqW2eK2bhrJiJ9svvSUmATjg0/KLc7C6JoRy6TKcbnlLX/bheERalbgLDfvaH0
	 8jyVdurPzr4K/2QD0hN+QrE7QlzfLhUVqZjHdk+ft4IwiPqu9wQor7a7WPFmzluPQ9
	 Q9KPsTnPp/YI81c473ZPMJd2JT0WgauoMhhRp2t+3tmtoWP1rRMTrDJTtDwc2eci70
	 BVC05pN60r0DbJvSaEdMRaG6diw0+hBdrL1UQ4p2aHqaZ3lmzun4wRiUfPrcNlaC9x
	 m3k4m7bzspPZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6639E843AE;
	Sun, 12 Apr 2026 12:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48439194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 12:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E2934228D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 12:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8iptEzJBiVq for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 12:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 621C542248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621C542248
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 621C542248
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 12:16:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b9c603ec2dfso457565566b.1
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 05:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775996182; x=1776600982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n8eEhPNhv5FegssKgyK/ueC3kvleEPyj1E+yr8qO99c=;
 b=FLRPt2FTE28HzoY9gL5E8mKg0HmszoAqRQ+mk5ptRdMWNtLJHSvo1SV4dDiIw4nYFg
 0ud1PnbiX6yn2Nhbc8u06hxggcrMkk2rCWLbuM5Eh9oMRt7aMgVlYOLlBqGNu9sCbdzq
 Q0uVpgcrIXDAOBYy6Tll1f58pScsMAs13i6FDotH4P6DiqJBLXjndnHNHsuOVHExkX0x
 e8g4UcH9ZYPYGcieSBNwUKBvqmcl1AOC0XcbOLqiZFDj7GVtQ0ilHOJqabqqfiiNP+sQ
 QOjO2DeDzeWtmqfYBaquIlQN38jdNcvnq6GzUTwyqSKjtoDG8yYJ7gEJquHa69cKiKFt
 2FSg==
X-Gm-Message-State: AOJu0YyTGUT5YxMkivKkuH2q7107EJcHovZv6zp6QQirJhFDAxBMi4MV
 Uyco2JR3EUHbkyzKV4RxWRjplc/gQK3alauLzKlej+Ti0NO4JUtZl/6ofllFaegsWjpTYJGrN62
 MC7fNrZg=
X-Gm-Gg: AeBDietm7DYhEe1+2Cep8hGSZxf8hnbK5ttbXD7shxgBd3i+D8fSGeSolHM5DKVFPEr
 xxcOLrCSztd049HIOH2KBDs+So7uCjVLRa+YPG1BRWqYhsGrbBLbI8Zjshq+NfVXF9jZnVofzOg
 vGBw+jYeWkMw9lokd07uP/bmUxYLLI/1oPVpn3Hj2pEAuJgJKvX+dACEkstRDqUT9O0HNkZD5Vq
 78nsUW7bGyX42F+ZHOcM0p/dNQchveguelzO17EoExGuNH0mjiLVmqikvQOqBKNQVcYPlHJAUla
 rWnTpmJ+CNI+98oKXbJzHGFdkzVW/jb+v1Zw96T5mVycXhoAF+1OAKzyZlBL+MZpTcSNQCv4avO
 VoE7FuX9vK27pmRCqOESE+MZ0S2mOpe0fUsKkrwMpzhgTOPoIM1GzlyYtpUHug9MPnkVE4Wv3gK
 /1YcX1SB1YfqxFZUXMLixHF1OiIgksvg==
X-Received: by 2002:a17:907:1c03:b0:b97:3bbe:e42b with SMTP id
 a640c23a62f3a-b9d729645f3mr541267266b.28.1775996182297; 
 Sun, 12 Apr 2026 05:16:22 -0700 (PDT)
Received: from mind ([2a02:a03f:8b19:d600:9448:e7a2:b059:7d14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6707082694dsm1832871a12.26.2026.04.12.05.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 05:16:21 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Javad Rahimi <javad321javad@gmail.com>
Date: Sun, 12 Apr 2026 14:16:06 +0200
Message-ID: <20260412121607.1349535-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
References: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1775996182; x=1776600982; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n8eEhPNhv5FegssKgyK/ueC3kvleEPyj1E+yr8qO99c=;
 b=aV7NnmT2LGwH2UGsga+WT8N094PAuYzAS4TNWbkk0HlrG+kyrsxijf5RTwvg5nMN4T
 zN2AXjzWnXN38uBzr8D+MRJuLwVP71v+HpFV49hw1kowIB9ucT9uCAr9V2b6GCYwd5Mg
 dvj3rtFM5a74vnxxbkkAQjYAEet6n98CGQTylxaQhf5QZ2/MvYhEPI53GaYulfcKlS+W
 zGAJGzQZGmJJZneQHAqm4CiEVxNQENzcXzW0ePAYz/60x1YLVzg1esVh8saMpGQgmfx2
 01G358MX+0Jiz7o/18eTz+hvmr9rgSq2y4ex3xgAD8SBQ+N3w+hvHJAXQaHsD/VR6YNv
 NDJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=aV7NnmT2
Subject: [Buildroot] [PATCH] configs/orangepi_pc2: bump uboot version to
 2026.04
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch fixes the autobuild error for the OrangePi PC2.
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

---
Changes v1 -> v2:
  - change the commit title
  - change uboot from latest version to a fixed version
---
 configs/orangepi_pc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 46d04b34c8..9d59e72de5 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
