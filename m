Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51431C44536
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9864E80EF4;
	Tue, 21 Jul 2026 18:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFi1m51L56Qy; Tue, 21 Jul 2026 18:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A3580ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784659392;
	bh=3qU+OqZuK9HAknNsedgQJ6rn6jB4ZIzKHIzSlooEuLc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qte7s43s2AYbCNP4xMwoHZpkSba2mvWrJjkOnuhiY4EtGBi+FoBPAy3QzkI3G3b+s
	 RKCYRVtWnbDuldWbLC2iElFernPTXHiRqDZx98OL9pQbkNkCE0hc/lxh0CYsHGXnW5
	 ygGYKXsuz1TzPjZEPgTN0BcXst1KWa8LVax5QfF5xCla71RQDmYWG+/2WhTKb3V4lb
	 trsPDbWLWK6A/c65slJcQan37k1Oht7BPxvcugn6e+Ki52iPu8KlkXtLJMERyoGT98
	 JXfbMvEknb7yChB9OQlaRtSnolgmoVPuGzHUL/LLLFv7YA1e5qTNGZ3VSxWMbzZ20O
	 8/3+1xeKnCX8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61A3580ECD;
	Tue, 21 Jul 2026 18:43:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B087AEB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95CAF80F10
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9C4qSHeWxIB for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 18:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 837B380ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 837B380ED6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 837B380ED6
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 18:43:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49550ec592cso17245115e9.0
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 11:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659386; x=1785264186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iC9t5/LW8JzsYIYQYVwPSUL8/yC2qXloojAC/zTqOdo=;
 b=cRC59w2bEHbdqq4ci7SoaTWJNBbXDr2PJI8LWUj4WpfuOpB+YxnE0arQa7ah9x3n7Y
 c0KHEnIIIoofOIjLLYG9dcDpPKJCWaSr5WW0ikBerIrlOvyPn5lJwYe0/hMOGpv9Jg7g
 YsoebI64RRIRIKIDAMLtcyrO6EX0j0uIuBXllHie2DJjOSCEnvWgEUE/I36mHdrf4uzQ
 qUj4O3Ol4XlX7w992TfJfnCq+MwBxrX/ibpe8MMww3W0tNymg/T/9PLBqbL79HAdU21T
 ltYMfPDVp8ImERRRLEnOwgSeXh/RkyOhuTvh2FgwpmZnI91Z6Z+Ib+bWftE1wOZAraiM
 nNfA==
X-Gm-Message-State: AOJu0YwL3xelb0BCArEDqmRAnup9fVJ4XLAEDZdmVOHmYY8u2zIRrQ5D
 te3Ee1zLIRLWiv64Dhn3tliwOYrz9mxi+hLwbCsZduk/JOpjqPw3L+KEBi+bLzF85bCUF112Nis
 6RfSG
X-Gm-Gg: AfdE7cm0o4U2VM8L3jz6sW/DW0/VJGFUVXsDjHzndqpt9nQJgYA1gFhg3X9JSC3YwR2
 wpP+tpBv+rLagnl32Ey9fibIDGW7+4A2Aru1g7orjc4jpZJpkQgBOfYqPfaOND1MOfcyjQVg2ch
 rYhjfTP4wIgRAdEP1nG0Wn9bj/dyocPz0R0KhufoQOQ2WdefWl4v4gDdP11dTnBsA3ckGjGdi+I
 JjlhBUAt6qaD9PqMwxGI85WcJUgBfF+0/yPFhTG0jK6aOGKggqOWV5DACmwd0N2dmrgMZHW4W0k
 V9QKZZRF2g6A3g+Tx9uwg+BkzVg5GKzw65878mkVcy61weAd/mORvlzhxBif5FjQ9uXPdEyR1A6
 h0kQI2qBM7FS8v+kUjOGTWqh1UYygiXqkgM/SvIO0dK0/zNHDvrcGgefTnfNA1gEeXiD2tQOiOo
 ClQwsOOKwhaiZvQz+/FhijN0T1OXCoDmJYuvqPeDqbhmuH/0zY/vPoVZNWinRancK37o45PZKCC
 W/S6c5jGFLGlLrnbsRRGcrDfyuBpKl0gDDOKA/86umXnDO8hMkIdcRuh2n/XCaZ53jRCAmLhQlN
X-Received: by 2002:a05:600c:548a:b0:493:f783:c46a with SMTP id
 5b1f17b1804b1-4956a4ef5d1mr8879595e9.6.1784659386316; 
 Tue, 21 Jul 2026 11:43:06 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956b030a64sm226505e9.3.2026.07.21.11.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:43:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Tue, 21 Jul 2026 20:42:47 +0200
Message-ID: <20260721184249.1579381-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
References: <20260721184249.1579381-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784659386; x=1785264186;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iC9t5/LW8JzsYIYQYVwPSUL8/yC2qXloojAC/zTqOdo=;
 b=pWlQBFmBNuAXXDPw4YC7O1NIQGKbD5qM5b3hUVHBGmVpt2GtIMpRfScIqg5gXX4EAp
 FUgX8pTvvBNMF1t/hP/sfUA+YVs3RXAkYeXTeLmNsu5YmFoBHLjW/fEo63r1BSFvh4JO
 hEUNHIzD7nty84dWroqx0Wdn1CpQK1TlkD4UA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pWlQBFmB
Subject: [Buildroot] [PATCH 4/6] configs/stm32f429_disco_xip: bump Linux to
 6.1.177
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

The patch bumps the Linux kernel to version 6.1.177. The size of
xipImage has increased by 23131 bytes (1696766 bytes compared to
1673635 in version 6.1.167).

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 +-
 configs/stm32f429_disco_xip_defconfig                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
index c34797e4f5ce..be1c34bc237f 100644
--- a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
+sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index e6edfa906177..0c472a328bfd 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -9,7 +9,7 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.167"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.177"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
