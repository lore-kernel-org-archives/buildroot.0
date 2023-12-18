Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A47DC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2FCC402F5;
	Mon, 18 Dec 2023 21:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2FCC402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FC0c_yM9rzht; Mon, 18 Dec 2023 21:26:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE4BA40195;
	Mon, 18 Dec 2023 21:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE4BA40195
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBC6D1BF344
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF0F94015A
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 21:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF0F94015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRIEza76UHgm for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 21:26:17 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2B04004A
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2B04004A
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d87eadc43fso826456b3a.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 13:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702934776; x=1703539576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5r+9b+Q6DOzannRUZVh1bmYAJ4wm0agsyki/0SxHKMU=;
 b=Gc+UdNeNzTvCPkNkmo+qzEik4miKCxhntHfRQSrS4jg7/ag384TCRZPILwu0vjwHYZ
 BgAviYKJG2RAuzEVyLZMUugTrEobzYXq6NfiyRfgePWQBwmDOsHkTAGRZfTc1ky8YkhD
 msPMYuvo3mZ8yGf8sSj7UuQaM+BreOdXINoie7s2JsTbQ74W/SOPbkHnNMvGfUxDrbo4
 eEVtDOAZm8KYLqm3u5Bz1JGp9Sz7L3GCPSREbxJu2DYmzfuQOES6/DsHAdYoxlQfXfPY
 vCJcitcl+SmaVYg8hdHTW34AopWIkbb2pva8EokCOyptyFFyByogS1Y77TbnhyitjWtP
 8rqA==
X-Gm-Message-State: AOJu0YzAwmI/3gQxYCIknnWGXbmIxW2Y9jxmaqWR8aCmpp4hYzVZh5+2
 atXVy/oN/UcBbcidIZ9HMdjMfGpQNU21dabAjmE=
X-Google-Smtp-Source: AGHT+IFOzZ0sgUlV+lXP6vU1lpGxbkZwFwS0mOk7I9E8S501eVMFODhw1J+oG6vqn2TM1jIRdNeftg==
X-Received: by 2002:a05:6a00:2401:b0:6ce:2732:1de9 with SMTP id
 z1-20020a056a00240100b006ce27321de9mr9458816pfh.35.1702934776445; 
 Mon, 18 Dec 2023 13:26:16 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a63e452000000b005cd7dd8708dsm4364264pgk.52.2023.12.18.13.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 13:26:15 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 14:26:08 -0700
Message-ID: <20231218212613.1201821-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702934776; x=1703539576;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5r+9b+Q6DOzannRUZVh1bmYAJ4wm0agsyki/0SxHKMU=;
 b=DgBLG+/yzerEKWOAK5O+6l1JNly0f3jE45WVyuoITN4UfYDcXu23RRcplxhFvwuhUJ
 oSOiJtn2vugBCNYXgxgMUiyHf+2c+0udv9XCxJ3lZioczxIb51Boyyikgef+/2vvP2SI
 Xb1a7Qmwbb1qopurwj26y+g+kaM1HxqW/5U/M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DgBLG+/y
Subject: [Buildroot] [PATCH v2 1/6] configs/mender_x86_64_efi_defconfig:
 Update kernel to latest LTS version
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5.18 is not a LTS version. Let's update the kernel to use the LTS 6.1 kernel.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Bump kernel version from 6.1.58 to 6.1.68

 configs/mender_x86_64_efi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 25a463abb3..260cd8a1e2 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -39,7 +39,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="--data-part-size=32M --device-type=buildroot-x86_64
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.18.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.68"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/mender/x86_64/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
