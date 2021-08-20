Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672F6C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA4A60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BA4A60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B53407BC;
	Thu, 26 Aug 2021 22:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQ4fa-sZH5aO; Thu, 26 Aug 2021 22:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59F1C407D4;
	Thu, 26 Aug 2021 22:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 125B91BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F30F40789
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Brsn0eNh2GXu for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 485FF407C8
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AB03E8DC52; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 10:02:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e5709388eb519e79720b4ae8ca7c67bd80513a6c
X-Git-Newrev: 6fdac7fd193507789b568d5e6839e6d100edbf26
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.AB03E8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpv: fix build of
 vaapi with egl-drm
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
