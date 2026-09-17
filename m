Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0B0C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 19:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1403406FB;
	Thu, 17 Sep 2026 19:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQfEbdnX_LG8; Thu, 17 Sep 2026 19:17:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 058604070B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789672652;
	b=YZwoXTmieWlMFCq4ZhTWnU9WBhvXsTEPkoW5qCKP9/JW/MzKbJ0LvYd2H7lNhoyIsc3m
	 N6Q0TsaMTcRLexoFiHIvVEgIFPiNGGYwVoNAU3N7qwIlIC9VDpOCD11NfHpw+4QBHWHa/
	 xEq2+qhxc7g1gHwj15A0jLvkWHL9NTU3rqSRpXIUP8lirngGV6eaBmVwpG1eQq7KFVVnq
	 QsI61GsskLpIkXDmqtzZW0bnV3K+Afy1qcF+4YVKoM2xR1CqYa7AfXofBwlyQehUnCdqa
	 9BGDnKOjyzeZnslJDquJxm/mqGnQhzTNyLOFDPxLX1A95HZA6vutQAWDPag007J8roQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789672652;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=aetxbkLUNy2K+R/H31nYX7fnmiE5P+ZMtvgq1wGBd3A=;
	b=CSFBHRR8s8LF3gQiEllDpLiAfqfKMg6/UGvlN7Dj4aqmM9y6Xp1aii24umaHSQuf7OZP
	 r20ju9yu3Ypzj8nPHWVO9V13gzb2oxXaxG9XuEHKQaSFW+yd9qV9Qy/CBNmtBrgTBVNVH
	 map2WAC3W/821jGq+odeWJ30+5AZ+bDLyu6DHZHxu7lv1NRyCq6MzeCDHYofPm0duC6qa
	 V5l73AWduy8OzvRE9TjuM4Fsq+B4CmRvSvTg7ApaF+t8huK33P+OuvOEboZDHAy9CuZ2R
	 KqzV9HeC/1Le9uq7R8R8tUB38rKrXOYiw4n0ptCS1r6hsQsYbjA/9lqDFqSha41yhWA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789672652;
	bh=aetxbkLUNy2K+R/H31nYX7fnmiE5P+ZMtvgq1wGBd3A=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4MTKmO6rmpgjlWiV1AdSuOpUGwULSrIrnBcfgJWgZ5w+wn4jNX3n1F0+FQQ7knb3
	 O7oJ1DV6DlbRtKspTdr6tdL9VH7LbMrNtluCaURbkOW2gFX7sByQ3nxnTG/iEbRu+o
	 8rhWEMbXGevjyEnxaNq2LYrWIg+1oRIqaYxR4eE01MZjgJtvLjJY8tjLDpP2a17Ddx
	 0EM3LKcXF5h4y9nEn03K1BPFqrn0HDZVqzkDHgNhEwtXDamM1IAUFulYVMFMTfckgt
	 xUhYVZTG/69Rmxf1uDUSpbjFEGg+Z/R1Jgg12hX0HsYVmv4RVpGwuxNL1EVxnaKhq6
	 QdWTR9rspzsCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 058604070B;
	Thu, 17 Sep 2026 19:17:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04CC93AF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC1980962
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IthiKFtyDEyG for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 19:17:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DCE0680906
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789672649;
 b=RTK388iRaeTCkFOYvpASD/Mcgr4V8+HNn1ZC6axy3L2ssa6JSguy3MRzsLwhCq6DqNoK
 zAcEv+p4shpwPL1Hm1f28uH5i5dDrpJGkC/vLZ9YmtPjordX7YiKeN41nyC1KMqDSstHc
 7+xw7Rtcf1/pm1SkCM3P6QFpavUQGPrtAkPytBcrfrIyoBab7FKcznDLBw6jyv0+Wspb+
 GSfcPseAU6FA4YITdUJPAlQsdIXIMaZvfx4BSp8O+4VuM8H3n1mryZcqjmo6Rvgalagu1
 Wdz+8FQbhgbeTNmwE/t4E4CYlewGBPh7czkaFaH3+tFc//+bLQoHLHb6IfcdyFGppyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789672649;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=87bet4qGJoZ5zndGDMheAomN2Vbqc//FLkI7S9R6DIc=;
 b=aLg/hMaL3Ksf1CwwON5W7ZuVlR6zVA8EhSlPLaTQE98/rI5EKkxcCv9oP6OKexZOnf3b
 DspvkG7akJTDC9wz1a98z9jWhjyKMnyofZsa1ZRpWsStB1UCLTNpY1VMRzt86zlhOONiB
 teuQab57NA8rxoMxd76lSR1dWdU303BYfX9bayz8uE1glim3y6rXlAOIvo85r4G3N/Ffl
 1mNkCr2Uqz+jpXmJS2BbbHhmC0FX7Bky9CAx6pd6qKgs78TFQ25ApaH/O+h26xyAtqTMs
 zDcU62FrUIvUvT02aaHHU1TrY3V9Lr3A5aO37MNB7CnEQLwM2S2C6ss6m6AVaBR4riw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FkDh2X7y; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FkDh2X7y
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCE0680906
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 19:17:28 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso18605e9.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789672646; x=1790277446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=87bet4qGJoZ5zndGDMheAomN2Vbqc//FLkI7S9R6DIc=;
 b=FkDh2X7yL/CEZ27lNHsqwezhmw1++AeiFcFVs9XL1SknQKVjIuacFEjfN1GGfaEQcf
 xHFTEWB6fs25H8Xz/Hz+JoSJJGQvNVqrgwnYqhrs2xW2l2bvHCLZUgX43MTCAJ+IBT5V
 zQFIPP6UmmpLMgbcjRYjRmclTDv5oZM93SG49qd7xCXprtfcph7hQjcgFAZY46c10smC
 I07bQF4gJMhkR7LN+2GmdMJjcad0RcKWEIg9cpTjaMoK1b40MU5q64Zkbn+2cZemDj3/
 cabORbaUBMQay1rBjNXB8ROK8gBf2lMhyI66rPmtBmDGObgAtRiEucOm0tYd8j9p+TWm
 GTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789672646; x=1790277446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=87bet4qGJoZ5zndGDMheAomN2Vbqc//FLkI7S9R6DIc=;
 b=lf5ksojsyDEtacXL7iWbJFYL2ZLtZv9duFaU5/wliR3vVQCQ1emniSL86T9EIfyPHR
 kLns4BEnX9htbjh0mf9V9Mp7bQBlibheXH6V163Y0rPLBPQiDJWF03rfE8poHpoupitC
 WkMM/Pt4BsX8aDFy5XNttoLKkjkQ8da0rfItF6d2o9uQr+VD7LfMITYgTiHoRFdJITih
 yE8CLxoHl+zOvFnVZOv61/QABdfbQK0YEyxTANk7z0Y0J3xynPIIuiOl+MAVbWhgewjC
 XBo9p0ZnMGjDDJDcAl/T8ouQhlX+e7QGmDnO352Ieqklg8y7q36ptKjw1KOBkjoN9+BG
 jvIQ==
X-Gm-Message-State: AFuF++nik0gNM5py9LMcmUNKnGePjZngyDXNekxGMk+Ag+VrvAkasgXe
 mWPpVNUPM6/8Usl0TBmUn/PA0lJ9dkn/mz5Mr6LB+FmH5Yk79ps7WGO3jM11bf9y
X-Gm-Gg: AYBFou0+V4rE13wjz1P4RDJMN5TNN+JR6Q5bfV3wzbphbLoIyjxbOzgNRAravCl/Nr5
 iOAk6t5UrKWQu5zq+AVKV7GtJ7ELm53FWc0gKSNYZKIwt8AqfF9cTGCZ40KrYPqO9JAy5VfWuBx
 F7FKSeUQ0i/CnVDVoKLwYBKdQNZMvZC16BiURjzL7l1dM98tfyjVUBall8+LqDgI3mdhPmKkWTi
 Jf5vtZq8kyOBuHteqI/NymfNuEgo1YIchF1Eh0Wm5X2Au32U/OzDeBcAwHvPqkYHnldMGcjJn3d
 2lVZCLfURnM5oODiQ73u1t578qzhVdNxs4zbSRlkbj8tn3tXyptx5w88AHeppeRUTPKP9E/mk3R
 PVfxStQSu50EVbk3Ua5qso5P1UuW3BIHFpq2YXpSnqowqwYj+1vqwLbRgnbUH5kcOY7VvakgGqr
 Os8wK1GxY+uzL2lQSim0TbBr+IkHI4ID7puO4rkqb86+MxPFz3nA24ZZnGsXf8wPipbITuG7ktN
 ttR
X-Received: by 2002:a05:600c:1389:b0:49d:2936:8ad1 with SMTP id
 5b1f17b1804b1-49fc4f71c7dmr1646425e9.1.1789672646313; 
 Thu, 17 Sep 2026 12:17:26 -0700 (PDT)
Received: from fedora ([139.47.34.204]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd23a815sm107083065e9.14.2026.09.17.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 12:17:25 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
To: buildroot@buildroot.org
Cc: Jean-Paul Etienne <fractalclone@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2026 21:17:16 +0200
Message-ID: <20260917191717.2471859-2-fractalclone@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917191717.2471859-1-fractalclone@gmail.com>
References: <20260917191717.2471859-1-fractalclone@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/brcmfmac_sdio-firmware: new package
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
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/brcmfmac_sdio-firmware/Config.in       |  6 ++++++
 .../brcmfmac_sdio-firmware.hash                |  2 ++
 .../brcmfmac_sdio-firmware.mk                  | 18 ++++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/brcmfmac_sdio-firmware/Config.in
 create mode 100644 package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.hash
 create mode 100644 package/brcmfmac_sdio-firmware/brcmfmac_sdio-firmware.mk

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
index 0000000000..30a823702e
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
+	cp --remove-destination --no-dereference $(@D)/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	cp --remove-destination --no-dereference $(@D)/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
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
