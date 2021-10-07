Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE36C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33AB7610EA
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33AB7610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE4D640143;
	Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WmiZodae8fFO; Thu,  7 Oct 2021 09:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA48840399;
	Thu,  7 Oct 2021 09:52:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3540D1BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3196940948
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vi77dYH94VeR for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:51:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B402E40947
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:51:57 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B736520000F;
 Thu,  7 Oct 2021 09:51:54 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:41 +0200
Message-Id: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/7] package/opengl/libgbm: new virtual
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
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
wayland.  To enable building libgbm in mesa3d without x11 & wayland we
need to create a virtual package for libgbm.

Also other packages besides mesa3d may provide libgbm.so, see
http://patchwork.ozlabs.org/patch/647235/
http://patchwork.ozlabs.org/patch/939703/

We also introduce two feature that shall help user choosing the version
implemented by a libgbm provider. This foresightly avoid building package
without having the required libgbm version (e.g. kmscube, qt5, sdl2
etc.)

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
---
Changes v1 -> v2:
 - Squashed patch 1/2
 - Added more relevant comment for each features added
Changes v2 -> v3:
 - Updated commit message

 package/opengl/Config.in        |  1 +
 package/opengl/libgbm/Config.in | 24 ++++++++++++++++++++++++
 package/opengl/libgbm/libgbm.mk |  9 +++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/opengl/libgbm/Config.in
 create mode 100644 package/opengl/libgbm/libgbm.mk

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
