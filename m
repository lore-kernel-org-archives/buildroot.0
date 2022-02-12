Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3153DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3A5A60A70;
	Sat, 12 Feb 2022 20:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ylO1n8Jrp-bT; Sat, 12 Feb 2022 20:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF5160B3F;
	Sat, 12 Feb 2022 20:40:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E381BF956
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 717864010F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YtTjMmX7NSE for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F886400AB
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BCAF482470; Sat, 12 Feb 2022 20:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de0f5ba17a15a87bc16a6d6aa318104510c38f9d
X-Git-Newrev: 3b3859cc7df8edce10e5b4dad9005bd05342c8c3
X-Patchwork-Hint: ignore
Message-Id: <20220212203150.BCAF482470@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix build with host-gcc 10+
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b3859cc7df8edce10e5b4dad9005bd05342c8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 boot/uboot/uboot.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6750069173..cb26fc8d3e 100644
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
