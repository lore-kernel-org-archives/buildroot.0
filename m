Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98EDC43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BAE41C68;
	Thu,  9 Jun 2022 20:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Trpxix_3o7VJ; Thu,  9 Jun 2022 20:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5878741C37;
	Thu,  9 Jun 2022 20:48:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7771C1135
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C91241C32
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyvTT0sj3Rog for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:47:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3669641B8A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:47:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6735886F2C; Thu,  9 Jun 2022 20:36:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:36:04 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4aa8f56196d9dd2633110f4d1ffe089cee5530ec
X-Git-Newrev: f8a979ff18dea28f0785501d6fc4de8cde2ddd95
X-Patchwork-Hint: ignore
Message-Id: <20220609203602.6735886F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qemu: fix armeb
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8a979ff18dea28f0785501d6fc4de8cde2ddd95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following armeb build failure raised since at least version
6.2.0:

ERROR: Unknown target name 'armeb-softmmu'

Fixes:
 - http://autobuild.buildroot.org/results/dbd1417fb638ad41e9f23941141bbeb9c999fb05
 - http://autobuild.buildroot.org/results/a6f97308aa2e634ed3d5b80b33b4663aa16c4693

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 66496a40564a2ea590081c4461075ea9d256e579)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e69e813059..33e6938774 100644
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
