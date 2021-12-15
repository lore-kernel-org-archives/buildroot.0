Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F297C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256E880F5C;
	Wed, 15 Dec 2021 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9E-BOMoi5Yt; Wed, 15 Dec 2021 18:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDDC0813F2;
	Wed, 15 Dec 2021 18:06:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AC7F1BF282
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B4240A3B
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 18:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oj8vpxJA1Mwc for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 18:06:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C5640A3A
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 18:06:26 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0FF2ACA1E2
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:34:37 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E0389240004;
 Wed, 15 Dec 2021 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1639589673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Pk9Db3KaCEpGgpX5tQqgBDmqWHmKt/GaNXz/c/lsns=;
 b=dpZ9m1qR7HeyBMFK89UiGXryplkaPH0qwFkOFD+/NSWa7js9UXP72PSRff592Tp7hiJ/mI
 jgVxd9avgEd3TAEOQAbLG6wjseMxID9Ag1ESpCfA1IayBSFBn34E1t4rqdW2uvyS3QqWrQ
 kOn58rEFbqHDXnNqYpoiDJzeFcq/+6fkM3GWDmAWQwSpvWoxXHuGE6+VXHKjHYr9dbGaCb
 uwoUiGpQ1fOMei7yKY1BIC98qxnV1WbfiIX8X6OeSft2Hm7wQEATyRiQdPFH8d1qNPk4x2
 9fsj8UAV4p6sy0qa7jCx5E0PtG2PN/AhYsGdoAyz7eJsdRDbIgOlqoIBeEa5QQ==
From: Thierry Bultel <thierry.bultel@linatsea.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 18:34:11 +0100
Message-Id: <20211215173411.274024-3-thierry.bultel@linatsea.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215173411.274024-1-thierry.bultel@linatsea.fr>
References: <20211215173411.274024-1-thierry.bultel@linatsea.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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

Adds an option to build an initramfs image,
using the dracut host tool.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
---
 fs/Config.in        |  1 +
 fs/dracut/Config.in | 13 +++++++++++
 fs/dracut/dracut.mk | 55 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 fs/dracut/Config.in
 create mode 100644 fs/dracut/dracut.mk

diff --git a/fs/Config.in b/fs/Config.in
index eee5e26bb2..3938f3b9a7 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -5,6 +5,7 @@ source "fs/btrfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
 source "fs/cramfs/Config.in"
+source "fs/dracut/Config.in"
 source "fs/erofs/Config.in"
 source "fs/ext2/Config.in"
 source "fs/f2fs/Config.in"
diff --git a/fs/dracut/Config.in b/fs/dracut/Config.in
new file mode 100644
index 0000000000..ee4220def8
--- /dev/null
+++ b/fs/dracut/Config.in
@@ -0,0 +1,13 @@
+config BR2_TARGET_ROOTFS_DRACUT
+	bool "Invoke dracut to make an initramfs"
+	default n
+	select BR2_PACKAGE_HOST_DRACUT
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Builds an additional initramfs using dracut. This can be useful to create a recovery system, for instance.
+	
+if BR2_TARGET_ROOTFS_DRACUT
+config BR2_TARGET_ROOTFS_DRACUT_CONF_FILE
+	string "configuration file"
+endif
+
diff --git a/fs/dracut/dracut.mk b/fs/dracut/dracut.mk
new file mode 100644
index 0000000000..9c91150e82
--- /dev/null
+++ b/fs/dracut/dracut.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# dracut to archive target filesystem
+#
+################################################################################
+
+ROOTFS_DRACUT_DEPENDENCIES = host-dracut host-uboot-tools
+
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
+
+define ROOTFS_DRACUT_ADD_INIT
+	if [ ! -e $(TARGET_DIR)/init ]; then \
+		ln -sf sbin/init $(TARGET_DIR)/init; \
+	fi
+endef
+
+else
+
+# devtmpfs does not get automounted when initramfs is used.
+# Add a pre-init script to mount it before running init
+# We must have /dev/console very early, even before /init runs,
+# for stdin/stdout/stderr
+define ROOTFS_DRACUT_ADD_INIT
+	if [ ! -e $(TARGET_DIR)/init ]; then \
+		$(INSTALL) -m 0755 fs/cpio/init $(TARGET_DIR)/init; \
+	fi
+	mkdir -p $(TARGET_DIR)/dev
+	mknod -m 0622 $(TARGET_DIR)/dev/console c 5 1
+endef
+
+endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
+
+ROOTFS_DRACUT_PRE_GEN_HOOKS += ROOTFS_DRACUT_ADD_INIT
+
+define ROOTFS_DRACUT_CMD
+
+	mkdir -p $(@D)/tmp
+	rm -rf $(@D)/tmp/*
+
+	DRACUT_LDD=$(TARGET_CROSS)ldd \
+	DRACUT_INSTALL="$(HOST_DIR)/lib/dracut/dracut-install"\
+	dracutbasedir=$(HOST_DIR)/usr/lib/dracut \
+	dracutsysrootdir=$(TARGET_DIR) \
+	$(HOST_DIR)/bin/dracut \
+	--kver $(BR2_LINUX_KERNEL_VERSION).0 \
+	-c $(BR2_TARGET_ROOTFS_DRACUT_CONF_FILE) \
+	--tmpdir $(@D)/tmp \
+	-M \
+	--force \
+	--keep \
+	$@
+
+endef
+
+$(eval $(rootfs))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
