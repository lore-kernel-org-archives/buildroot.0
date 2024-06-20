Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3E7C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 14:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4391F84485;
	Thu, 20 Jun 2024 14:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPYTRd_isL9f; Thu, 20 Jun 2024 14:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BA2843A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68BA2843A6;
	Thu, 20 Jun 2024 14:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978C51BF293
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84EFE81254
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QZ6Ox-VD4a9 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 14:39:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 603EB813D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 603EB813D9
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 603EB813D9
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:39:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7ED07240012;
 Thu, 20 Jun 2024 14:39:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 16:38:53 +0200
Message-Id: <20240620143853.1259543-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620143853.1259543-1-kory.maincent@bootlin.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1718894352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPTtZkvHuQ5SiA3xdFHpxONmcCtLztf2CRkiRgKC/6Y=;
 b=WlzSigeXwzycNFFds5AwjDSdnrvZFHUI+asTDrd11H1GfIozdMle3oIWCSI5++rHvABdvN
 ii/DsvAZy7O+B7d+55HNmuoccvkVIwcbxpkdtBE3avc1IdeaUKCQO4elwjODEzaSUpEFME
 pgPmlQ8veQe9tdQa+OZC8GGpeCdWyxiyRxUEJf+VDqVjdnM4v0S6w6e7HVzW/koQY8E08B
 WtwP9mmUb8Ev2f5FKToD2tUOBtJ2RiXtzTvzLKL09xY+uoOp58s3o5QNn1eUGCK5ykwKQg
 /zx015iOPhKMRzP3PEyDtcd40DD+LYPFZEdLtAOA7EflViqzbhLGH41hR34QZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WlzSigeX
Subject: [Buildroot] [PATCH 3/3] package/optee-examples: Add support for
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
does not match the latest optee-examples version supported by Buildroot,
optee-examples might not build or run properly. This patch adds support for
an optee-examples custom tarball URL to address this potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/optee-examples/Config.in         | 42 ++++++++++++++++++++++++
 package/optee-examples/optee-examples.mk | 26 +++++++++++++--
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index eb6ee16502..83a1e9cb09 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -26,3 +26,45 @@ comment "optee-examples needs a toolchain w/ threads, dynamic library, headers >
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
+if BR2_PACKAGE_OPTEE_EXAMPLES
+
+choice
+	prompt "optee-examples version"
+	default BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	help
+	  Select the version of optee-examples you want to use
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	bool "4.2.0"
+	help
+	  Use the latest release tag from the optee-examples official
+	  Git repository.
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows to specify a URL pointing to an
+	  optee-examples source tarball. This URL can use any protocol
+	  recognized by Buildroot, like http://, ftp://, file:// or
+	  scp://.
+
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION
+	string "URL of custom optee-examples tarball"
+
+endif
+
+config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
+	string
+	default "4.2.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
+
+endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 7d52a277d2..2e20dc4dd4 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,10 +4,26 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.2.0
-OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
+OPTEE_EXAMPLES_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_LATEST),y)
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL),y)
+OPTEE_EXAMPLES_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION))
+OPTEE_EXAMPLES_SITE = $(patsubst %/,%,$(dir $(OPTEE_EXAMPLES_TARBALL)))
+OPTEE_EXAMPLES_SOURCE = $(notdir $(OPTEE_EXAMPLES_TARBALL))
+else ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_GIT),y)
+OPTEE_EXAMPLES_SITE = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_REPO_URL))
+OPTEE_EXAMPLES_SITE_METHOD = git
+else
+OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES):$(BR2_PACKAGE_OPTEE_EXAMPLES_LATEST),y:)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_EXAMPLES_SOURCE)
+endif
 
 OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
 
@@ -28,4 +44,10 @@ endef
 OPTEE_EXAMPLES_POST_BUILD_HOOKS += OPTEE_EXAMPLES_BUILD_TAS
 OPTEE_EXAMPLES_POST_INSTALL_TARGET_HOOKS += OPTEE_EXAMPLES_INSTALL_TAS
 
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)
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
