Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9430DEF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5669C4062D;
	Sun,  8 Feb 2026 17:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqVuxDnN3kX4; Sun,  8 Feb 2026 17:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE1B40644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770572215;
	bh=EswIftxsbBrqGP4vmMrZXgOty3mXybE25iY+x9VTfhI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h6//tg6EgnIA0L8YBS0IGdvzDiZRFRlS/5KLRTw9UdwSzJjyCF39zhnSOEq4RqHPA
	 Sptm7z1HwrBTpgFHGCg2jRfETR2NWAH2badVeotTlVP/x3PQ55CXMPT3uEqLM0NVdr
	 UAecM1WD34pkvVybDAXJan3DaEA/KG+uAOltnZdjxz446d5gf4kl9URAZVjYCD41yn
	 NMQ26rVRnLGg+a0dVGCKhHks0i+r4akg44/XK7cbmV1Ijnc6uNbSVCFSalY12Zm74h
	 O4q435wrQ9K8FOtZX4ta/+SPdnxY21CvdE+p0Uo+9AF1wEIpcm0QPDFEIrh2eoEeT9
	 IW2EH/fzt2gsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FE1B40644;
	Sun,  8 Feb 2026 17:36:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 152262A2
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB0A64062D
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkNxJWTzkgVe for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 17:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E46F40644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E46F40644
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E46F40644
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 17:36:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.65.104.223])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1567478032A;
 Sun,  8 Feb 2026 18:36:46 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <rnaour@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Sun,  8 Feb 2026 18:36:26 +0100
Message-ID: <20260208173627.881651-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208173627.881651-1-vjardin@free.fr>
References: <20260208173627.881651-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770572210;
 bh=SkWc2GxP6p+jmWvgos+QitAIbH9Ek+gDRxC7WaV6MzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BTuVKpb0Vc+/LZ7r85Plpe87GCDSv0ctwvGGJTBP2fmGyYM9+Ky+t1b7++IT8fsga
 ISTu1xJIWFkLPAFB0k3zJuZsTKiLTGVjeUwZZTJKKuzy2xBk4lmWeiUXQq5mRUejXM
 mSAinx+ZmnjeZnHy6v+L/SD/bzR7B8hLfF0s5bEAvJe2jPfPGDyi+LOs4oXBiwNio3
 xxCK+35+A/tfTFLfKk/xOBF6DobFb//sB3yRfn9HmLHe8W54bZP61z6MQ+nkrkNsFD
 bSaWlSk6UlPorhFByhn8X27wJaLRq/IWvky8a/kTUlUhVOypbuhOMmglCN3zq3Q0Bv
 DKGCIN6VaQQdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BTuVKpb0
Subject: [Buildroot] [PATCH v2 1/2] package/rpmsg-utils: new package
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
 package/rpmsg-utils/rpmsg-utils.mk   | 45 ++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 package/rpmsg-utils/Config.in
 create mode 100644 package/rpmsg-utils/rpmsg-utils.hash
 create mode 100644 package/rpmsg-utils/rpmsg-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 225d1ac917..79581cae66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3357,6 +3357,7 @@ F:	package/bfscripts/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
+F:	package/rpmsg-utils/
 F:	package/sysrepo-cpp/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 8346ef1a0e..1ccd7f320f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -587,6 +587,7 @@ endmenu
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
index 0000000000..bd4f88a78b
--- /dev/null
+++ b/package/rpmsg-utils/rpmsg-utils.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256  8059fbde74f726efd778f1393e75f5b554871ea8a9f51278912838ea414031ca  rpmsg-utils-v2025.04.0.tar.gz
+sha256  62345788a019596360c7f4e4026278cc84754de6beafac82ea0de0647b23c6ed  LICENSE.md
+sha256  5907fa1cd899be6bd9696603a1d7c671c34dc993436e5f4acf69c78e1fa2e988  examples/linux/rpmsg-utils/LICENSE
diff --git a/package/rpmsg-utils/rpmsg-utils.mk b/package/rpmsg-utils/rpmsg-utils.mk
new file mode 100644
index 0000000000..f40fa9f980
--- /dev/null
+++ b/package/rpmsg-utils/rpmsg-utils.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# rpmsg-utils
+#
+################################################################################
+
+RPMSG_UTILS_VERSION = v2025.04.0
+RPMSG_UTILS_SITE = $(call github,OpenAMP,openamp-system-reference,$(RPMSG_UTILS_VERSION))
+RPMSG_UTILS_SUBDIR = examples/linux/rpmsg-utils
+RPMSG_UTILS_DL_SUBDIR = openamp-system-reference
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
