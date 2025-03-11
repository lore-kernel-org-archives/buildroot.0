Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE1C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B1F24129F;
	Mon, 19 May 2025 10:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bd7S2m2TCH1S; Mon, 19 May 2025 10:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4171F412E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4171F412E1;
	Mon, 19 May 2025 10:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16445D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E959240D7A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9342uYAR1kv for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E40E240D37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E40E240D37
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2A3E8725C; Mon, 19 May 2025 10:39:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 19:13:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebcd82198f2c84efddf82c7be9b0782b4180ce93
X-Git-Newrev: 1c653dd19f531f66601faf109db1817b0b2141be
X-Patchwork-Hint: ignore
Message-Id: <20250519103941.E2A3E8725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera:
 force-disable qcam for now
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c653dd19f531f66601faf109db1817b0b2141be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/5b0dc8acd491f1d7b20f5b5f065b28212b9d4912/
http://autobuild.buildroot.net/results/61e4bce00a2aff3f531de6c1896d4dc1f92ba5e3/

qcam is based on Qt6 since commit 71aa3ceec30b ("apps: qcam: Port to Qt
6") which is part of the v0.3.1 release.

qcam being enabled when BR2_PACKAGE_QT5BASE_WIDGETS symbol is defined
breaks the build as it's missing the qt6 dependencies.

The migration to Qt 6 for the Buildroot package isn't straightforward
though as we're hitting a meson bug[1].

For now, let's just always disable qcam until we can get everything
fixed and migrated properly.

[1] https://github.com/mesonbuild/meson/issues/13018

Fixes: 72757d111a5d ("package/libcamera: bump to version 0.3.2")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dcfa54e5dd..b3132dc016 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -18,6 +18,7 @@ LIBCAMERA_DEPENDENCIES = \
 LIBCAMERA_CONF_OPTS = \
 	-Dandroid=disabled \
 	-Ddocumentation=disabled \
+	-Dqcam=disabled \
 	-Dtest=false \
 	-Dwerror=false
 LIBCAMERA_INSTALL_STAGING = YES
@@ -83,16 +84,6 @@ LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
 LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
-LIBCAMERA_CONF_OPTS += -Dqcam=enabled
-LIBCAMERA_DEPENDENCIES += qt5base
-ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
-LIBCAMERA_DEPENDENCIES += qt5tools
-endif
-else
-LIBCAMERA_CONF_OPTS += -Dqcam=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
