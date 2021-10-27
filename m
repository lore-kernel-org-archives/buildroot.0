Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06FDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC236109F
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BC236109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E07E8195D;
	Wed, 27 Oct 2021 19:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJkEwryQtMBN; Wed, 27 Oct 2021 19:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A9F880F02;
	Wed, 27 Oct 2021 19:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1C691BF9CB
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E184640558
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpzcvHxSgCX2 for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C58840456
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D7B2E88E85; Wed, 27 Oct 2021 19:26:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:24:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba8d5aac8a561d54960f0c778e7db18c5e546ebf
X-Git-Newrev: 630530831fbf560d4a856b1f4e45ed57d9d94d67
X-Patchwork-Hint: ignore
Message-Id: <20211027192622.D7B2E88E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmscube: use libgbm virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=630530831fbf560d4a856b1f4e45ed57d9d94d67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmscube requires a libgbm implementation, which until now, only Mesa3D
was providing, so kmscube had a direct dependency on Mesa3D.

However, now that we have a proper libgbm virtual package, so this
commit converts the kmscube package to use the libegl, libgbm and
libgles virtual packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[ Kamel : add dependency on recent libgbm ]
[Arnout: fix syntax of Config.in comment; order depends alphabetically]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kmscube/Config.in  | 19 +++++++++++++++----
 package/kmscube/kmscube.mk |  2 +-
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index b6ad305bfb..7379675609 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -1,9 +1,20 @@
 config BR2_PACKAGE_KMSCUBE
 	bool "kmscube"
-	# requires libgbm from mesa3d
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
-	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	select BR2_PACKAGE_LIBDRM
 	help
 	  kmscube is an application to test kms/drm drivers.
 
-	  https://gitlab.freedesktop.org/mesa/kmscube
+	  https://cgit.freedesktop.org/mesa/kmscube/
+
+comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
+	depends on \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT || \
+		!BR2_PACKAGE_HAS_LIBGLES || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 7b458376dc..fc9a7f6f99 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -8,6 +8,6 @@ KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
-KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
+KMSCUBE_DEPENDENCIES = host-pkgconf libdrm libegl libgbm libgles
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
