Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F583C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1193081E4E;
	Sun,  6 Aug 2023 12:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1193081E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTjU9ZA3_8nE; Sun,  6 Aug 2023 12:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4743D818C4;
	Sun,  6 Aug 2023 12:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4743D818C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1081D1BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1DA2400F1
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DA2400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSkM0_ofjLlM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:14:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D76E64011F
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D76E64011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE9DD84369; Sun,  6 Aug 2023 12:14:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 14:12:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f5d68db8bd7001ff25be1f512c8518dbbe7fe83d
X-Git-Newrev: 07acc00add7ac09114f3c01b85d794a31c68229c
X-Patchwork-Hint: ignore
Message-Id: <20230806121436.BE9DD84369@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91dataflashboot: force arm mode
 instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=07acc00add7ac09114f3c01b85d794a31c68229c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The at91dataflashboot code contains some hand-written ARM assembly
that uses ARM classic instructions, and will not build in Thumb-1
mode.

This issue has always existed in Buildroot, but it's only since we
started testing random configurations, including Thumb-1
configurations, that this issue popped up.

Fixes:

  http://autobuild.buildroot.net/results/68bf2291201ef1882d8e8d3eca2b1a5ad731e4b0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91dataflashboot/at91dataflashboot.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index c66f27e343..cb329a90df 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -11,9 +11,14 @@ AT91DATAFLASHBOOT_SITE = ftp://www.at91.com/pub/buildroot
 AT91DATAFLASHBOOT_INSTALL_TARGET = NO
 AT91DATAFLASHBOOT_INSTALL_IMAGES = YES
 
+AT91DATAFLASHBOOT_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+AT91DATAFLASHBOOT_CFLAGS += -marm
+endif
+
 define AT91DATAFLASHBOOT_BUILD_CMDS
 	make -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
-		CFLAGS="$(TARGET_CFLAGS) -fno-stack-protector"
+		CFLAGS="$(AT91DATAFLASHBOOT_CFLAGS)"
 endef
 
 define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
