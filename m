Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09888C32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E7D883065;
	Wed, 21 Sep 2022 21:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E7D883065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 930dKYmHkMrL; Wed, 21 Sep 2022 21:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A41482F6F;
	Wed, 21 Sep 2022 21:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A41482F6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 488B01BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D1040497
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D1040497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wO7CkGkAYiWE for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F8F400D2
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1F8F400D2
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:10:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x18so6169787wrm.7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0O95noyUO2YOT1z675KEkg+VAZpxlQx5ZVkvis44omI=;
 b=8L+ncbvgx/qNqjK44zaa2Yfa7fb2IvyZ+WWkgXyy91c2qxb5qwNq0MeLvq9bTNsCfC
 7LjN9ru0eSLmQ1qkfOjoKf13oI9C7gbGzmBMNgywlVL017IS9RSV2lsb7xxCXgOnEU+/
 QmYsA1od4uPEJlYs0gnWqTgW7LLdNlwnIGYzeq1+AiJRuIUXxrHF7o5A7oZjgmas2sRk
 /EdW0Ju4Yg0wlJ6w/AyowbyCdoBVQs8Q9LjCU9MomEXD7u8maVXOTOPgYpRP4bjqhJKt
 uQ+wMGYa6YObyTbf3NBbkU21/p8zy8e0uHmzvtEQDOA5/4FD/34I2z/pwzha6A6mCSTo
 vCpQ==
X-Gm-Message-State: ACrzQf3m0LjM8ufGZvQqUdquBXe7Im72J+rKFT6Ch2zRGxE+Rjpq3aRj
 BlRZnYuhW81Jt+jwtgRJ34spNaYzJio=
X-Google-Smtp-Source: AMsMyM6ujq/2rovwMsEDe7G5G+ULvqe9QZDKV3QOced3lbaktsetKAnpeaekcqO0URhvWY0YexLwTw==
X-Received: by 2002:a5d:584d:0:b0:22b:229:7582 with SMTP id
 i13-20020a5d584d000000b0022b02297582mr45656wrf.211.1663794642777; 
 Wed, 21 Sep 2022 14:10:42 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003a5fa79007fsm3827612wmc.7.2022.09.21.14.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:10:42 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:10:25 +0200
Message-Id: <20220921211027.25034-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0O95noyUO2YOT1z675KEkg+VAZpxlQx5ZVkvis44omI=;
 b=qkXrU5nh+QYhlOKawBfgCb3EgW6gRTRZySHqcyXi5RUlYovtIUAhujaiIDMFMWsX2J
 gc4YVsegfhPXgSDjo7olJN4L/H/4ZYXSbIXSBxNV45FxDaQus02mlTVsQ+r4epNvxw80
 DwVEDrLCZAO/ZqaMPrwwjCxCTuSDJzT571AdXC8XIPRTAMCX3A/3hmOxEacBwVQoWovw
 hY9rmaRQKQ+1ZKeNYHm4a1TKTLaJHLz4v5Omz8pREEcrUDwBkEr5LmdQGaNeajUHlM8Q
 L89/2bu7lhqoGX3Q5wGIjT732yJCdTHvmsWhb+l5+lhNCd2R5suEe0xNqhl5a8s2U43Q
 CBpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qkXrU5nh
Subject: [Buildroot] [PATCH 1/3] Revert "toolchain/toolchain-external:
 update Arm ARM32 toolchain 11.2-2022.02"
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported to Linaro bug tracker [1] the Arm GNU Toolchain generated
since 2022.02 doesn't work on all x86_64 host.

It still not fixed with 11.3.Rel1 release (2022.08).

Fixes #15006

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19

This reverts commit 22d10e294cc9cd30fa8adc3672a337167e6241a3.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-arm-arm/Config.in             |  8 ++++----
 .../toolchain-external-arm-arm.hash                  | 12 +++++++-----
 .../toolchain-external-arm-arm.mk                    |  6 +++---
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index c595b1c133..28c6541406 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,7 +3,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2022.02"
+	bool "Arm ARM 2021.07"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -13,12 +13,12 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 11.2,
-	  GDB 11, glibc 2.34, Binutils 2.37. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 10.3,
+	  GDB 10.2, glibc 2.33, Binutils 2.36.1. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 3c07237e1d..1fc2c5de57 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,5 +1,7 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  c254f7199261fe76c32ef42187502839bda7efad0a66646cf739d074eff45fad  gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf.tar.xz
-
-# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  c5603772af016008ddacb7e475dc226d0cccdf069925dfded43e452a59774fc3  gcc-arm-11.2-2022.02-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz.asc
+md5  0f1c5c90f5c62e1d1066f75fb3e51e21  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
+# locally calculated
+sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
+sha256  fccd7af76988da2b077f939eb2a78baa9935810918d2bf3f837bc74f52efa825  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 1bab088830..8731a4f0e5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2022.02
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
