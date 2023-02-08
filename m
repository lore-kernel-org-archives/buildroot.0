Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F71C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3449F70131;
	Tue, 21 Feb 2023 01:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3449F70131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnKmFerjn_wd; Tue, 21 Feb 2023 01:48:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87A9770142;
	Tue, 21 Feb 2023 01:48:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A9770142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DE241BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA2676FE65
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA2676FE65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTCjjQiORhZD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFF5670005
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF5670005
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD26081979; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:43:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5a3dfb9a4a6550b9097b22b1c96a99f90880a64
X-Git-Newrev: bfb5035c6fae1285ff0100275083fabc2b9816c1
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.DD26081979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: use
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb5035c6fae1285ff0100275083fabc2b9816c1
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
 package/qt6/qt6base/qt6base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7b57eba4ab..212b2d689e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -79,11 +79,11 @@ define QT6BASE_BUILD_CMDS
 endef
 
 define QT6BASE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR) --prefix $(STAGING_DIR)/usr
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR)
 endef
 
 define QT6BASE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR) --prefix $(TARGET_DIR)/usr
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6BASE_BUILDDIR)
 endef
 
 HOST_QT6BASE_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
