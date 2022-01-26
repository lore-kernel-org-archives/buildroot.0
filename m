Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED69C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7471484D07;
	Wed, 26 Jan 2022 22:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blgRyhcvoeGG; Wed, 26 Jan 2022 22:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE2B84CFB;
	Wed, 26 Jan 2022 22:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA3721BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F56417F1
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HemOhWkLGhci for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:06:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DB6441717
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9C042827A0; Wed, 26 Jan 2022 21:59:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:05:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d893f870f7c0be22b340cd5fca5ae0661c20182
X-Git-Newrev: 96c6ccb49808c312a7dfbd12edf08716de621405
X-Patchwork-Hint: ignore
Message-Id: <20220126215945.9C042827A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sslh: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=96c6ccb49808c312a7dfbd12edf08716de621405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.22c in
commit 5b9c58531e97b012a8a11c6ae5145b16dcfb8f74:

sslh-select.c: In function 'udp_timeouts':
sslh-select.c:480:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (int i = 0; i < fd_info->max_fd; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/aaaac2beb16730747b4265e81d09cb5e072c7267

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sslh/sslh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 99fb6bf922..897b3b6505 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -11,7 +11,7 @@ SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
 SSLH_DEPENDENCIES = pcre2
 
-SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
+SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 ifeq ($(BR2_PACKAGE_LIBBSD),y)
 SSLH_DEPENDENCIES += libbsd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
