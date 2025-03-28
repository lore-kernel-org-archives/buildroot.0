Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA767C36016
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B5A81331;
	Fri, 28 Mar 2025 18:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XHgDwAsEq9x; Fri, 28 Mar 2025 18:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 553DD811CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 553DD811CC;
	Fri, 28 Mar 2025 18:05:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C3C11B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2B48405A1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNs3GURqaj6B for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ACE2240A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACE2240A9B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACE2240A9B
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39127effa72so196936f8f.2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185099; x=1743789899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TUbkd4ePF1t1J4WVxpEwWxkYw0pHV7XpmFkyop0ewc=;
 b=rUsqQEuLiMyD5vX52EyjjJCiSJQs4+DAGlXo8ahoATCS0qHp9xKthxRZceQO3UP+IR
 sy31ArbQ+GgX64B81w7DHciUgiWQmobY6P15yBRRBUNEPk6nZymCPWzUbEtOLiLLb1Hw
 50fa4ZJgPVY9yCnoqj5yGeP/pwe0PjkeEBZDHhuvLGxWb0rTFw14IZJjN1AMxh+6Hvmz
 f33Q8VVz2fiPpxWvY7uinCB+fVB25A3ow1wuBSmhLy/BfeVH3rRHLCy9MBRcJNUnratE
 AralsimWbBykkj9OpOitARrqxSqDtvR6wV0len0EOP0c1EG+FZYsKybfRmYJedsof65J
 bcrw==
X-Gm-Message-State: AOJu0YwijLKGjK3x9am4eiQgCcGSwMY+caS7RWqnH5YjsyrRbF+wWgjC
 fcxVe53v2tPowRpwUMlzRE7INQRhODUrWlOss6c26YpdaCEoJoMMFZKw8VFj
X-Gm-Gg: ASbGnctU9/tj8E4rkRArl90Ah2e55n10DGrITeDEIyvSrw7uhIAYvbApQcMnDk1Rddc
 a2tlDb7U+oQJuCPRMoaVmtj306sXryjlSRx3Rge/pYSVLL8UW8MQRultsd6E3oBadEkVh6Q5ZwR
 dZGwIFMisffnvMpzZfdSlOb5Cq08igQMjxFm7lM+/XkRVguHuTKWfNouibzUOHLHQ0eX1NMaXb1
 qZFBqYSsI/lEv/rAt4Cl7fu00gmrgRgIGFjDdbT6cWwVj4ELmPJPp+CCi8v+nVKPOrjaWy+YJqB
 QILENP/nbX8Kjdn0u8aqlVWE8Va6h287V3bWFA==
X-Google-Smtp-Source: AGHT+IHmR3Rl7sGjiNvfGvorYHn0i1TLq5e/t8EUOzIO0iWrPYw2R9lZ2nIwVFoJpYPySvtLaX8b0A==
X-Received: by 2002:a05:6000:2cb:b0:39c:cc7:3d3b with SMTP id
 ffacd0b85a97d-39c12115b48mr28553f8f.8.1743185099117; 
 Fri, 28 Mar 2025 11:04:59 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:04:58 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:23 +0200
Message-ID: <20250328180427.3434693-16-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185099; x=1743789899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TUbkd4ePF1t1J4WVxpEwWxkYw0pHV7XpmFkyop0ewc=;
 b=B4YX0lccwUfdYpRUAil/2mvH4o5FhMwreL8YsAiL7xEKm8nEsZPf4iz7M+7yn3DcT5
 ct471l6lnisRwI+WacDDQZOglXI069T608uhmK8zkr53bK1gyXVzKX2RIIAPMQBoxPhc
 j4rBMqV3TYnse7vaIpHxUuCnGB7km39Uii380YUKdWtb8WbsI8l72as11UVr+daV+rOu
 2/IM972n8ndKs+E9dVRcg2k/USGAUKcO+Moao4lLdhdH9Ev/X3FVab37n7NT2UEgPGbp
 AJ3zH6OmLtFxbJ0ctj6WDPUWsl4LYCwq3azfYKL+rDWOmdne+ssm4d6mL0SqNHMyc4uw
 6mqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B4YX0lcc
Subject: [Buildroot] [PATCH v2 15/18] package/qoriq-mc-utils: new package
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

The configuration files for the MC firmware binary are distributed
through a separate repository on GitHub, and need a different package.
They are licensed differently than the firmware itself, and unlike the
firmware, they are customizable.

There are two ways for a board to use this package - similar to
qoriq-rcw. If it is an NXP reference board or if the example files
otherwise work fine with it, it is recommended to set the _INTREE
variables to select a pre-existing DPL and DPC. Otherwise, if it is a
custom board, the best solution is to just provide the DPL and DPC dts
files in board/, and set the _CUSTOM_PATH variables to point to them.

There are also two ways to deploy to the target.

Traditionally in NXP BSPs, U-Boot loads the MC firmware, DPL and DPC
from given offsets in the storage medium (outside of the filesystem).
But this is not hardcoded and it doesn't have to be the case - the
mcinitcmd U-Boot environment variable is freely customizable. What can
also be done, and is done for the LX2160A-RDB, is to deploy multiple DPL
and DPC files (all the files available for a board) to a folder of the
rootfs, and just have two symlinks: dpl.dtb and dpc.dtb which point to
the currently active files. This makes easier the processes of
upgrading, downgrading and keeping multiple file versions.

Nonetheless, the "traditional" method of deploying to the target is also
possible. The selected DPL and DPC files are deployed to the "images"
folder and are freely usable with genimage or other post-image scripts.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- more info in the commit message
- add the option to specify the DPL and DPC files in the board/ folder
  instead of patching mc-utils
- add the option of deploying the files to the filesystem

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-mc-utils/Config.in           | 76 ++++++++++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash |  3 +
 package/qoriq-mc-utils/qoriq-mc-utils.mk   | 41 ++++++++++++
 5 files changed, 122 insertions(+)
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a76c7eeee6fd..cd67a04b2961 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3372,6 +3372,7 @@ F:	configs/ts5500_defconfig
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
+F:	package/qoriq-mc-utils/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index c37c5382fe62..754c9e76c26c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ menu "Firmware"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
+	source "package/qoriq-mc-utils/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-utils/Config.in b/package/qoriq-mc-utils/Config.in
new file mode 100644
index 000000000000..7444aef4c3ec
--- /dev/null
+++ b/package/qoriq-mc-utils/Config.in
@@ -0,0 +1,76 @@
+config BR2_PACKAGE_QORIQ_MC_UTILS
+	bool "qoriq-mc-utils"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC firmware is configured through two distinct files
+	  named DPL and DPC, which are customizable by the end user.
+	  Example configuration files for NXP reference boards are
+	  distributed through this package, and are frequently patched
+	  to produce the configuration required in other scenarios.
+
+	  https://github.com/nxp-qoriq/mc-utils
+	  # sign in required
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
+
+if BR2_PACKAGE_QORIQ_MC_UTILS
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC_CUSTOM_PATH
+	string "Data Path Configuration (DPC) custom file paths"
+	help
+	  The DPC file contains the settings defining the behavior
+	  of the MC firmware. Its structure follows the device
+	  tree syntax and is compiled to a device tree blob.
+
+	  This option defines a space-separated list of device
+	  tree source (DTS) file names, specified without
+	  the trailing .dts. It should be used when the NXP
+	  qoriq-mc-utils repository does not contain an adequate
+	  DPC for the platform, and is preferable to patching
+	  the package.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE
+	string "Data Path Configuration (DPC) in-tree files"
+	help
+	  This option defines a space-separated list of device
+	  tree source (DTS) files relative to the "config/"
+	  folder of the qoriq-mc-utils repository, specified
+	  without the trailing .dts. It should be used when NXP
+	  provides an adequate DPC for the platform.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM_PATH
+	string "Data Path Layout (DPL) custom file paths"
+	help
+	  The DPL file contains a description of the initial
+	  networking objects created by the MC firmware when it
+	  boots. Its structure follows the device tree syntax
+	  and is compiled to a device tree blob.
+
+	  This option defines a space-separated list of device
+	  tree source (DTS) files, specified without the
+	  trailing .dts. It should be used when the NXP
+	  qoriq-mc-utils repository does not contain an
+	  adequate DPL for the platform, and is preferable to
+	  patching the package.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE
+	string "Data Path Layout (DPL) in-tree files"
+	help
+	  This option defines a space-separated list of device
+	  tree source (DTS) files relative to the "config/"
+	  folder of the qoriq-mc-utils repository, specified
+	  without the trailing .dts. It should be used when NXP
+	  provides an adequate DPL for the platform.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH
+	string "Path on target to install DPL and DPC files"
+	help
+	  The DPL and DPC files can optionally be deployed to
+	  the target at the path specified here. This is useful
+	  if the mcinitcmd U-Boot environment variable is
+	  configured to apply the DPL and DPC from the filesystem.
+
+endif
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.hash b/package/qoriq-mc-utils/qoriq-mc-utils.hash
new file mode 100644
index 000000000000..f0234b9d1ff8
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d3f4a6b2661cff9cfb5d4fcba3b181eb6febdd88a127fa069e306f51d778fc5  qoriq-mc-utils-10.39.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
new file mode 100644
index 000000000000..8504625eeeae
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qoriq-mc-utils
+#
+################################################################################
+
+QORIQ_MC_UTILS_VERSION = 10.39.0
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
+QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
+QORIQ_MC_UTILS_INSTALL_IMAGES = YES
+ifeq ($(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH),)
+QORIQ_MC_UTILS_INSTALL_TARGET = NO
+endif
+QORIQ_MC_UTILS_DEPENDENCIES = host-dtc
+
+QORIQ_MC_UTILS_DPC_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_CUSTOM_PATH))
+QORIQ_MC_UTILS_DPC_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE))
+QORIQ_MC_UTILS_DPL_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM_PATH))
+QORIQ_MC_UTILS_DPL_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE))
+QORIQ_MC_UTILS_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH))
+
+define QORIQ_MC_UTILS_INSTALL_FILES
+	$(foreach file, $(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES), \
+		PATH=$(BR_PATH) dtc -I dts -O dtb $(file).dts -o $(1)/$(notdir $(file)).dtb; )
+	$(foreach file, $(QORIQ_MC_UTILS_DPC_INTREE) $(QORIQ_MC_UTILS_DPL_INTREE), \
+		$(INSTALL) -D $(@D)/config/$(file).dtb $(1)/$(notdir $(file)).dtb; )
+endef
+
+define QORIQ_MC_UTILS_BUILD_CMDS
+	PATH=$(BR_PATH) $(MAKE) -C $(@D)/config/
+endef
+
+define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
+	$(call QORIQ_MC_UTILS_INSTALL_FILES,$(BINARIES_DIR))
+endef
+
+define QORIQ_MC_UTILS_INSTALL_TARGET_CMDS
+	$(call QORIQ_MC_UTILS_INSTALL_FILES,$(TARGET_DIR)/$(QORIQ_MC_UTILS_INSTALL_PATH))
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
