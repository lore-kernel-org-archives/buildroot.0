Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3442BC982C3
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 13:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCA8B406BC;
	Wed, 16 Sep 2026 13:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxXFcujDufwK; Wed, 16 Sep 2026 13:17:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 97F4A406CF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789564627;
	b=E06tqL6wpMCByM2fRTDUbCMimQPogNMAxXsyKr5gExoyDiqvEiLFWgO2HIbXlmChM8mQ
	 PhpEaYBJWtP8vZzHRabSby9ypodn+V0PtVPxGuw/rTLxVoZMUtUK1mqZg6gTiPb7skHiu
	 71mTLMQAQX1FzB2OXWytVmRwqj2lzbmjR594fRy2k3w1zNzSPm49CV+oIemTniF1IPUwf
	 2hknXssamAiXve7kkoROynFrMfvZe8ZYDmRmdr6Y+trr7N2W7Vh1SKcoTI1ZJLcn9Mc0/
	 pYBeuIu3OwjV/kg+fVTFFp4bW3657iQdM9vIpRJYYwSVCKBmMLH0kq+Tu4iJluHB0WQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789564627;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iunk9MCuOdnCGJnjc89KqN0CJtopgN/yM6YNeHsMCEw=;
	b=dL9k/fEXlameOuf5LYtBysHRn7YOYzKO1CUz4POwgfwklCt8fhVFQB5woKz2KKN1ZPhu
	 4lD0c9eR/+cIYza7RakkuNlMuShn6nMpxRnzLcTWbuRiR023iJ9i+6rvHuxgMy2U89Hlc
	 L+ebyCOzmRbuaH8n3pN9ItYhIjtQa/lK0b0i+07iQ8f/FbEG0wtOyFiORxGGxFrm9xfGl
	 KZ8LFDTe9jf1FPT5+re8oCu9oHAS2hpLWRiLGzsE/dfJD9d5klaLZtmzeIkx9Oq00XZaD
	 P3gvwgJU9wFKJTisfgU0pneFX3EgUZePQASC3l5nrLIuEgZOfLM+hazPBtm8a+f6yig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=quimesis.be;
	dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256 header.s=ovhmo1685834-selector1 header.b=NbBiVaSE;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789564627;
	bh=iunk9MCuOdnCGJnjc89KqN0CJtopgN/yM6YNeHsMCEw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lGv10RT1mgNheEE+confxC/lAipJ52SBxbu+fU+VJTLhIX582Y6I4qiB4pSY270JR
	 iVxZvjGmzV1xRf1yvs116/rhF5keQZY01kFmt+sRxpo1D8ZNSmBMaMLpzuuX1qXfhq
	 ThGyF5O1s0+yelt3v/xB4FmsQJo2HoZ4bDgsnGcdwt7DnUXOhy3wZ6mISwqEYQrL7z
	 3iBCOysPBdl3m0XrueI5EIDQJuNZz+FCwKDBG8WxMh0ngvMS+lpY4UBO8DohsADLa1
	 L53Xm/cWEvn1Lbn6v5X4STxP79FVvOpJ2JgAeanOxdTzrRFaQzEnPXKEYQFZ3vC8wf
	 6BTfpAm7O762w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F4A406CF;
	Wed, 16 Sep 2026 13:17:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA041DD7
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 13:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90791406CF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 13:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kOTYT_FQ9Kp for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 13:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3CE8F406BC
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=188.165.53.149
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789564624;
 b=JiklrmrSKef7qfcjyURMiEZ6YoNrZjqYPL0ftob2oA0uDtWOnDcY9Qe0n50AhBAkY1jC
 IbaGg94KbSo0wyEyxru2aTKw/indF7vK8cZ8vYCv/4KSy4cfip20qCifEk7PQ0WhsQTXQ
 IYrAlm3SZbvaf3/YDuXI30DYJ8AaBMjyKSpHrp4AsYQzcf6gEp8CwkEC58odFQnFGwBnl
 p9C4hnYdOvUR7PzhBd9iZGKqc0q/Vxc7ieJFysz3TOT79cf0xajGW62hDpSsGCsJFR0ya
 4A+KphTXW+RLl8crmVm6gYjQoM9hHikgZ6bCaXL8E6jCnLKZpTyg9icgMkzqK/6tJRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789564624;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=qjZQooT1RXd132LiMSwpCxutJ+EIwO+xdJuI2QZQnjY=;
 b=A7BrN7V1+whJ90NfBDsqNyuFww3aLo+x/KmozTZd9FEj6rxS2nX1MGGUS40rq0dfKilR
 24CslF3lGFmz42uqMTIIV/StuKBkEBN7x3kOQjoEXlWb7xoLONiLPvhxXGIMSvAy/XVej
 W0QJ4TydBGkk+GBny5x8kkfkE868AVznRGFb8eb7cdgdEtXRQlfOteWq0NPZkkYqB4GqS
 75tF6+Yj0PldOKiSlp6zmdZVArstdATQOrGQh/ungK9IMan8XKo3rDI0S+qU7xSqMlbR2
 V2DRcDsBLTeYZ+Ga91ucsv0DMvO805BAdsrXa+JLgemsmQ7lSkcTWvAGSMeLZe7oVmA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=NbBiVaSE; 
 arc=none smtp.remote-ip=188.165.53.149
X-Greylist: delayed 488 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 16 Sep 2026 13:17:02 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=NbBiVaSE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.53.149;
 helo=2.mo560.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 2.mo560.mail-out.ovh.net (2.mo560.mail-out.ovh.net
 [188.165.53.149])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CE8F406BC
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 13:17:02 +0000 (UTC)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.231.96])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4hlK2q4dMpzBL8c
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 13:08:51 +0000 (UTC)
Received: from ghost-submission-c7b579475-cpcxk (unknown [10.110.118.120])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 74828C01B4;
 Wed, 16 Sep 2026 13:08:51 +0000 (UTC)
Received: from quimesis.be ([37.59.142.107])
 by ghost-submission-c7b579475-cpcxk with ESMTPSA
 id z8ZyL9+UqmqhmjkAQRngmw:T2
 (envelope-from <antoine.gennart@quimesis.be>); Wed, 16 Sep 2026 13:08:51 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00174a324b5-7c4a-4e0d-8048-8fb60b152c3a,
 5FEBD7DEB569A611C946051BA325CD8A23A91D25)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 77.72.238.202
From: agennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 15:08:39 +0200
Message-ID: <20260916130840.881186-2-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916130840.881186-1-antoine.gennart@quimesis.be>
References: <20260916130840.881186-1-antoine.gennart@quimesis.be>
MIME-Version: 1.0
x-ovh-tracer-id: 10728418740255657942
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGzc4JhBUu2ResoCMIdwA+G4whmJHvr1CzPgK44DFLwTTvPGNb7sn5Q9loavsxLvHd1HXZ1RsjiPrBrzEBNuAwVUGfRa8GSaYQdBcI0vDBpafG4z9CzUDy7y+ER9LXJaZlcZXszuMFY2+2KGdQ236z++jzGhTliODIr/8ON/t4mu33jnwE1ZQjVWflwSdyTbvAT/tsmC0Eozq14Bc+GTabU4C5wGqGDvQadNnr75dlFxpqCxyUp5ES98FmUiFrEGlLeLoKBcoxfnE6vxnLJi/LAD1p3ZVlx7yxotkGLwknTx0KqK5MLODHxxsQZH/TOBfsCVNA3u/mC1VdNav037V7MAyxnH4UaQoJjhf/W1sic5L/tZUN0Z4/yFi1FXNPWcCVxU+G5nos62yHIAX8zlEgK/0pKisKJNXwwH9NblRCdgqsIU5PseE0OpoJPLTDhChFnHcLGN27kblG3rcf7bfyc/SoXyEb0lOaOlzlTUnVvzMT7qjtt1ViikEv3L6NA0oOT/5fYttV+msiylnlR0DLDWp1nj2LMLE2LCsIuxFVbzuNtGKrE0UaABGOgPNLMCJ/GfLRcG4TLNx+Pr+gWtJ6cvl2d2fFGQInT7f077+KdHdUlgXkKTbLmk9ykzCzB7En8+zL8oWb4l2lhGr3UoZLsdeikV7ij2f6tSMQHirdr1Q
DKIM-Signature: a=rsa-sha256; bh=qjZQooT1RXd132LiMSwpCxutJ+EIwO+xdJuI2QZQnjY=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789564131; v=1;
 b=NbBiVaSE0Dh4dS7r+KSz8+bkpUJGz+EmuJTr9FNMeOCeMbhQyMlaG7UYQ53wmAk5UpU6bhO2
 A4IOJb7vjUyRTT5hNutQDloxxxGym6uxJmb+xCRIGh213MskcpCoNdt/u4Y/U31nvI3+aXo9XeS
 YQ15eaOUEeaTmdy4InMQSUeWfcicwAkGH0lShyPAj12bwf6O4QiWU6cvymea8GGPQ5aAsLj2nCU
 O5/zGRudurMDXIMrMRQaS+wiMW29YJn5UwZH/T3ZcVrfMQQFJpdiOFNO6lGwLAFqQkblje5aGor
 ma4cGP3FM9Bs7vsDprchczkDjV500qZgGL6U55DbqE75g==
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

The IW610 module is also available with a USB host interface, while the
current package only supports its SDIO firmware.

Bump the firmware release to lf-6.18.20_2.0.0, which
provides the FwImage_IW610_USB firmware, and add a dedicated
BR2_PACKAGE_NXP_BT_WIFI_FIRMWARE_IW610_USB option.

The new release also moves firmware files out of the nxp/ directory
and no longer provides 8801 or 8997 firmware. Update the installation
paths, make the existing IW610 option explicitly SDIO, and retain legacy
configuration handling for removed or renamed options.
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
