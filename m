Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779DEC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 20:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD3D60807;
	Thu, 17 Sep 2026 20:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdPazpXtBBLP; Thu, 17 Sep 2026 20:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 49B3F60852
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789677785;
	b=CnNjSpEnVxdjvfez7rvi+BRNbkiAXkjNDWlRqD3S3sGVay7lstPYqV3AvI1rlvA5lKKt
	 lpcWALx7fDmR8KzNkoxQgvOyRONwdBzr8I7VKHXEgll0ylgA7RI1qG2RiPBwWfEHmmYFA
	 quKsKTVkTtbDX8wGaYUMKiIY42Rbb9x0Cl1bXMYc9oBIdEkmiUsggueZi4yQAzeJ6Rqno
	 VCSiK3mWW91cClabuiPv4HW+lgpVDIn/djmDz+yftcHtcDYYDLcXIJRCo5DlcLmqSUA6x
	 hSgRRBQ2Ms/QTEz0BD5YrDRIwTPu8s0yBvi5GeUA4eOKXFzkDzqFhVEzaw6ZSGw4CXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789677785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:Date:MIME-Version:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RElxOwBYA4Yxz8MW/Ca4thqUXkQM5XCoLvwUYouLnw0=;
	b=EHE8U0poVW+sJlV0K6IKfPzWiNrIM7md/H/ccMHvHzCupqKQTsy1IE5Hmf67eAWwG+ET
	 9Gtb5nr9wWHmrKIOItEFQ3dGktKPQNyx+emf5bgzP7X3giDlrhVsoYznllf3AlJFTci0v
	 jBMFr7EcBKjbXmmiPaHeU3UPbzPNAwF460IWZinrJYqMwrgNdioFK4eCGZA/bW470NlCV
	 E8TZtAqfTz2erOaPiREX5RbGrckojeZnBxC7i7d3G/dN3KidKgPUH/fkCsR4dp/g7GzUa
	 xWW4UQl6ZmDPhPiNlGQ5Ew8S9knsxap7mJorN1RYTcTLwKW+aQy7ubSfAdTGKZsQ8fQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789677785;
	bh=RElxOwBYA4Yxz8MW/Ca4thqUXkQM5XCoLvwUYouLnw0=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWuet8kUnL5bZfmNxWl3tjiKsN0PWSHt83g+6yrZh+XMZZQZmHgbAHbnIesUYni16
	 OPgDDWM+bG+OJbQwiFoBi/wvbOfrkNefDiV4Ji4mvDELCujqzIpZa2qk58YreRmByz
	 9esPK7e/KKyg+H+sTS4ml/R1i7g7KFpjmO8eV8ijIAEtvI3KId2mfbW/6Mp1Qq21Aw
	 jNfKeJ6rKYI++CWwgB78/SbLDakPII1g30C8tIphicJsBBOXvAg8g7cW0sE0F9vF9G
	 sGH9Z3FWG9nqGNjTlVGjcVU47Xy4mIkYT+hcB/PnBBRvzSW+CHUJXqdIg8Y2ndgiOX
	 bYn49UDbSpg4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49B3F60852;
	Thu, 17 Sep 2026 20:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7A6A3B6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDF6F8110C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAZnS-FrDTH4 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 20:43:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B1CAF81108
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789677781;
 b=b/mopq5tLslSyncL7hlK9cyebcYADP4ebsSndXmwp8usDe3g0lx/PAKG6XXdWRzuHhyV
 oZUAjB03UWKkUSnNSzovyrRFz+MJCFr7USPLE7lK67+r3OKr5z7lKjmYVadtDx9zQ9MAy
 AqPunroxaCxXso8EEpgFMaIiho8iE+qkDp+y2DB7H5wDzcvGoHs1uNxPdYFc5DFhicdaK
 AKDUxzp1JjAEuT59tpq54plVBAg7dydizUSLzF9E/ejsbgga0kc6lChY6LqNfajZhe6fT
 5ii6Iiv+3bCt8Rxl4yCi/pHKKBqlzv62XNz9Ktq/DD2wr1slDiVR7PmeB5uvoOy5/DQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789677781;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 References:In-Reply-To:To:Cc:X-Mailer;
 bh=qaLXs5VRERy9HPoSd1Z8bw1yxWES81Pyo9b73QB1k30=;
 b=Kz7EMtK0IR9lxTw19kLdhWAlmtLizJYIQRpeIwDRUrvTUV61zDrZ7Ezgnn5NHGbBXl+A
 vASamKVPOBHbXPlhEbOgbsaa2Wx2f08El60fQaI3bIAAEmkD+kNRGWI41qTK6dAa3i5Bj
 //Rz6qoJEv3HFKo4yBE/4vgzSOqUYZ500dDz5Yu4/sKAoxQPCM2x6ok8T4MpRGPui7hPk
 d55u2AD0htQpMQ/EMUwgnnCl143PXdxDNSvLlJABriI27s9oSr78+EC5So5igrpo828ke
 Lsqtw4glTrQZJx4t7YBkFfSAfBCusjs/9vS5yJ25ddGBU+mMGhvgbdFfnrYKXEn8pcw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HAABfXWx; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=fractalclone@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HAABfXWx
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1CAF81108
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 20:43:00 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d822dso398905e9.2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789677779; x=1790282579; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qaLXs5VRERy9HPoSd1Z8bw1yxWES81Pyo9b73QB1k30=;
 b=HAABfXWxzJ0iKnJXmF5xoMcIwkaqeqYGSVJTwk0YuPCB2aVfAORNqM9WO1/D2C5TPM
 TTI8cE5YZl3o0W2G5SKCasDJxAtcKdQV6lnj//UzH6kTFIZhdwwGxGkEMPh3LsLcFwSS
 +seHY0L+n4nfW3dNjHA8XpvXmW955Y3S4O/fnQHFxTAuouqvny9iAYo7+S+nlngUZMcv
 bzkap717GY/XHIqyT32q+e1u9lvTkoIOTyKOg4NHEXgD9q5pU+NvgW1uKwIBa/wja/v+
 GihNxa9tvuv75GaNFBwNjmpFmULM9UIyXDkyHkDTVV/s2EjmlStrnySY4rjLC0mcWeYb
 l84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789677779; x=1790282579;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qaLXs5VRERy9HPoSd1Z8bw1yxWES81Pyo9b73QB1k30=;
 b=xhJi9YTcTMXIXlFrrysZeZaJ3SiArsEXIBHZUsgMvvPN0WCyHAktZrjKh6n/09rpS0
 874KJK6AUUTLRR2IICouoNxZjgN5Dq2nbZ7flEI46ntNYx9Cg3nHv7hUwDPDy/LAPAnP
 smkG2dX7FkzHvpgfvTrXZ8KL3LmmLY4ZrVwPNt8xGeG95RHQprrCfJc4hLrU3rLK4Ftk
 WaK43Ryqtq/nzTO/tO0JN0DmYi4n3QWsPPZHlezpJ0SWLIntQbDtW7dM/z9oPwoiR4OI
 2RqIfCMWtOaChvZ5tM8Mq/XoggfS2jgdMuB6akG8iVOl2DhkvT/DQNFgu+uTM5eIRRWC
 UN+Q==
X-Gm-Message-State: AFuF++mPrG/rvyuvSLX6fXFdbaCViAOb5cMslsT6YNp8gTQJS0qEmynp
 sryrnRDerHLn0wtA3hTp421PIa+acwrILf8tMCqKIYegNUf1TAv9Q/My5/zw6o06
X-Gm-Gg: AYBFou1tALIerzbnRrcY3YRuAnix2Di1YpgtFdexjzrcpNK5M7KhNMDivs7P1B7knAf
 iE45MeOPfPmo8hPHselxjwodvL66gMzfQmvPpFMNJrlEbxeXCtv/mBr94Ig8M0BEhfsRMdRnZV6
 YqHAbgEjnBk8hIEBK2b4jQGp1oupHHHeOf4NfOS5nDf3wVheGePev/esQU9ewNyHd/zqCCAeE6m
 rT28AOmM0hnymZChgvVMWCtAaZTzSUFVWWoWHuSVSVPNWDfOtiL4CkK+g0Bp8bMtToZERzFZL0h
 /P75Oh9zd5CjfOnspzzkkpqmCVCn9Ba/MWcInMcAco4qVp2pH/Zs6hZZX4jmHyqbbxNI6ls1s5H
 ZaU1qreO+Nl6GMUU6VVtbWiSUziMuWy12toTLwboz5+ffxJl56gVwKdLk6BtdYACWt24ybdBIZg
 t6JWpg0pDqF5o0F/Tim316tCqg7kTmVqrBmWWOCRNhJmYdYPDG0XJdiHhkBdJBM9cHzG3Xpsk54
 77rQS7ytjlvD1yw
X-Received: by 2002:a05:600c:8b61:b0:49e:69ff:c6b1 with SMTP id
 5b1f17b1804b1-49fc5749edemr1329485e9.31.1789677778490; 
 Thu, 17 Sep 2026 13:42:58 -0700 (PDT)
Received: from [192.168.1.138] ([139.47.34.204])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd2563ccsm126681465e9.13.2026.09.17.13.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 13:42:58 -0700 (PDT)
From: Jean-Paul Etienne <fractalclone@gmail.com>
Date: Thu, 17 Sep 2026 22:42:45 +0200
MIME-Version: 1.0
Message-Id: <20260917-rock-pi-4b-v1-2-a1da4ee05567@gmail.com>
References: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
In-Reply-To: <20260917-rock-pi-4b-v1-0-a1da4ee05567@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jean-Paul Etienne <fractalclone@gmail.com>
X-Mailer: b4 0.16.0
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
