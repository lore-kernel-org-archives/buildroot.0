Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FC3C433FE
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BB0611AE
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62BB0611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415684098E;
	Thu,  7 Oct 2021 09:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiYAbRtCJknH; Thu,  7 Oct 2021 09:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38564094B;
	Thu,  7 Oct 2021 09:53:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8E511BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8E2740948
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fUtsljyUDW4 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C497540947
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B165F60015;
 Thu,  7 Oct 2021 09:51:59 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:46 +0200
Message-Id: <20211007095147.688449-6-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 6/7] package/kmscube: use libgbm virtual
 package
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

kmscube requires a libgbm implementation, which until now, only Mesa3D
was providing, so kmscube had a direct dependency on Mesa3D.

However, now that we have a proper libgbm virtual package, so this
commit converts the kmscube package to use the libegl, libgbm and
libgles virtual packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[ Kamel : add dependency on recent libgbm ]
---
Changes v2 -> v3:
 - Fixed comment suggestions

 package/kmscube/Config.in  | 16 ++++++++++++----
 package/kmscube/kmscube.mk |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index b6ad305bfb..8c5fe9b7b0 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -1,9 +1,17 @@
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
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGBM ||
+	!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT ||
+	!depends on BR2_PACKAGE_HAS_LIBGLES || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index 7b458376dc..5719f72ba3 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -8,6 +8,6 @@ KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
-KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
+KMSCUBE_DEPENDENCIES = host-pkgconf libgles libegl libgbm libdrm
 
 $(eval $(meson-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
