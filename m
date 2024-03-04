Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B91C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7A314148D;
	Mon,  4 Mar 2024 15:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHsDuiTgeGpF; Mon,  4 Mar 2024 15:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9422F414CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9422F414CA;
	Mon,  4 Mar 2024 15:34:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 264B71BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13E0A821BF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgTwa4dswl1J for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47B9781FF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47B9781FF9
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47B9781FF9
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so6474532a12.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566454; x=1710171254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqwXj0Cwjbnuj3JXbq7I8NEydeF4lxxZvlM/8Q2Wx7Q=;
 b=n36/Y5D89JPeGpC92Evjerqry9Kv3b/ZdRP7cGP5WB8baqp7UdF2hjAyyzysicfCae
 2X/AFV1taSgVBXwBdQMmXScQXGEi2okHHavzPTVlc3w3YNHTj7S68NFJ+4/PZ5P26r6d
 BMJuTwkxo2UWg129xd/YQgdjt/PwybBmuzALt19AKmQIIvRWj5NZ7DjAjOIZHNXISTgU
 b6lyC2o/5tetQx0cZk+H1zOslTr/u3BOL/7g2YFcB7QaSKwtE5ZRCWMhIsU6PYNvvQOs
 Wg/TwZYhgB3P+clhhRixX03ZS6zufNEcSYfLo4IjXERlISWH3CzvpLLY6ULq5ppL6hfG
 zD3A==
X-Gm-Message-State: AOJu0YzjKyNuqvy1y++HLPKIXZ6226I4NYlXh525Hs7UV6ZD03kQmbLW
 iWNpx8smAnVDEsZPkH7rx1KLhiySAOIm9BGc1DCZ+v1hkpGQpZC5riEOo1PPqCTDoN1Bd/Ul9WM
 DaF8=
X-Google-Smtp-Source: AGHT+IHhs6F6rG3AZOW8F/pze+PhCN8X/MD4ya2hXFouTuMnt50jkWlW5iUs25L6AfdBqitK5B6HzA==
X-Received: by 2002:a17:906:abd0:b0:a45:293a:c94c with SMTP id
 kq16-20020a170906abd000b00a45293ac94cmr2488612ejb.60.1709566454053; 
 Mon, 04 Mar 2024 07:34:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:36 +0100
Message-ID: <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566454; x=1710171254;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqwXj0Cwjbnuj3JXbq7I8NEydeF4lxxZvlM/8Q2Wx7Q=;
 b=pva6AVWWaJ0cDQZVzJR4M+yLcBtpk/g6qztVmZCxgPWBqzP00bZDDp3F85/CqzXxaL
 CYMEC18x5riVbb5zzBuVh2mR/tCO4kyWUh4AcaSDGKiNGtPnAhwtk2/+0t3GqkyBrrzq
 7yhg+70REc7bY1eHz2+j9RUzPZJzPxlESE6jA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pva6AVWW
Subject: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to version
 2024.01
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All in-tree configs with the ti-k3-r5 bootloader use a custom version,
so this patch is mostly for the menuconfig default version

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v4

Added in v4

 boot/ti-k3-r5-loader/Config.in            | 4 ++--
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c8368a1a5a8..5f86c045c99f 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -16,7 +16,7 @@ choice
 	  here as it is used to build the main U-Boot package.
 
 config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
-	bool "2022.10"
+	bool "2024.01"
 
 config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	bool "Custom version"
@@ -60,7 +60,7 @@ endif
 
 config BR2_TARGET_TI_K3_R5_LOADER_VERSION
 	string
-	default "2022.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default "2024.01"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
 	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index c5d1cb8e09f0..fbe5d215409d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
