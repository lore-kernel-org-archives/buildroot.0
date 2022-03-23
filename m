Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D39C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946B141919;
	Wed, 23 Mar 2022 21:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PULHmLFhdf5D; Wed, 23 Mar 2022 21:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A751641B2D;
	Wed, 23 Mar 2022 21:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4E5C1BF9C8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1950847A0
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2OnRC4l679x for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07ECB8475F
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31A7485583; Wed, 23 Mar 2022 21:31:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:34:28 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b3f87a7ba3678c9d863244c66bdfec5a4382508f
X-Git-Newrev: 9d5fd132f098026f36c64b0b0c52ab49c6519bd4
X-Patchwork-Hint: ignore
Message-Id: <20220323213117.31A7485583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/rpi-firmware: fix
 missing files in overlays
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d5fd132f098026f36c64b0b0c52ab49c6519bd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When supporting multiple hardware targets, overlay_map.dtb might
be needed to map overlay names to one of several implementations [1].
If the correct overlay names are specified in config.txt, the map file
is not needed, but it also doesn't hurt.

[1] https://github.com/raspberrypi/documentation/blob/develop/documentation/asciidoc/computers/configuration/device-tree.adoc#the-overlay-map-file

Signed-off-by: Rutger Sassen <rsassen@comecer.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: always install overlay_map.dtb]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit da38cdead909aa133b9c468ddebf3f67c8d198f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 37bfa84eaf..230ba99372 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -23,6 +23,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	$(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
 		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
 	)
+	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
