Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6AFC83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A1683547;
	Tue, 15 Jul 2025 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4JkNS8v64NN; Tue, 15 Jul 2025 08:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40969820B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40969820B1;
	Tue, 15 Jul 2025 08:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D164BDCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC5A4820D6
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iIXoAQbLQRM for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 08:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 111F4820B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111F4820B1
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 111F4820B1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso823611166b.1
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 01:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752567599; x=1753172399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zKqrRXOLEHQ/UbeSrGIV87km7EZ7jr1ZSsPrCc6T80=;
 b=YQQMKT8VlnoNfOZ4TEfrZ7GMYA6hslrDJDbdMpa7FkHCfRYR1zHQr9dp4yG/GZWukh
 1gKPYrnLwpOOVJe/KMoD5UTLFv7Izwcnf7X/m9ca2LJznhcG/Vfio0PEjLAR/h6aEWSh
 OU9q5NfwDw14zyXwMsQA0N+lD8ALpvLyGlRoS0zwiokuqwXH4uDVf1FBcBVzFygeTKVo
 NbCqyoz4MKdz1hV/zehMMOdYeG/hjGskCVrzs2vBME9fHJEqGU0v3LhbdTB1XsvZCAoZ
 eHh20isX5tXjjcJUibW6ivyR5qS8ILXRAgNM60dLKgmk9V6MY+t3W8+gmyAGkoYVJc8U
 ZPNw==
X-Gm-Message-State: AOJu0Yz6nQT0vjKl0o8Ixnot9OOJnAC2AAOX1IZN4K7ATzgKoceDYdhA
 FtbsOSFKNjpeLf1v3puf2evBkfFjzETiKOPnrSSZE6AQir2fjlOoJjy092VCEA==
X-Gm-Gg: ASbGnctEIghkLOH1H4R7MHDxyiO2RsjRFEvUF+eK32Hhhj/sPdgaijvNNE5d/DZlWB/
 nX49gheTxlhJjRa64K3Qtmjy2Kkmyfxga1232ZSShNkafDCgzuSynNpjIvji0g7BToyE+pzCbdS
 sHjJgkeig6EYSs1CfsdcIw6z6+Zmjk31Onxc6ZaMJGOsNinDCIJBb3FILFMOyVHZmhN+LiAQJUG
 Ix/NftidshrptMN70HewifLNh/E3Z2mZokfJ1ihNHtvgtN9PsVGo+DeHRZZE4aeNWCP4scPfFsQ
 s/SD2tUYHcrHWXc9N0dn+Ssj15F/6RdwsREJ0axSoscznGW7Cd7QD+MFK/NSmCuEDdsaWlxyy2X
 yKrydGqLhDOmt8HaLubrTz/z+SMJGwot+crriKUA=
X-Google-Smtp-Source: AGHT+IEuzWxIZOfFKoUqAKl8F1jzvjXGMx6vPpuH9OhzJix83YL0Y8o/aQ/SgdFqmSIP23SnXmvCsw==
X-Received: by 2002:a17:907:60d3:b0:ad8:9d41:371e with SMTP id
 a640c23a62f3a-ae9b962e172mr181047366b.36.1752567598910; 
 Tue, 15 Jul 2025 01:19:58 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82df4cfsm944173866b.162.2025.07.15.01.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:19:58 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 10:19:38 +0200
Message-Id: <20250715081938.108853-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752567599; x=1753172399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/zKqrRXOLEHQ/UbeSrGIV87km7EZ7jr1ZSsPrCc6T80=;
 b=LgcCLHigQHIS0AUrOqdvN9F2Im3kSkG1oh7+iQLAOvmi0S20QD7aBm5GckpoMdYrEl
 m49x6e2bbMdc0MHkhU+96kJ11uNQNAExfT/PlAyI+1izXZq4ciricAh2zBhFiEXl90pn
 4c1T49rdWnjkxH0xPUNR9erY2o2PJd/w8Hn5rBjv2XEX5VhYZR4unSPUWHSq5YYqWfdc
 bSSP8rBmOWiE6gIqhMVL6cpd2GvqxKcC/LHslk/asf9dLlSSfxC3g6eHKtz5aiT7opMJ
 msRUj3O9Rqq1ppGa0j28jVyUMpNVf6H/Oq5kcfUivwsldK8rAZ5BQ6SwpLKGkeDZ9P8I
 2bQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LgcCLHig
Subject: [Buildroot] [PATCH v2] package/linux-firmware: add option for
 Chips&Media Wave 521C
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

Add an option to install the firmware files for Chips&Media Wave 521C
video processor used in the TI K3 architecture.

This "cnm/wave521c_k3_codec_fw.bin" file has been present in linux-firmware
since version 20221109.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
    - fixed value for LINUX_FIRMWARE_ALL_LICENSE_FILES,
      use LICENCE.cnm instead of LICENSE.cnm (Julien)
    - add entry to the hash file for LICENCE.cnm (Julien)

 package/linux-firmware/Config.in           | 6 ++++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 54910df6fd..778dfef8a0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -33,6 +33,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
 	help
 	  Firmware files for AMD GPU video cards.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC
+	bool "Chips&Media Wave 521C codec IP for K3"
+	help
+	  Firmware files for the Chips&Media Wave521C decoder
+	  needed by the Linux TI j721s2-wave521c driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	bool "Intel i915 video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 36cb97c9fe..e980010cd8 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -14,6 +14,7 @@ sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENC
 sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
+sha256  88236d5ae45b7abc96c2ab4c6952af88758e24b17412dd173746ee1c559b3c6f  LICENCE.cnm
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b9fd471e85..40758054e5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -25,6 +25,11 @@ LINUX_FIRMWARE_DIRS += amdgpu
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CNM_WAVE521C_K3_CODEC),y)
+LINUX_FIRMWARE_FILES += cnm/wave521c_k3_codec_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cnm
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
