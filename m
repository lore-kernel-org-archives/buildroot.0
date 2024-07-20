Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F3EC3DA70
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A05D40647;
	Sat, 20 Jul 2024 21:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLWv1Gtsn78m; Sat, 20 Jul 2024 21:13:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C674061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8C674061B;
	Sat, 20 Jul 2024 21:13:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEE951BF868
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA05C6068A
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXpKbAvHwoP0 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240D7605E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 240D7605E3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10BF681840; Sat, 20 Jul 2024 21:13:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:12:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58983179e4f8849ca4e9d6bb063c2f5bd232235a
X-Git-Newrev: 6084d904de77ddb99daad7fb9d67dad06fd42526
X-Patchwork-Hint: ignore
Message-Id: <20240720211354.10BF681840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: fix satamv handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6084d904de77ddb99daad7fb9d67dad06fd42526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

satamv is only available on x86 resulting in the following build failure
since switch to meson-package in commit
37dded43ae681e8319d7b76f9a612c71991467a9:

../output-1/build/flashrom-1.3.0/meson.build:475:6: ERROR: Problem encountered: satamv selected but not supported on this platform

Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
 - http://autobuild.buildroot.org/results/c689bf039d7686a9b42c6fcb84f87b555a9bcfb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 0b474caab4..478b53e1ac 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -65,7 +65,6 @@ FLASHROM_PROGRAMMERS += \
 	nicintel_eeprom \
 	nicintel_spi \
 	ogp_spi \
-	satamv \
 	satasii
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
@@ -74,7 +73,8 @@ FLASHROM_PROGRAMMERS += \
 	atapromise \
 	nic3com \
 	nicnatsemi \
-	nicrealtek
+	nicrealtek \
+	satamv
 endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
