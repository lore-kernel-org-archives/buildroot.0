Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F46EC3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A4F4254A;
	Fri,  2 May 2025 11:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-YztkhYBkiO; Fri,  2 May 2025 11:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5840D4257C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5840D4257C;
	Fri,  2 May 2025 11:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BFBD22A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDB6B41E87
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SvPVP1UC5Mq for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA39F41A4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA39F41A4E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C808E860E9; Fri,  2 May 2025 11:11:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:12:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 707b800225a0cab88f7942a9540a716a6ada7409
X-Git-Newrev: d6fb51826f081cb5175f467a0ba64f27f3abdc9c
X-Patchwork-Hint: ignore
Message-Id: <20250502111136.C808E860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcamera:
 improve reproducibility for optional dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6fb51826f081cb5175f467a0ba64f27f3abdc9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 028bdac7edf02820209c82f134744f0138f1da5b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
