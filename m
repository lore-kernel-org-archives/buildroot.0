Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB494EF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 17:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662F7606F0;
	Sun,  8 Feb 2026 17:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOJlqlLQ53H9; Sun,  8 Feb 2026 17:36:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C8E26075F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770572218;
	bh=qoddPAxMOkfKZ2WEiIiN5vL83jw0MHyTeCl2g6UNMpU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QYCLL6rqBnmFllCC3rVg64YuH24K4EP+UmXWU9S9ZVrGAHqNVesiGRCu9s6zxJ6Ev
	 B7q/RPErGNb+9BheeQ7FzKeLMmLpewsN1uPeGyW7UBlU3PBpNXWerUqzhZ3YdOJQ9F
	 Ou5G9uVDwHpzdflKflj8lKLyJz4Lr+nQDTog1khQoDhqOfKCtPSPujU87eWHneoR4d
	 DNlo3q5znFx9+cQKCXYS9b72UsVBWCod6/1lIgiAuz43cMpRkKhW5PpvA+56HLH4rB
	 b+3XkWz1geCFo9UbZzDx/FfzLWSoOaiVIKHFLiVfh6F6GEaBBeQLB3gTalctX3RmMj
	 HQCSgTEQvWzTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8E26075F;
	Sun,  8 Feb 2026 17:36:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA20C2A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B80640323
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-MSF0VwTMIO for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 17:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0F0640070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0F0640070
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0F0640070
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.65.104.223])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8A9CF780502;
 Sun,  8 Feb 2026 18:36:51 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <rnaour@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun,  8 Feb 2026 18:36:27 +0100
Message-ID: <20260208173627.881651-3-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208173627.881651-1-vjardin@free.fr>
References: <20260208173627.881651-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770572214;
 bh=ObZvn1zAj7AEhslg6gOeRgDcWHnYROaWf5Y2PKgum2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CQjhBv9bK9vcuD6R21nWf/ZtlV0/egkwXXOrnKaxki4SgoobqfMC+Tfs81eubvNST
 3p02juKT43DSmJE8B7oJ2bCOZd/vM/W6xgpmRnPSO1Vjn0ygKr/IW3mkv96sKB/V52
 zgNo2PgAmw9lhGVbawmIsLwctbTLgiUZho2EtuR13m23W8kIbQivscvLvLv1W6dJ/2
 n9rTS23fQq0XGcpf8K8Cw8M60lD+OO3RuT3YdE+vYbkqUu9zXfOc2a1zh314LJKCSd
 eyQusonxpiYLAGlx7GX+7VPMl6gt8q3X1HTH70u+V5xeNdWkRdyYq7riEQy/L2yN2L
 fXjcEGgYgCutA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CQjhBv9b
Subject: [Buildroot] [PATCH v2 2/2] package/rpmsg-echo-test: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux userspace RPMsg echo_test demo from the OpenAMP system
reference examples. This application uses the Linux kernel RPMsg
framework to send buffers to a remote processor and verify the
echoed data.

Requires kernel headers >= 4.11 for linux/rpmsg.h.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/rpmsg-echo-test/Config.in            | 17 +++++++++
 package/rpmsg-echo-test/rpmsg-echo-test.hash |  3 ++
 package/rpmsg-echo-test/rpmsg-echo-test.mk   | 36 ++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/rpmsg-echo-test/Config.in
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.hash
 create mode 100644 package/rpmsg-echo-test/rpmsg-echo-test.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 79581cae66..8e80212776 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3357,6 +3357,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/rpmsg-echo-test/
 F:	package/rpmsg-utils/
 F:	package/sysrepo-cpp/
 
diff --git a/package/Config.in b/package/Config.in
index 1ccd7f320f..ef1c979bc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -587,6 +587,7 @@ endmenu
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
+	source "package/rpmsg-echo-test/Config.in"
 	source "package/rpmsg-utils/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rpmsg-echo-test/Config.in b/package/rpmsg-echo-test/Config.in
new file mode 100644
index 0000000000..32f3d37156
--- /dev/null
+++ b/package/rpmsg-echo-test/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RPMSG_ECHO_TEST
+	bool "rpmsg-echo-test"
+	depends on BR2_USE_MMU # Linux userspace only
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/rpmsg.h
+	help
+	  Linux userspace RPMsg echo_test demo from the OpenAMP
+	  system reference examples.
+
+	  This application uses the Linux kernel RPMsg framework
+	  to send buffers to a remote processor and verify the
+	  echoed data (see "echo_test" demo in the OpenAMP docs).
+
+	  https://github.com/OpenAMP/openamp-system-reference
+
+comment "rpmsg-echo-test needs a toolchain w/ kernel headers >= 4.11"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/rpmsg-echo-test/rpmsg-echo-test.hash b/package/rpmsg-echo-test/rpmsg-echo-test.hash
new file mode 100644
index 0000000000..41f8ca4bf8
--- /dev/null
+++ b/package/rpmsg-echo-test/rpmsg-echo-test.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8059fbde74f726efd778f1393e75f5b554871ea8a9f51278912838ea414031ca  rpmsg-echo-test-v2025.04.0.tar.gz
+sha256  62345788a019596360c7f4e4026278cc84754de6beafac82ea0de0647b23c6ed  LICENSE.md
diff --git a/package/rpmsg-echo-test/rpmsg-echo-test.mk b/package/rpmsg-echo-test/rpmsg-echo-test.mk
new file mode 100644
index 0000000000..051ad4be2b
--- /dev/null
+++ b/package/rpmsg-echo-test/rpmsg-echo-test.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# rpmsg-echo-test
+#
+################################################################################
+
+RPMSG_ECHO_TEST_VERSION = v2025.04.0
+RPMSG_ECHO_TEST_SITE = $(call github,OpenAMP,openamp-system-reference,$(RPMSG_ECHO_TEST_VERSION))
+RPMSG_ECHO_TEST_SUBDIR = examples/linux/rpmsg-echo-test
+RPMSG_ECHO_TEST_DL_SUBDIR = openamp-system-reference
+
+RPMSG_ECHO_TEST_LICENSE = BSD-3-Clause
+RPMSG_ECHO_TEST_LICENSE_FILES = LICENSE.md
+
+define RPMSG_ECHO_TEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(RPMSG_ECHO_TEST_SUBDIR) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define RPMSG_ECHO_TEST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_ECHO_TEST_SUBDIR)/echo_test \
+		$(TARGET_DIR)/usr/bin/echo_test
+endef
+
+define RPMSG_ECHO_TEST_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_CHAR)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_CTRL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RPMSG_VIRTIO)
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
