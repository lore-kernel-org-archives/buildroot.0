Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700CEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F4D441545;
	Mon, 25 Apr 2022 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJVcEFRuzAVH; Mon, 25 Apr 2022 19:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A3C41497;
	Mon, 25 Apr 2022 19:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFFE1BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D94618125B
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oNswXRj-gsWA for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2710F8129F
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EF9328437C; Mon, 25 Apr 2022 19:25:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bb391014c1de216a77024263b5b53ee499ee779
X-Git-Newrev: d7f72651254ba24efc5faea743f1ce34d9ef6ed5
X-Patchwork-Hint: ignore
Message-Id: <20220425192517.EF9328437C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wlroots: enable vulkan renderer if
 possible
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7f72651254ba24efc5faea743f1ce34d9ef6ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the wlroots' Vulkan renderer if a suitable driver is being built.
Currently only Mesa provides Vulkan drivers, so gating the feature on
BR2_PACKAGE_MESA3D_VULKAN_DRIVER seems reasonable at the moment (and is
done at least by one other package already: pipewire).

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wlroots/wlroots.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index baa1edd9e1..4f14d20b11 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -23,8 +23,9 @@ WLROOTS_DEPENDENCIES = \
 	wayland \
 	wayland-protocols
 
-WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled -Drenderers=gles2
+WLROOTS_CONF_OPTS = -Dexamples=false -Dxcb-errors=disabled
 
+WLROOTS_RENDERERS = gles2
 WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
@@ -35,6 +36,13 @@ else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
 
-WLROOTS_CONF_OPTS += -Dbackends=$(subst $(space),$(comma),$(strip $(WLROOTS_BACKENDS)))
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
+WLROOTS_RENDERERS += vulkan
+WLROOTS_DEPENDENCIES += mesa3d
+endif
+
+WLROOTS_CONF_OPTS += \
+	-Dbackends=$(subst $(space),$(comma),$(strip $(WLROOTS_BACKENDS))) \
+	-Drenderers=$(subst $(space),$(comma),$(strip $(WLROOTS_RENDERERS)))
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
