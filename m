Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA209C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E7094F2AB;
	Tue, 21 Feb 2023 00:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E7094F2AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eur6bAc7ROvi; Tue, 21 Feb 2023 00:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEE84F49E;
	Tue, 21 Feb 2023 00:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BEE84F49E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 250301BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC085417F6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC085417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCl5igMkciWr for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAFB417F1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EAFB417F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1866386495; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:51:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05e4ad9c7e64e85d56126db8396dcf98138e84ad
X-Git-Newrev: 889f451caf22f5b36ff8430d7927e8cb3a56681e
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.1866386495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for widgets gtk backend
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

commit: https://git.buildroot.net/buildroot/commit/?id=889f451caf22f5b36ff8430d7927e8cb3a56681e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2a0afa6d27..911375aa6d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -217,6 +217,15 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_WIDGETS),y)
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+
+# only enable gtk support if libgtk3 X11 backend is enabled
+ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_LIBGTK3_X11),yy)
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=ON
+QT6BASE_DEPENDENCIES += libgtk3
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gtk3=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
