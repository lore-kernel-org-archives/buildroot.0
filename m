Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E33EC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3E1610B3;
	Mon, 19 May 2025 10:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYELe34PnxUC; Mon, 19 May 2025 10:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A1870792
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A1870792;
	Mon, 19 May 2025 10:53:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 219DE193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7C5741E79
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5GWj_HyQvi5 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4DD411F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4DD411F9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC2578348A; Mon, 19 May 2025 10:39:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 22:21:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef3c3bc9b17dad16e63d6519c0f037e7ec65e976
X-Git-Newrev: 028bdac7edf02820209c82f134744f0138f1da5b
X-Patchwork-Hint: ignore
Message-Id: <20250519103952.CC2578348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: improve
 reproducibility for optional dependencies
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=028bdac7edf02820209c82f134744f0138f1da5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libcamera has some optional dependencies that automatically detected at
build time.

To improve reproducibility, we should add a dependency on those optional
dependencies if the symbols that build them are enabled so that the
order in which packages are built does not influence the libcamera
package.

Note that the optional libyuv dependency isn't added as:
1) it is only used for the virtual pipeline and the android feature,
   both of which are disabled/not supported right now,
2) libcamera has it in a submodule if missing (though if that works with
   Buildroot is to be determined),
3) adding the dependency isn't enough as meson somehow doesn't find the
   dependency,

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/libcamera.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index ac5c12ff72..b5b17a5c94 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -82,6 +82,27 @@ LIBCAMERA_CONF_OPTS += -Dcam=enabled
 LIBCAMERA_DEPENDENCIES += libevent
 endif
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+# Optional dependency on libdw
+LIBCAMERA_DEPENDENCIES += elfutils
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBCAMERA_DEPENDENCIES += jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+LIBCAMERA_DEPENDENCIES += libdrm
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+LIBCAMERA_DEPENDENCIES += libunwind
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2),y)
+LIBCAMERA_DEPENDENCIES += sdl2
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBCAMERA_DEPENDENCIES += tiff
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
