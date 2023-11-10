Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A892C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E83EC839BC;
	Fri, 10 Nov 2023 12:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E83EC839BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kLZ6ENnJklGa; Fri, 10 Nov 2023 12:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 400D483A94;
	Fri, 10 Nov 2023 12:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 400D483A94
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96D8F1BF37C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB550839B8
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB550839B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umADE7SETLOD for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A18B839C0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A18B839C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3860986F32; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 13:23:40 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a8a3a1a9d044be75699095b22f1d9e0b790dc968
X-Git-Newrev: 6e92dc4589b57d4a796fcada8cb62a479344aaa7
X-Patchwork-Hint: ignore
Message-Id: <20231110122704.3860986F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 configs/stm32mp157c_dk2_defconfig: unbreak TF-A build with GCC >= 12
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
Content-Type: multipart/mixed; boundary="===============3039206564360763363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3039206564360763363==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6e92dc4589b57d4a796fcada8cb62a479344aaa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 1c0c67fc1ae146b34475231fb702e7f2e6bf9f8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32mp157c_dk2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index cf2433d67e..aa0fcfa843 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-dk2.dtb E=0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y

--===============3039206564360763363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3039206564360763363==--
