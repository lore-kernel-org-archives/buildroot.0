Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F35C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92830414C8;
	Wed,  8 Feb 2023 10:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92830414C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOOlyemWquwk; Wed,  8 Feb 2023 10:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71372410D5;
	Wed,  8 Feb 2023 10:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71372410D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 672EB1BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 598AA40BCC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 598AA40BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KDHQ8aM2eWC for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89DBE40BCF
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89DBE40BCF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86E41845D0; Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 653e573436398ed58e0d4323d684c237b55f9378
X-Git-Newrev: 7d195622f2388edd021c6f71ba78eb3d2f9539f7
X-Patchwork-Hint: ignore
Message-Id: <20230208105136.86E41845D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add support for
 printsupport/cups
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d195622f2388edd021c6f71ba78eb3d2f9539f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  |  8 ++++++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index da42b2ae0c..7927975bff 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -153,6 +153,14 @@ config BR2_PACKAGE_QT6BASE_WIDGETS
 	help
 	  This option enables the Qt6Widgets library.
 
+config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+	bool "printing support"
+	# yes, print support needs widgets
+	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+	help
+	  This option enables printing support, optionally using CUPS
+	  if available.
+
 endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index f4e63ab8d9..7b57eba4ab 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -207,6 +207,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+ifeq ($(BR2_PACKAGE_CUPS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
 QT6BASE_DEPENDENCIES += libdrm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
