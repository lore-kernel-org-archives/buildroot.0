Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4412AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6899415AE;
	Mon, 14 Nov 2022 07:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6899415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_W44giioTYe; Mon, 14 Nov 2022 07:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE12415A9;
	Mon, 14 Nov 2022 07:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE12415A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 700521BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 386A3415C9
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 386A3415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49TECWq_tk9Q for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37583415A3
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37583415A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114AB838BE; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 08:06:17 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fefc766702344f4f531812aeb700bb329da2bb5c
X-Git-Newrev: f007574559b26d716566ee44aaf99443d75afc8f
X-Patchwork-Hint: ignore
Message-Id: <20221114072057.114AB838BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rpi-userland: fix
 hello_ applications
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

commit: https://git.buildroot.net/buildroot/commit/?id=f007574559b26d716566ee44aaf99443d75afc8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The HELLO_ examples fail to run because the librevision.so
library build by the userland package is not included
in the image.

Include this library if BR2_PACKAGE_RPI_USERLAND_HELLO
is selected.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5044928baeaed86cee6f8452dc3850d5d0cb80a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1204196e19..2800b56296 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -25,6 +25,9 @@ define RPI_USERLAND_EXTRA_LIBS_TARGET
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
 		$(TARGET_DIR)/usr/lib/libilclient.so
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/librevision.so \
+		$(TARGET_DIR)/usr/lib/librevision.so
 endef
 RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_EXTRA_LIBS_TARGET
 
@@ -32,6 +35,9 @@ define RPI_USERLAND_EXTRA_LIBS_STAGING
 	$(INSTALL) -m 0644 -D \
 		$(@D)/build/lib/libilclient.so \
 		$(STAGING_DIR)/usr/lib/libilclient.so
+	$(INSTALL) -m 0644 -D \
+		$(@D)/build/lib/librevision.so \
+		$(STAGING_DIR)/usr/lib/librevision.so
 endef
 RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
