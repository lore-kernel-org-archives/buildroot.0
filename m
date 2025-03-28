Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A620DC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7552481F77;
	Fri, 28 Mar 2025 18:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnB5o_9bWXKA; Fri, 28 Mar 2025 18:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182F181343
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182F181343;
	Fri, 28 Mar 2025 18:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEB11B8
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A247F4F325
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XspZPe5BCLWF for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:05:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D5554F2EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D5554F2EC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D5554F2EC
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf89f81c5so2709285e9.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185098; x=1743789898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvX8WzES6DqbF2YLYrnftqFohIqWpUEj67veG4OFFV4=;
 b=QK5mN5y50P4nKDjjyc6SPK2umRsibkQ250QVlnuLf1ocw/DCwwF1402iJ+0OXRqgi6
 OZByHZKg4mFoqgaHV8Zds1IM+5kvmdqX1fqjvvFEJKY9jnIGgZoojINOBwTrBDexnuzG
 2Ywyo1wpatKnNghTI/tBtnotqNOZmhsYj+dzJAH0jtXjSBaGmBFUi8k261OlqRBgRTtj
 c0zaTlaG2T4tNAWN6VcmKg4+MP8aY0rWDicSEBsr6l/eh9dJhj3PwsvjdJRkScilukAg
 bWLg9fSr5KkAvobtVkm1pt1eYpdxpVIsFWoBz93artVJYFx0y4LdvZqAvu9+cTCmSd4i
 uAIA==
X-Gm-Message-State: AOJu0Yyb0fOQ7FOlxVXT8FA+Gqu61xLvhgfnPhYlsT0VDCFi+QUHsh+r
 pBwxmuNTMvf2kRwlKA/Dp4aJbh9qIi7JxbYLepucSknXeSJBkUUCQL2yJYbT
X-Gm-Gg: ASbGncsYhXXqnhO6FOrZv8yyrVhtEx4End+YLHgOidX3kVeHJfUq9QEgv37Tkv/aH7l
 cir4LkIF9REAwB2jnZYtPoBMgloa2odnKJBrCbudX2tIKVyvObOoz87WaTMA3sfHtzhBtcYQPVd
 b878qWQIM7vxK7ntocS9q+r2uN3IZr8Mt8Cmi4jxfPlD0FGOvjwXsRPdKCUx8zkndPN+JjOW084
 UVVfoXZ5J4jGdr0GvhL/1ic8uCsf0B9nYhx9nRyjq6CYa6kAayHf6XQTPv7WnZc3rVvS9RKO0so
 UbRSiVAurBSHeDb5rrR67KR0QIiDlev4fQTIoQ==
X-Google-Smtp-Source: AGHT+IFkalZFZbufPw0uKrv2PRhUvlpag+nb7XEUqku5iduRWKxKdcd6JAjQZ5P2PzVLGJrL2i3LwQ==
X-Received: by 2002:a05:600c:1d12:b0:439:90f5:3919 with SMTP id
 5b1f17b1804b1-43db62bb8c7mr1213965e9.4.1743185097749; 
 Fri, 28 Mar 2025 11:04:57 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:56 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:22 +0200
Message-ID: <20250328180427.3434693-15-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185098; x=1743789898; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvX8WzES6DqbF2YLYrnftqFohIqWpUEj67veG4OFFV4=;
 b=VICMdt3eJQP5mkl6bz/fxBv+KnJKtP7DN6yN6kayPToB1MmvzC98V5n3gDIV4+x+XH
 iz9UmgqNIOgUGMCtRQ68kXk5h3PbnxzwgAaaRBkYB/5+3VrjHNOs5QdkrrN87nK+CWZ2
 G2byDecZrkSQh/Lh2CX7zlWVKc9pjA9bQF+zr3/H6DmonBImogWCj7+gsKZRPF7my3NC
 MIYy4ynNAR4wpJEYXPrGY5tKrcGHEgoAWMd+DDU8zKCVCknkvKqCY7soVrSO94nONNif
 D1DVV11gtmGP8Efvb8EhpaiPJr52SnruOacyVxG6YT3squW9OXPA7x79mp46ULg1HtNX
 7Ong==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VICMdt3e
Subject: [Buildroot] [PATCH v2 14/18] package/qoriq-mc-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a package which deploys the NXP MC (Management Complex) firmware
to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
LS2088A, LX2160A).

The MC firmware is deployed by default to the $O/images/ folder, where
it can be used by post-build scripts. Additionally, if
BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH is specified and if the
board mcinitcmd is written as such as to pick it up, it is optionally
deployed to the filesystem.

The API exposed by the MC firmware respects backwards compatibility
principles, which means that the latest firmware version can always be
(and should always be) used on a platform, irrespective of the Linux,
U-Boot, RCW and restool versions, even though the latest features might
not be used by older API consumers.

In terms of forwards compatibility, old MC firmware versions can be
used as long as the qoriq-restool package is built with a
MC_VERSION_COMPATIBLE variable (located in its Makefile, signifying
"minimum compatible version") older than, or equal to it.

If the use of qoriq-restool is not desired (networking objects are
statically created by the DPL), old MC firmware versions are supported
by U-Boot and the Linux kernel with a limited feature set. Thus, it
is still possible to an extent to use firmware versions older than
MC_VERSION_COMPATIBLE.

According to the upstream maintainer, the latest MC firmware version
is identified by the fact that it is always located at the HEAD of the
"master" branch:
https://lore.kernel.org/buildroot/482493f17e63d2b4cb285b50049ed8e6@free.fr/T/#m62c3ec04ba546ac9b0a194d13bc35fedeaa9deb0
Currently, the latest MC firmware version is 10.39.0. This version
should be in sync with the qoriq-mc-utils package.

At this stage, the latest lf-6.12.3-1.0.0 NXP BSP has qoriq-restool with
an MC_VERSION_COMPATIBLE='10.32.0', which means that it supports this MC
firmware version.
https://github.com/nxp-qoriq/restool/blob/lf-6.12.3-1.0.0/Makefile#L23

Note that the MC firmware also used to be distributed through
linux-firmware:
https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/dpaa2/mc?h=20250311
I don't know what was the reason for doing that, but it stopped being
updated and the versions there are quite old.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- more info in the commit message
- add the option of deploying the firmware to the filesystem

 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/qoriq-mc-binary/Config.in            | 55 ++++++++++++++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash |  3 ++
 package/qoriq-mc-binary/qoriq-mc-binary.mk   | 29 +++++++++++
 5 files changed, 89 insertions(+)
 create mode 100644 package/qoriq-mc-binary/Config.in
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.hash
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1c7f867808e..a76c7eeee6fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3371,6 +3371,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-mc-binary/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index b6aecf7d7707..c37c5382fe62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
+	source "package/qoriq-mc-binary/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-binary/Config.in b/package/qoriq-mc-binary/Config.in
new file mode 100644
index 000000000000..6008b6c45631
--- /dev/null
+++ b/package/qoriq-mc-binary/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_QORIQ_MC_BINARY
+	bool "qoriq-mc-binary"
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC coprocessor runs a closed-source, NXP-supplied
+	  firmware image that simplifies and abstracts the allocation
+	  and configuration of the networking hardware primitives into
+	  DPAA2 "objects".
+
+	  https://github.com/nxp-qoriq/qoriq-mc-binary
+
+if BR2_PACKAGE_QORIQ_MC_BINARY
+choice
+	prompt "QorIQ MC firmware target"
+	help
+	  Select the target SoC for the QorIQ MC firmware.
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	bool "ls1088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	bool "ls2080a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	bool "ls2088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	bool "lx2160a"
+
+endchoice
+
+config BR2_QORIQ_MC_BINARY_PLATFORM
+	string
+	default "ls1088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	default "ls2080a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	default "ls2088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	default "lx2160a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+
+config BR2_QORIQ_MC_BINARY_SUBDIR
+	string
+	default "lx216xa" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	default BR2_QORIQ_MC_BINARY_PLATFORM
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH
+	string "Path on target to install MC firmware"
+	help
+	  The MC firmware can optionally be deployed to the target
+	  filesystem at the path specified here. This is useful if
+	  the mcinitcmd U-Boot environment variable is configured
+	  to load the MC firmware from the filesystem.
+
+endif
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.hash b/package/qoriq-mc-binary/qoriq-mc-binary.hash
new file mode 100644
index 000000000000..ccddff28cdd1
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  912ad8effd5c7b08eb277719b1e021b8b1fe4022dc3d961b419562e1d2d7a860  qoriq-mc-binary-10.39.0.tar.gz
+sha256  7733839334c6c820f01f76bff7ee9b60411effdcee8b6017e1d5bcacbdb432f6  LICENSE
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
new file mode 100644
index 000000000000..e554a98fec9a
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# qoriq-mc-binary
+#
+################################################################################
+
+QORIQ_MC_BINARY_VERSION = 10.39.0
+QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
+QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
+QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
+QORIQ_MC_BINARY_INSTALL_IMAGES = YES
+ifeq ($(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH),)
+QORIQ_MC_BINARY_INSTALL_TARGET = NO
+endif
+
+QORIQ_MC_BINARY_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_BINARY_PLATFORM))
+QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
+QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
+QORIQ_MC_BINARY_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH))
+
+define QORIQ_MC_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/$(QORIQ_MC_BINARY_SUBDIR)/$(QORIQ_MC_BINARY_BIN) $(BINARIES_DIR)/mc.itb
+endef
+
+define QORIQ_MC_BINARY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/$(QORIQ_MC_BINARY_SUBDIR)/$(QORIQ_MC_BINARY_BIN) $(TARGET_DIR)/$(QORIQ_MC_BINARY_INSTALL_PATH)/mc.itb
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
