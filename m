Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3ADC2BA15
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE634069A;
	Sun, 16 Jun 2024 10:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DyyjH0teuUj; Sun, 16 Jun 2024 10:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C84406A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C84406A7;
	Sun, 16 Jun 2024 10:25:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BA1D1BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 394FA4015E
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwo0BjobpAfj for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20DC4403B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20DC4403B7
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB6887FAE; Sun, 16 Jun 2024 10:25:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 12:24:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1561b6b56fcb9ff454443b2e7262be34db721163
X-Git-Newrev: 49032338441afddea853d35727914018860b7599
X-Patchwork-Hint: ignore
Message-Id: <20240616102528.1AB6887FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/genrandconfig: fix
 matching for a few lines
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

commit: https://git.buildroot.net/buildroot/commit/?id=49032338441afddea853d35727914018860b7599
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The matching in genrandconfig is idiomatically done by matching whole
lines, i.e. with the terminating \n but a few places are missing that.

Those are only matching against '=y', a boolean symbol, so it is in
practice not causing any issue. Still, for consistency, fix those.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8b8f5e336609e3b8f24786f8029d02bcae593a84)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index f2f1e33361..5796bbaa0f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -279,12 +279,12 @@ async def fixup_config(sysinfo, configfile):
        'BR2_PACKAGE_FLANN=y\n' in configlines:
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
