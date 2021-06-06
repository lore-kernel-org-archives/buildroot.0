Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68794C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336F76103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 336F76103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 003EC400E7;
	Tue,  3 Aug 2021 21:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFrFYnjrpgdA; Tue,  3 Aug 2021 21:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 078E7400C6;
	Tue,  3 Aug 2021 21:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 138161BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84D0E60883
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuqhWKobbcDG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2B7360890
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 366F3864A8; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:32:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6f63917485b109dc050aee65c9b98b1cb814b350
X-Git-Newrev: 0054fb6345ae09ce565ebae8273c224ff9364aa8
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.366F3864A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/minnowboard_max-graphical_defconfig: unbreak X11/mesa
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0054fb6345ae09ce565ebae8273c224ff9364aa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337965

Commit 15a2f9b819806d38a7d8172a2 (package/{mesa3d, mesa3d-headers}: bump
version to 21.0.2) marked BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST as legacy,
but forgot to update the defconfig.  The SW rasterizer isn't really needed
with the Intel GPU, so just drop it.

In addition, X11 now needs some help with loading the modules in the correct
order, similar to how it was done for the test in commit 4a3639bad01a
(support/testing: test_glxinfo load X11 modules in the right order).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf  | 11 +++++++++++
 configs/minnowboard_max-graphical_defconfig                   |  1 -
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf b/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
new file mode 100644
index 0000000000..91659baa65
--- /dev/null
+++ b/board/minnowboard/fs-overlay-graphical/etc/X11/xorg.conf.d/01-modules.conf
@@ -0,0 +1,11 @@
+
+# Xorg does not implement real dynamic linking and requires that its
+# modules get loaded in the right order.
+# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
+Section "Module"
+   Load "vgahw"
+   Load "fb"
+   Load "shadowfb"
+   Load "int10"
+   Load "vbe"
+EndSection
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 3b769ca6e7..051c7584dc 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -40,7 +40,6 @@ BR2_PACKAGE_ALSA_UTILS_APLAY=y
 BR2_PACKAGE_GLMARK2=y
 BR2_PACKAGE_MESA3D_DEMOS=y
 BR2_PACKAGE_MESA3D=y
-BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
 BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
 BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
