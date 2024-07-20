Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000EC3DA70
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A74F581DFC;
	Sat, 20 Jul 2024 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPQdhozSkG5Y; Sat, 20 Jul 2024 20:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A2F81E11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A2F81E11;
	Sat, 20 Jul 2024 20:17:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7FEB1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A640340151
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBtuuT0F5s-f for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D0E7400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0E7400D8
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D0E7400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:17:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eede876fccso37159841fa.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506632; x=1722111432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+++yGYdfCFaU9euIgJI1seQBlWbAXrGpQrHdS5BSeI=;
 b=K4ohS/GvjvFEN5giJ9FyI3ZbUtM/GvmMlAY4OGjhA6kfPr5/UWOvfmqxWzXrkgU5UB
 CY9ipoKX3P34Im/K66eIX+gyQ0vQ/jAdGHjG7/SD19Iblt1rRwHI1sWZ7h8hnaKv0cx6
 SDxCw8A1CxKJG9ASB61rIiISJOcZ+fiGg9Q4OmECKRG+H0Yf/mSAgFo2IkHhEhzUjm+z
 oEUpQtB9aeXct37ecuMJRDxiMCNArMZMJB2ovQFqhDl4AEqp3ksbPq0zrNu1jGFkQ4v1
 rQLMWlc16NUA9Y1sgtShd01L2bfSjC86jobtVhb5xFoO2DonruDcw/jbSjVVOyPFgWOB
 F7pg==
X-Gm-Message-State: AOJu0YwOhJ8nTcu4tlnUsbnKs2WVLzXsEtnjsKf6xpLFXYazLo8c6z5f
 IDqFlSGYfRdSQMf/VGgbFDOQ3p/Fcx2ZTkVcgI1feqBkfcUZ7C6ET89Zw/72FIErIhcXt6IMYhe
 7S8I=
X-Google-Smtp-Source: AGHT+IFf8acrnDKGDww77l7WS0BV/DV2nvDpIBWRHRl2lpFtmmRXba2NJJE2RzuilNZG8kzeHRddtA==
X-Received: by 2002:a05:6512:696:b0:52e:9b4f:dd8c with SMTP id
 2adb3069b0e04-52ef8da18a4mr1872708e87.35.1721506631973; 
 Sat, 20 Jul 2024 13:17:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-80-180-25-123.retail.telecomitalia.it. [80.180.25.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e7871sm204723766b.96.2024.07.20.13.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:17:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:16:57 +0200
Message-ID: <20240720201659.2253736-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721506632; x=1722111432;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+++yGYdfCFaU9euIgJI1seQBlWbAXrGpQrHdS5BSeI=;
 b=Az4G7z6EaiChq0pDCI1/IVymqCKJUzD0/ulOvYnzNMviqDsbaLFJ2lriXq1oU4T1bz
 zOKqeLOtOyZmh3itMLT3DF7pa00XjZXBKFpFFSgSvYdrtF7DrwClsHYxaxliutnqM9QK
 hEWU30EEeKrtOFd5yHUA6bM3/7KSuY2ACkEak=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Az4G7z6E
Subject: [Buildroot] [PATCH 3/5] configs/beaglebone_qt5: move patches to qt5
 subfolder
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compared to the beaglebone_defconfig, updating the Linux kernel is more
tricky because it may also involve updating the ti-sgx-{km,um} packages.
Therefore, it is unlikely that the two configurations can share the same
software versions for the Linux kernel, and consequently a single path
for the patches. For this reason, and with the foresight of adding the
hash files for the beaglebone_defconfig as well, the hash files and patches
are moved to the qt5 subdirectory. This way, future conflicts in managing
the patches for the two configurations (i.e., beaglebone[_qt5]_defconfig)
are avoided.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 2 +-
 .../{ => qt5}/patches/linux-headers/linux-headers.hash          | 0
 .../patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch | 0
 ...2-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch | 0
 ...03-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch | 0
 .../linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch     | 0
 board/beagleboard/beaglebone/{ => qt5}/patches/linux/linux.hash | 0
 board/beagleboard/beaglebone/{ => qt5}/patches/uboot/uboot.hash | 0
 configs/beaglebone_qt5_defconfig                                | 2 +-
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux-headers/linux-headers.hash (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/linux/linux.hash (100%)
 rename board/beagleboard/beaglebone/{ => qt5}/patches/uboot/uboot.hash (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2e6e8a9cac49..2f40d1e77c6b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,7 +8,7 @@ board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
 board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
-board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
+board/beagleboard/beaglebone/qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
diff --git a/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglebone/qt5/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beaglebone/qt5/patches/linux-headers/linux-headers.hash
diff --git a/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beagleboard/beaglebone/qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
rename to board/beagleboard/beaglebone/qt5/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/beagleboard/beaglebone/qt5/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/beagleboard/beaglebone/qt5/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch b/board/beagleboard/beaglebone/qt5/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
rename to board/beagleboard/beaglebone/qt5/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch b/board/beagleboard/beaglebone/qt5/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
rename to board/beagleboard/beaglebone/qt5/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/qt5/patches/linux/linux.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/linux/linux.hash
rename to board/beagleboard/beaglebone/qt5/patches/linux/linux.hash
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/qt5/patches/uboot/uboot.hash
similarity index 100%
rename from board/beagleboard/beaglebone/patches/uboot/uboot.hash
rename to board/beagleboard/beaglebone/qt5/patches/uboot/uboot.hash
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index e58255a1086c..cfca7645d4c3 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/qt5/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
