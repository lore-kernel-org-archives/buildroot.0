Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD9FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:05:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B04761183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B04761183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1A7840668;
	Tue, 21 Sep 2021 13:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y9EIhkc5c-Cj; Tue, 21 Sep 2021 13:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C18040665;
	Tue, 21 Sep 2021 13:05:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B775D1BF9AD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C3B60825
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQTxv7_edbIR for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC17D60689
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C52D6C0011;
 Tue, 21 Sep 2021 13:03:30 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:20 +0200
Message-Id: <20210921130326.3462783-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/8] package/mesa3d: add gbm api features
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Introduce gbm features so that each packages depending
on it can choose which implementation is required.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/mesa3d/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eb7c1eef46..a181a363da 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -387,6 +387,9 @@ config BR2_PACKAGE_MESA3D_GBM
 	bool "gbm"
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER \
 		|| (BR2_PACKAGE_MESA3D_GALLIUM_DRIVER && BR2_PACKAGE_MESA3D_OPENGL_EGL)
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	help
 	  Enable Generic Buffer Management (gbm)
 
@@ -423,6 +426,9 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
+
 config BR2_PACKAGE_PROVIDES_LIBGL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
