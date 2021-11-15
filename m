Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886BCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:26:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 183B161AA5
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 183B161AA5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA25580E3E;
	Mon, 15 Nov 2021 15:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5rEyVqAKAwS; Mon, 15 Nov 2021 15:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E84F80DDE;
	Mon, 15 Nov 2021 15:26:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E161BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87C2D403BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3-s0d9iklYQ for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F6D740178
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:26:08 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 63D9720000E;
 Mon, 15 Nov 2021 15:26:05 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 16:26:04 +0100
Message-Id: <20211115152604.84814-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115152604.84814-1-kory.maincent@bootlin.com>
References: <20211115152604.84814-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/psplash: add support to missing
 configure options
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

Add support to three configure options:
--disable-startup-msg: Disable text banner output on startup
--disable-progress-bar: Disable progress bar
--enable-img-fullscreen: Enable the logo image in fullscreen mode

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change since v1:
Remove the crap .config.in.swp

 package/psplash/Config.in  | 15 +++++++++++++++
 package/psplash/psplash.mk | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0..e79e9e85c4 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,21 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN
+	bool "use fullscreen mode"
+	help
+	  Enable the psplash image in fullscreen mode.
+
+config BR2_PACKAGE_PSPLASH_NO_STARTUP_MSG
+	bool "disable startup message"
+	help
+	  Disable text banner output on startup.
+
+config BR2_PACKAGE_PSPLASH_NO_PROGRESS_BAR
+	bool "disable progress bar"
+	help
+	  Disable the management of the progress bar.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 5e61f2392f..a7d36697a6 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -18,6 +18,18 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
+PSPLASH_CONF_OPTS += --enable-img-fullscreen
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_NO_STARTUP_MSG),y)
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_NO_PROGRESS_BAR),y)
+PSPLASH_CONF_OPTS += --disable-progress-bar
+endif
+
 PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
 
 ifneq ($(PSPLASH_IMAGE),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
