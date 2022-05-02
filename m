Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773BDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 04:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FF782733;
	Mon,  2 May 2022 04:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTuvhzoaM94f; Mon,  2 May 2022 04:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A5381BB0;
	Mon,  2 May 2022 04:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0951BF408
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 797BD607D1
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 04:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzE5fn4RG14V for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 04:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77391606F5
 for <buildroot@buildroot.org>; Mon,  2 May 2022 04:08:02 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id p12so11447204pfn.0
 for <buildroot@buildroot.org>; Sun, 01 May 2022 21:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUl4iRB+VlldtKj0N1t0TeDyWwgJvJ4QVDQj3RyjmYI=;
 b=cLUVgaTEn7DVcCXdP6Wg6IGV10InsElegkoyXYVzuVBN/3pd29mvKqH03hy19APldO
 qjT/sWMcucsglgT8kUycaJdwH15n5J/HBXfPsefoRFK3ZiKz2kM6nT5i/6ywgJZ45UK0
 KFvY+SDs0WVEi2+LG/JnA1sqyxBrs91bS3xbKxbp/KZh8CFUafAUX0n3dCCYKXHex88y
 pzw4MhIVVp/k6xYaSE8Kpa0wVttIpQR4dHWBQmlj2Zu96CqKb2vEp4Wv9poZ8NDolnZB
 nDeHhxoKLC/p1F7V9A5s887MmArLZoehN/4pIDg/erSsKpZVU6P8OC3NU+Hd8JkPo/m5
 NKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iUl4iRB+VlldtKj0N1t0TeDyWwgJvJ4QVDQj3RyjmYI=;
 b=LTmEysiqLR5VpQqZ28h/30o+YiBx8JvIz/gcT+mtGltDU7QqV1bY2DcO2hP+23eLo3
 jkgBUPau32X+0QfWq2N4XpLAsCT8eJMIhE9oUfq994Eiz+nCxxS1BaXRAnA4xA2paY4U
 lmZIxDK9vr7tYwjlc0OJm5B0xKYLzOQSDc8Hukbaq2aRMoI2JYXbR2I1iG/Rl6YeT++G
 5ZUC9ismy4Odjy28IoWdWWHjD7/D4GXviIvQhZGqxsnWP07geD1uZoSPyR4SQZJVlBOH
 U6sqXz7twI1R/zsGS+t+ps/8yDfgBLyZkZ9fc+ciT+b9iKytwQbyIC5WZLZhHsnTO1P/
 gD7g==
X-Gm-Message-State: AOAM530xccdaTCyetsILtZ5tdhlDYwB7DPMgsZRVx66WfTjA9k87esl1
 yrNAkKx6TXuoyhSN2zyHp3DwPDh4YUE=
X-Google-Smtp-Source: ABdhPJw7ZkGSqVqa8SUwyBzTnDDdqp/gCzivYuJ7OJfI9qVwGiuDITl+EtgcMZ2HgiPWfzNDo8089Q==
X-Received: by 2002:a05:6a00:234f:b0:4f6:f0c0:ec68 with SMTP id
 j15-20020a056a00234f00b004f6f0c0ec68mr9876756pfj.14.1651464481248; 
 Sun, 01 May 2022 21:08:01 -0700 (PDT)
Received: from localhost.localdomain
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a63b553000000b003c14af50616sm10066336pgo.46.2022.05.01.21.07.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 01 May 2022 21:08:00 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 21:05:00 -0700
Message-Id: <20220502040500.93634-1-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: add aarch64
 as a hostarch for arm tools
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Charles Hardin <ckhardin@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

The gcc toolchain is also released for an aarch64 host target and allow
that configuration to be used as part of the configuration. Tested on
on a aarch64 linux docker.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in   | 2 +-
 .../toolchain-external-arm-arm.hash                           | 3 +++
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk  | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 0fbeba6aae..ca9831e05f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index d58692de53..1fc2c5de57 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,7 @@
 # From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
 md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  0f1c5c90f5c62e1d1066f75fb3e51e21  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
 # locally calculated
 sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  fccd7af76988da2b077f939eb2a78baa9935810918d2bf3f837bc74f52efa825  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 4392205105..0f554953ec 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -7,6 +7,10 @@
 TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
+ifeq ($(HOSTARCH),aarch64)
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-aarch64-arm-none-linux-gnueabihf.tar.xz
+else
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-x86_64-arm-none-linux-gnueabihf.tar.xz
+endif
 
 $(eval $(toolchain-external-package))
-- 
2.32.0 (Apple Git-132)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
