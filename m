Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A98C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6315A61AC2;
	Thu,  4 Jan 2024 21:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6315A61AC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cOwe7zgtVSd; Thu,  4 Jan 2024 21:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B174F61AC7;
	Thu,  4 Jan 2024 21:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B174F61AC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1B6F1BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABA8F41DEF
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA8F41DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pyOzyNBX1dM for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:42:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E433341781
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E433341781
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0F5384151; Thu,  4 Jan 2024 21:42:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:42:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c67954bb4f30c8bf2957b4a0a76ceabab3a732cd
X-Git-Newrev: e6ef64d955f34db773addad52c7af17e111d7f13
X-Patchwork-Hint: ignore
Message-Id: <20240104214254.D0F5384151@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: fix fiptool
 linking issue on hosts without openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6ef64d955f34db773addad52c7af17e111d7f13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5834758777

Commit e7d16c35a (boot/arm-trusted-firmware: fix the RPATH of fiptool) tried
to fix the build of host-fiptool, but forgot to pass HOST_CFLAGS.

On hosts without (compatible) openssl development headers, this breaks
the build when it cannot find the openssl headers:

fiptool_platform.h:19:11: fatal error: openssl/sha.h: No such file or directory

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index bed873a182..7f9c896387 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -64,7 +64,7 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
-	HOSTCC="$(HOSTCC) $(HOST_LDFLAGS)"
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
