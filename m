Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E012CD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBC9D80D84;
	Sun,  1 Sep 2024 16:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1SKGK54k5VT; Sun,  1 Sep 2024 16:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C976C80CCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C976C80CCF;
	Sun,  1 Sep 2024 16:49:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DE871BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B8DC605FC
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjzU0TuIvgL8 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13D37605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D37605E4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D37605E4
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:49:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42bb9d719d4so22891565e9.3
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 09:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725209383; x=1725814183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wuxA26lXfStJjOiL1iHkcQ+tEH3309mc/Bg9ArP7YDI=;
 b=I6mMVDJpE2Fn61klEJNlNhbGnrvU6ieBpJKmRg9QIBHxKi1DzwNsWPLN6aiOFF3vke
 1YPylnwtQB2AeO+WHyaVI8pH8L/bQ9N9Sah+jA74/NZtzy0525Y+BLWBnoMkL7So7orj
 HIVSNEGeL3qG7L3pxr5KUatK4OBpATVw4LAKURcojMNTQ5IMeCa3Hqm7T1Bp+tyeyYxf
 0aLMRTI73NKogiYIpggEJ5eviBuWH87iP69RRg7YBSlfp1Kp43W7OaLr07foG3/CYfvi
 NCb+ae8reTGeISiI+XSYSa7RPUblqss9V4epMeETHpz40ZsXTtfEKsS85LYRCEp7Pk50
 Ne0A==
X-Gm-Message-State: AOJu0YzNZ9qYVZWxc1L2rSMBcsxO9yRq2Ez249JyBZJAxPiYnZNjA4Aw
 98/8iSPzRFmopNPvZCbhnWZX6uexgGBazG9GNkNTmPCrVuqeMJNKwtxZvg==
X-Google-Smtp-Source: AGHT+IH3tdZZxZeZi0+sJ1Kek/H2ihFyL6VMGqPlG8Jy6/tn0eSbRQuikMEp9aU8CQLZKGdOXv0RYg==
X-Received: by 2002:a5d:49c4:0:b0:374:badf:966f with SMTP id
 ffacd0b85a97d-374badf9701mr3331730f8f.7.1725209382762; 
 Sun, 01 Sep 2024 09:49:42 -0700 (PDT)
Received: from localhost ([212.38.43.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c1cc8163sm3806845f8f.100.2024.09.01.09.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 09:49:42 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 01 Sep 2024 18:44:55 +0200
Message-ID: <13603992.uLZWGnKmhe@localhost>
In-Reply-To: <1913421.tdWV9SEqCh@localhost>
References: <1913421.tdWV9SEqCh@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725209383; x=1725814183; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wuxA26lXfStJjOiL1iHkcQ+tEH3309mc/Bg9ArP7YDI=;
 b=HQ2zK76h65WMz+dgxHyUdYCgEEZSCWgr86Ilm7rRyQh6gA6EvlEShUpKyYKSxCXTxl
 Esp+URhVEGU0QzLXk1OAWc73PdN+a7/JvMDwZW7G/EemsVAz3CC0siwnnDDg5z6XiiAi
 oQQ8f0tVBLXXjV1Ecd7Muy/ieM3p/3HZrcXBzbSSXKP4tIIRASIZzgez9PzCDUrhm7Zk
 Jf1PeO7Hmdki+FtPOha9hQ/kDBYHx+LA+2a7hLdGxzjWAKZOIoRWjWxof+5/2yiLJcI/
 7i1DPTpgaN7V12xc4f3Fk+lwhLqW6zz3EBrSVqe1ngNen+FGvALZKsnkTHa9Gs4447pv
 dt0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HQ2zK76h
Subject: [Buildroot] [PATCH 2/3] configs/pine64: bump TF-A version to 2.10.5
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 configs/pine64_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index a6ddf6e57b..fb3a468f2d 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -8,9 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.45.2






_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
