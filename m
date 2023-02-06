Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656D6C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D6134038D;
	Mon,  6 Feb 2023 10:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D6134038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pudvg4iJSaqr; Mon,  6 Feb 2023 10:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFCD4047C;
	Mon,  6 Feb 2023 10:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFCD4047C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 999BE1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7358960A8C
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7358960A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4d3rZYxhysdP for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B59260AA4
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B59260AA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A6F7838E3; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75c313816eb526fe09a6baab8b327279e01be5ef
X-Git-Newrev: 11e75ecbf092420f00f0fc88a7183d5d99887ff1
X-Patchwork-Hint: ignore
Message-Id: <20230206105723.7A6F7838E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: explicitly set the timezone
 for the kbuild timestamp
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

commit: https://git.buildroot.net/buildroot/commit/?id=11e75ecbf092420f00f0fc88a7183d5d99887ff1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adjusts the code added in commit
c90bd74ebb264ccc925f10a142ccd82ef63a4601 ("boot/barebox: pass required
environment variables for reproducible build") to explicitly set the
timezone when calculating KBUILD_BUILD_TIMESTAMP, like is already done
in linux/linux.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a0cfaffe09..d7bcafe436 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -78,7 +78,7 @@ ifeq ($$(BR2_REPRODUCIBLE),y)
 $(1)_MAKE_ENV += \
 	KBUILD_BUILD_USER=buildroot \
 	KBUILD_BUILD_HOST=buildroot \
-	KBUILD_BUILD_TIMESTAMP="$$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+	KBUILD_BUILD_TIMESTAMP="$$(shell LC_ALL=C TZ='UTC' date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
 ifeq ($$(BR2_TARGET_$(1)_USE_DEFCONFIG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
