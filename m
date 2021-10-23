Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2690BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0DB60F6F
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A0DB60F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4681481A73;
	Sat, 23 Oct 2021 22:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1HcBbnSEB9a; Sat, 23 Oct 2021 22:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A21C281A64;
	Sat, 23 Oct 2021 22:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3809E1BF5E0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3483540332
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5gWNHKblz_wO for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7582640330
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:00:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5677E8851A; Sat, 23 Oct 2021 21:57:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 22:41:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fc095ec75434286458ced384a63acd07c82c447
X-Git-Newrev: 82d1e8c628cc7c7a0ede90aa6c41c5052a964830
X-Patchwork-Hint: ignore
Message-Id: <20211023215739.5677E8851A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: use none platform when
 building for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=82d1e8c628cc7c7a0ede90aa6c41c5052a964830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When creating the image we are using the target modules. Building
the modules for host is then unnecessary.

Lets configure host Grub2 for the 'none' platform.

Note that this still installs a platform-dependent file:
    .../host/lib/grub/i386-pc/config.h

This file does not seem to have much purpose, but it is harmless.
We did not care to provide a post-isntall hook to remove it.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/grub2/grub2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 270f289cfd..d93e383422 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -140,6 +140,7 @@ GRUB2_CONF_ENV = \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
 
 HOST_GRUB2_CONF_OPTS = \
+	--with-platform=none \
 	--disable-grub-mkfont \
 	--enable-efiemu=no \
 	ac_cv_lib_lzma_lzma_code=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
