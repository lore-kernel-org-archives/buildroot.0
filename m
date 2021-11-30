Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B8BC433FE
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 17:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA4E4048E;
	Tue, 30 Nov 2021 17:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjMjIZe9Mmpd; Tue, 30 Nov 2021 17:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22A6A40465;
	Tue, 30 Nov 2021 17:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40BD31BF358
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E7B34048E
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJUSfD7PPDrG for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 17:07:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F3FC40498
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 17:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB48792121; Tue, 30 Nov 2021 17:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:37:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c916b400bc608512db790d97df010ca666b6dd2
X-Git-Newrev: 3376a20b2d1cd64f0d6d103bd635302749af2d62
X-Patchwork-Hint: ignore
Message-Id: <20211130170221.CB48792121@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3376a20b2d1cd64f0d6d103bd635302749af2d62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since bump to version 6.1
in commit 33c69c02fb4c1176584d1e2dd336b74ed39f5d65 and
https://gitlab.com/qemu-project/qemu/-/commit/ba4dd2aabc35bc5385739e13f14e3a10a223ede0
(which enabled plugins by default):

Library dl found: YES
Checking for function "dlopen" with dependency -ldl: NO

../meson.build:460:4: ERROR: Problem encountered: dlopen not found

Fixes:
 - http://autobuild.buildroot.org/results/df447bd963e62e06b28d7230da744616ae55b194

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 8ef969c117..919aef6599 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -167,6 +167,10 @@ else
 QEMU_OPTS += --disable-usb-redir
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QEMU_OPTS += --static
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
