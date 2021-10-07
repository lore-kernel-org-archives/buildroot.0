Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F395EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:31:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9758A6113E
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9758A6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E1154039A;
	Thu,  7 Oct 2021 09:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rreWBuVMeiOV; Thu,  7 Oct 2021 09:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F59F403A4;
	Thu,  7 Oct 2021 09:31:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B20001BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A205960F7E
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lu2AR_5qXzkf for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:31:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7241960F7A
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:31:06 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B22E3FF816;
 Thu,  7 Oct 2021 09:31:02 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:31:01 +0200
Message-Id: <20211007093101.1643900-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/psplash: add support to psplash
 personalized png image
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
Cc: phil.eichinger@gmail.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an configuration to use personalized png image. If the configuration is
empty we keep the psplash default image.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/psplash/Config.in  | 10 ++++++++++
 package/psplash/psplash.mk |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index 5053ebacf7..da99b264e0 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -27,5 +27,15 @@ config BR2_PACKAGE_PSPLASH
 
 	  http://git.yoctoproject.org/cgit/cgit.cgi/psplash/
 
+if BR2_PACKAGE_PSPLASH
+
+config BR2_PACKAGE_PSPLASH_IMAGE
+	string "psplash image"
+	help
+	  Use a personalized png image as boot splash.
+	  Let it empty if you want to keep the psplash default image.
+
+endif
+
 comment "psplash needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index a0f01869b4..882c17704a 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -18,6 +18,14 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
+
+define PSPLASH_COPY_IMAGE
+	$(if $(PSPLASH_IMAGE),cp $(PSPLASH_IMAGE) $(@D)/base-images/psplash-poky.png)
+endef
+
+PSPLASH_POST_EXTRACT_HOOKS += PSPLASH_COPY_IMAGE
+
 define PSPLASH_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/psplash/psplash-start.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
