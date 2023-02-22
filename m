Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74AEC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75BF1416FE;
	Wed, 22 Feb 2023 16:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75BF1416FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0dHXQ3gAiL8; Wed, 22 Feb 2023 16:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59524170A;
	Wed, 22 Feb 2023 16:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59524170A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5092F1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 368974198B
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368974198B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwjRuYX8Jmnm for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30C354193F
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C354193F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F1A88679F; Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:11:28 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 41aade348afab8e876d114f4e16dddb8f5b21b96
X-Git-Newrev: b4027a4dddd92ab8b65c30733241a0a5751d3530
X-Patchwork-Hint: ignore
Message-Id: <20230222161342.1F1A88679F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] boot/barebox: explicitly
 set the timezone for the kbuild timestamp
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4027a4dddd92ab8b65c30733241a0a5751d3530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

This adjusts the code added in commit
c90bd74ebb264ccc925f10a142ccd82ef63a4601 ("boot/barebox: pass required
environment variables for reproducible build") to explicitly set the
timezone when calculating KBUILD_BUILD_TIMESTAMP, like is already done
in linux/linux.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 11e75ecbf092420f00f0fc88a7183d5d99887ff1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
