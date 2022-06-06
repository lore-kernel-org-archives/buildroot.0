Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11597C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6844170A;
	Mon,  6 Jun 2022 13:04:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lzmewKsJOOBA; Mon,  6 Jun 2022 13:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68D141B81;
	Mon,  6 Jun 2022 13:04:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A69F31BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A256B612D3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56SOjwm9HSo6 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3406E61070
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 065AD86D91; Mon,  6 Jun 2022 12:52:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:00:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fac515ab5f92c537e55f408c26be28ada7aaf7e
X-Git-Newrev: 66496a40564a2ea590081c4461075ea9d256e579
X-Patchwork-Hint: ignore
Message-Id: <20220606125202.065AD86D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix armeb build
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

commit: https://git.buildroot.net/buildroot/commit/?id=66496a40564a2ea590081c4461075ea9d256e579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following armeb build failure raised since at least version
6.2.0:

ERROR: Unknown target name 'armeb-softmmu'

Fixes:
 - http://autobuild.buildroot.org/results/dbd1417fb638ad41e9f23941141bbeb9c999fb05
 - http://autobuild.buildroot.org/results/a6f97308aa2e634ed3d5b80b33b4663aa16c4693

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1bcffc2340..290186ec4e 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -277,6 +277,9 @@ HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pi
 #       xtensa          xtensa
 
 HOST_QEMU_ARCH = $(ARCH)
+ifeq ($(HOST_QEMU_ARCH),armeb)
+HOST_QEMU_SYS_ARCH = arm
+endif
 ifeq ($(HOST_QEMU_ARCH),i486)
 HOST_QEMU_ARCH = i386
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
