Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E45C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401AC6FBA0;
	Tue, 21 Feb 2023 01:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401AC6FBA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyFusLq6IcDU; Tue, 21 Feb 2023 01:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 620057002D;
	Tue, 21 Feb 2023 01:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620057002D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60BCC1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4226461084
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4226461084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8JL2m2wunKUn for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7219E6FBFF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7219E6FBFF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62DC9828C8; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:57:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 014180011d4333a73857bbd327c5c2aef7f4b43e
X-Git-Newrev: 75c313816eb526fe09a6baab8b327279e01be5ef
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.62DC9828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/barebox: use $$ instead
 of $ where needed
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
