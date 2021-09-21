Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0DBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:03:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F1F61183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79F1F61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485358347D;
	Tue, 21 Sep 2021 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMmJ7RKOPuXd; Tue, 21 Sep 2021 13:03:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5FE83611;
	Tue, 21 Sep 2021 13:03:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC38D1BF352
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC15A404E3
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rIkyi_Hcyhl for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACC2D40322
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BA01EC0003;
 Tue, 21 Sep 2021 13:03:29 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:18 +0200
Message-Id: <20210921130326.3462783-2-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] package/opengl/libgbm: new virtual package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
wayland.  To enable building libgbm in mesa3d without x11 & wayland we
need to create a virtual package for libgbm.

Also other packages besides mesa3d may provide libgbm.so, see
http://patchwork.ozlabs.org/patch/647235/
http://patchwork.ozlabs.org/patch/939703/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opengl/Config.in        | 1 +
 package/opengl/libgbm/Config.in | 6 ++++++
 package/opengl/libgbm/libgbm.mk | 7 +++++++
 3 files changed, 14 insertions(+)
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
index 0000000000..ee18c4e6cb
--- /dev/null
+++ b/package/opengl/libgbm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBGBM
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	string
+	depends on BR2_PACKAGE_HAS_LIBGBM
diff --git a/package/opengl/libgbm/libgbm.mk b/package/opengl/libgbm/libgbm.mk
new file mode 100644
index 0000000000..5b3d8262a5
--- /dev/null
+++ b/package/opengl/libgbm/libgbm.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libgbm
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
