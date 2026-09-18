Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C67C982DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CEA40B59;
	Fri, 18 Sep 2026 17:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlnhtmLfyxRa; Fri, 18 Sep 2026 17:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB77240B83
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789751896;
	b=YnSQAnGTVdGJE5UPSTcNx5yix4EXFV9e13decmchJg2/KY9gCcxMn3J/D8JgTMVtBi3P
	 iPnoAlYBaagg9iTDRErnayhmODTdefifvI6+bX3AGHC9UUQa5hUkbhx0vB0Tt4rmypoSu
	 vrmYWaFkdnjGeOxn7IjD1qMwnr1ZEDneV3UgKSW8nsBjrpV6hk5pnO5xuMkE3vNhgdIqf
	 oxYC8q0DYsF4VWSYD1+kWvEzyKdVOxzNNmIyZ/26HKhtJa3yJSlwK6EsIgNwq9b73KB45
	 8L4eefAKBAtiTlXvEd8eMNXpd5T+038nD4pr71TYmj0JrD3zrKBOWdh74eYBGQl0rCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789751896;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=PvxEFd4wkePpb6qS/ehFgDw3XtEQpmm/CHYDYz9b6pQ=;
	b=Q4x9naTfHdY2ZOk/baHxiSyHi2z/mbeApOjNk0paHRXrkQNLEzSBFu4EnClOyVFlV3ki
	 rpC9jb1gsCE10U8kNWW5vpe16XHa8cLHS2KFMiuxD5/ENZ6WkKhLH01jYSjWlWCaBC79h
	 4wzzXgzRpIFZCjAZTRII+NmkvKkX5pdl2U05VaF4DetKZbeUUUIhemK/czZQCQ9uRO22D
	 Bpr9qjci44w0/lrbtmqVMhiSFmoS6V7b99DjreXRM7XBnuF66PbHAGdL7fvzgq/BIIM1f
	 mUGVvEEODletEJ6bAna8PqASHP5ggT0CVf1I5zmkI0Ddt/ul0EMxFo904mQSXpasQGA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789751895;
	bh=PvxEFd4wkePpb6qS/ehFgDw3XtEQpmm/CHYDYz9b6pQ=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jSzu5uSKf55L2xbOmJWkoKJSjiLWNmHikSxfMQz1q81LwPQ6LmGxVsZTSdLR3wbP6
	 cCzcLM/1EAn2jrSJ+EHNJ6A3hC4tYzGHHTGPXXmdYT7DGDVlvlmDdbtcFFQIvLaGy7
	 LZkGAj8uvGTfFkrzRfZP8jafrQyl4hMqfYcd+fkGB1/TxGHy2lSNa+GCMl6wnOQpei
	 +aN3Mjk/m2sIxyU1G3fBabSfFSHIhPSdY5gNPlWGBeOsurAEpJhKWMSZRmIekSN3bk
	 wTVUyq28ndmGVoVBYJUAm56Fo82l/NwRmAgEsLhFeHNoiBwlelJ/S8x2aVPhLvQQ3y
	 49fm/nv3A+wMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB77240B83;
	Fri, 18 Sep 2026 17:18:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C76A813D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE1A84054B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKQtAnBPRmdI for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6B5C0400F5
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789751893;
 b=c21FlqueAcAVvNwAUqSEK9VW823IL7iQt4wBMo0qY6MwlDXfgnTjdKS5EoqLHCzH8qj+
 b39P8Fdbif9GLNIGpuM54GwhfdpFk/r798EGHcmCObyPE9dZnuZuE8ovkcUFWu03FgaYv
 mvo0MjCk9atuRJ680jgFFLfhF8YyfNpx6jFfvgaSIM+pxew/R1F3HbOnGxAZ1GfNxhvkB
 HbrxmlBACCTkuobe/YbySwqi1bbmvPDmSf3Le13T21/kQs+78MPQ06jF+HS1pYPe2PK8Q
 9WdY6H3CaWT8AxjasquOoYbgGHY7lZJhFoQdGvDtg2BNsMDnWXX3NPXwCBpeWf0v0YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789751893;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=amEvugKU/QK2r5/HVAHDipHuves9zjkBDkAicHv82fE=;
 b=FqUbiSPdYQ1e/DZ+VgeYXwe987+brBV8A4GjY8rgrGwpvfe56wQ0ka4izt3rbrf3M6yY
 f6iLSSN7oYdX7ZiE/mu9x62xre6rEjn9kwGJWNm1SGMlWB1KqyXsQrY0zZ849lZYXS+Ps
 3kuI9JYsZtTZ9PuFDxqdmrwI1Oda4+dxAtpd24KRbgsibFloGtF+tR9tJdjxfST3I25SU
 jXiKPq76mAXAH5LfmhZuR8DC0L+bslDOCXrzHaSMO+a+ECZulcbK1kiKuIT/SDMGGMRDN
 jAFeuSCVLdGbBCbhUXNDSFZba6+ijXwLq3C8cQKoawxAu5hM6YSA0KTGeEc7Csd0U/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZsoEDdi2; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZsoEDdi2
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B5C0400F5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:18:12 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso8027585e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789751891; x=1790356691; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=amEvugKU/QK2r5/HVAHDipHuves9zjkBDkAicHv82fE=;
 b=ZsoEDdi2yivlH9adhj4VzqEZwLR2ws40outHd4nDhVjljHsvZdi5O4t+3ZRQQwr+yv
 mp2CBdR6vIgtepSEF/kVHR1Zz+LJ/MpoORLWyb81cL2kwnamTRK+QMLlxaC3U9uEMxOH
 SSLuU3NJuIkIH33EAWgUZaXsmOF5sOhWTnRC0cnzc9ilVHF5NGUyjMN/WlrA32rVzf/F
 r3sHEJgciuvLVgq0kamgzGmyE2aOTRWz6o7VfHvDOuoVFon36cOBS6PD47JSgToleSUV
 i5vQBCJLHOxeVq9MhWPKaVZW3GG+OYbmlNkuLMqETI1NQDfFVtYCxJQRxewDQzOewNQl
 r7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789751891; x=1790356691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=amEvugKU/QK2r5/HVAHDipHuves9zjkBDkAicHv82fE=;
 b=rIO/YjsECRdPDFrek3eJyyvF6hDakYnCHZu7paf+j6SVzRTp50TVDetiM0LVjEou4Z
 zkhky8YedmhkRTwtMjwDeuMiya2v0wpJwxCzzFbT6QU0ppLhUIVT+ZVdnqFIesufTntl
 9q2gGEFENwLeHzSkbX9mRlpjSqX5UVLHtqEwz9Wegaf7sfT7aYt4ShEXKfu14TpIgsHG
 HbUTFL/CP6o1nz8srGhZoh5Y0gZw56qzSZCIqr/tPHPrK4w2ClKyw6QGGQ7ooYBEKJDm
 iHh56AQOLNK51IfnmUWOIjaa1BjKrefTb22QLsRoygx5ugpxRXBrbZAvt3Yn/4uj9msV
 a5OA==
X-Gm-Message-State: AFuF++ld+M7GL9QIomTtGJs4sxLo3ZVDDSf/riYlPd6Y7q6Wh1/rDjfv
 UtJWRSHdTRFKUJZe2Y4Esa2XLd1Qx5cBm46LhSgQ9B/H6taNMS8oWy2UVKev0A==
X-Gm-Gg: AYBFou3t9Uu6VvaeU43DQDi7Jhr5Kqy5kl21gLyLqI4oyTk61ljJET0l7eqcTeXiFmk
 xF9jC5GuPVXEsQxdtafc1TPCSbepAvBBNL6btdXxqSxZyPfzp0F8Q0VzvaAjv5NsFDPbfliLr13
 uDZ1eYptJ1Esmt2xFJ+BFJvFIoCABIXoX3GlOdaElQ5byxqXITwLnioDYf0kpwXA1S4OxMBQnLB
 qGGLdasnsNg0gdu733vMcjz2DzQlRrzNZcYcy1Xzsf0jbC6IvESKYsGmX7RjeTDAmCPZPP94G0V
 P88ZkylSKdnwXF50zpz+vDziEo++fMXGo+2kAGDrqZ4pzEqWpif6n7tlR8a7cPtId8iQpzE6P4N
 XpbW9fllYwVWlU78YkJy8kDFEii52+kz0Lkwt+IvXnbljddQqc1I7aUJtt4z7fMNuTesyE+ndWR
 udEe16evgU50/84RC+TVlAtdwdckMVS4MKLA45DdeJhWacN6HvnhwCEJqL3f00hw7BZhb8J6quO
 FfsQA==
X-Received: by 2002:a05:600c:83c6:b0:49f:bd3c:bc17 with SMTP id
 5b1f17b1804b1-49fc572f20amr37020045e9.18.1789751890691; 
 Fri, 18 Sep 2026 10:18:10 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724460964sm133880f8f.7.2026.09.18.10.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 10:18:10 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Fri, 18 Sep 2026 19:17:36 +0200
MIME-Version: 1.0
Message-Id: <20260918-rock-pi-4b-v2-2-89120500a1de@gmail.com>
References: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
In-Reply-To: <20260918-rock-pi-4b-v2-0-89120500a1de@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
Subject: [Buildroot] [PATCH v2 2/3] package/brcmfmac_sdio-firmware: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package containing Broadcom Bluetooth and Wifi
firmware for various boards, like pine64, orange-pi,
radxa boards, etc.

Signed-off-by: Jean-Paul Etienne <fractalclone@gmail.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/brcmfmac_sdio-firmware/Config.in               |  6 ++++++
 .../brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.hash |  2 ++
 .../brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.mk   | 18 ++++++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6d69fd4663..2fd4c6e26f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1617,6 +1617,7 @@ N:	Jean Burgat <jeanburgat33@gmail.com>
 F:	package/openfpgaloader/
 
 N:	Jean-Paul Etienne <fractalclone@gmail.com>
+F:	package/brcmfmac_sdio-firmware
 F:	package/rockchip-rkdeveloptool
 
 N:	Jens Kleintje <scooby22@web.de>
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..49bf37e1fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -438,6 +438,7 @@ menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
+	source "package/brcmfmac_sdio-firmware/Config.in"
 	source "package/brcmfmac_sdio-firmware-rpi/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
diff --git a/package/brcmfmac_sdio-firmware/Config.in b/package/brcmfmac_sdio-firmware/Config.in
new file mode 100644
index 0000000000..6fab682d7b
--- /dev/null
+++ b/package/brcmfmac_sdio-firmware/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE
+	bool "brcmfmac-sdio-firmware"
+	help
+	  Broadcom Bluetooth and Wifi firmware for various boards
+
+	  https://github.com/LibreELEC/brcmfmac_sdio-firmware
diff --git a/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.hash b/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.hash
new file mode 100644
index 0000000000..0cff4fe397
--- /dev/null
+++ b/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  52eb7cf8fce423ce760ded49ef3f5c3b77db70deab6fb0e50f476e50298b8a6f  brcmfmac_sdio-firmware-235def24db2f660780f697099834aa488e910882.tar.gz
diff --git a/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.mk b/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.mk
new file mode 100644
index 0000000000..a7f3ddb059
--- /dev/null
+++ b/package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# brcmfmac_sdio-firmware
+#
+################################################################################
+
+BRCMFMAC_SDIO_FIRMWARE_VERSION = 235def24db2f660780f697099834aa488e910882
+BRCMFMAC_SDIO_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware,$(BRCMFMAC_SDIO_FIRMWARE_VERSION))
+BRCMFMAC_SDIO_FIRMWARE_LICENSE = PROPRIETARY
+
+define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
+	cp -dpfr $(@D)/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	cp -dpfr $(@D)/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*
+endef
+
+$(eval $(generic-package))

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
