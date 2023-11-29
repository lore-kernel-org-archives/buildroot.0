Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4809C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A238208F;
	Wed, 29 Nov 2023 17:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90A238208F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCvgwWOYHNoo; Wed, 29 Nov 2023 17:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF00843C9;
	Wed, 29 Nov 2023 17:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF00843C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 556FF1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7104026A
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7104026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0l63PolN9zGJ for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:48 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9AE34011A
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9AE34011A
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a0064353af8so230012366b.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278806; x=1701883606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=pi3BYS5nVIABot0zkuXTYDFq+7KiUUCeuxe4NcCVcxc/1OsZUhlBwpKi4B4l5umVCv
 KpIGE0XYRIlYwtv53mbAVpwpWSQo+yZNQBZ4MrHJM0KQtTcaoNTGv1RDCGHl+vxo7RnE
 TDdGXzLiU48J0kFmJZHFdCjw/6/8ewBd3eRUrgwVXtB7hxZhFS8wQ/lwh09euNWS/D/A
 h2NL4hTP6LylqSFhVTVn3RGwwhw3y4s/vadCLLmqN2kRyw4FhjBpUqrqjnG7h4dq8Nm+
 SDtf2sy3VamuYkpNGFRQIIpkF5ph/lNS11/c14FzfydVxOH6N5JGKtOCYvsYAnMsVyY5
 37tg==
X-Gm-Message-State: AOJu0YwtUq+BGGWogWK82l74LTHc2Vy30TPnn4hr5MQaeV8wPrVoXX+B
 Wzb/gDdk7413OXOL9287PrYssSUhKXb8/iPGATFefQ==
X-Google-Smtp-Source: AGHT+IFvolEGTis5QES1asjRwkR7sUVVLurKWb8cmY6KBdtR2k/XZzqox94wyPPKpCXKmwlvfGtAVw==
X-Received: by 2002:a17:906:8d2:b0:9b2:be5e:3674 with SMTP id
 o18-20020a17090608d200b009b2be5e3674mr16381132eje.36.1701278806646; 
 Wed, 29 Nov 2023 09:26:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:13 +0100
Message-ID: <20231129172615.1683565-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278806; x=1701883606;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=YGxgVGsbJj50h0BdIvuVGpKhK2aXuUj7J5eIB/qLr21LvqLM+F1CBGmSg1zpc6Z8Sh
 VSkVodkSmJQotBJls0c9gcYO3ycN+qH3yvycBHAzqU91pEgolJazYaMFyMmbQjlvks64
 3nVEc7t6yo79+M2qO4wyDTcUik6Op7DsOlRgY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YGxgVGsb
Subject: [Buildroot] [PATCH 09/11] boot/uboot: set BINMAN_INDIRS for TI K3 DM
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
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
