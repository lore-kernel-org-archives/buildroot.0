Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F8FC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6672B416C6;
	Mon,  6 Feb 2023 10:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6672B416C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQKjofbWXUmd; Mon,  6 Feb 2023 10:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7191E4159F;
	Mon,  6 Feb 2023 10:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7191E4159F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76BF11BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5071B813E6
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5071B813E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVvWdBm2LWwL for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83862813E0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83862813E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71FF4838DC; Mon,  6 Feb 2023 10:57:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 014180011d4333a73857bbd327c5c2aef7f4b43e
X-Git-Newrev: 75c313816eb526fe09a6baab8b327279e01be5ef
X-Patchwork-Hint: ignore
Message-Id: <20230206105723.71FF4838DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: use $$ instead of $ where
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=75c313816eb526fe09a6baab8b327279e01be5ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c90bd74ebb264ccc925f10a142ccd82ef63a4601 ("boot/barebox: pass
required environment variables for reproducible build") caused the
build to generate a spurious error message due to the $(shell
... date -d @$(SOURCE_DATE_EPOCH)) command being executed even when
BR2_REPRODUCIBLE was disabled.

This is due to the fact that variable references must be done using $$
within macros. This commit fixes that for the two variables that we
are referencing in the code added in commit
c90bd74ebb264ccc925f10a142ccd82ef63a4601.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/barebox/barebox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 90be8c1ecc..a0cfaffe09 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -74,11 +74,11 @@ endif
 $(1)_MAKE_FLAGS = ARCH=$$($(1)_ARCH) CROSS_COMPILE="$$(TARGET_CROSS)"
 $(1)_MAKE_ENV = $$(TARGET_MAKE_ENV)
 
-ifeq ($(BR2_REPRODUCIBLE),y)
+ifeq ($$(BR2_REPRODUCIBLE),y)
 $(1)_MAKE_ENV += \
 	KBUILD_BUILD_USER=buildroot \
 	KBUILD_BUILD_HOST=buildroot \
-	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+	KBUILD_BUILD_TIMESTAMP="$$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
 ifeq ($$(BR2_TARGET_$(1)_USE_DEFCONFIG),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
