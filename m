Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BA0C2BA1A
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 951FE843E5;
	Thu, 20 Jun 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmDSp7HSWh2B; Thu, 20 Jun 2024 14:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 332A0844ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 332A0844ED;
	Thu, 20 Jun 2024 14:39:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6991F1BF293
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 638CB43561
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mtt4CD8UlP_M for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 14:39:14 +0000 (UTC)
X-Greylist: delayed 21577 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Jun 2024 14:39:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 402E64356E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 402E64356E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 402E64356E
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:39:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1272240010;
 Thu, 20 Jun 2024 14:39:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 16:38:51 +0200
Message-Id: <20240620143853.1259543-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620143853.1259543-1-kory.maincent@bootlin.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718894351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbVyk26jpJpqu34oobHP47DUvOXXmzDDc5wpugKoqqM=;
 b=fz9nGCn5o2Yw6Mxue6WFZXDEBDOJsF+LF4hqpZB8N60SokW5B5MVnqgxfMXb1sv4qGWC8h
 2BgUcoYPRzfwAyiEOegtizAKtGQCLuZ2Yjbeh2VhhZTJmKxZ4Ri6coMER3eASuhUdrxkOu
 8jc43Wi6InWT589IOY7AYiAr2r2NRpO9lIKfkn5Bu2KWwxg76vPP7ql4M8/plXAwurXMWg
 Xbad6ux3CrNz2oQj3Cz6bgAjE7JqkSd3Bj/wEG/cv0IrGi8qCNRHOBSj67WN3bJG7p0+gc
 ehljydEM6W3N3HlWr5so9gBTxToocUm4kM2Wis7zz8T4NIT44Ba3f+XN4ZkibA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fz9nGCn5
Subject: [Buildroot] [PATCH 1/3] package/optee-client: Add support for
 custom tarball
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
does not match the latest optee-client version supported by Buildroot,
optee-client might not build or run properly. This patch adds support for
an optee-client custom tarball URL to address this potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/optee-client/Config.in       | 38 ++++++++++++++++++++++++++++
 package/optee-client/optee-client.mk | 24 ++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 4061164cbb..3a59ce9725 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -17,6 +17,44 @@ config BR2_PACKAGE_OPTEE_CLIENT
 
 if BR2_PACKAGE_OPTEE_CLIENT
 
+choice
+	prompt "optee-client version"
+	default BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	help
+	  Select the version of optee-client you want to use
+
+config BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	bool "4.2.0"
+	help
+	  Use the latest release tag from the optee-client official Git
+	  repository.
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows to specify a URL pointing to an
+	  optee-client source tarball. This URL can use any protocol
+	  recognized by Buildroot, like http://, ftp://, file://
+	  or scp://.
+
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
+
+config BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION
+	string "URL of custom optee-client tarball"
+
+endif
+
+config BR2_PACKAGE_OPTEE_CLIENT_VERSION
+	string
+	default "4.2.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
+
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	string "Path for normal world OS secure storage"
 	default "/data/tee"
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 6600a9c4fc..a91548a43b 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,10 +4,24 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 4.2.0
-OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_LATEST),y)
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL),y)
+OPTEE_CLIENT_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION))
+OPTEE_CLIENT_SITE = $(patsubst %/,%,$(dir $(OPTEE_CLIENT_TARBALL)))
+OPTEE_CLIENT_SOURCE = $(notdir $(OPTEE_CLIENT_TARBALL))
+else
+OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT):$(BR2_PACKAGE_OPTEE_CLIENT_LATEST),y:)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_CLIENT_SOURCE)
+endif
+
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
 OPTEE_CLIENT_CONF_OPTS = \
@@ -38,4 +52,10 @@ define OPTEE_CLIENT_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
 endef
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
