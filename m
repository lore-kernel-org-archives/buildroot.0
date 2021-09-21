Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C656AC4332F
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94122611C5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94122611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F38082C8F;
	Tue, 21 Sep 2021 13:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXfWW2H7zDuD; Tue, 21 Sep 2021 13:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA39B80EAD;
	Tue, 21 Sep 2021 13:04:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0BB1BF352
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09BAF82D75
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-h8MVPZVhwX for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E4B282C84
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5F2F3E0002;
 Tue, 21 Sep 2021 13:03:30 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:19 +0200
Message-Id: <20210921130326.3462783-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/8] package/opengl/libgbm: introduce api
 features
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

We introduce two feature that shall help user choosing the version
implemented by a libgbm provider. This foresightly avoid building package
without having the required libgbm version (e.g. kmscube, qt5, sdl2
etc.)

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/opengl/libgbm/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/opengl/libgbm/Config.in b/package/opengl/libgbm/Config.in
index ee18c4e6cb..f6d68e847a 100644
--- a/package/opengl/libgbm/Config.in
+++ b/package/opengl/libgbm/Config.in
@@ -4,3 +4,15 @@ config BR2_PACKAGE_HAS_LIBGBM
 config BR2_PACKAGE_PROVIDES_LIBGBM
 	string
 	depends on BR2_PACKAGE_HAS_LIBGBM
+
+config BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
+	bool
+	depends on BR2_PACKAGE_HAS_LIBGBM
+
+comment "feature implemented in mesa gbm api version 17 or later"
+
+config BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	bool
+	depends on BR2_PACKAGE_HAS_LIBGBM
+
+comment "feature implemented in mesa gbm api 10 or later"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
