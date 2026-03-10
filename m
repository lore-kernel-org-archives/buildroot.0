Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57BEB1049
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 10:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43DE840AFC;
	Tue, 10 Mar 2026 10:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdZkFwJdpb1h; Tue, 10 Mar 2026 10:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A1AB40B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773138644;
	bh=1rN9m1zKkApifdJAayb7nI3ycA2P70mUGJhBw/uIHi4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bZSX5hqmOqttG1xqeswaltv6MJab2WTryZq8YvMlM3wq8g7HkNmtGGtHEs0K+QQ0s
	 0RpsCwD0iQvRCsE8H3zDacMDEUSpUVdv+hMQfuePmJL85U9L37LuhIkUfqPD+N+Ppg
	 gcRl4DBc6MSVNy4VFHAslOGDBiTF03Wu4ToGfPmaYQ58M5tW2t4CeD6LJ5Y0rgbQBH
	 RRmHEEaRUqPAXwCty5bZyZcgq8Hj+fGiVsp7gWF21eCtdFbAKZyEn3e7wQWu/oTCut
	 /OPc8TNQfGYywD1tF51k2w9mNmWzto8p4ApDbw9goXnPPeJPBamUS11vytmEIU1lVb
	 rm8xLJZBfliMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A1AB40B09;
	Tue, 10 Mar 2026 10:30:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B1A7B35C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A38EA60AC5
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg5Ov0mHz9V0 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 10:30:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F10860AAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F10860AAE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F10860AAE
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:30:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so24674225e9.0
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 03:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773138638; x=1773743438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yk25jpbI17zquFQAW8r0JXd4wz0AT2X6dQhcmru90xo=;
 b=H+tYjJEve9AUVHjgeCRQkJ4Ct6TjkVt0be14jRQ0zKTvKCiHt/1sAo6aiP2Fm8qHFB
 cKdi1tz+WYx3NuhPlCryuH/eeV33ExzgAQE2h2+CPOmJvmh+rLsF7mEkCY9c93luATCo
 V0ed2LEgKLNGYfPwL6cieGocpdMH73/dtBMJUC8hqmiXHWFmufw2O2IDVIfem59aZRcZ
 IkoltX1ge4JeseKIyqVw4fale47MkwYgShCIU+y5RCbq+wPeoyhVdsvk1JAn8U/OHp4Y
 9IPGjfUcpi78mMf/Cc8LbFEZPNaVD4yO1wWVOUeU+3G+rbB8x7C9lvNkD/i6bic1rZKA
 dZuA==
X-Gm-Message-State: AOJu0YxLqMLQb9LYTU2cZ0eFVQED+OyO5tM1oo58DUzVm3NgQcBsQeO0
 S4uJyxlTmRB+62rzsCC2aImDIxp66KxVB8jjSMnjC7VU6k8hlS7hTI6clnztIXKtc85TP6dleeI
 3jhGYaME=
X-Gm-Gg: ATEYQzwfrNixiwWrcld3GKcPZbbTObWb+z6xFY/U24PufzbRpnd9kDiwu2s6NHg4J5p
 uFKI2PI4xIzeamHkzHE+h1sC3Spp7s2O58Pm0gxnhih8eMRG9GApOE4Yyg+rhxyPWLvaU9y3y6d
 IunusB8gzKqNFftKHxPe5pLWfSvcuQk3RGU2OA2j3nof9XvKOlz/cB1w71hzZPxodg444lxsMHw
 Cl/Kb1ZfB40IBeFZfCwLh3tjpPuCPOWNNwyYZyFrg1iTSJw4C0/dVRmOi21JOs0xcFSGXoOpnej
 RlkqGrL0ChUod4gfHROtQt3/xyt6l5J7ltz0Xx52NAHYM/D21kWRRsNO4+a7srdh2j3KAVPLV9X
 YGfDDZJrxBRwRB5lFBPyFND1cARtKdvkX/deA04s4hGWLR9juDPPojNlhZD5JTOI6iEUEwFyQ2/
 ZDytPPwSMqkWZWxmaUWM0ayyPdwXOFGvfhQBViBj77a204IozUOhzujayDo3cgbNmX5uh9eQbHo
 Ie/iundcAbmYQywe/HX0IoOV6c6oC4=
X-Received: by 2002:a05:600c:4ed0:b0:485:379b:57be with SMTP id
 5b1f17b1804b1-485379b597cmr142487565e9.1.1773138638356; 
 Tue, 10 Mar 2026 03:30:38 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d968sm33755333f8f.6.2026.03.10.03.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 03:30:37 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue, 10 Mar 2026 11:30:27 +0100
Message-ID: <20260310103027.2057907-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773138638; x=1773743438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yk25jpbI17zquFQAW8r0JXd4wz0AT2X6dQhcmru90xo=;
 b=ieOCEJYiQtoazlG8JsjKsIM0tsAA3tT+QI0KhRBagCkphLzNNOTHk+XyuYfsr4Mu/m
 7dKkBSuGxqVU1aH6LRYxaZnhJu0f5TQ4cKcyauSA84gI7X47EPkCxthMrgQIOMuaxvd2
 YGTGUm+/f3dOf1qiLj/msyrXWUxWwPFPHSTfQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ieOCEJYi
Subject: [Buildroot] [PATCH v1 1/1] toolchain/toolchain-external: bump to
 version 15.2.rel1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the ARM AArch64 external toolchain to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Verified by building a minimal AArch64 configuration.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in           | 2 +-
 .../toolchain-external-arm-aarch64-be.hash                | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                  | 2 +-
 .../toolchain-external-arm-aarch64/Config.in              | 2 +-
 .../toolchain-external-arm-aarch64.hash                   | 8 ++++----
 .../toolchain-external-arm-aarch64.mk                     | 2 +-
 .../toolchain-external-arm-arm/Config.in                  | 2 +-
 .../toolchain-external-arm-arm.hash                       | 8 ++++----
 .../toolchain-external-arm-arm.mk                         | 2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 3a71e1356b..d6816532a4 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 14.2.rel1"
+	bool "Arm AArch64 BE 15.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 317fc10a09..95dead94d6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  0ea5d00d0ba4c5d16bc8e140d434c54367516b568a146d724936c589a2f56aaf  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  f848f5b15d49217fbe8b3d72e1cc44eac06b096e6b66fa892898fa9c710a3c05  arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
\ No newline at end of file
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 381a591932..264e8bff71 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 8582fe0ec8..e7b19d8936 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 14.2.rel1"
+	bool "Arm AArch64 15.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 3f9c9cea71..9913974643 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096  arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  9a685b335bd709d683a8c782253c37e8c36c10e6924e59e39d4769b02132eb43  arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  97e3f600c00413088bb21109475443f9a1c57b4f75336a6e820acd43b065f875  arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index cbc923bee5..5ddb5e10c1 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-$(HOSTARCH)-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 7b1a7fb27f..d9744c6967 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,7 +3,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 14.2.rel1"
+	bool "Arm ARM 15.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 9a657a5ed4..ce3797ac34 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  3c65d820a6b8f677f8f6fbfc749fe00a4f16dde12341436c9df5b7092a47c0fb  arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  6e5871df39a38b3a4c1374ea06f82fe0fe0c2927ddd2c060401fd60a5d045859  arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 86937a7412..f82f1ab196 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
