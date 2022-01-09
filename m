Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F3DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92DED80BB7;
	Sun,  9 Jan 2022 15:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLiH1EEjPM0U; Sun,  9 Jan 2022 15:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9266812E8;
	Sun,  9 Jan 2022 15:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3CA1BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76C3A4022E
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQbFDu5XgXi2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:46:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 685D84025D
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:46:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 94FCC82DEE; Sun,  9 Jan 2022 15:40:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 16:46:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcf114234b00a07d45de63f7321fd47a66ed4c43
X-Git-Newrev: 6a51177af14a2ddaa6431bb7fc618fe138b59b72
X-Patchwork-Hint: ignore
Message-Id: <20220109154018.94FCC82DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: always enable glx-direct
 if glx is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a51177af14a2ddaa6431bb7fc618fe138b59b72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many applications that use GLX want to combine it with DRI3 to bypass
the X server and send GL commands directly to the graphics driver. This
is only available in mesa3d if glx-direct=true.

Up to now, we only enabled glx-direct when a DRI driver was enabled.
Historically, this is either because only DRI drivers had DRI3, or
because we didn't know better at the time. However, glx-direct is not
related to DRI drivers at all. Setting it for a DRI driver when there is
no GLX is effectively a NOP. Conversely, we also want to set it for
Gallium drivers when GLX is enabled, otherwise GLX-direct applications
don't work.

Note that glx-direct is only functional if glx=dri. If glx=xlib or
glx=gallium-xlib, GLX always goes through the X server so direct is not
possible (as far as we understand).

Set glx-direct=true unconditionally when GLX is selected. Remove it from
DRI drivers.

Reported-by: Howard Mitchell <hm@hmbedded.co.uk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/mesa3d.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 28ff0669e0..cd3a33a38e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -73,7 +73,10 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 #  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
 #  xlib         : xlib conflicts with any dri driver
 #  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
-MESA3D_CONF_OPTS += -Dglx=dri
+# Always enable glx-direct; without it, amy GLX applications don't work.
+MESA3D_CONF_OPTS += \
+	-Dglx=dri \
+	-Dglx-direct=true
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += -Dgallium-xa=enabled
 else
@@ -136,7 +139,6 @@ MESA3D_CONF_OPTS += \
 else
 MESA3D_CONF_OPTS += \
 	-Dshared-glapi=enabled \
-	-Dglx-direct=true \
 	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
