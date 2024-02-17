Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ECEC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7FB383EF0;
	Sat, 17 Feb 2024 16:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HNdQaTTi5Mb; Sat, 17 Feb 2024 16:03:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C69D583CFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69D583CFC;
	Sat, 17 Feb 2024 16:03:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05B081BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008A24076E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-N2ecQ5YDKK for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02DF14076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DF14076A
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02DF14076A
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5129c8e651fso1314318e87.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185796; x=1708790596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vi2n0LHY8oGAIL1VmzLmktIBqylURF4MXo4bL1w+JYo=;
 b=WFTHoAvljSVvx7WHlhL5zG3jl+D+vkVa+WAMFcts7cLwiJJXpUe3AIp9l6S0gkwEW6
 lxSgzEPJAGuI3nLTptG6rw5xRmOEXjtq8nnni/UIX/r6hymK6cYvFm4aLZ7CZpsaten8
 c7kortl6lnlZ/qGgAG2Ky8hNqbpRBd7wwymXoN12vWt/OdJrLqf+yEN06eVV88ArTWqr
 uyIU3NHqB60Kft7IMiqx94NqChl6Ykb0YNwZa7tO8jtZd7tKT35fcNNK95AWN6dOOQTI
 r9WMNXl0YQdDsc7ReNmPI7Tmpp+vennq6xgTqx8iJu3+NJEbz4LLWBYqlh+XgNYU11OC
 xp3g==
X-Gm-Message-State: AOJu0YyYFBhz3xldKeoTJ3vGrLAxKYZuieVm/Nxq2V2b0qU2hx59Ynaa
 pHwe63J3K2wmcLeXtEXl3bpmYTTA/NplxIH8maUFyOClJW82On2qQ9vZvfUYDjCGzbbCBK/httG
 7c/A=
X-Google-Smtp-Source: AGHT+IGZcI8QicfjNe/JrMJ89Q84COdbG2JEmRqHTAWbf2jnhsYgbgfVi3ZKaJmgVXwnIRbt6cgAdw==
X-Received: by 2002:a05:6512:2249:b0:512:86fa:bb32 with SMTP id
 i9-20020a056512224900b0051286fabb32mr6802140lfu.15.1708185796129; 
 Sat, 17 Feb 2024 08:03:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:38 +0100
Message-ID: <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185796; x=1708790596;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vi2n0LHY8oGAIL1VmzLmktIBqylURF4MXo4bL1w+JYo=;
 b=FG2OhharSPpreB1zFl7gqVJmhMIUnFWkrVt0uBD2ijo0eO4wRVIfRyt4dEuJjdIw+O
 BrLIRf9cMPEOMbfd/14El7yZReo/zm3+kM0kqMCiTR8o0sjc9A8TTE1FQPlNid3U9qhO
 +nvRKaR9u6fq3ITLnqhG/MEVcmzFXv2cWPMUc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FG2Ohhar
Subject: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for TI
 K3 DM
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

As explained in [1], adding support for AM62x LP SK in U-Boot, requires
binman for building bootloader images. The BINMAN_INDIRS environment
variable is used to provide a space-separated list of directories to
search for binary blobs.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20231030110138.1347603-3-n-yadav@ti.com/
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v1:

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/uboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a88059..cf70f86a4132 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -189,7 +189,8 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
 UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
+UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f \
+	BINMAN_INDIRS=$(BINARIES_DIR)
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
