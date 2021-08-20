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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA757C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8757860FE6
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8757860FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64972614F3;
	Thu, 26 Aug 2021 22:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UKtGpGOUGqG; Thu, 26 Aug 2021 22:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 822C7614F5;
	Thu, 26 Aug 2021 22:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18D2F1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E804077F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQNe4wVlM_Zw for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A7EA407C9
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9FD2C8DC50; Thu, 26 Aug 2021 22:01:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 10:02:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e24c5731536a9820b6f42293551c582e2f47cc23
X-Git-Newrev: e5709388eb519e79720b4ae8ca7c67bd80513a6c
X-Patchwork-Hint: ignore
Message-Id: <20210826220132.9FD2C8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpv: vaapi-drm needs
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5709388eb519e79720b4ae8ca7c67bd80513a6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Build of vaapi-drm without egl-drm is broken since commit
6ec47c4e59c7c8c57e972dab985c8a2ba0bf7174.

egl-drm has been added with commit
031df474c24f92757ac95ade572b90995ebdc6a2 and it is only available with
mesa3d because of the gbm dependency:
https://github.com/mpv-player/mpv/blob/0b56e1c00a57fdb767674462c299a5c973a9e373/wscript#L571

Indeed, at the moment, mesa3d is the only gbm provider in buildroot.

Fixes:
 - http://autobuild.buildroot.org/results/83d6dcbb77ab8754aefcdcf90baeaff9db2a1c81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mpv/mpv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..91e31dd150 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -181,7 +181,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += --enable-vaapi
 MPV_DEPENDENCIES += libva
-ifeq ($(BR2_PACKAGE_LIBDRM),y)
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
 MPV_CONF_OPTS += --enable-vaapi-drm
 else
 MPV_CONF_OPTS += --disable-vaapi-drm
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
