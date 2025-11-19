Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0EACF3942
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 15:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E8080DA1;
	Wed, 19 Nov 2025 15:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No5V-qac_Fu0; Wed, 19 Nov 2025 15:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43D3080DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43D3080DB4;
	Wed, 19 Nov 2025 15:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F0037D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADABA40549
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lzfY_YC5-jrS for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 15:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=nolange79@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D88BB40547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D88BB40547
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D88BB40547
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:48:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b73545723ebso1234842166b.1
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 07:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763567302; x=1764172102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+umOLVx5Hqgu+RlIbwb22yRXpv88rKyOKjZut9kd4Zw=;
 b=EOPWCBZ18dlSGz4E8F7x9eDFzwfQur0ipj1wXaJpOHBwFt/OrWs65EVMhSpkPu//k1
 OXmkZ/CpfvSjSo8Cu2KKUpnbNDW0/9/JFi+1c+NFzT3gHMXNKrNkjVS1iG3NY9odCCCW
 3wHLeIj9ZOHMewZAvn+jnDl0WbUILiYjIJ67aSzjuvR8l8JTaNxNDbApUUo6q4lKxUdV
 wLUqDyqv0drhoX4Mzzy7gCZR3r/VS5V4BGyCHc0HAOC4QyIbZiB/dmMsBBJDqIa1sz40
 B/PvlOOrR9TobidW1dyP+rF2xnbyiF4k8MmamPtRk3sGnF+02Qe7UmREktpgsN6VkGUj
 L+vA==
X-Gm-Message-State: AOJu0YxTmn1Iw3pP3dFXHnM8a9Io9xiT7HEumUmzofCtueb8C/fuv9mv
 RIAYciIw2VAqywaXoAl2DKCcCIAfD/vpj2uArmybPWEo532kcxZEQeke9C3yhQ==
X-Gm-Gg: ASbGncuFdkseK/kLw61NYsAB6oamqNUkyVRkYS9jKM+dmzhgVSfqGPNf9VSaLsroty4
 Owa+8bysSc+rWAuYbjI6QXG6wbSWS54w/qw15XQraHJ4AL02UDUkf8vVN9/mPJBkHdyS+brBo5w
 xR8dNhWbTb7+hv5rZafKe8kSOtV4S4GcJkdDKwlRWxNt44Ho05gQqJuF6hltzRvFmPcbblk2jTA
 Bc3FscQDtrcQRDIwCpcE3Jubg77Ls4y71n2R+yhbKoFx6PWy7s5qrwz3go9fgkrJj7t5MKsl7pW
 +i081As9jEB5E1FUWC4wjhgGS7swAFnSZ9BO3HNOTl5Zt0qkpTqiad6KaDoM1+MqhmpRGMP32yJ
 2sV7LGLOmKH8XQakFbxKdObxznXo1SykE0CYgsSi9PO0nMJe/wuFe/ytucslPR+DqxglbnV92bR
 ksxI/pKKR3zgLZEjVmFs2S3xF28y6RQcC5ngOqR8wIiJhic6Xql2NS
X-Google-Smtp-Source: AGHT+IGA/yDbwc6gWIOq8IBKF8IIkJFwRa+l43pSOX26fUA7Aj68veopB3OW7v5duFXhhV5nHsadKw==
X-Received: by 2002:a17:907:9615:b0:b73:737e:2a21 with SMTP id
 a640c23a62f3a-b73737e2c28mr1699699566b.54.1763567301796; 
 Wed, 19 Nov 2025 07:48:21 -0800 (PST)
Received: from vcllano-01.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7359bfb238sm1571586366b.14.2025.11.19.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 07:48:21 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Wed, 19 Nov 2025 16:48:18 +0100
Message-ID: <20251119154819.3416176-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763567302; x=1764172102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+umOLVx5Hqgu+RlIbwb22yRXpv88rKyOKjZut9kd4Zw=;
 b=XaD5vScUu/HsCzDmwKKJe678Dn3ozkjGWD3wMZL7A8UnBbWYR/Re1/BU1HDN4lcliq
 tdwu9Y9I6AwvNLwTnwVw3rUFOK+WlxhSLde3705A0xxpDtY8JlkfIF4yaUbAdWiEi8P6
 3OlXg3bzosp5oLGlipJZ7hB5KHJa8I6YCtKLJhI7GuPR6LqnsOEUgUJ2tY/ma2L7jQr6
 BvAR6j5Cz/L4qEtUX/OLRBXX1fievV2KGGfr9H+vGFJdI7mLRToJAVILUNP9iyByPYO6
 ePmMmzbFOYKtUPfpkT2rVfzgVcJPKgt2UG1uYMAaSvdXU8hxIs8XhQq++YEWcVhTa0ZC
 07Xg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XaD5vScU
Subject: [Buildroot] [PATCH] package/systemd: remove several Kernel config
 options
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

All those features are optional and prevent customization of the kernel.
Forcing IPv6 is particularly nasty.

This reverts parts of "package/systemd: bump to version 256.4"

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 126ce7716f..0ee680e55e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -863,35 +863,16 @@ define SYSTEMD_LINUX_CONFIG_FIXUPS
 
 	$(call KCONFIG_ENABLE_OPT,CONFIG_DMIID)
 
-	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_BSG)
-
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_NS)
 
 	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
 
 	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSFS_DEPRECATED)
 
-	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_SECCOMP_FILTER)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_KCMP)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCHED)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_SCH_FQ_CODEL)
-
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_SCHED)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FAIR_GROUP_SCHED)
-
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CFS_BANDWIDTH)
-
-	$(call KCONFIG_ENABLE_OPT,CONFIG_EFIVAR_FS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_EFI_PARTITION)
-
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DMI_SYSFS)
 
 	$(call KCONFIG_DISABLE_OPT,CONFIG_RT_GROUP_SCHED)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
