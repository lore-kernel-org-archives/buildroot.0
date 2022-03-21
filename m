Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB65C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAA9C60FC5;
	Mon, 21 Mar 2022 21:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dp_v6YW6FVNm; Mon, 21 Mar 2022 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 260E260FBF;
	Mon, 21 Mar 2022 21:55:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37CD11BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F14E4167F
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mO3iaB7yhmh for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:55:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1DFA41678
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 36DD784F2F; Mon, 21 Mar 2022 21:46:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:49:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b98d8bba7c1358938f8930a0167abe7a3f6c521
X-Git-Newrev: da38cdead909aa133b9c468ddebf3f67c8d198f2
X-Patchwork-Hint: ignore
Message-Id: <20220321214630.36DD784F2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: fix missing files in
 overlays
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

commit: https://git.buildroot.net/buildroot/commit/?id=da38cdead909aa133b9c468ddebf3f67c8d198f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When supporting multiple hardware targets, overlay_map.dtb might
be needed to map overlay names to one of several implementations [1].
If the correct overlay names are specified in config.txt, the map file
is not needed, but it also doesn't hurt.

[1] https://github.com/raspberrypi/documentation/blob/develop/documentation/asciidoc/computers/configuration/device-tree.adoc#the-overlay-map-file

Signed-off-by: Rutger Sassen <rsassen@comecer.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: always install overlay_map.dtb]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
