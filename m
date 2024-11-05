Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899B2D12676
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 09:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC2D80E96;
	Tue,  5 Nov 2024 09:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zh785o33jLfH; Tue,  5 Nov 2024 09:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3177E80EB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3177E80EB2;
	Tue,  5 Nov 2024 09:59:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA5B3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE281404E7
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klYD5bTsfeip for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 09:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E5F7402F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5F7402F4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E5F7402F4
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:a4ad:3140:e0ab:8c71])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 91C7A13F8E1;
 Tue,  5 Nov 2024 10:59:08 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Tue,  5 Nov 2024 10:57:44 +0100
Message-ID: <20241105095744.60477-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241105095744.60477-1-vjardin@free.fr>
References: <20241105095744.60477-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730800750;
 bh=mkJujv2vVatcz19nNfNRgv+r9fNHTnYlKrOrE4prd54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsAi2uBiK9dqNhxCy925jHJlksMX6XR/NrwbOueQunaSU2MxNUPKmlq9EjqJXtcue
 fq4BeZ2bKNcD1+qHc1DmRUIsn4xK+0b5ZwoqOtVkDoB6/Ju33Rz29z//KB+LiDe0vI
 tXHzo+ubKe28760ihe81jM7UJD7Ya98qJc/jF//lY8MNo5GBuujCvblYh1ulrgza3g
 PWCcaV6lFm5u2MBRvhB/f/fGpzkMal322SuNvC3cwqtHes07ygqzObM8o5GEKN/FRP
 a0YwDPsy0R+gDf/WqLLSSBYcvqRUQZd/Gj7wDrGaT//RUkYjeppfu0xZ3l8fTXiHzE
 hSlYn/Q/82onA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QsAi2uBi
Subject: [Buildroot] [PATCH v0 1/1] package/bfscripts: add 3.9.7-1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bootstrap the installation of Mellanox/NVIDIA Bluefield scripts
that can be run either on the host CPU or on the onboard ARM64 CPU.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                       |  1 +
 configs/nvidia_bf3_defconfig     |  3 +++
 package/Config.in                |  1 +
 package/bfscripts/Config.in      |  7 +++++++
 package/bfscripts/S99bfup        | 17 +++++++++++++++++
 package/bfscripts/bfscripts.hash |  3 +++
 package/bfscripts/bfscripts.mk   | 29 +++++++++++++++++++++++++++++
 7 files changed, 61 insertions(+)
 create mode 100644 package/bfscripts/Config.in
 create mode 100644 package/bfscripts/S99bfup
 create mode 100644 package/bfscripts/bfscripts.hash
 create mode 100644 package/bfscripts/bfscripts.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index edf823b34b..a11e4e580e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3273,6 +3273,7 @@ F:	support/testing/tests/core/test_root_password.py
 N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
+F:	package/bfscripts/
 F:	package/dpdk/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
index 3f958c0062..95054d5b15 100644
--- a/configs/nvidia_bf3_defconfig
+++ b/configs/nvidia_bf3_defconfig
@@ -10,3 +10,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/nvidia/bf3/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_BASH=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_BFSCRIPTS=y
diff --git a/package/Config.in b/package/Config.in
index 876b340a8a..d7430287b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -475,6 +475,7 @@ endmenu
 	source "package/apcupsd/Config.in"
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
+	source "package/bfscripts/Config.in"
 	source "package/biosdevname/Config.in"
 	source "package/brickd/Config.in"
 	source "package/brltty/Config.in"
diff --git a/package/bfscripts/Config.in b/package/bfscripts/Config.in
new file mode 100644
index 0000000000..bdfd45a4ed
--- /dev/null
+++ b/package/bfscripts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BFSCRIPTS
+	bool "bfscripts"
+	select BR2_PACKAGE_BASH
+	help
+	  Install bfscripts from Mellanox/NVIDIA.
+
+	  https://github.com/Mellanox/bfscripts
diff --git a/package/bfscripts/S99bfup b/package/bfscripts/S99bfup
new file mode 100644
index 0000000000..63a2867dab
--- /dev/null
+++ b/package/bfscripts/S99bfup
@@ -0,0 +1,17 @@
+#!/bin/sh
+#
+# notify to the root PCIe (/dev/rshimN/misc) that Linux is up
+# and that BF3 boardis ready
+
+case "$1" in
+  start)
+	printf "bfup: "
+	/usr/bin/bfup
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+  *)
+	echo "Usage: $0 {start}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/bfscripts/bfscripts.hash b/package/bfscripts/bfscripts.hash
new file mode 100644
index 0000000000..05f2966ab9
--- /dev/null
+++ b/package/bfscripts/bfscripts.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  92123fcaeb8eb9ba7f296e2457e82f56831c6fd19c1ad1a5949b7bc7d5d0a837  bfscripts-3.9.7-1.tar.gz
+sha256  ab52bc4ac5e66e42e0ce14172c4d1d40969919db98cc0e11d2f6178dcc97bf4d  LICENSE
diff --git a/package/bfscripts/bfscripts.mk b/package/bfscripts/bfscripts.mk
new file mode 100644
index 0000000000..cb13defb8f
--- /dev/null
+++ b/package/bfscripts/bfscripts.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# bfscripts
+#
+################################################################################
+
+BFSCRIPTS_VERSION = 3.9.7-1
+BFSCRIPTS_SITE = $(call github,Mellanox,bfscripts,$(BFSCRIPTS_VERSION))
+BFSCRIPTS_DEPENDENCIES = bash
+BFSCRIPTS_LICENSE = BSD-2-Clause
+BFSCRIPTS_LICENSE_FILES = LICENSE
+
+BFSCRIPTS_FILES_TO_INSTALL = bfcfg \
+	bfrshlog \
+	bfup
+
+define BFSCRIPTS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
+	$(foreach f,$(BFSCRIPTS_FILES_TO_INSTALL),\
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/bin/$(f)
+	)
+endef
+
+define BFSCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/bfscripts/S99bfup \
+		$(TARGET_DIR)/etc/init.d/S99bfup
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
