Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54533C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB99B81399;
	Sun,  5 Feb 2023 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB99B81399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buwmUVMw7p-r; Sun,  5 Feb 2023 21:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 143308191E;
	Sun,  5 Feb 2023 21:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 143308191E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAF971BF407
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4F4960692
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F4960692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbkjRAAlcLhO for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 21:41:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A68F605A0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A68F605A0
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 21:41:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so7479680wms.1
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 13:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0UYw75y0pUaPXSB0VnvrGZ2/YKLIYC7AWSJbzQiaf0=;
 b=NI/btOtbeh/jBvrYwLK093NolYiDPkI3EJns5cxsPmeSyOaMcPRPilrIp5ahJSOKwS
 8ZQ8yCW9Zw3TRpSiAFBv/2TmQQ9srtvTGsJ3qQ12svohs1s46+luFXhqbwUCiH6lXiZy
 a49zQbU87r89HUFa3Ox1aanL076a3vMf8fb9mOFXk49QUuqOyrnTMveHspEhFA9KOfcx
 fBQyJNyvHA//wvhlLXNTdHgHCUzstjeWJQBG/XKHm4IVJrjEM6QVEE6q8jaRNMBBXMkd
 f2qKiWh5ybz+xUGbvejOsTY37ku2J8f/R598UKyTm2y36NNoFEtuJfZDlVnLscaPJldZ
 fiEQ==
X-Gm-Message-State: AO0yUKUWQgWutrbKUWytqf+I+H+UcApote/6nZxcT9/tCtJ0VTDUII7A
 /7G6fm52n05xkfQbfy0HDqKaki2v7FV2szL4Yc896Q==
X-Google-Smtp-Source: AK7set9+/S1DAHbe+esjSW2Un6uVGK7vkXPisDdqmARizhtSp6QtmP8TSjKUGh3NSEa0A2kGuKXJ3A==
X-Received: by 2002:a05:600c:43d4:b0:3df:f2a5:49fb with SMTP id
 f20-20020a05600c43d400b003dff2a549fbmr5837097wmn.7.1675633308335; 
 Sun, 05 Feb 2023 13:41:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:648d:7200:935:86ef:373f:18f])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm9994934wmo.3.2023.02.05.13.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 13:41:48 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 22:41:32 +0100
Message-Id: <20230205214132.6941-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
References: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0UYw75y0pUaPXSB0VnvrGZ2/YKLIYC7AWSJbzQiaf0=;
 b=lfjtwgPYwCw/rn5L5NaXSzabEbUdaQYIPIAXz/G2OOoxfgHZTdG5Cf9+87e6/hB52M
 ygdq/747gpGoSshyxKGZyb1f1B+FmwnrMVOh0ow2OrkRZ7rlffrDwdKMEuwCAZcn19M1
 eV3AmOwmzLcRhYQagfBCxuIHfd/Sg1Zr/TFCM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lfjtwgPY
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: bump U-Boot version to
 2022.10
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
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Starting from version 2021.10 only distro booting is supported, as
reported by commit ff8f277e9121 ("ti: am335x_evm: Switch to DISTRO_BOOT only").
The patch allows to update U-Boot to versions later than 2021.10.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beaglebone/extlinux.conf | 4 ++++
 board/beaglebone/genimage.cfg  | 1 +
 board/beaglebone/post-build.sh | 2 ++
 configs/beaglebone_defconfig   | 2 +-
 4 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 board/beaglebone/extlinux.conf

diff --git a/board/beaglebone/extlinux.conf b/board/beaglebone/extlinux.conf
new file mode 100644
index 000000000000..4a08c9dedad9
--- /dev/null
+++ b/board/beaglebone/extlinux.conf
@@ -0,0 +1,4 @@
+label beaglebone-buildroot
+  kernel /zImage
+  fdtdir /
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
\ No newline at end of file
diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index 987d20507551..4b026fda8431 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -12,6 +12,7 @@ image boot.vfat {
 			"am335x-bonegreen.dtb",
 			"am335x-boneblack-wireless.dtb",
 			"am335x-bonegreen-wireless.dtb",
+			"extlinux"
 		}
 	}
 
diff --git a/board/beaglebone/post-build.sh b/board/beaglebone/post-build.sh
index ffdd19138c7f..b7afd92ffeae 100755
--- a/board/beaglebone/post-build.sh
+++ b/board/beaglebone/post-build.sh
@@ -2,3 +2,5 @@
 BOARD_DIR="$(dirname $0)"
 
 cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index dff7dea422ee..0207916d0166 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -34,7 +34,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
