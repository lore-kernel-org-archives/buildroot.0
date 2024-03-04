Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8375BC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5577D414D0;
	Mon,  4 Mar 2024 15:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk63sjHDo8Fa; Mon,  4 Mar 2024 15:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11935415A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11935415A6;
	Mon,  4 Mar 2024 15:35:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A90701BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AF2881656
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GP_fR3OUmqcp for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82DD581F63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82DD581F63
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82DD581F63
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a452877ddcaso163696866b.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566466; x=1710171266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PTxw9v4vJWFWFxqGPEIz5b+ovpWbrurOUUDeiiATkds=;
 b=Gx80TGtqRtFDHY4mSEaVYR/9zLUcmSuGOddho05CJjhCy14d7aErSJu/jB5sMrsK2Q
 6NEitxHlFMEFFNgkFqqktvGaXcAWlOINvQln9LdDDZ6HjrWEZCiUyVZ6+CgRpPRqBMtV
 UQCQDYMINaKPjGmdCl2l8U6XSLHb0m7iDeiF0MQQgNpyOmxlUb+RGe6dn/XX5FSlZjJx
 TrRoqoLWpf+Mf4mlBoYzE4SZBkXODdOlUiXWzQ2YU0bsYedeGWtCAbDlMkAT11jPb4fl
 Q2jIlpLyVa3A5H4JKLKIAjMFKL3T7X6JTwx0I53pDsatfMIFGxBAwUhJioilE4AzzjnS
 gswA==
X-Gm-Message-State: AOJu0Yyfhyhq1Msy8SmVPRyHZGIku3nYuLTIHp8qObSuGnY/nMzmrgNL
 JF6iyHYloIxXMp0DmrrbGXumADx98X4SE1lUImgg58zSMyAYK5PFd7orCtNDRxMg2fiavyD4Cba
 Ht9k=
X-Google-Smtp-Source: AGHT+IHEaCuI4KUJkd0J+yj+s6YB5UbkxZ/jaky945+NVoMeYSGYfNBKWuhKlPptGX6NvMH7v8TU8A==
X-Received: by 2002:a17:906:1114:b0:a44:729f:5bac with SMTP id
 h20-20020a170906111400b00a44729f5bacmr6065947eja.53.1709566466482; 
 Mon, 04 Mar 2024 07:34:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:46 +0100
Message-ID: <20240304153253.732708-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566466; x=1710171266;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PTxw9v4vJWFWFxqGPEIz5b+ovpWbrurOUUDeiiATkds=;
 b=AtTrbx+sEghsa3uZp8Mm/jJKcFXvy+6FbMKNBVBFELrR4gBB964srIle1t2nDjZwnn
 T3Gj+rfwQHBSuhk61VvKA6lJa5UCVMlSefBv+dlhHO7cB5KcO77g7aYdu08/n2BOc8ZA
 5nTju2UBhGM5VLngXB5fuM3F3j0eqtWb5MkOw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AtTrbx+s
Subject: [Buildroot] [PATCH v9 15/22] boot/ti-k3/ti-k3-r5-loader: install
 tiboot3.bin
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

Recent versions of U-Boot are capable of building tiboot3.bin using
Binman. In this case, let's copy it to the binaries directory.

The use of `find' command is justified by the need to use a regex
expression to select the correct file. This is not possible with a
simple `cp' command.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v8:
- Use the `find' command in pipe with the `cp' command.

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index fdb058f3b72a..9a05d005067a 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
+TI_K3_R5_LOADER_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	cd $(@D); find ./ -type f -regex "\.\/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-[^-]*..bin" -exec cp {} $(BINARIES_DIR)/tiboot3.bin \;
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
