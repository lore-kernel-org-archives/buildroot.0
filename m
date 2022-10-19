Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796ADC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1611E40C58;
	Wed, 19 Oct 2022 08:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1611E40C58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1jVmWFNHJKM; Wed, 19 Oct 2022 08:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA59B40C52;
	Wed, 19 Oct 2022 08:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA59B40C52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BAF41BF9AD
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1772A81306
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1772A81306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G3HG7_3Trdx for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2713B812D8
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2713B812D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15C6986EE1; Wed, 19 Oct 2022 08:03:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 10:01:40 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b1a75fac5ee41c4cded27e71b2e05d197df871dc
X-Git-Newrev: b44e2cf19a1f8f19e228019f320921fd06834f01
X-Patchwork-Hint: ignore
Message-Id: <20221019080332.15C6986EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] configs/sipeed_*_sdcard:
 Add dependency on host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=b44e2cf19a1f8f19e228019f320921fd06834f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 959e9f7fdef4d8b602740312649016245209ce73)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sipeed_maix_bit_sdcard_defconfig  | 1 +
 configs/sipeed_maix_dock_sdcard_defconfig | 1 +
 configs/sipeed_maix_go_sdcard_defconfig   | 1 +
 configs/sipeed_maixduino_sdcard_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index e1c9dc417e..456b40dfe4 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 6b7f8d9c68..66e72bdc50 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index a127872cd8..a914f5f483 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/uboot.config"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sipeed_maix_bitm"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index baaa2bc7bb..b91588b336 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -47,6 +47,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
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
