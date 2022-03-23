Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A2CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD8040FD7;
	Wed, 23 Mar 2022 21:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BtgqtWfSWyY0; Wed, 23 Mar 2022 21:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9561403F7;
	Wed, 23 Mar 2022 21:44:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A75A1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D36AF419E3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOwBmOPAerRz for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19B55419FF
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 426AA856ED; Wed, 23 Mar 2022 21:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:28:34 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: de5f4568c015e2adc82eab3fc007802c3a87ed24
X-Git-Newrev: b43b4f12773bf63bb3ba6f10498db5c9ac9e2cad
X-Patchwork-Hint: ignore
Message-Id: <20220323213134.426AA856ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rpi-firmware: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=b43b4f12773bf63bb3ba6f10498db5c9ac9e2cad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index b46a7f5270..d4d1d07b3f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -48,6 +48,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
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
