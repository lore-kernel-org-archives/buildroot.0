Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1627C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8046840475;
	Thu, 17 Sep 2026 09:45:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6u_EDu-uE8v; Thu, 17 Sep 2026 09:45:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CEFF4076D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789638310;
	b=krikFXNSPo4ULgOuqzdBjfkPCVim8wXCymxhw/AqCKkH6pv0o0qdMjnQn+hcnk0QJDyT
	 Q/oIxBT7Cz0OQ+9AIASTxRWn33wQ6gopUCuEFjYSdZs3TRY9H0wO67XtsrAE4yyI1pfru
	 BF+ldTiFQ/g+hVjDwutZc9OqTN4Nc0V0lKQUxoq746e/54MZ+oiqYYje3eQ9A4jY7cRRH
	 speAILVL0LuYKV6qCUBvqa1jzrpKwDY1LoYB3/A1RT00qjySzTjJr8WK56BVHBR0zmuya
	 JBNXgTOiK0O1jRhCDO5eTghrmkux3AgxyS9mjxlVesVmy10iYUXuQ3iEI8g9Qsak1qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789638310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y9QApnl24kgQhAXEHvum/ygBc72Pg1nU1p1C/ljkOsE=;
	b=cymXmmxbrq+KSCClYg7Gq75Nw5QyEaM1Uy4gRUHR6ko1S9P3gglPDsbzPjxL984hgNNk
	 YOWjfBhcBxW4cGJp5DUth2qw5WWFkNvAaw4iFZ0pMvOLhiVjNJY0ysFl909uyoFdVfAgn
	 WTxDkMYyH+SJ5KrpfTiwhgXvjETldfOzyjjOJR8gb9HklSakVKxw2MdtJBXkoA7Y3UTxN
	 puDv6B+OaiuupDXEGg1a1lAcHsSailoxnU1nrzeMe1p2rpJzxx6EiXZA7lCXadJt9xgkO
	 eXWaellXHY4JbTvUAGqJPb8Sv6tBnZG1fuVLEx2XHWTYVt1dzQSFlnwW4wPEt8xD4kA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789638310;
	bh=y9QApnl24kgQhAXEHvum/ygBc72Pg1nU1p1C/ljkOsE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kY0NP7TS50EitGnEfLvGaNwGcph/q049KRmNCNOcZM+/e7QmwwqGzbu5lxSHgX2eu
	 5dzKi9yhSJ2XVL9/u34HwmPMnSEQ2aVMf4k/MkaOgsZw/TV7fMfxplOzvKloqK8p2H
	 R7YN/kQLUB4nKEPjDW8D2iAERs7shI5M9V80vZRqcBxu+wOvuV5IdF///AVSQJPH9b
	 6nt3PlBsnYDmVuSNf9CgUMSwCQQm2Rj6y5me5237Xpx/JQbHQvtLoYuT2NNg88QXxJ
	 UpIIHZmQbBQiSrRMbNeen4cJns/mSWqoT+j0qOHsHVzB1RiavFHtgK/RIDuHLijNb3
	 o5i3xr8L/2vjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEFF4076D;
	Thu, 17 Sep 2026 09:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2ADA13D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 989F280EF1
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jk_vU9qCYRWT for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CA6E080E97
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=46.105.40.176
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789638307;
 b=Jygzatv3KKZK/muyY798YUjQIGRrd1dNPZP1IndQyqwsd8tm3U0Tm+TeBqGMQN9zqSLJ
 fRGbFlTPBvk5l7+xrAFnItyAWPWAU7ZatyJs3N8mBPmKCQ9cqbkzsPxtXvswtKRY52csm
 gtcB7dcz+fjz6K9Z9eGSEddXD2tprF6fiyWcZgtsqj3BYjXvg3kU8VADuzmnaV/qD9Faa
 SEyeoakywxQ1CK7JMT0ue8O3lukvDE8XugOU3RARcf0grnkOGLrM90puHm8LhnkjLgTtG
 /GI8JNPTzOZwHZZbPnveRX5y84opN5cLOgriCH3NuQlbmpJIEyzzxIu14FFghiJmRow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789638307;
 h=Received-SPF:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=WUlcSNFHuy4eeQoxfvgKh3bU+E94l8hPanoQzzXpjAs=;
 b=TOyKj5gB3GdpS289aAM7i+dADTdJozrCkNQvNbqsJ/aAXnRkMwzcgsq2q7Wo+LYNJ3W3
 /kiCQfFoC0s81je9VDtN14vqyK18qKLP3zDpXz0l1LvDV4ZxJrLodb1Pvaxl/+Xm5LoAU
 otE2sSlRlOQtqGh5pHDgWwPTrwP8gmqjiHbfcSv4uf9LOYwQCnr7vaNHB2r3NIiepZ1/w
 kwdOxCnlDT1U3BcXu7twS9gab/skjxKh/7N4hGrwtRkfW8Ar2aIqxKMeQqD2JwaZ6DLrX
 cDRfLuP4vwZgnt5rWgQ63f4zA0gmEFdSr7PRpPSen1EnGQxTSslatvA1QANz/2uf9QA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=IgTa5SHl; 
 arc=none smtp.remote-ip=46.105.40.176
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.176;
 helo=9.mo584.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=IgTa5SHl
Received: from 9.mo584.mail-out.ovh.net (9.mo584.mail-out.ovh.net
 [46.105.40.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA6E080E97
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:45:05 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.37.167])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4hlrL74fsZz8VCZ
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:38:55 +0000 (UTC)
Received: from ghost-submission-c7b579475-z2xfn (unknown [10.111.182.237])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5757CC0075;
 Thu, 17 Sep 2026 09:38:55 +0000 (UTC)
Received: from quimesis.be ([37.59.142.110])
 by ghost-submission-c7b579475-z2xfn with ESMTPSA
 id cFDRCy21q2prYzsAFSJ44g:T2
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 17 Sep 2026 09:38:55 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004a0eb8616-9221-47cc-a862-5afdbf354441,
 8A94A716474959CFB9616324D37364D589FF58DE)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 81.245.109.59
From: Antoine Gennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 11:38:48 +0200
Message-ID: <20260917093849.2095768-2-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917093849.2095768-1-antoine.gennart@quimesis.be>
References: <20260917093849.2095768-1-antoine.gennart@quimesis.be>
MIME-Version: 1.0
x-ovh-tracer-id: 13055653846874263510
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEEE/3+VB2ok3vJIcNdSt/euPBQZpOckG+o7beqrNbb3yIgvjiSkiqiYmUtlC7v5l0qFYFnpuBUllUVwyun1pKLnL8mjU1/h5+6VDhQl1mlOLwV+9g5kO5vPFYg1azAkH1AJ/8IMXFvGkmHqIm+MrTyaf8lOkWL7DSDqyfpdQNwibIPz8m7YctwSbMi7dyLuRewC8Z1xU9kmt3mW7jlqfA7FDA+/pCk7idwverNKVO8QzjB47MhSxAzShcys3nllhuLAcDrDZYBL5HZvVDNXc2PEHSP2ae67vx3aWgHb5fbA8/+Noe0/6qiPJpXD+jdPDhJ3cqAKDvhNaf460J6XXrIgWrnZ01E50rQxhuNU7PDihlbi8snreOMhrGvnd50i3rNEPEY0jZHZ/WlcVqbGcpqBtxvgLnD6zSVTFsY6MHL94hyQSoEw2evg67kpBgQoUo9hArC3mFxG7V6G+J1X9BOMidy+gR6N677AniUrzzlD1irJ2T3pnaB15dj2Uz4wgRIgkLY3qyIA6spdBZ4ro5g8AzvtjXaCr8amJoSMswp0w7xAwFT0LltxxWJYlsI2nM9iUzAIpkh/fQ8Itk37IA6QP/k6JZMM04/+XovvX8qFXcy0dcvWpnZHgRIjCpTq6+2rGi90rS3dgsNNGXokern9QuXfBpzfzssK2mYj1qOmg
DKIM-Signature: a=rsa-sha256; bh=WUlcSNFHuy4eeQoxfvgKh3bU+E94l8hPanoQzzXpjAs=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789637935; v=1;
 b=IgTa5SHlBET4dEpFWFJEgBoIuPwMh/doJh7RJWFIzy0OV6UkNnu631wiplH9bVCsiW4ygxkn
 MFe0N8L/ABAeGCGURujWxhJbLBagLlwiLQEyL+M0wk8mKmlxD84rfbNp8A78noLUjEf2Hhr/4xx
 qwz5S183yD1knmiTjo426ecVUDft/l6kyQDTvEQ1RRRQht2yeEyIyqFY0b59WFGf2o3TWxxhpfv
 K2EordYZGcGn5LA41rBO+Sp9JxYrRbaLG85WwU3lk+RhhwZo/zvB1NMd3Kam1cXebhNDaRQkAct
 39i2kJQoyZ0uu5HWzlvqDxIKA/3mL2MVasGG/9w+OA3/w==
Subject: [Buildroot] [PATCH 2/2] package/nxp-bt-wifi-firmware: add IW610 USB
 support
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
Cc: agennart <antoine.gennart@quimesis.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: agennart <antoine.gennart@quimesis.be>

The IW610 module is also available with a USB host interface, while the
current package only supports its SDIO firmware.

Bump the firmware release to lf-6.18.20_2.0.0, which
provides the FwImage_IW610_USB firmware, and add a dedicated
BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB option.

The new release also moves firmware files out of the nxp/ directory
and no longer provides 8801 or 8997 firmware. Update the installation
paths, make the existing IW610 option explicitly SDIO, and retain legacy
configuration handling for removed or renamed options.

Signed-off-by: Antoine Gennart <antoine.gennart@quimesis.be>
---
 Config.in.legacy                              | 36 +++++++++++++++++++
 package/nxp-bt-wifi-firmware/Config.in        | 32 ++++-------------
 .../nxp-bt-wifi-firmware.hash                 |  2 +-
 .../nxp-bt-wifi-firmware.mk                   | 16 ++++-----
 4 files changed, 50 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c222c0e57..565f100e57 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,42 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
+	bool "nxp-bt-wifi-firmware 8801 support removed"
+	select BR2_LEGACY
+	help
+	  The 8801 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
+	bool "nxp-bt-wifi-firmware 8997 support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD
+	bool "nxp-bt-wifi-firmware 8997 SD support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE
+	bool "nxp-bt-wifi-firmware 8997 PCIe support removed"
+	select BR2_LEGACY
+	help
+	  The 8997 firmware is no longer available in the selected NXP
+	  firmware release.
+
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610
+	bool "nxp-bt-wifi-firmware IW610 option renamed"
+	select BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD
+	select BR2_LEGACY
+	help
+	  The IW610 firmware option was renamed to distinguish SD and
+	  USB interfaces.
+
 config BR2_BINUTILS_VERSION_2_44_X
 	bool "binutils 2.44 has been removed"
 	select BR2_LEGACY
diff --git a/package/nxp-bt-wifi-firmware/Config.in b/package/nxp-bt-wifi-firmware/Config.in
index c707cd05cd..9fe79fa7d6 100644
--- a/package/nxp-bt-wifi-firmware/Config.in
+++ b/package/nxp-bt-wifi-firmware/Config.in
@@ -7,36 +7,11 @@ config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
 
 if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801
-	bool "8801 (SD)"
-	help
-	  NXP 8801 module firmware files.
-
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987
 	bool "8987 (SD)"
 	help
 	  NXP 8987 module firmware files.
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
-	bool "8997"
-	help
-	  NXP 8997 module firmware files.
-
-if BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997
-
-choice
-	prompt "8997 WiFi interface"
-
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD
-	bool "SD"
-
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE
-	bool "PCIe"
-
-endchoice
-
-endif
-
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098
 	bool "9098"
 	help
@@ -62,11 +37,16 @@ config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416
 	help
 	  NXP IW416 module firmware files.
 
-config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD
 	bool "IW610 (SD)"
 	help
 	  NXP IW610 module firmware files.
 
+config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB
+	bool "IW610 (USB)"
+	help
+	  NXP IW610 module firmware files.
+
 config BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612
 	bool "IW612 (SD)"
 	help
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
index 60e1be03da..3becca37ec 100644
--- a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  444351eba2669772a0f62aadbff92b46adb370dcd5228f12e4f5ae2b58554951  nxp-bt-wifi-firmware-lf-6.6.52_2.2.0.tar.gz
+sha256  549b3e666e9203f2a752545c10dd391c36ee751e140fa33013ea74739088f1e5  nxp-bt-wifi-firmware-lf-6.18.20_2.0.0.tar.gz
 sha256  601fa790c5b4d03579bd182fb4d65a6f329a32faf49db22f98e4608221e861f7  LICENSE.txt
diff --git a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
index f0440ce32a..74fa21ac18 100644
--- a/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
+++ b/package/nxp-bt-wifi-firmware/nxp-bt-wifi-firmware.mk
@@ -4,29 +4,27 @@
 #
 ################################################################################
 
-NXP_BT_WIFI_FIRMWARE_VERSION = lf-6.6.52_2.2.0
+NXP_BT_WIFI_FIRMWARE_VERSION = lf-6.18.20_2.0.0
 NXP_BT_WIFI_FIRMWARE_SITE = $(call github,nxp-imx,imx-firmware,$(NXP_BT_WIFI_FIRMWARE_VERSION))
 NXP_BT_WIFI_FIRMWARE_LICENSE = NXP Software License Agreement
 NXP_BT_WIFI_FIRMWARE_LICENSE_FILES = LICENSE.txt
 NXP_BT_WIFI_FIRMWARE_REDISTRIBUTE = NO
 
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8801) += FwImage_8801_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987) += FwImage_8987
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_SD) += FwImage_8997_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8997_PCIE) += FwImage_8997
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_8987) += FwImage_8987_SD
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_SD) += FwImage_9098_SD
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_9098_PCIE) += FwImage_9098_PCIE
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW416) += FwImage_IW416_SD
-NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610) += FwImage_IW610_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_SD) += FwImage_IW610_SD
+NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB) += FwImage_IW610_USB
 NXP_BT_WIFI_FIRMWARE_FILES_$(BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW612) += FwImage_IW612_SD
 
 define NXP_BT_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/nxp/wifi_mod_para.conf \
+	$(INSTALL) -m 0644 -D $(@D)/wifi_mod_para.conf \
 		$(TARGET_DIR)/lib/firmware/nxp/wifi_mod_para.conf
-	$(INSTALL) -m 0644 -D $(@D)/nxp/mfguart/helper_uart_3000000.bin \
+	$(INSTALL) -m 0644 -D $(@D)/mfguart/helper_uart_3000000.bin \
 		$(TARGET_DIR)/lib/firmware/nxp/helper_uart_3000000.bin
 	$(foreach f,$(NXP_BT_WIFI_FIRMWARE_FILES_y), \
-		$(INSTALL) -m 0644 -D $(@D)/nxp/$(f)/* $(TARGET_DIR)/lib/firmware/nxp/
+		$(INSTALL) -m 0644 -D $(@D)/$(f)/* $(TARGET_DIR)/lib/firmware/nxp/
 	)
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
