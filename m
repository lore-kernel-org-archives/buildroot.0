Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB35CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86CB861040
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86CB861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 606CF83ACE;
	Tue,  3 Aug 2021 21:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87Mo8G5fZGRW; Tue,  3 Aug 2021 21:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF72D83AC0;
	Tue,  3 Aug 2021 21:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA631BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC83560890
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOzwTxOQ3JAA for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E516089E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 402D5843F5; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Jun 2021 09:40:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0054fb6345ae09ce565ebae8273c224ff9364aa8
X-Git-Newrev: 8601137c08e112a67a565bee1c245481b62f96cd
X-Patchwork-Hint: ignore
Message-Id: <20210803210948.402D5843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpv: handle --{en,
 dis}able-libmpv-{shared, static}
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

commit: https://git.buildroot.net/buildroot/commit/?id=8601137c08e112a67a565bee1c245481b62f96cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libmpv-static and libmpv-shared are disabled by default resulting in the
following build failure when building with gl but without rpi, wayland
or x11:

Checking for OpenGL without platform-specific code (e.g. for libmpv)      : libmpv-shared not found
Checking for OpenGL context support                                       : gl-cocoa not found
You manually enabled the feature 'gl', but the autodetection check failed.

Here is an extract of wscript:

    } , {
        'name': '--plain-gl',
        'desc': 'OpenGL without platform-specific code (e.g. for libmpv)',
        'deps': 'libmpv-shared || libmpv-static',
        'func': check_true,
    }, {
        'name': '--gl',
        'desc': 'OpenGL context support',
        'deps': 'gl-cocoa || gl-x11 || egl-x11 || egl-drm || '
                 + 'gl-win32 || gl-wayland || rpi || '
                 + 'plain-gl',
        'func': check_true,
        'req': True,
        'fmsg': "No OpenGL video output found or enabled. " +
                "Aborting. If you really mean to compile without OpenGL " +
                "video outputs use --disable-gl.",
    }, {

Enabling both the shared and static libraries is not allowed by mpv, so
we consider the BR2_STATIC_LIBS to be static, and otherwise (i.e.
BR2_SHARED_LIBS and BR2_SHARED_STATIC_LIBS) to be shared.

Fixes:
 - http://autobuild.buildroot.org/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - expand config log about shared/static icompatibility
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpv/mpv.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 5713b98e8e..25ac783b52 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -28,6 +28,12 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth
 
+ifeq ($(BR2_STATIC_LIBS),y)
+MPV_CONF_OPTS += --disable-libmpv-shared --enable-libmpv-static
+else
+MPV_CONF_OPTS += --enable-libmpv-shared --disable-libmpv-static
+endif
+
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
 MPV_CONF_OPTS += --enable-alsa
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
