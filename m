Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BDEC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB334F3BC;
	Tue, 21 Feb 2023 00:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB334F3BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4nD4W6xzP6H; Tue, 21 Feb 2023 00:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A214F51A;
	Tue, 21 Feb 2023 00:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A214F51A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D92B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2D27417DD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2D27417DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OcGTuSO9Nnhq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E16D417EB
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E16D417EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B3C986495; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 14:35:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e447f56408f9308cc0e527f97dcc1844f2d6c850
X-Git-Newrev: 9d8e207e7aaf035f48252e19013b610893d2fce0
X-Patchwork-Hint: ignore
Message-Id: <20230220205256.0B3C986495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6serialport: use
 DESTDIR instead of --prefix for installation
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d8e207e7aaf035f48252e19013b610893d2fce0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Even though it works, overriding --prefix at installation time is a
bit weird. In order to be more consistent with what is done with other
build systems, use DESTDIR instead at installation time.

Note that $(DESTDIR) comes in addition to the
-DCMAKE_INSTALL_PREFIX=/usr that is passed at configure time, so with
this commit, the files continue to be installed in $(STAGING_DIR)/usr
and $(TARGET_DIR)/usr as they should be.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6serialport/qt6serialport.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index 9656e97c96..497719d4ec 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -41,11 +41,11 @@ define QT6SERIALPORT_BUILD_CMDS
 endef
 
 define QT6SERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(STAGING_DIR)/usr
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
 endef
 
 define QT6SERIALPORT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR) --prefix $(TARGET_DIR)/usr
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)
 endef
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
