Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E52C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131BD83F61;
	Sat, 17 Feb 2024 16:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vVGWYbehv7gS; Sat, 17 Feb 2024 16:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998A483F77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998A483F77;
	Sat, 17 Feb 2024 16:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5051B1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4794E83D6C
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aNZqjDpzV5vk for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0696C83D50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0696C83D50
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0696C83D50
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:24 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so2116243a12.0
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185802; x=1708790602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lz0FBjYVL02fSOFknV9/WyKWRqLvz9cqyl66/8Btm6E=;
 b=qhwAG0Buofu8pRekt+54R+/Tt4WWQ42Dww6ez/nHlm6fvXKOg/nhEcP4450gOxJiFi
 DFnq6Y6pM5rsN6wqZmdQ9Je17+DHB2fdFIAbzsYDPmtws2BjwAVrEm7A9+lQ46teoiwc
 ueLbXa2j+k6oEUK1lncE7luzZhbqWdcIxai/dwonT5dtx27WXVwo+Yz4yhWik5F8Nlbt
 1EK9pudRH3k8BrWlZADulCz3bRZROcYHUcSQY0+VstpWOTRGJztH8Rxk1L/BWlnWMoam
 q+hFCPb1uwxolyPhpkKASk2VV9SQXGTr8YD7ue4DOu/VlfmHPbylRlA0v3x3cqMRbxCz
 4FMQ==
X-Gm-Message-State: AOJu0YxbNIr5Taoz7VUsOC0YKRXVFOK0QoqtK0gNCQ7lPwCOoj8AUNQ6
 TkrIGmvbkRIS54ghYe0sMmtw4O0miJxiQEh9v0JucEEePczRTBB8IKypvrTXm7LWMxVU+yWna+s
 4Ac0=
X-Google-Smtp-Source: AGHT+IHSrbvNsCMOEm4AzXWSliJbU5aPQj0Yh651UoSYmFiKQ18/xZxXQhszNDNc9fMWHdHLarZLGA==
X-Received: by 2002:a05:6402:2812:b0:563:c54e:ee with SMTP id
 h18-20020a056402281200b00563c54e00eemr7306704ede.2.1708185802708; 
 Sat, 17 Feb 2024 08:03:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:43 +0100
Message-ID: <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185802; x=1708790602;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz0FBjYVL02fSOFknV9/WyKWRqLvz9cqyl66/8Btm6E=;
 b=C8THLRXsguBg2iAxgvjDjLwFMrves47+8EZBwUcC9nD/MceXTSnHL3BIF5lwOP1hEX
 TJ0P++24HxTV7EjQipS7BP8ogqEpcIafjxxelzIilvlyh3Ebu/+/5XkjzrgQtB3RZ3IC
 p4vlfqR++udcG+TpsFt5OZos4yRlFtYZ+UObE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=C8THLRXs
Subject: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader: install
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 2a10024aedaa..643298a1e70a 100644
--- a/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -75,8 +75,11 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_SECTYPE))
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	find $(@D) -name "tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin" -type f -exec cp {} $(BINARIES_DIR)/tiboot3.bin \;
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
