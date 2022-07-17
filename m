Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CA4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 12:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AE3D83F10;
	Sun, 17 Jul 2022 12:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AE3D83F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUrvVanKlT1m; Sun, 17 Jul 2022 12:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EDF483F03;
	Sun, 17 Jul 2022 12:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EDF483F03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CB2D1BF3D1
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1319C40412
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 12:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1319C40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFudWjxHqou1 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 12:55:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07F1D400F2
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 12:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F1D400F2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CA11083A87; Sun, 17 Jul 2022 12:42:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 14:55:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98ecdd1d1125f2529a8d61c01a2bec6d8dbc48d1
X-Git-Newrev: 030baf89fc9467329907abe07c292567e2f05c0f
X-Patchwork-Hint: ignore
Message-Id: <20220717124210.CA11083A87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: add explicit dependency
 on libevent if libevent package to be built
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

commit: https://git.buildroot.net/buildroot/commit/?id=030baf89fc9467329907abe07c292567e2f05c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cam application requires libevent. Since there's no Kconfig option
for it, cam building ability is checked by meson build system by default.

If libevent is present in the sysroot, cam is built.

The issue is that there's no explicit dependency on libevent in
libcamera package. This means that it is possible for libevent AND
libcamera to be built, but have libcamera be built before libevent.
Meaning that even if all requirements seem to be fulfilled, cam still
won't be enabled in some cases.

This fixes the possible race by expliciting the dependency to libevent
if the libevent package is enabled. Otherwise, explicitly disable cam
building as it's already known that it isn't going to build.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/libcamera.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 41d6a5abef..3f336cb797 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -84,6 +84,13 @@ else
 LIBCAMERA_CONF_OPTS += -Dqcam=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBCAMERA_CONF_OPTS += -Dcam=enabled
+LIBCAMERA_DEPENDENCIES += libevent
+else
+LIBCAMERA_CONF_OPTS += -Dcam=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBCAMERA_DEPENDENCIES += tiff
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
