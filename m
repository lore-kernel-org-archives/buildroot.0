Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA60C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A6A82009;
	Sat,  4 Nov 2023 13:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A6A82009
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beC5jb6T9Yqr; Sat,  4 Nov 2023 13:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9286082002;
	Sat,  4 Nov 2023 13:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9286082002
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 445521BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A84882001
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A84882001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8UN0NrUs4wiF for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C210B81FF9
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C210B81FF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A19B4861F1; Sat,  4 Nov 2023 13:36:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 14:35:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6724f3a7294ddaba8a648ea162ca1f84b13307a
X-Git-Newrev: ad98e52090c8bbd3b290b418df4f28205f6584ba
X-Patchwork-Hint: ignore
Message-Id: <20231104133600.A19B4861F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flashrom: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad98e52090c8bbd3b290b418df4f28205f6584ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid the following build failure raised since bump
to version 1.3.0 in commit 073b0fc9c1fe9945eccf4b792b948633aae9a9b8:

chipset_enable.c:27: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
   27 | #define _LARGEFILE64_SOURCE
      |
<command-line>: note: this is the location of the previous definition

Fixes:
 - http://autobuild.buildroot.org/results/b8d8c30d1306c2ba8f59b48f457a7ef930306b8c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flashrom/flashrom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index ca55592dba..1ccef572da 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -9,6 +9,7 @@ FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
+FLASHROM_MAKE_OPTS = WARNERROR=no
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 FLASHROM_DEPENDENCIES += host-pkgconf libftdi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
