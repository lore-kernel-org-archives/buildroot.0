Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26748C71153
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 21:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D77D5408DD;
	Sun, 10 Sep 2023 21:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D77D5408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQbn0EnmJn1l; Sun, 10 Sep 2023 21:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1340440B05;
	Sun, 10 Sep 2023 21:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1340440B05
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 156D81BF573
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89ABB40A21
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 21:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89ABB40A21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAT0ymhw-Y8l for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB22A40A8B
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB22A40A8B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB32986BF9; Sun, 10 Sep 2023 21:44:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 23:35:50 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 59d0adb63f58c1479b7262e8b16f883d9a2a4d20
X-Git-Newrev: 7cf98ac971d721593f57a9b030ee4870c3df53de
X-Patchwork-Hint: ignore
Message-Id: <20230910214436.AB32986BF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] boot/at91dataflashboot:
 force arm mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cf98ac971d721593f57a9b030ee4870c3df53de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit 07acc00add7ac09114f3c01b85d794a31c68229c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
