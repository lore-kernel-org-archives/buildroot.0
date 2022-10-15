Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9E5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F69860BB2;
	Sat, 15 Oct 2022 15:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F69860BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBQDA9jT3hRS; Sat, 15 Oct 2022 15:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 982C460BF6;
	Sat, 15 Oct 2022 15:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 982C460BF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 651381BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 411774061F
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411774061F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onrZWfhF8tMx for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747E14012B
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 747E14012B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63F5986DE8; Sat, 15 Oct 2022 15:43:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:42:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29586aed965844ffb35b4d859e02f6973a67f33c
X-Git-Newrev: 959e9f7fdef4d8b602740312649016245209ce73
X-Patchwork-Hint: ignore
Message-Id: <20221015154300.63F5986DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_*_sdcard: Add dependency on
 host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=959e9f7fdef4d8b602740312649016245209ce73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gitlab CI reported build failures for the sipeed RISC-V nommu boards
with the u-boot/sdcard enabled default configuration. The compilation
errors are related to the openssl/evp.h header file missing, e.g.:

In file included from tools/imagetool.h:24,
                 from tools/fit_common.c:20:
include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
directory
 1166 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
files so that host-openssl gets built as a dependency of U-Boot.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229992
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229994
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229996
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229998

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 +
 configs/sipeed_maix_dock_sdcard_defconfig | 1 +
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 8a19996090..34769eeca8 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index d3d0f405e1..62f6a0e0b8 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 75300997b8..6c61e3aaaf 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index add9369747..da8cbe45f9 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -50,6 +50,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
