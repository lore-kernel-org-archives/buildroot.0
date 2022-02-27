Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF81AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726E881CE9;
	Sun, 27 Feb 2022 19:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAxEE04HA3S6; Sun, 27 Feb 2022 19:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F1B881CDB;
	Sun, 27 Feb 2022 19:29:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB7021BF356
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E0481A6F
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdAtE7_BUPgB for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D43D781B60
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 755708349D; Sun, 27 Feb 2022 19:20:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 20:22:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: e91440b904a6bae850a503f0938f833a5691d951
X-Git-Newrev: 701ce0ad69580854076df85eaa1b8db3da51e20f
X-Patchwork-Hint: ignore
Message-Id: <20220227192002.755708349D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] boot/uboot: fix build
 with host-gcc 10+
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

commit: https://git.buildroot.net/buildroot/commit/?id=701ce0ad69580854076df85eaa1b8db3da51e20f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Some older versions of U-Boot, or custom versions (like forks for some
boards), fail to build with host-gcc 10+, because of redefined symbols:

      HOSTLD  scripts/dtc/dtc
    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
    of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
    collect2: error: ld returned 1 exit status
    make[4]: *** [scripts/Makefile.host:106: scripts/dtc/dtc] E

Since this has been fixed in recent-ish versions, we can't use an
unconditionaly patch, so we must have a conditional patch. However, a
patch may not always apply to arbitrary U-Boot versions or forks.

Upstream just dropped that line altogether:
    https://source.denx.de/u-boot/u-boot/-/commit/018921ee79d3f30893614b3b2b63b588d8544f73

So, we use a little sed-grep combo to do the exact same change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 3b3859cc7df8edce10e5b4dad9005bd05342c8c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 9661f901ea..0765e66c4a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -238,6 +238,13 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
+# Older versions break on gcc 10+ because of redefined symbols
+define UBOOT_DROP_YYLLOC
+	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
+	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
+endef
+UBOOT_POST_PATCH_HOOKS += UBOOT_DROP_YYLLOC
+
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 define UBOOT_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),u-boot)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
