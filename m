Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0236CC25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA1964013C;
	Mon, 27 May 2024 16:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1FLzWypXrJz; Mon, 27 May 2024 16:03:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FFC940253
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FFC940253;
	Mon, 27 May 2024 16:03:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 744441D1EBA
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 16:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60B7980BD3
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 16:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuzNIz_HMIfZ for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 16:03:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 726C080BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 726C080BC5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 726C080BC5
 for <buildroot@buildroot.org>; Mon, 27 May 2024 16:03:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4211a86f124so2779815e9.0
 for <buildroot@buildroot.org>; Mon, 27 May 2024 09:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716825828; x=1717430628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9jLqWH5cZIf94u906SPixfTbPPggSGk4n9aD8h+tkdg=;
 b=w9DIriMoWtY93APnDqRP9fcm3jSKcBcCZN/Z9T+2reqfi5Zycfi3dvZWx2h6o0FJUA
 V7qaAVP1t9zZBjnkSaInobDY16NoYJRHyuUcvcFsrCHzuVKCS2FAuE8JyKw4QqP37Klq
 MYaooEao17VMVGyxJvX/jw+898q2Amn825IXcJ1oohMnnD+k2FOmHLiWkeSBphbd7k0H
 qp7cEgQBeppq/e4CYO0c2TNqN7ViWtcyTpW6Q+HnjYGH+EAKPrhrsDsyQCyMIARk+dEC
 Yg5k78pvyA60IxlVNawHHeR2P9DRrYIE3gB01zudY2iXLxb7ExBBkYjD9zHkDS2Gh1We
 JcJw==
X-Gm-Message-State: AOJu0YzU1ftOjF1AdivXlB6cioenP52jqXAbvSPlF04QRrcwDzkCwks2
 K4j0ysBJ9VvKYWN7w879lX+DhIuW8of7vxDLm1ze4jGRdNaOiSTZNgccU4ztnbQxfkppLNWzxD/
 OGWk=
X-Google-Smtp-Source: AGHT+IHkyJDaTvwOtBd8cwrXVauG2NsiFb0lZJMIvxlf4htO3vYcj7QpdIQScbkCY9P8mpar4hR9Cg==
X-Received: by 2002:a5d:6503:0:b0:354:fbdd:32fb with SMTP id
 ffacd0b85a97d-35526c191a6mr6228759f8f.11.1716825828124; 
 Mon, 27 May 2024 09:03:48 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557dcf001esm9453919f8f.97.2024.05.27.09.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 09:03:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 18:03:43 +0200
Message-ID: <20240527160343.2662538-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716825828; x=1717430628;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9jLqWH5cZIf94u906SPixfTbPPggSGk4n9aD8h+tkdg=;
 b=JWJkwOQEtPz0CNsHzUvzNPCNCVCS7CH2cDYwO03wpCNbJUevKvMeXhWQlttW2cVXmC
 H+mu7dAHZrVgGOW7Pybecpc6fT5I4P7OIernTrn72+geoGRxVS+UbUEh/pdFUsY4o78V
 A03bqDvWw4VYcVZPYoaO093dsO8wvopi3TqxE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JWJkwOQE
Subject: [Buildroot] [PATCH 1/1] configs/at91sam9x5ek_dev_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash | 2 ++
 .../at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash   | 1 +
 board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash           | 2 ++
 board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash           | 2 ++
 configs/at91sam9x5ek_dev_defconfig                              | 1 +
 6 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 board/atmel/at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash
 create mode 120000 board/atmel/at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash
 create mode 100644 board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash
 create mode 100644 board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 68c0ea83dd73..9c78786e3f4a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -135,7 +135,6 @@ configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9x5ek_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_dev_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9x5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9x5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/atmel/at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash b/board/atmel/at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 000000000000..6edf3d3345ec
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_dev/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash b/board/atmel/at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_dev/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash b/board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash
new file mode 100644
index 000000000000..baf48c8a64b6
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_dev/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6cc67b3d2d550c3f0b201d7850bdb25503bc6a51e41b98d2c0fbd531b56f3a20  linux-linux4sam_6.1.tar.gz
diff --git a/board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash b/board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..f6d9f29bc8db
--- /dev/null
+++ b/board/atmel/at91sam9x5ek_dev/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cc72d6a36ebf5f0970e18788b1e1dc9b76ba9237ec6745c6f16f1b2e1d8fb3a0  uboot-linux4sam_6.1-git4.tar.gz
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index bc034019b441..b381fe279715 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -9,6 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
 BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek_dev/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
