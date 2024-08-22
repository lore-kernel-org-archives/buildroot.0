Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB367C5321E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3362360E4B;
	Thu, 22 Aug 2024 18:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Saa9IfZDi8Wo; Thu, 22 Aug 2024 18:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0675A60E51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0675A60E51;
	Thu, 22 Aug 2024 18:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8B881BF381
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C145981A46
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXJj2XUK3s02 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D87B81142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D87B81142
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D87B81142
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 18:37:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-371b97cfd6fso700958f8f.2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 11:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724351866; x=1724956666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKzCjo3qdZIf2pi418S63Vz2bGbb0Xdz5SnU/PMgetQ=;
 b=j9kSBVL2ZCMBkaLSnqIg2x1E4sxLpgcjtySEE+qdHKm6WyLQiKS0li3FieEeZu692i
 1fR0sw6IEj5k/4jZC6Lx2CVv7K5EZF+J1JoDVJylr+QUpHBSPAfC1ydPecH59aN5/gos
 P2BmfdZ7Y7+1CUGROu76OWzM6CmMBaRh/1et2QSgI9dKE/STaUY6tznSyNIu4JdhHpkk
 GfvtgJCLO1MWQeh7ICQacHfOWGEiJkbDji7f20dwdBwmbi2Whj+JxErGBTevgjhydKmi
 kOilk8vHUe9gsumWomB1kFlaIbCekzJfSDWiaq2xCOQXoK6m2xY+HaPRalJFYd1BJnUS
 d6Bw==
X-Gm-Message-State: AOJu0Yz+W1gbHKFa4qxbF+d1Yd49nOy8BAO0pK/BoXr+rjUK/3zwnEJa
 DEiYQeO+uNtV2owdlRqV18k3boDLfcrCcSth54hNwFSayG1mMw5c0NXWbHGtYlaizpVIHNGWi4Q
 oFxY=
X-Google-Smtp-Source: AGHT+IERlVEJSV3yn2vmWwgGbsZ4s1y+uJGrdkeKojE6+wBGhQBLmnaYnMFyS+q8G8wo6xjrNyaKoQ==
X-Received: by 2002:adf:a3d0:0:b0:371:8a74:4170 with SMTP id
 ffacd0b85a97d-372fd6d5744mr4225924f8f.24.1724351866197; 
 Thu, 22 Aug 2024 11:37:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811001fsm2276397f8f.20.2024.08.22.11.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 11:37:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 20:37:40 +0200
Message-ID: <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724351866; x=1724956666;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKzCjo3qdZIf2pi418S63Vz2bGbb0Xdz5SnU/PMgetQ=;
 b=XTUvchDoUMkK3xWrY5IPVgmBLqa2pAxt4Ca7B4La0Ykj18yUYsGfFuNaa5YUVZA7ze
 ZmCAcYIGMfCnDNzJ6C0l6oHXvSKOS3VVDSRrgZBbh5uaPoeA8BbLwZl6HLkrr69MA0JQ
 owwQ4myw5+ft0fu1l2FChTsb1OvT+XHcIr/gM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XTUvchDo
Subject: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package contains a Linux init script suitable for resource-limited
systems which can be used as an alternative to the one provided by
Busybox.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

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
 package/tinyinit/Config.in   | 10 ++++++++++
 package/tinyinit/init        | 32 ++++++++++++++++++++++++++++++++
 package/tinyinit/tinyinit.mk | 12 ++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/tinyinit/Config.in
 create mode 100644 package/tinyinit/init
 create mode 100644 package/tinyinit/tinyinit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af35431b..45cc1cc48996 100644
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
index 317f859684fe..ddf378b13e01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2869,6 +2869,7 @@ menu "System tools"
 	source "package/tar/Config.in"
 	source "package/tealdeer/Config.in"
 	source "package/thermald/Config.in"
+	source "package/tinyinit/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/tinyinit/Config.in b/package/tinyinit/Config.in
new file mode 100644
index 000000000000..2ceb8e191e23
--- /dev/null
+++ b/package/tinyinit/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TINYINIT
+	bool "tinyinit"
+	depends on BR2_INIT_NONE
+	help
+	  A Linux tiny initialization script suitable for resource
+	  limited systems, which can be used as an alternative to the
+	  one provided by Busybox.
+
+comment "tinyinit needs BR2_INIT_NONE, i. e. no init system installed"
+	depends on !BR2_INIT_NONE
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
index 000000000000..c7bb144dee68
--- /dev/null
+++ b/package/tinyinit/tinyinit.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# tinyinit
+#
+################################################################################
+
+define TINYINIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(TINYINIT_PKGDIR)/init $(TARGET_DIR)/sbin/init
+	(cd $(TARGET_DIR); ln -sf /sbin/init init)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
