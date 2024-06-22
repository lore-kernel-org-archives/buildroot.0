Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9A2C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 18:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8894E4015F;
	Sat, 22 Jun 2024 18:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXACRByDQT5l; Sat, 22 Jun 2024 18:04:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF164018B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EF164018B;
	Sat, 22 Jun 2024 18:04:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4541BF5D7
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 18:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87C7C4018B
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 18:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIHvR9uCk0dl for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 18:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 276194015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276194015F
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 276194015F
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 18:04:42 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6fdd947967so79969766b.2
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 11:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719079481; x=1719684281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfUAsDRzCiDYS7get2GPdbA00ZW4z/fTNxtjWoUcDis=;
 b=H2zUJLhnS+nMRgE2BXkRhN6gIn+ixGa0oUostbx7P65Uy526Km74tDUA7cTBLhgwm+
 v9f6LjSV5qwvj89bBokmo5+5AReoK/n/Ksy89r5yY0OXC9dgIIsyWAfYyegyOJJFmb9l
 rQTLzdiC6LvZybU1qgY4T9JU72kK3/2KmVxlaWPx48sDORYWFUz5pO1MAu2HYyJq9nmh
 69ioaXwr68MrerKJYS442ixNM5BIMUeDlW4T+LmeNHPI88+kQwJdfV94mpSDIBPnMjVB
 m17OosRXRsVCWlWOlGyFoy2PjhcqecDVao51ZSsbJ1JP3AGGbtQm1ItvZ2utgUDXR/Nd
 p03Q==
X-Gm-Message-State: AOJu0YwrdMEYi7ohxIZ88HHTw7sinBJxsr85k3ll+WJvpLRm1A0FUvhG
 omkiLe6j66DtzNPX7KYxiuaaoD5CgCN8uMFK+rzMHtocpmYnyDBe9kgrVpfosUFbKJ3ydYhmKVC
 a
X-Google-Smtp-Source: AGHT+IElMIJRX+oFEnvlz6FgQxLo46GdPN9/U6ghhj7vKE6wUxqtdP4UoirYQ65pcZpSRc9/OoWzKA==
X-Received: by 2002:a17:906:ad90:b0:a72:4320:19f3 with SMTP id
 a640c23a62f3a-a7245bf6283mr27317666b.39.1719079480853; 
 Sat, 22 Jun 2024 11:04:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-40-31.retail.telecomitalia.it. [87.2.40.31])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf42a65bsm219537866b.40.2024.06.22.11.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 11:04:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 20:04:32 +0200
Message-ID: <20240622180432.4094568-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719079481; x=1719684281;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TfUAsDRzCiDYS7get2GPdbA00ZW4z/fTNxtjWoUcDis=;
 b=DIPTO597Irat+CZUNrNDT3oQAbsi0RpqiArah7oQ0dpnKia8LBKWMCB+LTRU5B4grU
 PpZGH+7NPYyuLVXigI/dOdXcAvgbbifzIXg9QOBJUY5W4DWaBbI2wB/Eyk2Lr804iRtn
 q/4WT4Tmr/MQ8X+pxAzIO3CniI28T5ibX4QA8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DIPTO597
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp157a_dk1: add hashes
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
Cc: linux-amarula@amarulasolutions.com,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Arm trusted firmware, Linux, Linux headers
and U-Boot and then enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we
can now drop the defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 .../stm32mp157a-dk1/patches/linux-headers/linux-headers.hash    | 1 +
 .../stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash | 2 ++
 .../stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash | 2 ++
 configs/stm32mp157a_dk1_defconfig                               | 2 ++
 6 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 807cee1a08f8..a8693e6b1f08 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -332,7 +332,6 @@ configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
-configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..97c4500711fd
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  068325043b7c8ecc47ebb8b4f241f01e86d3f69dc49a63f340aa94bd41a9e6df  arm-trusted-firmware/arm-trusted-firmware-lts-v2.8.16.tar.gz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
new file mode 100644
index 000000000000..8b7624cceb9e
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..7cef5b688ec3
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index aed6cfad3438..38f7bc8946c1 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,6 +6,8 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
