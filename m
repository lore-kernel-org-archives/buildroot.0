Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21C2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3627611C9
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 21:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3627611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ADEF4061C;
	Wed, 22 Sep 2021 21:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXY9K366sq4B; Wed, 22 Sep 2021 21:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C30E40613;
	Wed, 22 Sep 2021 21:05:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A51C81BF2F7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A179E614E7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3d4IOp4ag0v for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 21:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E499F6148D
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 21:05:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0D038CA2C; Wed, 22 Sep 2021 21:03:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 23:03:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44d5f1d05d9cf9dc03af22ae32d31cb3f647a339
X-Git-Newrev: 4cc074f43f1009bdacba4395bd8b94988064e5b1
X-Patchwork-Hint: ignore
Message-Id: <20210922210348.A0D038CA2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: disable vaapi with DRI driver
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cc074f43f1009bdacba4395bd8b94988064e5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of vaapi with BR2_PACKAGE_MESA3D_DRI_DRIVER is broken since commit
17a7abbafee9bf4a971e00da7870ae439910e47e because vaapi can only be
enabled with x11, wayland or egl-drm
(https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L632):

'deps': 'libdl && (x11 || wayland || egl-drm)',

As a result, despite what is being displayed in the autobuilder log
message, the build failure is not related to X11 but to the fact that
we try to enable vaapi through a DRI driver but without egl.

Fixes:
 - http://autobuild.buildroot.org/results/5ae706e94eb6e5a3aa69368f81c5d12e608b1a5a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpv/Config.in | 2 +-
 package/mpv/mpv.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 51c9799de8..81b1e24b5f 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MPV_SUPPORTS_VAAPI
 	bool
-	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_GBM
+	default y if BR2_PACKAGE_LIBDRM && BR2_PACKAGE_MESA3D_OPENGL_EGL
 	default y if BR2_PACKAGE_WAYLAND
 	default y if BR2_PACKAGE_XORG7
 
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index a71a4b3114..ff77f248e5 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -184,7 +184,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_GBM),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
