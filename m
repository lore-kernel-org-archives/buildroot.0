Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91287C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 577084071F;
	Thu, 17 Sep 2026 08:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF3TX2EnvJKg; Thu, 17 Sep 2026 08:26:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 411F140758
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789633565;
	b=AW5/M1SmLoQqAG+aHGMGmb6Z+/BrF8JwMQPUiL/aPUlgrmue4bKHrr5gozJa1sXbIfnN
	 Er3Ev2QKaMXrphMmWtu3zgWNxdWauH6DQlpaZ8AVjCe3DroJXoqIKESfs2bCJ664pW1Th
	 PZX051KTbxZTiMuSKlBgA1iYQ+7FpbEV2h08FmutUc1OnPUiFMOUpSBJ2pv1Tw2Gkq1IY
	 2+qF55EbmS6nGEXzLMKvidWV9UaPBlK5jQhITmdlyd44nDcg1agBfZuloHxbqoxR4RIja
	 1fd5zaFLVMAeeFL1UnV/X6iK0n43RkocWGe9+lsDvhGN5zGC0MA6IjDEzS9MpPw5Icg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789633565;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:X-OVh-ClientIp:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NEsgnIbih0zy9AVwVpuJQdeVmcfXPy/+bXtr0Mm0xIw=;
	b=MHfwBsdvTLVbFQj3FB+cg7ok0sXySjZ9TjW+UuJjpaN063lGMwxmI+yuHMfHdmK/Cd4R
	 kHuPAAwj8PJWU5/YDypxgXJQmbgaVbV/4cDX9LKMJ9cThBm94dumih81FYYP/UGN22KVv
	 PWQjTJfevMq+2WxMJ+MvZuDD5ESazti9HWDAo8Tr+LK9ymrvVuquNTUxrd4/k0oLMq41R
	 +xVFBkEigedNVTxjQfuYXw2uj9kvWBR8/Wpir0EmU2Am8TN8Xfq9RDYuVKbY1I5hrlGqy
	 Z9SwjPQWAKNSLCsu6dHLPxYxw0vAyWBn85MRR2vSOvstAh+79F6KNLD/AyAKOxWzSDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789633565;
	bh=NEsgnIbih0zy9AVwVpuJQdeVmcfXPy/+bXtr0Mm0xIw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=asJUKr0BaZc102nZzeEq0J0GE6vO951HCBhKftWbVRDubw7FVRHcK+ch5paa0XgI3
	 loBY8Aa75BLAeC6qtMSvo5xTWHDTuyyymQEvcJL7yB9ZMXSjdCFpXJrPP/IYFfOSZE
	 00q5/Y8KtYxhZt+XlEp7G6IeQr5eEUyiOJzEk189OYM4Wk6vVx3pxSMII9isytqFSs
	 H2eO7Dn7pyqOpHGX0z8L+9a1Pqykypoqhb8sdM5XrrbS1MlcdfaEASyQ/2bw9sfMjA
	 1yzlG4XSYD91YTj//PZ800uVKVOw5+vKremOW7C+/3KG0RHodp54IWeqB5jofplHT8
	 mi/e92rD4UhzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 411F140758;
	Thu, 17 Sep 2026 08:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CECB1224
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04EF80EE6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ia5Chu_W1kY for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:26:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C97B480EDF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=46.105.40.108
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789633563;
 b=ZQGIVOiOSzBByj0k5m2gHdo0c5VM2xGlFr4EUmBLNdyKZLLBxys7UiG7goY/i8WwEhmA
 mM0mhhiPAKqwL49q+PNXp1LUCcaIDTSG/qqJU//+ijJgdK/CaliNil8WAtwdhOMnuhIHn
 QXpXW5/DSrCQRRcC616rxY5Sy6n1NxZol49lVdWSbJRky0Zz9rNkou18F8xpok1+IMvuZ
 xDsfLGnAzn8/KCOrngakgfQFnNO7T8PwN0cQ2q1MXg1WoAFnMO9edYc0+L+MwJAk0VWOW
 5DoweLX3ordzNGr76ae6LmsOeRzNDxLcS6Etexw5DGtqK+lcoao1MBYuxc7revojrLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789633563;
 h=X-Greylist:Received-SPF:Received:Received:Received:X-OVh-ClientIp:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
 bh=oWF4QjNUqMUmFyc0YZ2MG+NcAIwXhjbhxOLqTiLCJec=;
 b=MfCAs5kYEy4ex0s40bg+PwJa+pbMsNATFlnrOgi+E2sM1EoTQRfvyo2c3oL0H2pEyV9z
 bVR6X95g9wa4tAhSQuUrMUDJ95G6WQjAfNjl4hbXQv0rGq9tK/aHh5z/Ru7t2pHWxC54i
 Wt1Qu9XxwHw6oAfYlBSM497e8TasV6iH/j085PwdnvLiac7CpPX+fHM4baKLvrv7g1L3Y
 fNim2kl1ppHH12Z50rZL1pqJEDauA/a5C6TmZUWooaecbIaN8Td2RUi8TF5VUBSAd63V6
 MuQLk6LIlhDTX6hnlTaXnKXw+kI8UbO6mzyENmvnxvtTq6NjJDNyhQXVJX+/LZV8miw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=quimesis.be; 
 dkim=pass header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=DItPOuJE; 
 arc=none smtp.remote-ip=46.105.40.108
X-Greylist: delayed 77449 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Sep 2026 08:26:02 UTC
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=quimesis.be
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=quimesis.be header.i=@quimesis.be header.a=rsa-sha256
 header.s=ovhmo1685834-selector1 header.b=DItPOuJE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.40.108;
 helo=3.mo583.mail-out.ovh.net; envelope-from=antoine.gennart@quimesis.be;
 receiver=<UNKNOWN> 
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net
 [46.105.40.108])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C97B480EDF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:26:02 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.54.182])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4hlmyS5l6rz5vql
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:06:40 +0000 (UTC)
Received: from ghost-submission-c7b579475-t7vw7 (unknown [10.110.188.175])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8A761C0D51;
 Thu, 17 Sep 2026 07:06:40 +0000 (UTC)
Received: from quimesis.be ([37.59.142.103])
 by ghost-submission-c7b579475-t7vw7 with ESMTPSA
 id tv7KF36Rq2qcIDsACFZ/tQ:T2
 (envelope-from <antoine.gennart@quimesis.be>); Thu, 17 Sep 2026 07:06:40 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00521070d8c-0ceb-4880-8a6f-38568bf8ab0f,
 8A94A716474959CFB9616324D37364D589FF58DE)
 smtp.auth=antoine.gennart@quimesis.be
X-OVh-ClientIp: 81.245.109.59
From: agennart <antoine.gennart@quimesis.be>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 09:06:31 +0200
Message-ID: <20260917070632.1930848-2-antoine.gennart@quimesis.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
References: <20260917070632.1930848-1-antoine.gennart@quimesis.be>
MIME-Version: 1.0
x-ovh-tracer-id: 10484379934945578966
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFbjyzm5iU9yC+rutGpHSHeKL8uhJyrvmy3kVTojUU3uJaPDYuukl+sLdr+IIyFNIsnXzK7/raNfQf50NR+gUjwHsrfG7VM6AP17qiablWAOfz7hljTRQqzOV7gjdjUrPw9KH11Ggby9aq5/p8c2q4HL1Sn1w3WHrYP9P3T507J3dvXm5rnonWHpbyZPIdvu8/4rGBQ2wwm6QOz3klzML3X6GO2glhoeop0EYj+EL2PLtOR4r3JsvbSNm7Xtoyho7/90vZL1U4lxMVpupNDFDGGIOjcD7niy94jsxub6hH7fA8/kFVx1ZjbWY7HRcOWiHRPstbHTpCCwQaMQymkgl9Fp3/Q9v5r8nzauamy3ShF9zmuvbSukjU8xj77/NavHFwDEq8lWcY/B1S91DX3m+L/anDQs9YSrv4y/0YjIKcxkRgX8chPZm0ta3wbJokJpO8UsRVj9a81mupSs2UuEjWGi2ufxt/HRgrJ1OCotOeFSCrYG5Wn3KfGXtm12vlsEcyD89502I6JN4UjmCMol6XEmVxcx4Xo2RXo0qYPXX4G4x6L3wlUQnuLJyiR13XId8DUeeYDza4XIUSRVbg9MwW23EQ8IOUU2eFEtOv3dhQnM0/X0hmWb3xkC1ll+CXJfJTVR2luY5D1BMHj6+RTz6LX+vV8hWnYzu6CI1BosuZd1Q
DKIM-Signature: a=rsa-sha256; bh=oWF4QjNUqMUmFyc0YZ2MG+NcAIwXhjbhxOLqTiLCJec=; 
 c=relaxed/relaxed; d=quimesis.be; h=From;
 s=ovhmo1685834-selector1; t=1789628800; v=1;
 b=DItPOuJEZe3OeVPLSC68uaYUc88AWE+1X83GZKVSoGY/UGWchJ/TWeSoTAiDF0DvgJ+6zyQQ
 kz7nV3NvgZ2DdD+YynHx28n/HA8jgG+HOM0V5O9xBbJXJjO/wp8dEZAWIEpPDXuBuZCbjmAy5bc
 MCRvxaZ4sLBPbLjX8WbjfP2B3/pGqtDPd6ZsiAbqJanGcT9MmpI7n45tMCc2SymANSn8O1+ADNw
 tK+0KW+Q47+8qN/8Wq/zMjNT2IX2RQTfbLBRKrVk7CSob5t/j+FAwtuqWD7MCNQ42SUzKGejOS7
 MCs2pDcdhcj9fMPStkLwhSQuIsqWTKA0PW1vu/SJ7fcwQ==
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

Signed-off-by: agennart <antoine.gennart@quimesis.be>
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
