Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7FACE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B63184861;
	Fri,  6 Sep 2024 20:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyQgM1QolqhZ; Fri,  6 Sep 2024 20:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE98984879
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE98984879;
	Fri,  6 Sep 2024 20:03:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A26D1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2134040B8B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uolhlicg48kS for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393E1409AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 393E1409AE
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F7D86587; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:51:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ed8b8769534761b04445718acd3d3ec36c1bfdf
X-Git-Newrev: f0d9f976e5a9bce04d737f981c902615eb2083d3
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.36F7D86587@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pine64: bump U-Boot version to
 2024.07
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f0d9f976e5a9bce04d737f981c902615eb2083d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update U-Boot to fix the following error when building with
python-setuptools >= 69, that is, since 6b62384e3d
("package/python-setuptools: bump to version 69.0.3"):

  packaging.version.InvalidVersion: Invalid version: 'u-boot-2019.01'
  make[5]: *** [scripts/dtc/pylibfdt/Makefile:27: scripts/dtc/pylibfdt/_libfdt.so] Error 1
  make[4]: *** [scripts/Makefile.build:434: scripts/dtc/pylibfdt] Error 2
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [scripts/Makefile.build:434: scripts/dtc] Error 2
  make[2]: *** [Makefile:508: scripts] Error 2
  make[1]: *** [package/pkg-generic.mk:289: output/build/uboot-2019.01/.stamp_built] Error 2
  make: *** [Makefile:83: _all] Error 2

Use SPL and U-Boot FIT image combined into u-boot-sunxi-with-spl.bin.

Do not use the optional System Control Processor (SCP) firmware pointing
the SCP env variable to /dev/null.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pine64/pine64/genimage.cfg | 12 +++---------
 configs/pine64_defconfig         |  8 ++++----
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 06b4ed1056..3555869036 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -14,17 +14,11 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index c454114d2a..a6ddf6e57b 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
