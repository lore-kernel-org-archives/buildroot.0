Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D00EE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE6A940B6E;
	Mon, 21 Aug 2023 20:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE6A940B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2SMdSXa03T7; Mon, 21 Aug 2023 20:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E066640BFD;
	Mon, 21 Aug 2023 20:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E066640BFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371B01BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22F1A4167D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22F1A4167D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHKcWYymUiab for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BF5414C3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BF5414C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 734D286024; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 23:59:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ff050de534eed1dab152890d748952fc659882a0
X-Git-Newrev: ef57da23b9950a8820c64c268672265f233cfb00
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.734D286024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/composer: needs
 host-php to extract phar files
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef57da23b9950a8820c64c268672265f233cfb00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Although composer has host-php as build dependency, we use php in the
extract step, so it needs to be listed as an extract dependency,
otherwise host-php might not been built/installed before the extract
step of host-composer.

Fixes:

  http://autobuild.buildroot.net/results/50658c50fde8145fac320e3b17004e98c78c6c4d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/composer/composer.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index a24c020796..fde5b48951 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -15,6 +15,7 @@ COMPOSER_LICENSE = MIT
 COMPOSER_LICENSE_FILES = LICENSE
 
 HOST_COMPOSER_DEPENDENCIES = host-php
+HOST_COMPOSER_EXTRACT_DEPENDENCIES = host-php
 
 define HOST_COMPOSER_EXTRACT_CMDS
 	cp $(HOST_COMPOSER_DL_DIR)/$(COMPOSER_SOURCE) $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
