Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA18C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 17:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E1040296;
	Sat, 13 Jul 2024 17:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTa334wLImRK; Sat, 13 Jul 2024 17:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDF740359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FDF740359;
	Sat, 13 Jul 2024 17:03:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE16C1BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D89C58204F
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 17:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_GKE8iv2eXv for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 17:03:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9147F82040
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9147F82040
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9147F82040
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 17:03:42 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso369379766b.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 10:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720890220; x=1721495020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=srUWCGTY4hlseG/qY0Rbz5PO+pZU4k9WDxK4Dx4GUVs=;
 b=K8EiQZRzCx4GPVwIWcRqxRBWGyL5BMMn1AqqzJ9olxVxxBWBOeNWtZQLCQUFOPuuVI
 qmj5lAyw2qhGXU6cAvAh1nHqA2JafihW0dtI5IAiUbWCuw4MOxxWDV7/o0OJWVb3o7eA
 q4vvNDLHJN/A8zuJHGh7WEoCxxgbeTGX638eCTYdv7AoJTqFeww7BGrzyU9e0ta08HwQ
 hw+39sdehRTUGq4NF4j8cJDte5lmLy6ayUb5FujbCtk2RIegvjNcRDP12CH084DtbhNd
 n9blT81+RReuesUOFlI0k41RxxczoivGEUAAet7APqPbZdjFv1i+in2qIslizs/uxpiA
 AqgA==
X-Gm-Message-State: AOJu0Yw5t4T4FSBQJcQPUcN9kz3jSUJPqHZui3CAGj+19JboBSvSJtKj
 tYdFHtN+x+qeetxWF3uCcgdfdSj3yqeJuiA7Z4t9cNx5fZ9wihFe1uv4vJXgq47Epz6DpGBwZX2
 aATo=
X-Google-Smtp-Source: AGHT+IH7IydtOox0gDxrxzh8CpcZCApVfD/n9+0qL5OaFcPVkn23qlYFfIjGK6/9FEKD9M72f9nV3A==
X-Received: by 2002:a17:906:3416:b0:a72:88e2:c327 with SMTP id
 a640c23a62f3a-a780b6fef62mr924445466b.38.1720890220237; 
 Sat, 13 Jul 2024 10:03:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-21.retail.telecomitalia.it. [95.244.101.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5a3aa6sm65482666b.39.2024.07.13.10.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 10:03:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 19:03:37 +0200
Message-ID: <20240713170337.1137765-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720890220; x=1721495020;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=srUWCGTY4hlseG/qY0Rbz5PO+pZU4k9WDxK4Dx4GUVs=;
 b=AyEJxjuIo058BOzLV+oYAVToHutKScmhX6jY4FIlQzOH7Y79hvY05JfU7iFTZS2sQs
 qjNkfF0yNUYx8jr/mRRej37bYVS//AE5oRyTnVDE/kw/bEUvToR+TenKbOknTJWDrj1D
 mzqaQOqZO0CK3JmURzQ24+oTfgH0OmzjnLqMo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AyEJxjuI
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2024.07
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/Config.in  | 6 +++---
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f37040a28a97..626585b378d2 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2024.04"
+	bool "2024.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2024.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2024.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -279,7 +279,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
 	help
 	  Use binman tool for generation and signing of boot images.
 
-	  https://docs.u-boot.org/en/v2024.04/develop/package/binman.html
+	  https://docs.u-boot.org/en/v2024.07/develop/package/binman.html
 
 menu "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index a8021fb696b1..0811ed58c46c 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
