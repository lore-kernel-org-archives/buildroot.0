Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5ABD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7091E40A10;
	Wed,  7 Jan 2026 18:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B50BKI8u85lt; Wed,  7 Jan 2026 18:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1D240A77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809094;
	bh=Zh1iq1OIpLcYn3TVb88MQWy8xk5Fow6TQOKeQLie77k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s66cMt9hYANFR8QWiAUSqtgSlMCBN/TmrPpM3NF4GVxlPHDR9l+IC1JgOIcR1ZqRp
	 kvjN21OxTvfRKO3/05Pc4sXvSux47CMx83Kehw7tm/bfZjc5PZeA6HsQIdxGWqAfRG
	 l3E4z3YEID4baoRO8vxNswSDphO19D0aUI+jl9TOIumOkY3KRNvFlNM8DNVtOy/5qV
	 J3XYm5GCHNsy9GgcqGPvcDAXj2Ug5i++jjH+AzXnv1mds8gd3Sx232ha5I5urskVut
	 3Q/RDjZJlZma+OOujAJKjaureHtjFUZzKYY6RDMY+x7euhNzZIZ6ZbqR3MYrjtTlQR
	 7ZgtZbaCbvgCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C1D240A77;
	Wed,  7 Jan 2026 18:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F889ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC3F607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDPdfZYgC-SH for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92F6260643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F6260643
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92F6260643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:04:51 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D1A2513F8B9;
 Wed,  7 Jan 2026 19:04:47 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:04:41 +0100
Message-ID: <20260107180441.2470944-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107180441.2470944-1-vjardin@free.fr>
References: <20260107180441.2470944-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767809090;
 bh=/hauNK26Z5jZCnS4ldnPm2PI0OJIKPK5qhuzCRez7sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BrVjlaZAJTxBGIAA20FJauUDmDPhqVimPn8o+tu+sYctdFDiJCqWzaqx5qvfXvdGw
 xRNgvuHdabSFKl5lW2336VILePBG+9i3lQScKq/4va9NYo83kM2/Yoq2t3BxFCRcn5
 QJOV8sMOIUZq1a4iuvxFXNbm1FGsxMNqQHkm5C9Og/UeX9hUFAla0cH5pJAB/vO3Wm
 pslDFhmqOCUu6XZ8/MosmjRVPkO/IROlCeVpgBCVa0IR2ysl2WHAL3iwjJqVA1iQ9K
 E7ntG3PIQoLvikbQeZsLi/1MO7a7CGeRD8GsnOV2ssV3kCuD3uRMOu9JOlmLLQYlsO
 MT+4C7GPT+/8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BrVjlaZA
Subject: [Buildroot] [PATCH v1 1/1] package/rpmsg-utils: new package
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

rpmsg-utils provides user-space utilities for the Linux RPMsg character
driver from the OpenAMP system reference. It includes tools for managing
RPMsg communication channels with remote processors: rpmsg_export_dev,
rpmsg_export_ept, rpmsg_destroy_ept, and rpmsg_ping.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/rpmsg-utils/Config.in        | 17 +++++++++++
 package/rpmsg-utils/rpmsg-utils.hash |  4 +++
 package/rpmsg-utils/rpmsg-utils.mk   | 44 ++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+)
 create mode 100644 package/rpmsg-utils/Config.in
 create mode 100644 package/rpmsg-utils/rpmsg-utils.hash
 create mode 100644 package/rpmsg-utils/rpmsg-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..9e6d671ec8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/rpmsg-utils/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..a6c6f28eed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ endmenu
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
+	source "package/rpmsg-utils/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
 	source "package/rtl8188eu/Config.in"
diff --git a/package/rpmsg-utils/Config.in b/package/rpmsg-utils/Config.in
new file mode 100644
index 0000000000..e801c5695f
--- /dev/null
+++ b/package/rpmsg-utils/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_RPMSG_UTILS
+	bool "rpmsg-utils"
+	depends on BR2_USE_MMU # Linux userspace
+	help
+	  User-space utilities for the Linux RPMsg character driver,
+	  from the OpenAMP system reference examples.
+
+	  Installs:
+	    - rpmsg_export_dev
+	    - rpmsg_export_ept
+	    - rpmsg_destroy_ept
+	    - rpmsg_ping
+
+	  These tools operate on /dev/rpmsg_ctrlX and /dev/rpmsgX
+	  devices provided by the Linux RPMsg framework.
+
+	  https://github.com/OpenAMP/openamp-system-reference
diff --git a/package/rpmsg-utils/rpmsg-utils.hash b/package/rpmsg-utils/rpmsg-utils.hash
new file mode 100644
index 0000000000..9eb85d611a
--- /dev/null
+++ b/package/rpmsg-utils/rpmsg-utils.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  8059fbde74f726efd778f1393e75f5b554871ea8a9f51278912838ea414031ca  openamp-system-reference-v2025.04.0.tar.gz
+sha256  62345788a019596360c7f4e4026278cc84754de6beafac82ea0de0647b23c6ed  LICENSE.md
+sha256  5907fa1cd899be6bd9696603a1d7c671c34dc993436e5f4acf69c78e1fa2e988  examples/linux/rpmsg-utils/LICENSE
diff --git a/package/rpmsg-utils/rpmsg-utils.mk b/package/rpmsg-utils/rpmsg-utils.mk
new file mode 100644
index 0000000000..cd2ea798d2
--- /dev/null
+++ b/package/rpmsg-utils/rpmsg-utils.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# rpmsg-utils
+#
+################################################################################
+
+RPMSG_UTILS_VERSION = v2025.04.0
+RPMSG_UTILS_SITE = $(call github,OpenAMP,openamp-system-reference,$(RPMSG_UTILS_VERSION))
+RPMSG_UTILS_SUBDIR = examples/linux/rpmsg-utils
+
+RPMSG_UTILS_LICENSE = BSD-3-Clause
+RPMSG_UTILS_LICENSE_FILES = LICENSE.md $(RPMSG_UTILS_SUBDIR)/LICENSE
+
+define RPMSG_UTILS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(RPMSG_UTILS_SUBDIR) \
+		CC="$(TARGET_CC)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define RPMSG_UTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_UTILS_SUBDIR)/rpmsg_export_dev \
+		$(TARGET_DIR)/usr/bin/rpmsg_export_dev
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_UTILS_SUBDIR)/rpmsg_export_ept \
+		$(TARGET_DIR)/usr/bin/rpmsg_export_ept
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_UTILS_SUBDIR)/rpmsg_destroy_ept \
+		$(TARGET_DIR)/usr/bin/rpmsg_destroy_ept
+	$(INSTALL) -D -m 0755 \
+		$(@D)/$(RPMSG_UTILS_SUBDIR)/rpmsg_ping \
+		$(TARGET_DIR)/usr/bin/rpmsg_ping
+endef
+
+define RPMSG_UTILS_LINUX_CONFIG_FIXUPS
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
