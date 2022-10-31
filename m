Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5DC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A7160BEB;
	Mon, 31 Oct 2022 12:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A7160BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkHl3k8uyp1j; Mon, 31 Oct 2022 12:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92BB60C17;
	Mon, 31 Oct 2022 12:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A92BB60C17
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 826771BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F11F405DB
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F11F405DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4LA0dVPXIMW for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:13:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804CA4098B
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 804CA4098B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CE81878DF; Mon, 31 Oct 2022 12:13:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:12:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43c7fda8d6fd4834c2ee2d75abb0b9ed87120804
X-Git-Newrev: 27024049426483091b1d5edc73cd225307e79540
X-Patchwork-Hint: ignore
Message-Id: <20221031121311.6CE81878DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: add option to use
 custom cmdline.txt
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

commit: https://git.buildroot.net/buildroot/commit/?id=27024049426483091b1d5edc73cd225307e79540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the cmdline.txt file is installed in $(BINARIES_DIR) by the
rpi-firmware package. Overriding files in there can not be done with an
overlay (which only applies to $(TARGET_DIR)), and thus requires using
either a post-build or post-image script, which is not always very
practical when a custom file must be used.

Like was done in 689b9ac439ab (package/rpi-firmware: rework boot/config
file handling) for config.txt, add an option to allow users to specify
the path to a custom cmdline.txt.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 {package/rpi-firmware => board/raspberrypi}/cmdline.txt |  0
 package/rpi-firmware/Config.in                          |  7 +++++++
 package/rpi-firmware/rpi-firmware.mk                    | 10 +++++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/cmdline.txt b/board/raspberrypi/cmdline.txt
similarity index 100%
rename from package/rpi-firmware/cmdline.txt
rename to board/raspberrypi/cmdline.txt
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 8070dc3019..a9aeaed745 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -69,6 +69,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	  Path to a file stored as config.txt in the boot partiton
 	  of the generated SD card image.
 
+config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
+	string "Path to a file stored as boot/cmdline.txt"
+	default "board/raspberrypi/cmdline.txt"  # legacy
+	help
+	  Path to a file stored as cmdline.txt in the boot partiton
+	  of the generated SD card image.
+
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
 	default y
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d4d1d07b3f..6f5902fd52 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -35,6 +35,14 @@ define RPI_FIRMWARE_INSTALL_CONFIG
 endef
 endif
 
+RPI_FIRMWARE_CMDLINE_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE))
+ifneq ($(RPI_FIRMWARE_CMDLINE_FILE),)
+define RPI_FIRMWARE_INSTALL_CMDLINE
+	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CMDLINE_FILE) \
+		$(BINARIES_DIR)/rpi-firmware/cmdline.txt
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -79,9 +87,9 @@ endef
 endif # INSTALL_VCDBG
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
+	$(RPI_FIRMWARE_INSTALL_CMDLINE)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
