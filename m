Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D1FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736F38128C;
	Sun,  9 Jan 2022 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MeS3ip7I3sh5; Sun,  9 Jan 2022 15:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E081180F5D;
	Sun,  9 Jan 2022 15:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57FD31BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 551344025E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXi8IV9lNxKT for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BB964022E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:46:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8A02A82BA1; Sun,  9 Jan 2022 15:40:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:46:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e36e8f2081a66f477dd038793082045876d65ee
X-Git-Newrev: bcf114234b00a07d45de63f7321fd47a66ed4c43
X-Patchwork-Hint: ignore
Message-Id: <20220109154018.8A02A82BA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: select vc4 driver for
 gallium v3d
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcf114234b00a07d45de63f7321fd47a66ed4c43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the Gallium V3D driver for RPi4 can be built independently, in
practice the accelaration doesn't work unless the VC4 driver is also
enabled.

Select VC4 automatically when V3D is selected.

Signed-off-by: Howard Mitchell <hm@hmbedded.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7c3a1beff3..c01f12529a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -262,7 +262,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_LIBDRM_VC4
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4 # runtime
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
