Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223BFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A36D24109F;
	Sun, 24 Jul 2022 05:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36D24109F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrYYn8EKfHWP; Sun, 24 Jul 2022 05:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC711409B3;
	Sun, 24 Jul 2022 05:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC711409B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0F2F1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A975684063
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A975684063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jm5IWXcEEfDO for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A53083A47
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A53083A47
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:54 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bb16so9900970oib.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ninmtw3nbf6GhNVkEvaHhBLUMw2uOANgjQJ90LK106w=;
 b=qcM1Xg5YtuFlNE7JPtIXmRYVwpUlm6RNOpv9Ip+6TXUd/zgQCjoPhl6NYtZUhLsMdv
 OW+DBubTN36HSEyGk1kNi6BlzRGo74Tvwavoht/LbNOlkVNP8at7D99oAH6jmU4KXbeC
 tWenQsHOL5MFIPhPC80HFJALZL/hrt8ikHHudRv+cfpwGoA+BYCJrc/4D6C19mgT8ttj
 jyGWLcJlT7v+mAT+uD03L+OlndPtjRIK3H88ep8UwmFeNYC6yiYZO2LCSWCEbUtYuKhD
 BEA3QgyUGKlAZZC0RiTo5qyos63CKmqY1bwC2wV31BFA8lO96cNhvVu0XFmoVfzK602T
 FzAA==
X-Gm-Message-State: AJIora8jYHSxh2/2e5pwFCRNSeNWw7sI5g90szFCl9AjkGnrc0+2Kgqc
 KMkt76tgEl8DewD1cpxrXfa+GOxp4uA=
X-Google-Smtp-Source: AGRyM1ua/wTFuIG3j7t2t42Ey+dQhZjO/OhM8BotPzR9cUw6EwD85sj2+l5RraCrAYtqYcwfl1Uq0w==
X-Received: by 2002:a05:6808:1201:b0:337:e9c2:84b7 with SMTP id
 a1-20020a056808120100b00337e9c284b7mr2969636oil.247.1658641853642; 
 Sat, 23 Jul 2022 22:50:53 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:52 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:08 -0300
Message-Id: <20220724054912.2354219-13-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ninmtw3nbf6GhNVkEvaHhBLUMw2uOANgjQJ90LK106w=;
 b=Cmdo97uJo2bjabV1eCXWOLL2emv2tj059o+pAe1onTjxsh06MViUhoKQPHhWEtlIxA
 U9IlYk71PlcOFMN38R3uVrrw+CndWtPwlSnOi8/amfxUMFMmpp/KKiVONXuQt8+Y9v7J
 fbBAPsZdAIBzqsqXduU4xAveNOw+IMhgA1srsALj4Eb/3lrllrfIDKSIrRb14flfQMzV
 QyrRGps/Qc3tdgZYDshzpIApRZYKlR/TvlthSxNWhEaxD9ZLzanX3rY1PTWelueLIbaL
 iCSh4YTdep/cqLvKmGjk2V0ZuWEKXV+VAuQpFkqiTEja42OYWF2B6M7dCwX1Vrfcegk8
 g78g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cmdo97uJ
Subject: [Buildroot] [PATCH 12/16] utils/check-package: check files in board/
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When a SysV init script is inside package/ it does not need to be
executable.
But this check does not apply in the case the script is in a fs_overlay.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore
---
 .checkpackageignore               | 92 +++++++++++++++++++++++++++++++
 utils/check-package               |  1 +
 utils/checkpackagelib/lib_sysv.py |  3 +
 utils/checkpackagelib/tool.py     |  5 ++
 4 files changed, 101 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 765e5c1cba..58c05416c4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,3 +1,95 @@
+board/aarch64-efi/post-image.sh Shellcheck
+board/amarula/a64-relic/post-build.sh Shellcheck
+board/amarula/vyasa/post-build.sh Shellcheck
+board/andes/ae350/post-build.sh Shellcheck
+board/arcturus/aarch64-ucls1012a/post-build.sh Shellcheck
+board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
+board/aspeed/common/post-image.sh Shellcheck
+board/asus/tinker/post-build.sh Shellcheck
+board/atmel/flasher.sh Shellcheck
+board/beaglebone/post-build.sh Shellcheck
+board/beagleboneai/post-build.sh Shellcheck
+board/beaglev/post-build.sh Shellcheck
+board/beelink/gs1/post-build.sh Shellcheck
+board/boundarydevices/common/post-build.sh Shellcheck
+board/boundarydevices/common/post-image.sh Shellcheck
+board/canaan/k210-soc/post-build.sh Shellcheck
+board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
+board/chromebook/elm/sign.sh Shellcheck
+board/chromebook/mksd.sh Shellcheck
+board/chromebook/snow/linux-4.15-dts-tpm.patch ApplyOrder
+board/chromebook/snow/sign.sh Shellcheck
+board/cubietech/cubieboard2/post-image.sh Shellcheck
+board/firefly/roc-rk3399-pc/post-build.sh Shellcheck
+board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
+board/freescale/common/imx/post-image.sh Shellcheck
+board/freescale/common/mxs/post-image.sh Shellcheck
+board/friendlyarm/nanopc-t4/post-build.sh Shellcheck
+board/friendlyarm/nanopi-m4/post-build.sh Shellcheck
+board/friendlyarm/nanopi-neo-plus2/post-build.sh Shellcheck
+board/friendlyarm/nanopi-neo4/post-build.sh Shellcheck
+board/friendlyarm/nanopi-r2s/post-build.sh Shellcheck
+board/hardkernel/odroidc2/post-image.sh Shellcheck
+board/hardkernel/odroidc2/rootfs_overlay/etc/init.d/S09modload Shellcheck Variables
+board/hardkernel/odroidxu4/post-image.sh EmptyLastLine Shellcheck
+board/intel/galileo/post-build.sh Shellcheck
+board/intel/galileo/rootfs_overlay/etc/init.d/S09modload Shellcheck Variables
+board/kontron/bl-imx8mm/patches/uboot/0001-imx-imx8mm-imx8mm-kontron-n801x-s-convert-options-to.patch NumberedSubject
+board/kontron/bl-imx8mm/patches/uboot/0002-imx-imx8mm-imx8mm-kontron-n801x-s-add-common-board-u.patch NumberedSubject
+board/kontron/bl-imx8mm/post-build.sh Shellcheck
+board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch NumberedSubject
+board/kontron/pitx-imx8m/post-build.sh Shellcheck
+board/kontron/smarc-sal28/post-build.sh Shellcheck
+board/lego/ev3/post-image.sh Shellcheck
+board/lemaker/bananapro/post-build.sh Shellcheck
+board/lemaker/bananapro/post-image.sh Shellcheck
+board/minnowboard/post-build.sh Shellcheck
+board/nexbox/a95x/post-build.sh Shellcheck
+board/nexbox/a95x/post-image.sh Shellcheck
+board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch NumberedSubject
+board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch NumberedSubject
+board/olimex/a13_olinuxino/post-build.sh Shellcheck
+board/olimex/a20_olinuxino/post-build.sh Shellcheck
+board/olimex/a33_olinuxino/post-build.sh Shellcheck
+board/olpc/post-build.sh Shellcheck
+board/orangepi/common/post-build.sh Shellcheck
+board/orangepi/orangepi-lite2/post-build.sh Shellcheck
+board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
+board/orangepi/orangepi-rk3399/post-build.sh Shellcheck
+board/pine64/rock64/post-build.sh Shellcheck
+board/pine64/rockpro64/post-build.sh Shellcheck
+board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
+board/qemu/post-image.sh Shellcheck
+board/qemu/x86/post-build.sh Shellcheck
+board/qemu/x86_64/post-build.sh Shellcheck
+board/radxa/rockpi-4/post-build.sh Shellcheck
+board/radxa/rockpi-n10/post-build.sh Shellcheck
+board/radxa/rockpi-n8/post-build.sh Shellcheck
+board/raspberrypi/post-build.sh Shellcheck
+board/raspberrypi/post-image.sh Shellcheck
+board/roseapplepi/post-build.sh Shellcheck
+board/sifive/hifive-unleashed/post-build.sh Shellcheck
+board/sinovoip/m1-plus/post-build.sh Shellcheck
+board/solidrun/clearfog/post-build.sh Shellcheck
+board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
+board/solidrun/macchiatobin/post-build.sh Shellcheck
+board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh Shellcheck
+board/stmicroelectronics/common/stm32mp157/post-image.sh Shellcheck
+board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
+board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
+board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
+board/stmicroelectronics/stm32f469-disco/post-build.sh Shellcheck
+board/synopsys/axs10x/post-build.sh Shellcheck
+board/technologic/ts4900/post-image.sh Shellcheck
+board/toradex/apalis-imx6/post-image.sh Shellcheck
+board/udoo/common/post-build.sh Shellcheck
+board/zynq/post-build.sh Shellcheck
+board/zynq/post-image.sh Shellcheck
+board/zynqmp/kria/kv260/kv260.sh Shellcheck TrailingSpace
+board/zynqmp/kria/patches/uboot/0001-arm64-zynqmp-zynqmp-sm-k26-revA-Fix-DP-PLL-configura.patch NumberedSubject
+board/zynqmp/post-build.sh Shellcheck
+board/zynqmp/post-image.sh Shellcheck
+board/zynqmp/zcu106/patches/uboot/0001-arm64-zynqmp-zynqmp-zcu102-revA-Fix-DP-PLL-configura.patch NumberedSubject
 boot/binaries-marvell/binaries-marvell.hash HashSpaces
 boot/s500-bootloader/s500-bootloader.hash HashSpaces
 boot/shim/shim.hash HashSpaces
diff --git a/utils/check-package b/utils/check-package
index 880fcfa21e..874f58e0d2 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -101,6 +101,7 @@ CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
     r"Config.in",
     r"arch/",
+    r"board/",
     r"boot/",
     r"fs/",
     r"linux/",
diff --git a/utils/checkpackagelib/lib_sysv.py b/utils/checkpackagelib/lib_sysv.py
index 386d085afc..dc4afd71b8 100644
--- a/utils/checkpackagelib/lib_sysv.py
+++ b/utils/checkpackagelib/lib_sysv.py
@@ -21,6 +21,9 @@ class Indent(_CheckFunction):
 
 
 class NotExecutable(checkpackagelib.tool.NotExecutable):
+    def ignore(self):
+        return 'etc/init.d/' in self.filename
+
     def hint(self):
         return ", just make sure you use '$(INSTALL) -D -m 0755' in the .mk file"
 
diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
index e719fdd407..632aaa9f9e 100644
--- a/utils/checkpackagelib/tool.py
+++ b/utils/checkpackagelib/tool.py
@@ -4,7 +4,12 @@ from checkpackagelib.base import _Tool
 
 
 class NotExecutable(_Tool):
+    def ignore(self):
+        return False
+
     def run(self):
+        if self.ignore():
+            return
         if os.access(self.filename, os.X_OK):
             return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
