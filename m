Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7676C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519B160F6F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 519B160F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 298C76088B;
	Mon, 25 Oct 2021 18:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFxVgMJlWG-m; Mon, 25 Oct 2021 18:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887D660847;
	Mon, 25 Oct 2021 18:56:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2EE31BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC4C60892
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VH94ZB8jaSlD for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29DC56088B
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A1550887AA; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2c02a8c2f42dcd76e0cf6458f14afd642746dd5
X-Git-Newrev: df857f6e0fd9d0815c12519ca239de0b0fd2b96b
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.A1550887AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: disable doc generation for
 host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=df857f6e0fd9d0815c12519ca239de0b0fd2b96b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- disable doc generation (via sphinx) for host build

Reduces host-qemu build time from (on a system with sphinx installed):

	real    2m5,522s
	user    9m41,292s
	sys     1m9,732s

to:
	real	1m9,183s
	user	8m40,131s
	sys	1m9,533s

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 95f3dfe54f..8ef969c117 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -355,6 +355,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-bzip2 \
 		--disable-containers \
 		--disable-curl \
+		--disable-docs \
 		--disable-libssh \
 		--disable-linux-io-uring \
 		--disable-sdl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
