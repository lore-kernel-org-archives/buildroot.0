Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF502C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 19:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FE541DC7;
	Sun, 12 Nov 2023 19:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FE541DC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpGDuhK4DcbX; Sun, 12 Nov 2023 19:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677A141834;
	Sun, 12 Nov 2023 19:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677A141834
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 410B51BF23B
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 19:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C73CE821BA
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 19:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C73CE821BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgrH0L2fYBUp for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 19:43:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73C66821BD
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 19:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C66821BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 884C540006;
 Sun, 12 Nov 2023 19:43:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1r2GMp-00AeWV-1g;
 Sun, 12 Nov 2023 20:43:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 20:43:22 +0100
Message-Id: <20231112194326.2539029-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 1/4] Revert "package/tar: allowing building even
 on non-Y2038 compliant systems"
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 7f1088f9cae9f191740423a0084bb31f94af2e75.

We're going back to tar 1.34, so this needs to be reverted as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tar/tar.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 8a612b6f45..eea112ebc7 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -7,15 +7,9 @@
 TAR_VERSION = 1.35
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
-# --exec-prefix=/: busybox installs in /bin, so we need tar to install
-# as well in /bin so that we don't end up with two different tar
-#
-# --disable-year2038: tells the configure script to not abort if the
-# system is not Y2038 compliant. tar will support year2038 if the
-# system is compliant even with this option passed
-TAR_CONF_OPTS = \
-	--exec-prefix=/ \
-	--disable-year2038
+# busybox installs in /bin, so we need tar to install as well in /bin
+# so that we don't end up with two different tar
+TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
