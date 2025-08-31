Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE7DCA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AACAA4095E;
	Sun, 31 Aug 2025 15:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnbPjrLmtTJs; Sun, 31 Aug 2025 15:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD348408AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD348408AE;
	Sun, 31 Aug 2025 15:01:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 115E2D2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5B2D408AE
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4QEqUsdmq3q for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BB5540920
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BB5540920
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B2D287D66; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 16:59:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c47e8b1b2c1870c4281e30756fe2d44aa5c7e3a
X-Git-Newrev: 73331b68a9a8b72876a69f1138a0917b44ad67db
X-Patchwork-Hint: ignore
Message-Id: <20250831150148.0B2D287D66@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brcm-patchram-plus: fix build w/
 gcc-15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=73331b68a9a8b72876a69f1138a0917b44ad67db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/2058934e442c0b3f3d0bd81bd7ed080c2eaade31/

The source code uses empty argument function pointer prototypes, which
changed behaviour in C23 (default in gcc-15):

https://gcc.gnu.org/gcc-15/porting_to.html#c23-fn-decls-without-parameters

Causing build issues. Fix it by forcing gnu99 mode instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brcm-patchram-plus/brcm-patchram-plus.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
index d873330769..81ffc47aee 100644
--- a/package/brcm-patchram-plus/brcm-patchram-plus.mk
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -10,4 +10,8 @@ BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
 BRCM_PATCHRAM_PLUS_LICENSE_FILES = COPYING
 BRCM_PATCHRAM_PLUS_AUTORECONF = YES
 
+# C23 changes meaning of empty argument prototypes like int (*)()
+# causing build failures, so force gnu99
+BRCM_PATCHRAM_PLUS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
