Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C593C77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C9960FDF;
	Sun,  9 Apr 2023 21:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34C9960FDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7C90n6Kgv-hH; Sun,  9 Apr 2023 21:00:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0843960FBD;
	Sun,  9 Apr 2023 21:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0843960FBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE7271BF291
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3E76410C4
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3E76410C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwtrMc39rOQl for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D3E1410C1
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3E1410C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB56583C05; Sun,  9 Apr 2023 20:59:18 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 21:51:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d775b2ac05d473db490d2dc6babd2743b28cfbf5
X-Git-Newrev: 29d6f319a0aed8ebad6bb3aef18b13479886aa54
X-Patchwork-Hint: ignore
Message-Id: <20230409205918.EB56583C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: check files in board/
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29d6f319a0aed8ebad6bb3aef18b13479886aa54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a SysV init script is inside package/ it doesn't need to be
executable. However, when an init script is inside a fs_overlay, it
*does* need to be executable. Therefore, skip the NotExecutable test for
init scripts. We detect them based on the directory /etc/init.d

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: update .checkpackageignore]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore               | 91 +++++++++++++++++++++++++++++++++++++++
 utils/check-package               |  1 +
 utils/checkpackagelib/lib_sysv.py |  3 ++
 utils/checkpackagelib/tool.py     |  5 +++
 4 files changed, 100 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4faa3a8b8f..ae4356f500 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1,3 +1,94 @@
+board/aarch64-efi/post-image.sh Shellcheck
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
+board/broadcom/northstar/post-image.sh Shellcheck
+board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh EmptyLastLine Shellcheck
+board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh Shellcheck
+board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh Shellcheck
+board/bsh/imx8mn-bsh-smm-s2/flash.sh EmptyLastLine Shellcheck
+board/bsh/imx8mn-bsh-smm-s2/post-build.sh Shellcheck
+board/canaan/k210-soc/post-build.sh Shellcheck
+board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
+board/chromebook/elm/sign.sh Shellcheck
+board/chromebook/mksd.sh Shellcheck
+board/chromebook/snow/linux-4.15-dts-tpm.patch ApplyOrder
+board/chromebook/snow/sign.sh Shellcheck
+board/cubietech/cubieboard2/post-image.sh Shellcheck
+board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
+board/freescale/common/imx/post-image.sh Shellcheck
+board/freescale/common/mxs/post-image.sh Shellcheck
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
+board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-support.patch NumberedSubject
+board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch NumberedSubject
+board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch NumberedSubject
+board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch NumberedSubject
+board/olimex/a13_olinuxino/post-build.sh Shellcheck
+board/olimex/a20_olinuxino/post-build.sh Shellcheck
+board/olimex/a33_olinuxino/post-build.sh Shellcheck
+board/olpc/post-build.sh Shellcheck
+board/orangepi/common/post-build.sh Shellcheck
+board/orangepi/orangepi-lite2/post-build.sh Shellcheck
+board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
+board/pine64/rock64/post-build.sh Shellcheck
+board/pine64/rockpro64/post-build.sh Shellcheck
+board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
+board/qemu/post-image.sh Shellcheck
+board/qemu/x86/post-build.sh Shellcheck
+board/qemu/x86_64/post-build.sh Shellcheck
+board/radxa/rockpi-n8/post-build.sh Shellcheck
+board/raspberrypi/post-build.sh Shellcheck
+board/raspberrypi/post-image.sh Shellcheck
+board/roseapplepi/post-build.sh Shellcheck
+board/sifive/hifive-unleashed/post-build.sh Shellcheck
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
+board/terasic/de10nano_cyclone5/barebox-env/boot/mmc Shellcheck
+board/toradex/apalis-imx6/post-image.sh Shellcheck
+board/udoo/common/post-build.sh Shellcheck
+board/versal/post-build.sh Shellcheck
+board/versal/post-image.sh Shellcheck TrailingSpace
+board/zynq/post-build.sh Shellcheck
+board/zynq/post-image.sh Shellcheck
+board/zynqmp/kria/kv260/kv260.sh Shellcheck TrailingSpace
+board/zynqmp/kria/patches/uboot/v1-0001-makefile-add-multi_dtb_fit-dep.patch ApplyOrder
+board/zynqmp/post-build.sh Shellcheck
+board/zynqmp/post-image.sh Shellcheck
 package/alsamixergui/0001-misc-fixes.patch Sob
 package/am33x-cm3/S93-am335x-pm-firmware-load Variables
 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch Sob
diff --git a/utils/check-package b/utils/check-package
index 98a25bd0b2..e3b7d8515f 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -107,6 +107,7 @@ CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
