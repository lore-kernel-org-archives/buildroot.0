Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA3BC19F32
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B1A83FC7;
	Sun,  2 Mar 2025 21:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09Y_ZZw-N6L6; Sun,  2 Mar 2025 21:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E1084025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E1084025;
	Sun,  2 Mar 2025 21:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1249595B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B87CB60A6B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdwpC4HqMcck for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:53:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3181605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3181605C9
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3181605C9
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:53:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso499719f8f.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952381; x=1741557181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cx+1nMa+w3YPBWxIMkVITM5EtSZj1DeGGklJLWGSf7Q=;
 b=Xq8b4W9Pxy5c5Ziw12qht7Lv5yLgu94JGw+4irf4t3XRZ0ff6Ua36EM4Ecqe2Uvh3z
 YDApgx0zDrbsBfsJMqFRBqIf3Gtnl9Ooi8rgV1eiC9mh9+1yvmar701CwKez9ARZ09oe
 C7s2jHq4oEy1hQrxAIpEdAaTAaRx4MmUYTiGz2z3lGA7VyLuOoTGB2XU/lbaS3aeLCmM
 LW8SIXxyPGx/3ospGgpdvgj/ZTbzoEUk3UdlxjsZmjIXPUcdfojt3LgyF0RISMQHqYXd
 Rxj+7OoCS9qbqD/SDmz5+yhr4gGlB9ud0q1YCo1F8n4vOYRGyL1a12FtPunQUHTyT8nE
 tTbw==
X-Gm-Message-State: AOJu0Yxb3eecuyMccZf+BFQV1JxXVoATs+y9yiafa5F8ZBB184BuHmf4
 /J4JHOIksF4G6q8pboohlh3PLfgfSU5CuLLOXGV4BipqaKK6bUENV1cZp23n
X-Gm-Gg: ASbGncurBqk/cqckUu7El7KrP8SrZcQ4s9WcgVzwXMAO91496JInvxfPQMsfaG05F5j
 zV3IrYbrw2xpftN+He77bUGc/2cEzH4NtIVDkxUWDyj0yX3wcCMSuAn8lSLhb5EG30AUUEOQ6MM
 ptrFuXM7vVsGfjvdQB0bfc4W58/3EF5paag5XblXgsaRE2+IyfeDM63NJO6h4P9tGv4fRTtPIkQ
 rXZRP9q17Gm4aIX13oe0V72CQ4RKo7BdMfMMrgTcJIyZGa3qlgnYa3RpgslEPoBjqG0WH3kRgl3
 ffmAAVCgpuBgtIoOOD3qCkSytWUWmM0boRLDdA==
X-Google-Smtp-Source: AGHT+IHgh3M6rT8fFZv2mTGzFcu/907/jHbgr15U7L85MYRw88HfQdFcBCqfKlTSXABF63I4S5jlAw==
X-Received: by 2002:a05:600c:a01:b0:439:9a40:aa1a with SMTP id
 5b1f17b1804b1-43ba675b15amr37397885e9.6.1740952381076; 
 Sun, 02 Mar 2025 13:53:01 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:59 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:17 +0200
Message-ID: <20250302215219.1276480-14-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952381; x=1741557181; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cx+1nMa+w3YPBWxIMkVITM5EtSZj1DeGGklJLWGSf7Q=;
 b=jLreAOHZQKIKnj1+OrWED5AO7VbO8RWUbeUlBwHMOuwydXXJAPhed+MghT2rD6Bopn
 8DM0V2vBVDKD0ZTohjh3UQILNIOG3gjCKzDE4z8vFLulgWikm6v0svMXwvKX14vgzYjF
 PMw1SOF4B0prrQ9AhMw7QWzH7VwcxjwW8FrKRcsRqix2CsPPlgO6akaASKkrkL4phJeN
 SlIjYRhY5yd6AsTRBmFlpv6b+gh8mYOoRRw+Qho2SNAc9066YzyN0pzyNG1SJQ9cztQf
 UI7kDzG0pMXEioscVhG6Lvt+eMmUlxU+VZ8iLV8DWoRuvFWtefIoXQki+z2clY5rPHrl
 NERw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jLreAOHZ
Subject: [Buildroot] [PATCH 13/15] configs/ls1046a-frwy: enable the fmc
 package and dependencies
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since LS1046A-FRWY uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
Patch is new.

 configs/ls1046a-frwy_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 52d8f0cc07bb..5c05da82f0a6 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -41,3 +41,7 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_QORIQ_RCW=y
 BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1046afrwy/NN_NNQNNPNP_3040_0506/rcw_1600_sdboot.bin"
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_FMLIB_QORIQ_FAMILY_ARM=y
+BR2_PACKAGE_FMLIB=y
+BR2_PACKAGE_FMC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
