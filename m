Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459D5CCA473
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C593D415DD;
	Mon,  6 Jun 2022 20:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9rju6lhFR7O5; Mon,  6 Jun 2022 20:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64FD041C1A;
	Mon,  6 Jun 2022 20:40:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D47B1BF297
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1690A41088
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDBmkJ91HPmb for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC37C40992
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1EB8786DDE; Mon,  6 Jun 2022 20:25:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:36:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05b6f15ae82d926b016c32e0f60bfd0b4463f27e
X-Git-Newrev: 2967e28aa24ccfdf602638c9553314aea36dfdc0
X-Patchwork-Hint: ignore
Message-Id: <20220606202540.1EB8786DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-intel: switch dependency from mesa3d to
 libgl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2967e28aa24ccfdf602638c9553314aea36dfdc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

DRI support for this driver is provided by the xserver_xorg-server
package when BR2_PACKAGE_HAS_LIBGL is enabled:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91

Change the dependency to follow the logic of xserver_xorg-server.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index d911234c92..879abdd74d 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -31,12 +31,17 @@ XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-# X.org server support for DRI depends on a Mesa3D DRI driver
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+# DRI support is provided by xserver_xorg-server if libgl is enabled
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
 	--enable-dri2 \
 	--enable-dri3 \
 	--enable-uxa
+else
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += \
+	--disable-dri2 \
+	--disable-dri3 \
+	--disable-uxa
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
