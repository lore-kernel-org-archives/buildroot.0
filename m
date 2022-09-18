Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15575C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD5C683FE5;
	Sun, 18 Sep 2022 10:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5C683FE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnxAwYIs6VbY; Sun, 18 Sep 2022 10:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2DA83F33;
	Sun, 18 Sep 2022 10:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2DA83F33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5291BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43815409E7
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43815409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmAqpYZU32ti for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:40:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF4B40988
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EF4B40988
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 083CC84F5C; Sun, 18 Sep 2022 10:40:04 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:38:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdb23693a4bff5e9e9472738a0278ae0b13411e0
X-Git-Newrev: 93652b85770c53fa66e799825f0bc2099be619f2
X-Patchwork-Hint: ignore
Message-Id: <20220918104004.083CC84F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add qt libudev support
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

commit: https://git.buildroot.net/buildroot/commit/?id=93652b85770c53fa66e799825f0bc2099be619f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7b296fc99b..92fadbca82 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -101,6 +101,13 @@ endef
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 QT6BASE_CONF_OPTS += -DFEATURE_icu=ON
 QT6BASE_DEPENDENCIES += icu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
