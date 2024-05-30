Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34C5C25B74
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E69F843BC;
	Thu, 30 May 2024 20:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FV57xubraw3S; Thu, 30 May 2024 20:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E976843B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E976843B8;
	Thu, 30 May 2024 20:47:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E54E1D4ACF
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3823441971
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 20:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkEsYFyE5CeT for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 20:47:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0720341972
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0720341972
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0720341972
 for <buildroot@buildroot.org>; Thu, 30 May 2024 20:47:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-420180b5838so9262075e9.2
 for <buildroot@buildroot.org>; Thu, 30 May 2024 13:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717102036; x=1717706836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D03K2piTmin90/m7K0HLB3lSOATZ3hbgLMQkv/Lz/a4=;
 b=FbVMJJXWm33Ob1cwXzZiQxj1RLkSVeTvgl4UjT+B+ZbwsOB1nuAS77tzP6Sc3F18fx
 2r3m8QdWADv2XNRqDB97IecJP/nvWFK0n68XmvdgSAcZXUoYoEMi71i/DDiFmJGsVomG
 u02ypTvUTUSi5gzWgxwBBdxx8by8xs13JUoDJyFQJHUvDq2MG84WBphdOgaSEFF+7NKu
 n4TqqpogvNRQ33S9H0KV3hZ4wBw/69mot0ZKkQxxaYj4HcDEueN4XNjiLTTNj1YnWoj+
 GdFlinGVHQ+GAaJa6Gu8AxqAjSgQfIrDiO6DIZwl4tde7TmoKhOhhKFBvhEOdhnFmtGS
 l7EA==
X-Gm-Message-State: AOJu0YzpOreYQmOp1S2xFUBdRn8uerJM8Mr6yawK0wHwsGc2Ll6jFuGc
 Jvf8cu78t7hzYnwS0aE9Zfsslfz25TNQkQI0yIMKVG3YHhyHlXDBHwjik7u4FPoRADreyxM/3Xz
 jYHU=
X-Google-Smtp-Source: AGHT+IHaMNRk4DRyfJKRyeLf6lPIyLJskP0T+cF19OLOEPtMP/OC23PV981+teudjx7hXoGyEZGBIA==
X-Received: by 2002:a05:600c:178f:b0:421:1e47:f809 with SMTP id
 5b1f17b1804b1-4212792865bmr33933055e9.36.1717102035980; 
 Thu, 30 May 2024 13:47:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.40])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b84ae09sm4736375e9.18.2024.05.30.13.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 13:47:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 30 May 2024 22:47:05 +0200
Message-ID: <20240530204706.2132204-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240530204706.2132204-1-dario.binacchi@amarulasolutions.com>
References: <20240530204706.2132204-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717102036; x=1717706836;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D03K2piTmin90/m7K0HLB3lSOATZ3hbgLMQkv/Lz/a4=;
 b=FOKIRVNdebBl7GcQKRXmb8SRriUUWGTP5PEX9yoVNGUgdjhR2kBlTr64vOAQoxIrAg
 kOCfBw3YiuqvaVm3QMkt6/Z0TLtwUR0U9x9+u6+S6F1RpoGqFdRK0axAjQzKYz17b0qF
 Yg7zIponzT5O+LMgyKp9xTNIDihkRc9mgr42c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FOKIRVNd
Subject: [Buildroot] [PATCH 3/4] configs/acmesystems_arietta_*: bump Linux
 to 4.19.315 to fix compilation error
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel failed to build since commit e88225ed882 (package/binutils:
make 2.41 the default version). The new version contains the commit
790756c7e0229 ("ARM: 8933/1: replace Sun/Solaris style flag on section
directive") that fixes the issue.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/acmesystems_arietta_g25_128mb_defconfig | 2 +-
 configs/acmesystems_arietta_g25_256mb_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
index b882b2bdb265..74f395cf86af 100644
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
index 10501d462cbe..9c7307613015 100644
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.216"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
