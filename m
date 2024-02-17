Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FB7C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E814783AC0;
	Sat, 17 Feb 2024 16:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMLYmwVBOyFE; Sat, 17 Feb 2024 16:03:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3DC83D37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA3DC83D37;
	Sat, 17 Feb 2024 16:03:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B39001BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC3AE60BF2
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eI9Epn8EOPui for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB25260BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB25260BB8
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB25260BB8
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-563d696ce87so3040005a12.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185783; x=1708790583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fb9RR9xhHBnSfFwqYoWBbxcnoqOC0kGA9Ba146KqPRA=;
 b=nVsJHCwcjPZO9Y8UilMQWVq0vsd9SsN0hfhDL5zTSA4sOHYZL2e1lFeI3GagMzJze5
 vcTR5/Iwqlq/OSf4Hd73T0V/z/3GvVjyGvSNSkBzcyWCy3mYoSaIkD3PNoP548tP1PTO
 C0voim3kP+lz8SBLBdlciKzsFzoX26v0kYIR/GHb6qjL1+ynC7KnMn7N4Dt3pmrqSPq8
 xVVaTy09YDUFiCcF6svbM5FwqamgQfgkFR80laTCYkWiWLfFLPhv5Zehjer34O/hO0yR
 hjEq+r2ywY8Sd/MVcfAGqJpwaRkjw79pT5nU2O4jVcL972Um0TZp+6RSGmRLpH1B05a3
 y5qQ==
X-Gm-Message-State: AOJu0Yxls3Gf3G4hqNbFSVY+XVd2KPJS6YlpBalK6Rk8uhXa4qZmdm4W
 9FVl0JiKzgaJHTryC/AEzGutLXj4xVT/Do4Qe97p/Lj2zC2FT38pD2XHBjHQiqS+EMRFiL+GI1X
 sMLI=
X-Google-Smtp-Source: AGHT+IEPhdbvR54SxnK5A1XhGesxO51xY5PZfGc8HJyjVS/WCVe4w76K8RXkR5rIppyfXlSFw/0nXg==
X-Received: by 2002:a05:6402:4582:b0:55f:ce14:337a with SMTP id
 ig2-20020a056402458200b0055fce14337amr9174227edb.11.1708185782677; 
 Sat, 17 Feb 2024 08:03:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:02 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:28 +0100
Message-ID: <20240217160244.1320482-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185783; x=1708790583;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fb9RR9xhHBnSfFwqYoWBbxcnoqOC0kGA9Ba146KqPRA=;
 b=Cg2qYXW+9laxl2mnq8e2h/Wqkh5k04NFx/p5DNX+gnxceBJAJaQKVbvRogVsGvjM7o
 nPVOz8Tz4t8wu9BADjMD8WGl03BAwKrV+7rO/aXlAWPn1jlZ6q/m1lW0ejH63lJvG9M5
 utZWcpQKWQvNhe772Txua7MXhem6Wp8I5vogs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Cg2qYXW+
Subject: [Buildroot] [PATCH v4 04/20] configs/ti_am64x_sk_defconfig:
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

Commit 6b2329bb80 ("configs/ti_am64x_sk: new defconfig") forgot to
specify the ti-k3-r5-loader, so do that now.

When the defconfig was added, the default version was 2022.10, so use it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am64x_sk_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 98476c88626b..5fd9653b5b8f 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -26,6 +26,8 @@ BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
