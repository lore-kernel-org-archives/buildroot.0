Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23817C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 14:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFF9D844FC;
	Thu, 20 Jun 2024 14:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZveOr8VLOFvH; Thu, 20 Jun 2024 14:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C725681206
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C725681206;
	Thu, 20 Jun 2024 14:39:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293EB1BF293
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E56F443561
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 14:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM7wcLEzqkdx for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 14:39:14 +0000 (UTC)
X-Greylist: delayed 21581 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 20 Jun 2024 14:39:13 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B48074356D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48074356D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B48074356D
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 14:39:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B95AA240011;
 Thu, 20 Jun 2024 14:39:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 16:38:52 +0200
Message-Id: <20240620143853.1259543-3-kory.maincent@bootlin.com>
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
 bh=QLVxlA0WD15g1hf8PaVEgcLJ2VTVteTjGDIVRAfVPNU=;
 b=Zhe/BfgLqnv35MxygJdRGgqVxboK1WlmoscPRBkz17GMQ+A/ATWb5X4cZJaD1HbMz77w+G
 NCQ8BL8K/wK0bVNnA8jjcDN435oins4axvhiwHFo3Ty1VS5T0hsGr/41QF/jOJIDZpUObS
 i06XXAVz66CX1dSszXEmhwC4Uqp/gNf7OFk/D1WafOn2jZu+KmcJjR3yeEhXTwrtR7HGmL
 UowYHU0jGiyxxPTr9dIdOhhRDNtOWcv5aNl5cAaFY6rMcAYjTmpxxlw/tDfwjUI5LVwZrn
 86UUXqtAaNLcS9fOjSQ9H3RYrdrYzUpZVO32Hv1bmuvB/BVKCKQUJyo2c4Q/pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Zhe/BfgL
Subject: [Buildroot] [PATCH 2/3] package/optee-test: Add support for custom
 tarball
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
does not match the latest optee-test version supported by Buildroot,
optee-test might not build or run properly. This patch adds support for
an optee-test custom tarball URL to address this potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/optee-test/Config.in     | 41 ++++++++++++++++++++++++++++++++
 package/optee-test/optee-test.mk | 23 ++++++++++++++++--
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 57a7834c75..1c4dbf7fb4 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -31,3 +31,44 @@ comment "optee-test needs a toolchain w/ threads, C++, dynamic library, headers
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+
+if BR2_PACKAGE_OPTEE_TEST
+
+choice
+	prompt "optee-test version"
+	default BR2_PACKAGE_OPTEE_TEST_LATEST if BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	help
+	  Select the version of optee-test you want to use
+
+config BR2_PACKAGE_OPTEE_TEST_LATEST
+	bool "4.2.0"
+	help
+	  Use the latest release tag from the optee-test official Git
+	  repository.
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows to specify a URL pointing to an optee-test
+	  source tarball. This URL can use any protocol recognized by
+	  Buildroot, like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
+endchoice
+
+if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
+
+config BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION
+	string "URL of custom optee-test tarball"
+
+endif
+
+config BR2_PACKAGE_OPTEE_TEST_VERSION
+	string
+	default "4.2.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
+
+endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 69e84fdbd2..9bc074b215 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,10 +4,23 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 4.2.0
-OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
+OPTEE_TEST_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_LATEST),y)
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL),y)
+OPTEE_TEST_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION))
+OPTEE_TEST_SITE = $(patsubst %/,%,$(dir $(OPTEE_TEST_TARBALL)))
+OPTEE_TEST_SOURCE = $(notdir $(OPTEE_TEST_TARBALL))
+else
+OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_TEST):$(BR2_PACKAGE_OPTEE_TEST_LATEST),y:)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_TEST_SOURCE)
+endif
 
 OPTEE_TEST_DEPENDENCIES = optee-client optee-os
 
@@ -34,4 +47,10 @@ endef
 OPTEE_TEST_POST_BUILD_HOOKS += OPTEE_TEST_BUILD_TAS
 OPTEE_TEST_POST_INSTALL_TARGET_HOOKS += OPTEE_TEST_INSTALL_TAS
 
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)
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
