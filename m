Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04EFF60B10;
	Sat, 12 Feb 2022 20:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdV5_l4O4vvH; Sat, 12 Feb 2022 20:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3700660AFC;
	Sat, 12 Feb 2022 20:40:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8AD1BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29688400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjELS3NyW_DW for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B482400C6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C868C824EE; Sat, 12 Feb 2022 20:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b3859cc7df8edce10e5b4dad9005bd05342c8c3
X-Git-Newrev: 9b41b54be07711c10ad13ce157be272ed1cf402e
X-Patchwork-Hint: ignore
Message-Id: <20220212203150.C868C824EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix build with host-gcc 10+
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b41b54be07711c10ad13ce157be272ed1cf402e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some older versions of linux, or custom versions (like forks for some
boards), fail to build with host-gcc 10+, because of redefined symbols:

      HOSTLD  scripts/dtc/dtc
    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
    of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
    collect2: error: ld returned 1 exit status

Since this has been fixed in recent-ish versions, we can't use an
unconditionaly patch, so we must have a conditional patch. However, a
patch may not always apply to arbitrary Linux versions or forks.

Upstream just dropped that line altogether:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

So, we use a little sed-grep combo to do the exact same change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index d798aea057..102b7a15d4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -271,6 +271,13 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
+# Older versions break on gcc 10+ because of redefined symbols
+define LINUX_DROP_YYLLOC
+	$(Q)grep -Z -l -r -E '^YYLTYPE yylloc;$$' $(@D) \
+	|xargs -0 -r $(SED) '/^YYLTYPE yylloc;$$/d'
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
+
 # Older linux kernels use deprecated perl constructs in timeconst.pl
 # that were removed for perl 5.22+ so it breaks on newer distributions
 # Try a dry-run patch to see if this applies, if it does go ahead
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
