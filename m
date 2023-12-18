Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63806C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 095E2403C9;
	Mon, 18 Dec 2023 08:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095E2403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e07cj1i1PZa0; Mon, 18 Dec 2023 08:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE07D408BD;
	Mon, 18 Dec 2023 08:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE07D408BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E884B1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A7760D7B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1A7760D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiz_suQ8-IKh for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:25 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31C3660D59
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C3660D59
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e305530baso1247493e87.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887623; x=1703492423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=A2qJ7+NhTLgJE63wHNkCLY5WdwdWkIOQZJkMfwh1OT81ZA2X4RCulMoLJZDWYUDhnt
 U3zDJ3Rnmt/oINjSlV7WoWO6iKaP6IZ4YsrlU7SGwklhI+wjgxx3s/sTNJ9KvHsXszIw
 TKrZvj/FoDJJDVLIEGdsruU6pIWqBvja7KVUyUZQivhjjw5IgSUncG72uuG/M+Yzd8s/
 2gViv/ksUqSWr7iV8i4PjAqG5v6yuxKqlu5TCs4TvdJvzyMVB2A+o7hNdFV9E4mh0XoL
 l1pwEErAcv7OYZ69/MaVqKV2tIfkzSfY6k/vc8ixEq5HzU5StCy/yDErDBoJGjA9IKV9
 w4hQ==
X-Gm-Message-State: AOJu0YykL7mi/Kkux65237kRt4wsKF0fqO2UKsRmK5cyZYioarNKRDzI
 mcibClHWpg/bBI2OWIIw4KUEf1Y0IAb2fY42S6hqTw==
X-Google-Smtp-Source: AGHT+IFrcQRZj5gNHuF0R2eoxUi206mjvZtS/Tnn56+y7NtnjJeyitkgcJpojmJIHyr4pVPrJ5+Lew==
X-Received: by 2002:ac2:562c:0:b0:50e:3b91:99a1 with SMTP id
 b12-20020ac2562c000000b0050e3b9199a1mr234918lff.86.1702887623017; 
 Mon, 18 Dec 2023 00:20:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:56 +0100
Message-ID: <20231218081958.506691-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887623; x=1703492423;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dof/GJcDXFGBHL7g6Pes+V0YjmvVefsviCiZtZGui7Y=;
 b=Nw5WSdVPt/ySzqCvzfuzaRzXKO8lD7wkHsL38COg3HeqVLrqUgLb5nd7wxvLIbhIs6
 tOm0vn6cSUgvzq3UO5Vr8cXYMTHNrSDuUCmxRh84VnrI8pS5hvJPkpBda1SsK519h83I
 oEAL7DOG2n6+cqpAtH+6FW8ON0mDY8WsHDj40=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Nw5WSdVP
Subject: [Buildroot] [PATCH v3 09/11] boot/uboot: set BINMAN_INDIRS for TI
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
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
