Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E750CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 19:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5FA960E09;
	Wed, 15 Oct 2025 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oyERn_XloIY; Wed, 15 Oct 2025 19:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 029A260E1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 029A260E1F;
	Wed, 15 Oct 2025 19:31:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44BCD1C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36CC240098
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_qAFN3mjJh6 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 19:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA54640095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA54640095
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA54640095
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:31:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FF65A4C6E97;
 Wed, 15 Oct 2025 21:31:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43866)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v97DV-000000004cJ-2fuo;
 Wed, 15 Oct 2025 19:31:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 15 Oct 2025 21:31:21 +0200
Message-ID: <20251015193121.1386613-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760556682;
 bh=izYyqArvO1bjC3+3nhPCIF+gZndnS4cROz0X9kGC6AQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aNb4hqdZhQeKdBrQA9lB3cTM19EFldraZpFfrPKiJCDT1rYAC+OoxKA191LxGHlxg
 zuwd5GACNaVQkfNpBkdrrYRTeu8z8KrueFfDlZRj80LLubMz4FDYt7Z2pq2i374KD8
 V2ROskMMgS+benDcD/Uwvl16fEcmX2yBUYiK+FjoZ1zJkxiUEWdPC+p6ZEBAwYuhw8
 LMTZmSWXAiDLDXrRA1+snNPgiCyeU7ErdeaYqbErfnS72TNknSLQkOv8YMez8x5hiA
 U9RHkLXLcAMsRLqZ4PdI+Iq4J9tt4dUIDK750IBeiRsYRLJRjHLuYTLqBLMowJg8/y
 UZKQGdF7L439g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=aNb4hqdZ
Subject: [Buildroot] [PATCH 1/1] package/nvme: bump version to 2.15
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

Switched build system to meson and added dependency to libnvme:
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.0-rc0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nvme/Config.in |  2 ++
 package/nvme/nvme.hash |  2 +-
 package/nvme/nvme.mk   | 34 +++++++---------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/package/nvme/Config.in b/package/nvme/Config.in
index dd8655fa1a..16b8726144 100644
--- a/package/nvme/Config.in
+++ b/package/nvme/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NVME
 	bool "nvme"
+	depends on BR2_USE_MMU # libnvme
+	select BR2_PACKAGE_LIBNVME
 	help
 	  NVME utility, a utility for interacting with standard NVM
 	  Express (optimized PCI Express SSD interface) devices.
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index a7ce51ca74..c6fb9c9aa8 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a75270e65a4a7a6add48f748ba216d8f68d78f90f8cb77e88e9753b74d527991  nvme-1.12.tar.gz
+sha256  93282c426f22dd1ea6d172dec8af043c4e9ff80189becfbbb5378fe1ca0a74ad  nvme-2.15.tar.gz
 sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 53f9dff753..9f2b086d2a 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,37 +4,17 @@
 #
 ################################################################################
 
-NVME_VERSION = 1.12
+NVME_VERSION = 2.15
 NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
+NVME_DEPENDENCIES = libnvme
 
-# Yes, LIBUUID=0 means libuuid support enabled.
-# LIBUUID=1 means libuuid support disabled.
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-NVME_DEPENDENCIES += util-linux
-NVME_MAKE_OPTS += LIBUUID=0
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+NVME_CONF_OPTS += -Djson-c=enabled
+NVME_DEPENDENCIES += json-c
 else
-NVME_MAKE_OPTS += LIBUUID=1
+NVME_CONF_OPTS += -Djson-c=disabled
 endif
 
-# Yes, HAVE_SYSTEMD=0 means systemd support enabled.
-# HAVE_SYSTEMD=1 means systemd support disabled.
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-NVME_DEPENDENCIES += systemd
-NVME_MAKE_OPTS += HAVE_SYSTEMD=0
-else
-NVME_MAKE_OPTS += HAVE_SYSTEMD=1
-endif
-
-define NVME_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
-		$(NVME_MAKE_OPTS) -C $(@D)
-endef
-
-define NVME_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(NVME_MAKE_OPTS) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr install-bin
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
