Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403B0C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEFB2416CE;
	Wed, 22 Feb 2023 16:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEFB2416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pe8lH0gQW6kr; Wed, 22 Feb 2023 16:14:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FB1A41711;
	Wed, 22 Feb 2023 16:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB1A41711
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13F391BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E143D81F04
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E143D81F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqZZzSZxmgdw for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 254FE817AD
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 254FE817AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1604B83CA2; Wed, 22 Feb 2023 16:13:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:10:47 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: eace3a9a0323098cbdd2774de6b09823865ba377
X-Git-Newrev: 41aade348afab8e876d114f4e16dddb8f5b21b96
X-Patchwork-Hint: ignore
Message-Id: <20230222161342.1604B83CA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] boot/barebox: use $$
 instead of $ where needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=41aade348afab8e876d114f4e16dddb8f5b21b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit 75c313816eb526fe09a6baab8b327279e01be5ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
