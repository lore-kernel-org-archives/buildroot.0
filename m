Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7E0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 10:45:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD9361C15
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 10:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD9361C15
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB0BC4040B;
	Tue, 16 Nov 2021 10:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUDQ6ZRE8rCa; Tue, 16 Nov 2021 10:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA66240227;
	Tue, 16 Nov 2021 10:45:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF3481BF589
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 10:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D58E40227
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 10:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_YTooJMy-BA for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 10:45:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E8D040102
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 10:45:38 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E8ECC40002;
 Tue, 16 Nov 2021 10:45:34 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 16 Nov 2021 11:45:34 +0100
Message-Id: <20211116104534.18868-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/psplash: add support for missing
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
--enable-startup-msg: Enable text banner output on startup
--enable-progress-bar: Enable progress bar
--enable-img-fullscreen: Enable the logo image in fullscreen mode

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change since v1:
Remove the crap .config.in.swp

Change since v2:
Use both side of enable/disable configure option condition.
Use positive options in Kconfig.


 package/psplash/Config.in  | 17 +++++++++++++++++
 package/psplash/psplash.mk | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index da99b264e0..edd30dcb4d 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE
 	  Use a personalized png image as boot splash.
 	  Let it empty if you want to keep the psplash default image.
 
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN
+	bool "use fullscreen mode"
+	help
+	  Enable the psplash image in fullscreen mode.
+
+config BR2_PACKAGE_PSPLASH_STARTUP_MSG
+	bool "enable startup message"
+	default y
+	help
+	  Enable text banner output on startup.
+
+config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
+	bool "enable progress bar"
+	default y
+	help
+	  Enable the management of the progress bar.
+
 endif
 
 comment "psplash needs a toolchain w/ wchar"
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 5e61f2392f..e5b212381a 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -18,6 +18,24 @@ else
 PSPLASH_CONF_OPTS += --without-systemd
 endif
 
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
+PSPLASH_CONF_OPTS += --enable-img-fullscreen
+else
+PSPLASH_CONF_OPTS += --disable-img-fullscreen
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
+PSPLASH_CONF_OPTS += --enable-startup-msg
+else
+PSPLASH_CONF_OPTS += --disable-startup-msg
+endif
+
+ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
+PSPLASH_CONF_OPTS += --enable-progress-bar
+else
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
