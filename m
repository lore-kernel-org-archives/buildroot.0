Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6062BC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15119700D7;
	Tue, 21 Feb 2023 01:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15119700D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2zC66_--B75; Tue, 21 Feb 2023 01:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5636470145;
	Tue, 21 Feb 2023 01:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5636470145
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6DF31BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 393FB6FFF2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393FB6FFF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gI_8-Ol7pk77 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57C30610DD
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C30610DD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 477AD81979; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:51:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 73d6df812d9eaccfad9cf4b5cb4fc53d30205e20
X-Git-Newrev: 2db19af40179d6c2dfd78e08c005e67b01cdc01e
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.477AD81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for libinput
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

commit: https://git.buildroot.net/buildroot/commit/?id=2db19af40179d6c2dfd78e08c005e67b01cdc01e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 8db59bbc31..49a61e4d25 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -229,6 +229,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBINPUT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=ON
+QT6BASE_DEPENDENCIES += libinput
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libinput=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_TSLIB),y)
 QT6BASE_CONF_OPTS += -DFEATURE_tslib=ON
 QT6BASE_DEPENDENCIES += tslib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
