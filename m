Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCB7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006F961AFF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 006F961AFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8EA160A86;
	Wed, 17 Nov 2021 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPhKIfmiNQU1; Wed, 17 Nov 2021 20:47:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 498BB60A83;
	Wed, 17 Nov 2021 20:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C64A1BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BE5B60A85
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IcidAqytwO-n for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A85A60A81
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:47:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 86CE08D4D0; Wed, 17 Nov 2021 20:43:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:37:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bd40a0303c697822f2c65b4ede80ad1252bbc07
X-Git-Newrev: 36602fd41ac27a37bb389316019ec1f8a77190cd
X-Patchwork-Hint: ignore
Message-Id: <20211117204335.86CE08D4D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/seatd: daemon needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=36602fd41ac27a37bb389316019ec1f8a77190cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.6.2 in
commit c54f85ca0d2ba7b73c899a27e62c67d3389617b8 and
https://github.com/kennylevinsen/seatd/commit/1e98727ae9dfdb23316249a4f32b3169d956e417:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: seatd-launch.p/seatd-launch_seatd-launch.c.o: in function `main':
seatd-launch.c:(.text.startup+0x8a): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/5219b6dac714886c7fa4d3687a13b9dff8338df2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/seatd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/seatd/Config.in b/package/seatd/Config.in
index 2c2efcb04e..5473b237ce 100644
--- a/package/seatd/Config.in
+++ b/package/seatd/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SEATD_BUILTIN
 
 config BR2_PACKAGE_SEATD_DAEMON
 	bool "seatd daemon"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Build the seatd daemon and support for it inside libseat.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
