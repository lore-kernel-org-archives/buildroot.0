Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59491E6FE49
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 23:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB4A40231;
	Fri,  6 Sep 2024 23:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOPBjsGfoytc; Fri,  6 Sep 2024 23:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFD6640400
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD6640400;
	Fri,  6 Sep 2024 23:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54E6A1BF378
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 23:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CB4404CA
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 23:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZV5EBVMCgPf for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 23:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A65740400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A65740400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A65740400
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 23:12:19 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20551e2f1f8so25804045ad.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 16:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725664338; x=1726269138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl0CifTNSQU9uCA3QtGuLwnXVFMOILUY1ZqHxpPtDwY=;
 b=QDBEpTvxty9qnF4i2lqxxpjk+Llqr5vcnDfafKdxCZEbWaBPuLa/L3eqZv04MWvJqR
 pugeB3AKqjVNMUJaaB+Ns3a1Jfqf5j5Wv+aAL804WFr3uXArZbJQQCL3YU0FjUKiF2F5
 d04iaBbzULIOI0l4yQuxnPnqLij4ltZQUh62PB9G5Tl3kZafaJx6Pau6FN48tyHcuART
 oRhdoaawuRExBcjvQy9Qjq575sXXHYjo0NYooNo1uVkA6wPAURJgUwtInP9IfR8M2GVK
 38lc+zS/H7iFRhwuivMKu+Q1EC8ChuHVPTq0gDuIqcyQuGfT63hH4IDrykx6/sLrsVgB
 ZxfA==
X-Gm-Message-State: AOJu0YykJGIavPi48Z8B8TVm5vouG29RDiyzOXl3L7KCbtoNkYuRxfYv
 y39wxoRTQPM0VP2YFBTbbdXF8hgiJTL45kWkfCzSKDey6O5KPovO16hvew==
X-Google-Smtp-Source: AGHT+IHOWA0Y5LbqhrB+ZAwOAmXBOaJwzWWJkc45NqcNp9KzjFqABqM2uzNPfl4DL4WWCKRclpMQBQ==
X-Received: by 2002:a17:902:d584:b0:1fb:701b:7298 with SMTP id
 d9443c01a7336-206f05346e5mr47200765ad.32.1725664337948; 
 Fri, 06 Sep 2024 16:12:17 -0700 (PDT)
Received: from eldorado.. (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f1e99bsm68725ad.207.2024.09.06.16.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 16:12:17 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 16:12:11 -0700
Message-Id: <20240906231211.652205-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725664338; x=1726269138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl0CifTNSQU9uCA3QtGuLwnXVFMOILUY1ZqHxpPtDwY=;
 b=QIktDbWfOSuCP8pxigfszFo1Q1JxqAcH/jHl++77ZY0zEd6nxKAAf+IObP3hbaa8+m
 hsvxIbOvxra6WtpLvFg+VV7plSM5yZE2KY3w7p1ocQqbZq2r7cD5SpA0NL1q9K0HT6TB
 TWga243yOI2tTXFuarpL0rubHyAXqcMXm3wMoPCDY6fIrG/kJq/MkYjs2VnLZjYMqJUk
 jUB4WFSpOaZFf9Mx2dTTQEagyy9IwQQW4/nS4/7P9B0Y5MNq+6xzjlXoibh1JpbMT0vH
 sFUkI8+T3H+7Atwd09wFIQEdWAwlSYMRmul5XqaBET/1p5l5YXINtkeTy5f9nAegy7wX
 LfRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QIktDbWf
Subject: [Buildroot] [PATCH] package/linux-firmware: Add option for
 Rocketport 2 firmware
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Florian Fainelli <f.fainelli@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option to install the firmware file required by the Linux rp2
driver.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 651ca4508764..4e1f60ba9780 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -706,4 +706,14 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
 
 endmenu
 
+menu "Serial adapters firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RP2
+	bool "Comtrol RocketPort EXPRESS/INFINITY firmware"
+	help
+	   Firmware files for the Comtrol RocketPort EXPRESS/INFINITY
+	   needed by the Linux rp2 kernel driver.
+
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e40eab8dc85f..ae10e160b97f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -910,6 +910,10 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
+LINUX_FIRMWARE_FILES += rp2.fw
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
