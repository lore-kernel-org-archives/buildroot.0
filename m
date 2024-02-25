Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B562C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 08:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7AE4071C;
	Sun, 25 Feb 2024 08:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7E3hOxhzhdW; Sun, 25 Feb 2024 08:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B004076E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B004076E;
	Sun, 25 Feb 2024 08:02:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED5A1BF232
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 757F640719
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UbOAFudFFSCW for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A95640722
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A95640722
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67A4787A8F; Sun, 25 Feb 2024 08:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 08:47:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9047058cd8addca8aedf274f2836f1f639c27eef
X-Git-Newrev: b89648b4d0d1c3ca985d5d97015990caf04e46ea
X-Patchwork-Hint: ignore
Message-Id: <20240225080241.67A4787A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: install all barebox images
 if none were specified
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

commit: https://git.buildroot.net/buildroot/commit/?id=b89648b4d0d1c3ca985d5d97015990caf04e46ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox-aux/Config.in | 9 +++++++--
 boot/barebox/barebox.mk            | 2 ++
 boot/barebox/barebox/Config.in     | 9 +++++++--
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index d39d24f763..4b0201ea67 100644
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
index 4c9df8d618..fe366989b9 100644
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
index 958e294e40..2fd70a84ae 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
