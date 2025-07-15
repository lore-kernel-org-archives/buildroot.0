Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DCAC83F1D
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 08:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE7E61063;
	Tue, 15 Jul 2025 08:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLiqPaEj00Oi; Tue, 15 Jul 2025 08:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9906D60DEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9906D60DEF;
	Tue, 15 Jul 2025 08:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 856A6DCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0E74054C
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEQy3mwtsw_P for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 08:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A429740507
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A429740507
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A429740507
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so1041808266b.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 01:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752567605; x=1753172405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XsrBPh8VxC/5klpxqbwI49Sy1nf+Y7+bm1zje1SJlP4=;
 b=frI36I1MFDYhZHaTeKK9hfQ7Cxswda7NEHZb3MwI1Tk1ZgavQ03+nhh6IME0XvPY7O
 qdNclfGMAJpIcDj3sBMSDvzrE1m4Y7Lun+Vd273oei9+kVcxSI8Lwo8YlJNQSPIbFZBH
 2WXPw2Ppjxy6jZarLmpDJk0y2F2HStBt2rxcnM2d43if0OtYwHQTmILDKVoTB34Nupx/
 CmwlUCUbKK+pUE9SiDM2HGHAf30Dt7PaNKZZ5FMsgZ4aoLrcBgQnaMYZY5S1GlOi6iDv
 HgZW9Kfj3VWiQlz1TiKsvgk/97M2Wm4vkaOhcqQPPeE9GQWxcQsPjaFdOL1oDpZ9b+E6
 DF/w==
X-Gm-Message-State: AOJu0YwaJoaGyyR9cau6S1mM9hwcRaernajSxA81meYBKduWvEYJheHe
 oYzfrjlCGlBZzxlJQkhtVen5xMWthUqCDaXh0jI3dBgvqMXZtuZL1XGnUVnOsQ==
X-Gm-Gg: ASbGncsQLxa+6DJyMn7o3AM8QKIf2/yTYR7XsDdpdXgkvopyPMXu0YIW0CMabtMb4lx
 68ysEHrk8h6lVNC2EOoZlGijUqKh/L6J3ULzxFDFDrqq9PIegoJ+3jwgUWzcTGHz2DAcyIluH+Q
 bRJSaTy745Kj0G20k8UV677wPnfatetiqtm4MMfHfHFSPD5iLY5FM9IsQRCTpZYzYzuHkKcdZ+x
 d0+eh0TAf+/3T6gpiYh/tOKsKQ2paoAWfA5oZ3CsOxX2gOUq4LkqBaqQ2UGVtU+Fy9vEeVbTkRv
 ur3YjkyXaN1joCjJ88zsVyDY4aeMt09fmi5yZt+95crWb/k8IBu3gQRs2yFtHa4i7VBw4c5sGG2
 kLh12/EXTL2aK8OfZMA3Esn/tYMaL0+9YrYRV/WstxxzDQ00NKw==
X-Google-Smtp-Source: AGHT+IG/qvZta4m5W4O9T0um0cLWYM/F5V4aKi14WexGSAW7DJa7qHAvSBp4w8bTBjMyV1xiA6zYsw==
X-Received: by 2002:a17:906:f596:b0:ae0:66e8:9ddb with SMTP id
 a640c23a62f3a-ae6fbdc7e12mr1747107166b.19.1752567604922; 
 Tue, 15 Jul 2025 01:20:04 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82df4cfsm944173866b.162.2025.07.15.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:20:04 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 10:19:40 +0200
Message-Id: <20250715081938.108853-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715081938.108853-1-heiko.thiery@gmail.com>
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752567605; x=1753172405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsrBPh8VxC/5klpxqbwI49Sy1nf+Y7+bm1zje1SJlP4=;
 b=iinVO5YDlYifIE792cRbOrJtef1ndRpwBroKcoK1Bvx9wllIhccH715E+OQ7yz5tW8
 BiFWdBxizNkeV//LgbYKnDHpO49GdwUCcUxR1VyJWH1r6Ej2XRFjOMw/jCktFVU0qfvC
 MX836zZSGRR56Tc3+5/VpeJR7tjVlG49rQCaVE3TmqPenEfutEJxmsMoIVAmeWoRBPQe
 VON18H5cJDzrHIunwEe5pIgCQToPl8gaAN5BDL3MTV0Bc3MKJ3NEwmILYzh6Kn6O5Apf
 GudOkCGDm8Sw+80ZIIjadku93PIdek1KbL1MKnQ6lopL69CwVrsocTaVluQrxuqpwozt
 pTkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iinVO5YD
Subject: [Buildroot] [PATCH v2] package/linux-firmware: add support for
 PowerVR rogue
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 Bryan Brattlof <bb@ti.com>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This "powervr" directory has been present in linux-firmware since
version 20231211.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
    - add entry to the hash file for LICENSE.powervr (Julien)

 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 34f3fb7691..54910df6fd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -729,6 +729,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
 	  Firmware files for Arm Mali 10th generation GPU
 	  needed by the linux panthor kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE
+	bool "PowerVR Technologies Rogue GPU firmware"
+	help
+	  Firmware files for PowerVR Technologies Rogue video cards.
+
 endmenu
 
 menu "Serial adapters firmware"
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c9c673f7e2..36cb97c9fe 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -26,6 +26,7 @@ sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENC
 sha256  a90d3f66704d85889945fec5525ea77622549da83aced1aac99828383f8f1805  LICENCE.mediatek
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
 sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
+sha256  1c9aa6bd6703a7ce1cdb879542fa1d8aca115a327bd819b193c971de9c53f402  LICENSE.powervr
 sha256  0bd9f7cae3cf72b12a63359a725ccbb76ddbd6831372695a9162144329800dd0  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 38212e12ac..b9fd471e85 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -931,6 +931,11 @@ LINUX_FIRMWARE_FILES += arm/mali/arch*/mali_csffw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_POWERVR_ROGUE),y)
+LINUX_FIRMWARE_DIRS += powervr
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.powervr
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RP2),y)
 LINUX_FIRMWARE_FILES += rp2.fw
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
