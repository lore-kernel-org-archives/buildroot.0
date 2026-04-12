Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E42ED58B06
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 08:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD58D42137;
	Sun, 12 Apr 2026 08:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzW0AK-9dNU2; Sun, 12 Apr 2026 08:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576034210A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775981969;
	bh=8Qw7EZjwWTa+N0uRjvfulaKQgb0iu9DkxgpoPX/+L78=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Xvzoht98oAz8WTczGwLv/0WHTtQZy8a4cIe56Fv5+iHUlJc8UY4bNWCIkJjDEDgC9
	 7vEOEWiUqaEouunxVVdDolLIha9I4jdxtI7mP6knuidyUS3l3eInZQuZINI7jmCnFc
	 uTW7oUMgnDr6PCuw13nXEu7IK3Q1wN9ghx/YWuEsCJOWDHcI8v1UaBJjhNQbWOOGvE
	 mQk5eiFcvPSvixv67ITRSATd6cUrLTqtVsPtJ0pz6/frnHx0LCJx9tBK9VmG8eZCA8
	 4r4tTaudI15RuyvlaTlvJ71rGe8+2orNMZ5lUd08aiNr0yat15O9EMe+tra6Cptzjh
	 H4+acF7XC5WUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576034210A;
	Sun, 12 Apr 2026 08:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35B29237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27A614210A
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 08:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmUxZj72yI2k for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 08:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5CEDE420F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEDE420F9
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CEDE420F9
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 08:19:25 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-66bd4f7b2d3so3731936a12.3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 01:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775981963; x=1776586763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fVSxU1rm8z4EiWNYFYT2hZp+NnCuS8mWA5wTQ1rK5Q=;
 b=M4xjqFwXBRVRq/Sx/gA6+QgHMZvj4OcytcTtkVpzi77n0teZaV1VIbbvRUrNPiBoNG
 w5OLVKxVHFUEJyeAdrkjBcRO5KD8+UXdcHV7UsGxjrSP2oA5lhWtFb4sYcRAwAapzPaw
 kLXeNKRYxJTjlKmo++/AIA0wfRZiSHlcwbRCzuarBPWe5RMsOX1qmMG1kOqkBjMw/k46
 sIgLc4Jr0rETBZSHOpcIuJYlHgB4p4YPS7vyIDsMEqoaeFXTGTwnuESERdb1wYgXnPHb
 W4dJVHTNDQyXsHumiaAMHEsfB9VoY7nlqix+G1D/9oGpEhR6BG5wSxJ+8OTkyQhlvYQ9
 nSjg==
X-Gm-Message-State: AOJu0YxKJbj9NE9XlXyeKNOLbWaFbg9RV2viV3EjGmOCoDhLQZGo7gJ9
 d3EH2LAuC7nw+4nqMNkdEgOCWGUhtCCFLtkUWp/ygTBMzXQtSb9IYkeSKkr14zflvxFdEx0NXMq
 ZFyXzNUk=
X-Gm-Gg: AeBDietZJiclSg1CYbik2t5aTRnBnI1GeTnYxZaiv986Ke2ApmSQFL17DB4qLTcv2v4
 lRFX2lkszHUYuhzzwEkeBiRbYEXYCCAzbZ+hmSvQguzjPGkjadva1h6up7+0Avl4A6VOp59Rg7f
 9zWYfZaqj58eLxeUSe59OCc6S7C24MQPwsdKkpjwarCG7p7/XAEzFv2icHes5VlE4cp8ivoY/tj
 AD77hP4Fht9LwQeyIE3ef0u2mHdm8hsb8ihcI7tBcaaz0fwEj8BLniQ1iYAGJPgSrSQzdo+osrp
 GfxZlTnx6Txhm4lwvvmUO1JinjQkSsgmujZCI8xPttB2WA4bS43kfemU6gH8FLcNtVSB5fIIJs1
 G9w+FBudcQCzHxVKB3yDvdUfLEgYNua/9cGaswNPEvcHlrKpksYecERrFUWAiRoSYtTBcnWERB2
 ysfWGYNlqgutk2cJppnaruNTk42cDb8A==
X-Received: by 2002:a17:907:c48e:b0:b9d:6e81:1c35 with SMTP id
 a640c23a62f3a-b9d7277b6dbmr516866066b.41.1775981962316; 
 Sun, 12 Apr 2026 01:19:22 -0700 (PDT)
Received: from mind ([2a02:a03f:8b19:d600:9448:e7a2:b059:7d14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9d6e5c582fsm229408266b.31.2026.04.12.01.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 01:19:22 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>,
 Javad Rahimi <javad321javad@gmail.com>
Date: Sun, 12 Apr 2026 10:19:14 +0200
Message-ID: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1775981963; x=1776586763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8fVSxU1rm8z4EiWNYFYT2hZp+NnCuS8mWA5wTQ1rK5Q=;
 b=JPb8UlKhqWVH2kPngW0XXwIk50UZ8WU/UosCTkwqkgdKP+pwLn4DzrtirA2Vd99ELB
 b/i30hOJ6agUk8OAZ+tr6Qk2WuWFkEs5CsyM9zHxdLWVUKPPb+XT9/epxBpp3tbkYeW8
 YTA1JM7fgmqcDPMQ62t4VyvdO6btz4W8EftDy/mOXpX14B7WAo7ZBduaGWM7u2QcJewb
 +r1AshqjumDeOG5CWMT/+yqc1ADnOZf9BKq4zr+ySupkhWU2XJYSzpZ58j9n2jPu4SDY
 zfH0uPxWnKjmei9U0jzPV3LjYm1DFQT+b93F2rbSRpBf5W4ShfTQTU0/6K727IZI7n8z
 p3Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=JPb8UlKh
Subject: [Buildroot] [PATCH] boot/uboot: bump version to 2026.04
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

This patch fix the autobuild error for OrangePi PC2:
Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 configs/orangepi_pc2_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 46d04b34c8..115fcc93fe 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -23,9 +23,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
