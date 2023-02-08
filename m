Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D1C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12CF140B3B;
	Wed,  8 Feb 2023 12:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12CF140B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1W5LWi2wwZa; Wed,  8 Feb 2023 12:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 187BC40B3A;
	Wed,  8 Feb 2023 12:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 187BC40B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF08F1BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A650281F48
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A650281F48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PoYxd3KBDdm for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:44:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C048A81F47
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C048A81F47
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD52884680; Wed,  8 Feb 2023 12:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:43:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5a3dfb9a4a6550b9097b22b1c96a99f90880a64
X-Git-Newrev: bfb5035c6fae1285ff0100275083fabc2b9816c1
X-Patchwork-Hint: ignore
Message-Id: <20230208124458.AD52884680@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: use DESTDIR instead
 of --prefix for installation
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
