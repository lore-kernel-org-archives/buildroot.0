Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB38C48BF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA6F40BA0;
	Mon, 19 Feb 2024 21:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wMbjhMgzVgYM; Mon, 19 Feb 2024 21:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F92540BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F92540BA7;
	Mon, 19 Feb 2024 21:33:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 977841BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9080B40B8C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VfjxiyPu5tdM for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:33:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de;
 envelope-from=a.fatoum@pengutronix.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 809D240BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809D240BAE
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 809D240BAE
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:33:09 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>) id 1rcBG7-0002av-SJ
 for buildroot@buildroot.org; Mon, 19 Feb 2024 22:33:07 +0100
Resent-From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Resent-To: buildroot@buildroot.org
Resent-Date: Mon, 19 Feb 2024 22:33:07 +0100
Resent-Message-ID: <a979040b-6215-4df9-8b87-1e31896e058e@pengutronix.de>
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1rcAqc-0004hS-EX; Mon, 19 Feb 2024 22:06:46 +0100
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1rcAqc-001irI-2E; Mon, 19 Feb 2024 22:06:46 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
 by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1rcAqb-001hzf-39;
 Mon, 19 Feb 2024 22:06:46 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 22:06:28 +0100
Message-Id: <20240219210628.407423-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-PTX-Original-Recipient: a.fatoum@pengutronix.de
X-PTX-Original-Recipient: afa@pengutronix.de
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: buildroot@buildroot.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Subject: [Buildroot] [PATCH] boot/barebox: install all barebox images if
 none were specified
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
Cc: barebox@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When selecting barebox in menuconfig, BR2_TARGET_BAREBOX_IMAGE_FILE will
be empty by default, which causes Buildroot to install whatever the
barebox-flash-image symlink points at for barebox versions >= v2012.10.0.

This is an outdated fallback, because barebox-flash-image is only valid
when the barebox build produces a single binary. Virtually all new
defconfigs added in the last couple of years are multiconfig
(CONFIG_PBL_IMAGE=y) however, meaning that a single imx_v7_defconfig
or multi_v8_defconfig will produce many images that support different
boards or even platforms.

As there is no single valid target for barebox-flash-image to point at
in this case, this symlink will point at a non-existing
'multi-image-build' to alert the user to this fact.

As replacement for barebox-flash-image, barebox commit 550cf79c216a
("Make list of flash images and fix link all single image cases") first
released with v2015.12.0 creates a barebox-flash-images file with a list
of all images built by barebox.

Have buildroot use that file as a fallback before trying
barebox-flash-image to have a fallback that works for any recent barebox
defconfig as well.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 boot/barebox/barebox-aux/Config.in | 9 +++++++--
 boot/barebox/barebox.mk            | 2 ++
 boot/barebox/barebox/Config.in     | 9 +++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index d39d24f763e0..4b0201ea6758 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -36,8 +36,13 @@ config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
 	  the images directory.
 
 	  If left empty, defaults to:
-	  - barebox.bin for barebox versions older than 2012.10.
-	  - barebox-flash-image for later versions.
+	  - all images as listed in barebox-flash-images (>= v2015.12.0)
+	  - the image pointed at by barebox-flash-image (>= v2012.10.0)
+	  - barebox.bin for even older barebox versions
+
+	  In any case, this only influences the artifacts collected by
+	  Buildroot. They will still need to be referenced from image
+	  packages or flashed separately onto the hardware.
 
 config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV
 	bool "Generate an environment image"
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 4c9df8d6180b..fe366989b9d8 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -151,6 +151,8 @@ $(1)_IMAGE_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE))
 define $(1)_INSTALL_IMAGES_CMDS
 	if test -n "$$($(1)_IMAGE_FILES)"; then \
 		cp -L $$(foreach image,$$($(1)_IMAGE_FILES),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
+	elif test -e $$(@D)/barebox-flash-images ; then \
+		cp -L $$(foreach image,$$(shell cat $$(@D)/barebox-flash-images),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
 	elif test -h $$(@D)/barebox-flash-image ; then \
 		cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
 	else \
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index 958e294e40b6..2fd70a84aec3 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -36,8 +36,13 @@ config BR2_TARGET_BAREBOX_IMAGE_FILE
 	  the images directory.
 
 	  If left empty, defaults to:
-	  - barebox.bin for barebox versions older than 2012.10.
-	  - barebox-flash-image for later versions.
+	  - all images as listed in barebox-flash-images (>= v2015.12.0)
+	  - the image pointed at by barebox-flash-image (>= v2012.10.0)
+	  - barebox.bin for even older barebox versions
+
+	  In any case, this only influences the artifacts collected by
+	  Buildroot. They will still need to be referenced from image
+	  packages or flashed separately onto the hardware.
 
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
-- 
2.39.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
