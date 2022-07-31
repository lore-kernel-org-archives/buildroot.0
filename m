Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF7C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C99A540FCB;
	Sun, 31 Jul 2022 19:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C99A540FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGrl1uHITfFl; Sun, 31 Jul 2022 19:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92CC6400CE;
	Sun, 31 Jul 2022 19:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92CC6400CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74EC31BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50852400CE
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50852400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WGF20Fo5Y4vy for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB3B400B9
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BB3B400B9
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:12 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 125so9292958vsx.7
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CyOMpob65O4dClSTTTNKcb9KSmVoe+E++aNZv47BmBo=;
 b=WDrLjs+MnrGchzIMA0g1Xs5Jl3a+SGg4Cza0XR2BVBoTLaKpz1Pkdy3g/utfYvSShR
 T2cs75BYyAjW6VXjmORzF5717FvxDGgVMuX67oUg74SQeA5USUsIgfviH3rvtIb7cw7y
 2qjnc3UBRwf8SZeJQXeFsAxfwdAGez1l8P60yt9xs7krEQvp5dA5h+Sg4+8ZmmpIFtU1
 pH43cDNAGZANTUdi3+J5ZJSxVP4FoEPuOureTiY6k8rAEdWKzFcI/VTY3yRZNyp0D8tZ
 Q0yYHDB5+6HDDgbA981HHwX4QJIX9b5/sofnbRSCxLrqtUo1B8Gn0poBpOeQ+N5thr9V
 hVwg==
X-Gm-Message-State: ACgBeo1faiIxhLZlCChQTg7SV+XDDQnjInWPF6XPFrv4inEO5j/PLreX
 Ro4i7VxK0oBF0ouctKtdFG/cnlbsWso=
X-Google-Smtp-Source: AA6agR5E+CY2hiHoEJTj7BmgMdc9hsChZRO5X8xCyjw6eP4307KlBe8J+McSgTqTo/afhQNHWzrVnQ==
X-Received: by 2002:a67:dd12:0:b0:384:ce1e:1e84 with SMTP id
 y18-20020a67dd12000000b00384ce1e1e84mr596163vsj.39.1659296171392; 
 Sun, 31 Jul 2022 12:36:11 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:10 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:16 -0300
Message-Id: <20220731193521.1217825-10-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CyOMpob65O4dClSTTTNKcb9KSmVoe+E++aNZv47BmBo=;
 b=houEoYCPK2MXGQjnuVnmqknEJdzByKrXiKvJoe6RsoqiiSInLg3cTNgBfm9fOWLI5V
 43sGD4Y2iHzZoXQ0OUvIy1xALeoLyOlPuwIycunybPMasO2Oxy/O+2zXWSnW7aknTidD
 1N/ot5BW4RkyLFVJZoktruPqSU38wFnIaOg4Ztz6P3SrpDcTBFRd6DoTMmxjeyxAAPlI
 DF+wnuSLh+5MVuz3gSgQd9IhXfIZ8bQi24cFwTg5REY9D8oxYytORbDYFFg95uPmumg7
 vXpdsbyN/62zU5uBPqxNU3gOl4FOYwOhuUC8ra5oy/5qkeZcNqM+SVksblIqRn2VXKY1
 alcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=houEoYCP
Subject: [Buildroot] [PATCH v2 09/14] utils/check-package: check files in
 board/
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
Changes v1 -> v2:
  - none

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ utils/docker-run make .checkpackageignore
---
 .checkpackageignore               | 91 +++++++++++++++++++++++++++++++
 utils/check-package               |  1 +
 utils/checkpackagelib/lib_sysv.py |  3 +
 utils/checkpackagelib/tool.py     |  5 ++
 4 files changed, 100 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 615fe22e52..d528b0122e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,3 +1,94 @@
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
+board/kontron/bl-imx8mm/post-build.sh Shellcheck
+board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch NumberedSubject
+board/kontron/pitx-imx8m/post-build.sh Shellcheck
+board/kontron/smarc-sal28/post-build.sh Shellcheck
+board/lego/ev3/post-image.sh Shellcheck
+board/lemaker/bananapro/post-build.sh Shellcheck
+board/lemaker/bananapro/post-image.sh Shellcheck
+board/mender/x86_64/post-image-efi.sh ConsecutiveEmptyLines
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
 package/alsamixergui/0001-misc-fixes.patch Sob
 package/am33x-cm3/S93-am335x-pm-firmware-load Variables
 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch Sob
diff --git a/utils/check-package b/utils/check-package
index 094b7b9c07..004352261b 100755
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
