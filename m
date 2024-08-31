Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C4BCA1018
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 12:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3288B4242E;
	Sat, 31 Aug 2024 12:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1rRpJF9uTL9; Sat, 31 Aug 2024 12:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AAC34241F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AAC34241F;
	Sat, 31 Aug 2024 12:08:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6655A1BF5F5
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 607F042401
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 12:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxwOGqzjFoyC for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 12:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90131423FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90131423FF
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90131423FF
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 12:08:45 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c23f0a9699so879600a12.1
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 05:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725106123; x=1725710923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjJfoEd6aJRxK/ZXd9KzrdJcvsoV07mC6Y5AbeT3mhQ=;
 b=hutqYC2+Ewu4ghUx3PbJ5Vot14QxHSmTDmqi8koD50T2qbVDeOvx827OvtY91Rtw4z
 G+O/djZOv5JXZQtMoqhOI+dnzEp5PsiU34XCc9fzpplGSWXFn0A3LJ7QYIjVn8nMMGRo
 NNtkyuGMJ2ETKUpxEbteFHv+7r58eYj9kPs8Jq+PA9GWo73lwlp9Mly3GyFosY8WjaCK
 IRcw/+IBh1oVKoTENwELzwUnxSn7jkLRBi7rQiTBwd+5qx0bIbb1v3HwTZu3huCxJYvU
 M42ZYgSNqUxBZrBiv80U/iHH1RYdC8KlAKQeuH1z1bObbAHTwW+V8R2d++yz1DetoMrX
 2yxA==
X-Gm-Message-State: AOJu0Ywh9P1ulQPhSaiSJwYbcNqq/DRoBh/AMrgLEYnXziLXEiEdYOaA
 bEhZSTvJFODZCKiTkt/N9YC2lgx/E7SYZIGQMO07rnfxk6QKEkzvFbs/JPSGKVYnCtDmyWkCqIv
 tlgc=
X-Google-Smtp-Source: AGHT+IGfM9YJ2fpvF33+scLaxLDj9HCaKc+NGcWsuWPC2NaCei6KZLyd4T+78C9puFKkvHzNABeAXA==
X-Received: by 2002:a05:6402:2792:b0:5c2:4a98:7520 with SMTP id
 4fb4d7f45d1cf-5c24a987b9emr853788a12.31.1725106123293; 
 Sat, 31 Aug 2024 05:08:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ce4f47sm2938178a12.88.2024.08.31.05.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 05:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 14:08:31 +0200
Message-ID: <20240831120833.2915529-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725106123; x=1725710923;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vjJfoEd6aJRxK/ZXd9KzrdJcvsoV07mC6Y5AbeT3mhQ=;
 b=mWFlLF9qjvr8EesyRc9jFp3zzsxE1S1cJoyClLuOwCIGGrCq0eTRCLu0H6ldktc1dT
 jvKVMvzA8oz4ODC4vK/sRKJsTrL6gvWqkiRzXi8eAfItUs3g0cSBVRci0WkCNvseenBp
 pBmAxHsY4fqU587/GJXHUfgOp3YPNGUDJDwz4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mWFlLF9q
Subject: [Buildroot] [PATCH v4 1/3] package/tinyinit: new package
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
Cc: linux-amarula@amarulasolutions.com, Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package contains a Linux init script suitable for resource-limited
systems which can be used as an alternative to the one provided by
Busybox.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
 - Add tinyinit to Busybox dependencies
 - Add a comment to the tinyinit.mk just before the statements creating
   the symlink
 - Drop the comment from package/tinyinit/Config.in
 - Add the entry in the init selection in system/Config.in.

Changes v2 -> v3:
 - Add the init script
 - Drop the entry in the init selection in system/Config.in.

Changes v1 -> v2:
 - Rename tinit to tinyinit.
 - Put the script inside the tinyinit package without the need to use
   a github repo.
 - Update the commit message.

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/busybox/busybox.mk   |  1 +
 package/tinyinit/Config.in   |  8 ++++++++
 package/tinyinit/init        | 32 ++++++++++++++++++++++++++++++++
 package/tinyinit/tinyinit.mk | 13 +++++++++++++
 system/Config.in             |  9 +++++++++
 7 files changed, 65 insertions(+)
 create mode 100644 package/tinyinit/Config.in
 create mode 100644 package/tinyinit/init
 create mode 100644 package/tinyinit/tinyinit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec20c..cf62d0ed65ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -791,6 +791,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/sscep/
+F:	package/tinyinit/
 F:	package/uuu/
 
 N:	Dario Binacchi <dariobin@libero.it>
diff --git a/package/Config.in b/package/Config.in
index 211080345adc..af7f13a75f7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2868,6 +2868,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
+	source "package/tinyinit/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 204ebe0106ee..942875ee0e12 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_TINYINIT),tinyinit) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
new file mode 100644
index 000000000000..f68b030e7e0f
--- /dev/null
+++ b/package/tinyinit/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TINYINIT
+	bool "tinyinit"
+	depends on BR2_INIT_TINYINIT
+	imply BR2_PACKAGE_BUSYBOX
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
diff --git a/package/tinyinit/init b/package/tinyinit/init
new file mode 100644
index 000000000000..fbcb481010c2
--- /dev/null
+++ b/package/tinyinit/init
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+# This script replaces the default busybox init process to avoid having that
+# process staying alive and sleeping in the background, (uselessly) consuming
+# precious memory.
+
+# Mount procfs and sysfs
+/bin/mount -t proc proc /proc
+/bin/mount -t sysfs sysfs /sys
+
+# When the kernel is directly booted, devtmpfs is not automatically mounted.
+# Manually mount it if needed.
+devmnt=$(mount | grep -c devtmpfs)
+if [ "${devmnt}" -eq 0 ]; then
+    /bin/mount -t devtmpfs devtmpfs /dev
+fi
+
+# Use the /dev/console device node from devtmpfs if possible to not
+# confuse glibc's ttyname_r().
+# This may fail (E.G. booted with console=), and errors from exec will
+# terminate the shell, so use a subshell for the test
+if (exec 0</dev/console) 2>/dev/null; then
+    exec 0</dev/console
+    exec 1>/dev/console
+    exec 2>/dev/console
+fi
+
+# Clear memory to reduce page fragmentation
+echo 3 > /proc/sys/vm/drop_caches
+
+# Finally, let's start an interactive shell
+exec /bin/sh
diff --git a/package/tinyinit/tinyinit.mk b/package/tinyinit/tinyinit.mk
new file mode 100644
index 000000000000..ac1f0f736e38
--- /dev/null
+++ b/package/tinyinit/tinyinit.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinyinit
+#
+################################################################################
+
+define TINYINIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
+	# Downside: In non-initramfs systems the symlink isn't used/needed
+	(cd $(TARGET_DIR); ln -sf /sbin/init init)
+endef
+
+$(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index d7d59db47db7..974152bd23e6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -165,6 +165,15 @@ config BR2_INIT_TINI
 
 	  https://github.com/krallin/tini
 
+config BR2_INIT_TINYINIT
+	bool "tiny init"
+	select BR2_PACKAGE_TINYINIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
+
 config BR2_INIT_NONE
 	bool "Custom (none)"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
