Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66252C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14897414CA;
	Sun, 19 Dec 2021 07:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-sPIS6J4G5X; Sun, 19 Dec 2021 07:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6384341581;
	Sun, 19 Dec 2021 07:31:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D09A81BF2C2
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB6D960B3D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pp10cZuSTki for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:31:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD9CA60AB0
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:31:30 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B805C240008;
 Sun, 19 Dec 2021 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639899089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekpDsBOKSDH01uvybW6e1PcWBL5Xw2fVpHHoE0VxhVA=;
 b=cek1+onBshdt/s69paQqN5HCfa430cvf3ev4OZ4IT4fs3Zu8FB1ca7rgE4vC4TVb3eDKH4
 nEkXGEqALxKNuV8nOUIOBfE9thbKk6/f9WyG0FRFpZy4qIbNzKySMreBxS09l7gUmHQK9S
 LIz4Qp8k9ycPKM6GFwhh+u1oOV6zra68OQiUHEEmrDQ59ahQT11XDNam3Az77IfXbaSCbh
 +XccjWiLKzkpiH5wCpQRlBhmUKkRfVdEpC2Q4A1oksrods3f4lKLuHvJYk0ka3iBhcj4CE
 X60ATQIs9lVuWha+/gF/bqCZgMZN/koKzM/6o9L7GY4wdAuUSwU4rvFeHG1PyA==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 08:31:19 +0100
Message-Id: <20211219073119.1087539-3-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
References: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] fs/cpio: new option to use dracut tool
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds an option to invoke the dracut host tool, providing
a configuration file, instead of having a full cpio archive
of the whole target directory.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Changes v1 -> v2 (suggested by Arnoult and Yann)
  - was a new fs type, now an option of cpio
  - deals with the case of a build with no kernel
  - gets the kernel name in a smarter way
  - checks for the name of dracut configuration file

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 fs/cpio/Config.in | 28 ++++++++++++++++++++++++++++
 fs/cpio/cpio.mk   | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index c1151a2881..09c5bf46d3 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -7,6 +7,34 @@ config BR2_TARGET_ROOTFS_CPIO
 
 if BR2_TARGET_ROOTFS_CPIO
 
+choice
+	prompt "cpio type"
+config BR2_TARGET_ROOTFS_CPIO_FULL
+	bool "cpio the whole root filesystem (ie the content of 'target')"
+	help
+	  Build a cpio archive containing the whole the root filesystem.
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT
+	bool "Invoke dracut to make an initramfs"
+	depends on BR2_LINUX_KERNEL
+	select BR2_PACKAGE_HOST_DRACUT
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Builds an additional initramfs using dracut.
+	  This can be useful to create a recovery system,
+	  for instance.
+
+if BR2_TARGET_ROOTFS_CPIO_DRACUT
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "configuration file"
+endif
+
+endchoice
+
+endif # BR2_TARGET_ROOTFS_CPIO
+
+if BR2_TARGET_ROOTFS_CPIO_FULL
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 81f8c393d1..c5fbb05a57 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -29,6 +29,41 @@ endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
 
 ROOTFS_CPIO_PRE_GEN_HOOKS += ROOTFS_CPIO_ADD_INIT
 
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
+
+export TARGET_CROSS
+ROOTFS_CPIO_DEPENDENCIES += host-dracut
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DEPENDENCIES += linux
+endif
+
+ifeq ($(BR_BUILDING).$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y.)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+endif
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DRACUT_CMD_OPTS += --kver $(LINUX_VERSION_PROBED)
+else
+ROOTFS_CPIO_DRACUT_CMD_OPTS += --no_kernel
+endif
+
+define ROOTFS_CPIO_CMD
+	mkdir -p $(@D)/tmp
+	rm -rf $(@D)/tmp/*
+
+	$(HOST_DIR)/usr/bin/dracut_wrapper.sh \
+		$(ROOTFS_CPIO_DRACUT_CMD_OPTS) \
+		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		--tmpdir $(@D)/tmp \
+		-M \
+		--force \
+		--keep \
+		$@
+endef
+
+else ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
+
 # --reproducible option was introduced in cpio v2.12, which may not be
 # available in some old distributions, so we build host-cpio
 ifeq ($(BR2_REPRODUCIBLE),y)
@@ -53,4 +88,6 @@ endef
 ROOTFS_CPIO_POST_GEN_HOOKS += ROOTFS_CPIO_UBOOT_MKIMAGE
 endif
 
+endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
+
 $(eval $(rootfs))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
