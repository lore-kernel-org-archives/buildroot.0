Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AC7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 13:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72610410BE;
	Mon, 11 Jul 2022 13:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72610410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ri6GIOTLVUNN; Mon, 11 Jul 2022 13:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F1E40A05;
	Mon, 11 Jul 2022 13:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F1E40A05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A2B21BF20F
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61A2F6068D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 13:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A2F6068D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8PBP3-KXBqP for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 13:18:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DF360670
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 65DF360670
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 13:18:38 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id AFFF6240008;
 Mon, 11 Jul 2022 13:18:34 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 15:18:23 +0200
Message-Id: <20220711131823.116481-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

The cam application requires libevent. Since there's no Kconfig option
for it, cam building ability is checked by meson build system by default.

If libevent is present in the sysroot, cam is built.

The issue is that there's no explicit dependency on libevent in
libcamera package. This means that it is possible for libevent AND
libcamera to be built, but have libcamera be built before libevent.
Meaning that even if all requirements seem to be fulfilled, cam still
won't be enabled in some cases.

This fixes the possible race by expliciting the dependency to libevent
if the libevent package is enabled. Otherwise, explicitly disable cam
building as it's already known that it isn't going to build.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

v2:
 - added -Dcam=enabled when libevent package is enabled, to catch
 possible additional dependencies to cam in later upgrades,

 package/libcamera/libcamera.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 41d6a5abef..3f336cb797 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -84,6 +84,13 @@ else
 LIBCAMERA_CONF_OPTS += -Dqcam=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBCAMERA_CONF_OPTS += -Dcam=enabled
+LIBCAMERA_DEPENDENCIES += libevent
+else
+LIBCAMERA_CONF_OPTS += -Dcam=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBCAMERA_DEPENDENCIES += tiff
 endif
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
