Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3655EC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC0BD40948;
	Sat, 24 Feb 2024 20:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zfsb06j9lWae; Sat, 24 Feb 2024 20:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B96405FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B96405FC;
	Sat, 24 Feb 2024 20:58:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 053201BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7563540611
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id va5emXJQa3YG for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAD8840522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAD8840522
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAD8840522
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512bc0e8ce1so1652386e87.0
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808266; x=1709413066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gm19FuITjNDQ4mviSWw5Cz0UNa9h0pPt8cqm22ZFQJo=;
 b=CgKQRr8F7nT7XRebARXCbdjFPsFPE7LS24ODNw1Vh1kqMD3o87lU/0/xuaPMuZ8uye
 tpoYv/3SQXXi5Ve4Eu6ZCtZOjZZSCxiRT8IslxhYxmJoLNyxE8Ys6MuWp+qZwH7JFEZ6
 XZer1X5vnWk7zzwLEMaR96VzGn30KiWgfHHw0w+1wFlx+xT8ttJhpYgVVvHGRTZ+Jh3d
 WUYydJx24ADUYxHCVBLbI6zIyOoxo/z9jyteUSkGUfDjQsa6ltjiCeXErQQgXrrVriAS
 04wzBWKbrD1UU+Ma22K9Q0Z1XnkDe/M838bFxvkxOwG86L1WEcchNQEh3Johl9R7Zeqr
 CXFg==
X-Gm-Message-State: AOJu0Yz7bOrY+fc1StdfYVvWnQPlI3BRUXYQ3nFO5y/kgegDn5a6aHfi
 kNuShPNDD2tcoWyPUWi4qg2lCLS7P4hrwS0qF030Zhcym6Hd7hx+HgFOMCtz1s8wpPp+UnNEH4G
 2lDY=
X-Google-Smtp-Source: AGHT+IEyZ822sMawrAVEcY4VLRdTPg3nbxnysKtbGCLAt8YUQ+1n1BmGn/vT+D/LWwrKq/CKnEE6+g==
X-Received: by 2002:a05:6512:488b:b0:512:be66:7c3f with SMTP id
 eq11-20020a056512488b00b00512be667c3fmr1983850lfb.29.1708808266411; 
 Sat, 24 Feb 2024 12:57:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:51 +0100
Message-ID: <20240224205654.1546744-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808266; x=1709413066;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gm19FuITjNDQ4mviSWw5Cz0UNa9h0pPt8cqm22ZFQJo=;
 b=OxChHciYs2CVIHlMdjxVIFlaLyDiU3d8Pvwy7pzDnzCPkzYdjbpHLwJCUji4FjNEPJ
 IuTt0IWNJ+GzdlXIUxTD2JrkJp7JNqOLwhq3Rflss+BYzIg96tpQvmCF5dWy5dtFXzTm
 Y7n3EcEa8L2xvZTQ6hUL5yvYD42mWCJ7xcOHM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OxChHciY
Subject: [Buildroot] [PATCH v6 14/16] boot/ti-k3/ti-k3-r5-loader: install
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

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index fdb058f3b72a..cbdb653278f8 100644
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
+	cp $(@D)/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin $(BINARIES_DIR)/tiboot3.bin
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
