Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD830C5478C
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9093D414B4;
	Mon,  4 Mar 2024 15:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyOMacK2wtBF; Mon,  4 Mar 2024 15:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DC8641511
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DC8641511;
	Mon,  4 Mar 2024 15:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2D21BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB27940939
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3FvrxInEDku for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC95740955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC95740955
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC95740955
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a449c5411e1so399800666b.1
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566451; x=1710171251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Js6re1cNZnkdKlpxuJ10eiMtCKJbntgPb35mWC0eE5c=;
 b=hFyt47hout9TW72MA2c2wpQc1t9ynLfOoNKGsxvi9/ULv2YrvMMdlo94Y5WzcIzDLU
 lB/68bXjcWZQSY+NCivsg6YSuDalHZEFwBnGe/t1rsDlNniXWv0iy7I730VzSBW6Dfwe
 M0L5S0w8/veUe+XyD4KDWO0AkKgxiFazejQOAdmWuX32J6/O4XMjES/XrjyK0fmgGrn3
 56FBNROFD1AID+GpLaYWsDffoF3XwtCjvADI9KcjaWLvswj4q+caa6tJoMjpWErdUZii
 zFXAccjkPQj4mgwMzRZIGmruzyVbTNbJMSvTwFyFRt5ubdR2Gv16Frdol94M9OrBHjwY
 7kHQ==
X-Gm-Message-State: AOJu0Yx8mSY1NhBi8R56sJi1IVWVF6XFo+w84UeNmOsnMVjaGDKjl05S
 0R+qCEWwlOhJ9vKKCVrsOdF74kC+53Pk4dEj2F9RSJUn75/WrJ3B2Zm1NH5q7qANKstfAP1jvsM
 5C9M=
X-Google-Smtp-Source: AGHT+IFHT7MAsL1ajGsohY2RGieXPYxKceIoa3UPpwbKESKd7mXgy2UeOMDPA2YKnBD3jUdn+UylLA==
X-Received: by 2002:a17:906:2548:b0:a43:7ea2:a289 with SMTP id
 j8-20020a170906254800b00a437ea2a289mr5804681ejb.55.1709566451758; 
 Mon, 04 Mar 2024 07:34:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:11 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:34 +0100
Message-ID: <20240304153253.732708-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566451; x=1710171251;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Js6re1cNZnkdKlpxuJ10eiMtCKJbntgPb35mWC0eE5c=;
 b=AfH1pBrmpOh7frI9OrkEQTWqZhfDOk86PWRZwM5j8laOEDhGTvMcRArFxoBoRsuE4t
 qqnvb9uVb457yqLoGzTD5uWGMXw9lnWZnD3u7Me0tBbhw22J4/Sx9mwEb+5qnE5QjAJW
 N9yr2u5/bV+NBuztMH8hG67vRUALxHqh90waE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AfH1pBrm
Subject: [Buildroot] [PATCH v9 03/22] configs/ti_am62x_sk_defconfig:
 explicitly set the ti-k3-r5-loader version
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

Commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig") forgot to
specify the ti-k3-r5-loader, so do that now.

When the defconfig was added, the default version was 2022.10, so use it.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v4

Added in v4

 configs/ti_am62x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index c3ad555a8184..a129e216d25b 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -25,6 +25,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
