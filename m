Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2474C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C17610CF
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91C17610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64BBD605F2;
	Fri, 20 Aug 2021 08:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhubBy97zgP8; Fri, 20 Aug 2021 08:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97D2605F4;
	Fri, 20 Aug 2021 08:04:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DECD1BF3A6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B5780C78
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msq0thX9RTqw for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 08:04:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F1D380C91
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 08:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 159B18D6C2; Fri, 20 Aug 2021 08:03:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 10:02:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5709388eb519e79720b4ae8ca7c67bd80513a6c
X-Git-Newrev: 6fdac7fd193507789b568d5e6839e6d100edbf26
X-Patchwork-Hint: ignore
Message-Id: <20210820080326.159B18D6C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: fix build of vaapi with
 egl-drm
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fdac7fd193507789b568d5e6839e6d100edbf26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build of vaapi with egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174 because egl-drm is a part of gl
group which is only enabled if BR2_PACKAGE_HAS_LIBGL or
BR2_PACKAGE_HAS_LIBGLES are set:
https://github.com/mpv-player/mpv/blob/ec0006bfa1aaf608a7141929f2871c89ac7a15d6/wscript#L572

As a result, despite what is being displayed in the autobuilder log
message, the build failure is not related to X11 but to the fact that
we try to enable vaapi through egl-drm but at the same time, we disable
gl.

To fix it, enable gl if libegl is available as gl can be enabled for
example through wayland and egl (gl-wayland):

'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
+ 'gl-win32 || gl-wayland || rpi || '
+ 'plain-gl',

Fixes:
 - http://autobuild.buildroot.org/results/e5c15228f42a73f8c34b26630b2074c30e5f5966

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpv/mpv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 91e31dd150..f8ecaeb78a 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -148,6 +148,9 @@ MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgles
+else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MPV_CONF_OPTS += --enable-gl
+MPV_DEPENDENCIES += libegl
 else
 MPV_CONF_OPTS += --disable-gl
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
