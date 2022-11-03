Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91EFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2FB4188F;
	Thu,  3 Nov 2022 21:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2FB4188F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmiZJSaidMh1; Thu,  3 Nov 2022 21:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1739241885;
	Thu,  3 Nov 2022 21:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1739241885
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 346341BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CAB040BCE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CAB040BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66yqESGfrK3B for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E52440BC6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E52440BC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD2787C44; Thu,  3 Nov 2022 21:13:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:13:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a353cf87367fa2df22b8f0e55dee4d48a6f91ea8
X-Git-Newrev: 5044928baeaed86cee6f8452dc3850d5d0cb80a5
X-Patchwork-Hint: ignore
Message-Id: <20221103211336.3CD2787C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: fix hello_
 applications
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

commit: https://git.buildroot.net/buildroot/commit/?id=5044928baeaed86cee6f8452dc3850d5d0cb80a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The HELLO_ examples fail to run because the librevision.so
library build by the userland package is not included
in the image.

Include this library if BR2_PACKAGE_RPI_USERLAND_HELLO
is selected.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
