Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68371D12D4C
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 17:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC91A605C7;
	Sun, 10 Nov 2024 17:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnIQ_MxKZTEG; Sun, 10 Nov 2024 17:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B814B605AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B814B605AD;
	Sun, 10 Nov 2024 17:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBCAD8F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB43580D21
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOLTjacHSNyh for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 17:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF61E80D1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF61E80D1F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF61E80D1F
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 17:37:07 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AC0166012D;
 Sun, 10 Nov 2024 18:37:00 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 10 Nov 2024 18:33:28 +0100
Message-ID: <20241110173328.48325-2-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241110173328.48325-1-vjardin@free.fr>
References: <aedee4f5789c42dae10d18bc9f9f7c61@free.fr>
 <20241110173328.48325-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731260223;
 bh=h2w6rvtzezBOxsC9zL+XmSEU0ylLYp6o+9iQKiKljR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s8xfYj5mN4bqKqdr39c/loHCrNrHXK6rqMZn2T/+gncR/6A7KlNz+FuUqCA1IzD3J
 sEFo/9kywDTLwCGtkQxy3LE0/GzfIxfjcDlWkJf0t6g93VZ780qEghGfdn24R0pUV6
 A4ycyb+8+GdhYPqI4TfXNwaPOfnxLP6DE0a4Z8OIMZ4wdmUx/WhkyBNnPgeci6M6zX
 LYlNXkhLz/ytKq4RoKNPfUbn8fQpPoBMo7JG8xXD6tfdQsiiS/JdyZUS00zpm16m4y
 uwG6Mi3lIe8H66cWw557IVNwkExIf7zXx0osdPjy1SCsDqsmPM+c2DyQna5NAPVLMy
 zv0IyKQuMinjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s8xfYj5m
Subject: [Buildroot] [PATCH v1 1/1] package/bfscripts: new package
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
Reviewed-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/bfscripts/Config.in      | 12 ++++++++++++
 package/bfscripts/S99bfup        | 20 ++++++++++++++++++++
 package/bfscripts/bfscripts.hash |  3 +++
 package/bfscripts/bfscripts.mk   | 28 ++++++++++++++++++++++++++++
 6 files changed, 65 insertions(+)
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
index 0000000000..73f55e25d8
--- /dev/null
+++ b/package/bfscripts/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BFSCRIPTS
+	bool "bfscripts"
+	depends on BR2_USE_MMU # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_BASH # runtime
+	help
+	  Collection of scripts that are used for Mellanox/NVIDIA
+	  Bluefield SoC management.
+
+	  Currently, it installs: bfcfg, bfrshlog and bfup.
+
+	  https://github.com/Mellanox/bfscripts
diff --git a/package/bfscripts/S99bfup b/package/bfscripts/S99bfup
new file mode 100644
index 0000000000..6c301993dc
--- /dev/null
+++ b/package/bfscripts/S99bfup
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# notify to the root PCIe (/dev/rshimN/misc) that Linux is up
+# and that BF3 board is ready
+
+DAEMON="bfup"
+
+case "$1" in
+	start)
+		printf "bfup: "
+		/usr/bin/$DAEMON
+		exit_code=$?
+		[ $exit_code = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	*)
+		echo "Usage: $0 {start}"
+		exit 1
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
index 0000000000..aec788e7cb
--- /dev/null
+++ b/package/bfscripts/bfscripts.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# bfscripts
+#
+################################################################################
+
+BFSCRIPTS_VERSION = 3.9.7-1
+BFSCRIPTS_SITE = $(call github,Mellanox,bfscripts,$(BFSCRIPTS_VERSION))
+BFSCRIPTS_LICENSE = BSD-2-Clause
+BFSCRIPTS_LICENSE_FILES = LICENSE
+
+BFSCRIPTS_FILES_TO_INSTALL = \
+	bfcfg \
+	bfrshlog \
+	bfup
+
+define BFSCRIPTS_INSTALL_TARGET_CMDS
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
