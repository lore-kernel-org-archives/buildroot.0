Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C1AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0C76103C
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 19:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD0C76103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B41560B1C;
	Wed, 27 Oct 2021 19:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c6Z3SUYA-h6; Wed, 27 Oct 2021 19:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6FBA60B14;
	Wed, 27 Oct 2021 19:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7D961BF333
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4DBF60B14
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOQJtjmKCmFK for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01D046063B
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 19:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BA19988E85; Wed, 27 Oct 2021 19:26:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 21:22:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 343643fdf1c68927439da34992953834e9c05fbe
X-Git-Newrev: 4a541ee93242e67f7fab625607f5501c6925d451
X-Patchwork-Hint: ignore
Message-Id: <20211027192622.BA19988E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opengl/libgbm: new virtual package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a541ee93242e67f7fab625607f5501c6925d451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 18.0-Leia, Kodi implements stand-alone gbm support alongside x11 &
wayland.  To enable building libgbm in mesa3d without x11 & wayland we
need to create a virtual package for libgbm.

Also other packages besides mesa3d may provide libgbm.so, see
http://patchwork.ozlabs.org/patch/647235/
http://patchwork.ozlabs.org/patch/939703/

It turns out that libgbm has seen several additions in its API over
time, and therefore not all libgbm implementations provide support for
all features. In order to account for this, this commit adds two hidden
boolean options that allow libgbm providers to indicate which optional
features they support:
BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT and
BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF. These booleans must be selected
by the packages providing libgbm implementations, and depended on by
packages using libgbm.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[ Kamel : introduce gbm api features ]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/opengl/Config.in        |  1 +
 package/opengl/libgbm/Config.in | 24 ++++++++++++++++++++++++
 package/opengl/libgbm/libgbm.mk |  9 +++++++++
 3 files changed, 34 insertions(+)

diff --git a/package/opengl/Config.in b/package/opengl/Config.in
index cbc001427d..cfa51def45 100644
--- a/package/opengl/Config.in
+++ b/package/opengl/Config.in
@@ -1,5 +1,6 @@
 source "package/opengl/libgl/Config.in"
 source "package/opengl/libegl/Config.in"
+source "package/opengl/libgbm/Config.in"
 source "package/opengl/libgles/Config.in"
 source "package/opengl/libopencl/Config.in"
 source "package/opengl/libopenvg/Config.in"
diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
new file mode 100644
index 0000000000..7aa3efb97a
--- /dev/null
+++ b/package/opengl/libgbm/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_HAS_LIBGBM
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	string
+	depends on BR2_PACKAGE_HAS_LIBGBM
+
+config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	bool
+	depends on BR2_PACKAGE_HAS_LIBGBM
+
+# gbm implementations should select this option if they provide the
+# format modifier plane count feature. This API was initially introduced
+# in mesa3d version 17. A gbm implementation provides this feature if it
+# is implement function gbm_device_get_format_modifier_plane_count.
+
+config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	bool
+	depends on BR2_PACKAGE_HAS_LIBGBM
+
+# gbm implementations should select this option if they provide the
+# dma buffer feature. This API was initially introduced in mesa3d
+# version 10. A gbm implementation provides this feature if it
+# is implement function gbm_bo_get_fd.
diff --git a/package/opengl/libgbm/libgbm.mk b/package/opengl/libgbm/libgbm.mk
new file mode 100644
index 0000000000..ecab234720
--- /dev/null
+++ b/package/opengl/libgbm/libgbm.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# libgbm
+#
+################################################################################
+
+# This package requires to install a gbm.pc which needs
+# to be provided by GBM providers.
+$(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
