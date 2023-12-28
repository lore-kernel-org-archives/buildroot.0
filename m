Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE43C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7AC41724;
	Thu, 28 Dec 2023 20:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7AC41724
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZwoByQTauH9; Thu, 28 Dec 2023 20:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8780A41711;
	Thu, 28 Dec 2023 20:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8780A41711
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCE11BF32B
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 459B441711
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 20:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 459B441711
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nht69SOwmp4 for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 20:32:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 612B2416D2
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 20:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612B2416D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C7EC81840; Thu, 28 Dec 2023 20:32:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 21:31:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b0c02a77ac13489a625db7b60a204a64cfc37cb
X-Git-Newrev: e29fcde4ba70ce2259824b3b7dd807b2195baefa
X-Patchwork-Hint: ignore
Message-Id: <20231228203217.4C7EC81840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6base: remove
 $(TARGET_DIR)/usr/mkspecs in target-finalize
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

commit: https://git.buildroot.net/buildroot/commit/?id=e29fcde4ba70ce2259824b3b7dd807b2195baefa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt6base installs things in /usr/mkspecs, but also the soon to be added
qt6core5compat, and the existing package qwt as well.

So let's move the removal of /usr/mkspecs in target-finalize, where we
already remove lots of development-related directories, using a
target-finalize hook in the qt6base package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: make it a qt6base target-finalize hook]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 package/qwt/qwt.mk             | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index c32089f551..67c705fb93 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -366,5 +366,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
+define QT6BASE_RM_USR_MKSPECS
+	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
+endef
+QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f..f344ca4e3a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -58,7 +58,6 @@ endef
 
 define QWT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
-	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
 $(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
