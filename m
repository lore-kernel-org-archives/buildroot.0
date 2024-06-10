Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C63C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72EA840693;
	Mon, 10 Jun 2024 19:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yuu4bNiPiEq; Mon, 10 Jun 2024 19:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3465A40622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3465A40622;
	Mon, 10 Jun 2024 19:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E31F81BF3B8
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D040260667
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 19:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUdhpkdVrpzX for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 19:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E10E260644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10E260644
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 19:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D424387EDA; Mon, 10 Jun 2024 19:56:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 21:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12b2860d7562d5cf1b7492b58f4f10f0405444c4
X-Git-Newrev: 8b8f5e336609e3b8f24786f8029d02bcae593a84
X-Patchwork-Hint: ignore
Message-Id: <20240610195654.D424387EDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix matching for a
 few lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b8f5e336609e3b8f24786f8029d02bcae593a84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The matching in genrandconfig is idiomatically done by matching whole
lines, i.e. with the terminating \n but a few places are missing that.

Those are only matching against '=y', a boolean symbol, so it is in
practice not causing any issue. Still, for consistency, fix those.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0889be0d43..fb493f3f31 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -267,12 +267,12 @@ async def fixup_config(sysinfo, configfile):
        BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # No C library for internal toolchain
-    if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y' in configlines:
+    if 'BR2_TOOLCHAIN_BUILDROOT_NONE=y\n' in configlines:
         return False
     # Xtensa custom cores require an overlay file with internal
     # toolchains
-    if 'BR2_XTENSA_CUSTOM=y' in configlines and \
-       'BR2_TOOLCHAIN_BUILDROOT=y' in configlines:
+    if 'BR2_XTENSA_CUSTOM=y\n' in configlines and \
+       'BR2_TOOLCHAIN_BUILDROOT=y\n' in configlines:
         return False
 
     if 'BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y\n' in configlines:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
