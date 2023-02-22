Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9274C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 712CB41590;
	Wed, 22 Feb 2023 14:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 712CB41590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vx-cdOUAAieB; Wed, 22 Feb 2023 14:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A354241081;
	Wed, 22 Feb 2023 14:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A354241081
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BAF11BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2698F41193
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2698F41193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1LbUmwBujcb for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:53:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6545940278
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6545940278
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53FA0866E9; Wed, 22 Feb 2023 14:53:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:52:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0af2840b1b16dd95b9a468e46b6e275186e5447
X-Git-Newrev: cf4c94de51eb5c303a3e9ee62e97baa8b37d7461
X-Patchwork-Hint: ignore
Message-Id: <20230222145311.53FA0866E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: enable LIBAV only
 if libdrm and ffmpeg is present
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf4c94de51eb5c303a3e9ee62e97baa8b37d7461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
does enable LIBAV by default which depends on libdrm and ffpmeg.

Fixes:
- http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/

/home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
   13 | #include <libdrm/drm_fourcc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera-apps/libcamera-apps.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 290ee9a026..fe402ec3f4 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -29,6 +29,13 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
+LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
+else
+LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
+endif
+
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
