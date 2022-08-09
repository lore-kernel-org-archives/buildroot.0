Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2661C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 274D14160A;
	Wed, 10 Aug 2022 10:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 274D14160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcO_9_lMDl2g; Wed, 10 Aug 2022 10:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D4B40246;
	Wed, 10 Aug 2022 10:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2D4B40246
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E27B91BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE2E98242D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2E98242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayJ_2a1qs0KL for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:22:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CE6582422
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CE6582422
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4261787035; Wed, 10 Aug 2022 10:08:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Aug 2022 16:50:38 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: fd0238db2a40422ec9c4a4d58c6429f155ef0281
X-Git-Newrev: 4a94500c2189be2cf6f60f15942b061dad7b1f8b
X-Patchwork-Hint: ignore
Message-Id: <20220810100808.4261787035@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libcamera: add
 explicit dependency on libevent if libevent package to be built
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a94500c2189be2cf6f60f15942b061dad7b1f8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 030baf89fc9467329907abe07c292567e2f05c0f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
