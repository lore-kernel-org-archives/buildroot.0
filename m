Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B9BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E21B41926;
	Mon,  6 Nov 2023 22:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E21B41926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7j2eyYJqEs6j; Mon,  6 Nov 2023 22:11:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C661341929;
	Mon,  6 Nov 2023 22:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C661341929
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8E9A1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0279415CB
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0279415CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HR4MHd3COg0F for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60E27415BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60E27415BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A5A186B73; Mon,  6 Nov 2023 22:10:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:09:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdae1d231cae302bf903c128b77fd78db3dc0342
X-Git-Newrev: 5c40f41b2e715bb39693a188da5a540ae9fa7aef
X-Patchwork-Hint: ignore
Message-Id: <20231106221052.4A5A186B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp157a_dk1_defconfig: unbreak
 TF-A build with GCC >= 12
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
Content-Type: multipart/mixed; boundary="===============5418601551310361152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5418601551310361152==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5c40f41b2e715bb39693a188da5a540ae9fa7aef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the move to default to GCC 12 in commit e0091e42eef9 (package/gcc:
switch to gcc 12.x as the default), TF-A now fails to build as a warning is
generated and it builds with -Werror:

  CC      plat/st/stm32mp1/bl2_plat_setup.c
drivers/st/io/io_stm32image.c: In function ‘stm32image_partition_read’:
drivers/st/io/io_stm32image.c:249:13: error: ‘result’ may be used uninitialized [-Werror=maybe-uninitialized]
  249 |         int result;
      |             ^~~~~~
cc1: all warnings being treated as errors

This is fixed in TF-A v2.6 with commit c1d732d0db24 (fix(io_stm32image):
uninitialized variable warning), but I do not have the board to verify if
v2.6 works, so instead disable -Werror by passsing E=0.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/stm32mp157a_dk1_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index ecaace54b8..e764a1558d 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dk1.dtb E=0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y

--===============5418601551310361152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5418601551310361152==--
