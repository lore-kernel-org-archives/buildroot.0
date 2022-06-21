Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F276C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 13:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A72B419C6;
	Tue, 21 Jun 2022 13:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A72B419C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHOuWvKru0NP; Tue, 21 Jun 2022 13:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C225419BA;
	Tue, 21 Jun 2022 13:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C225419BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BA0A1BF9C2
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B039419B9
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 13:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B039419B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEsUCEFolR3g for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 13:11:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45FF0419BA
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45FF0419BA
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:11:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 2F0B0CD4FB
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 13:06:43 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C553040017;
 Tue, 21 Jun 2022 13:06:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 15:06:36 +0200
Message-Id: <20220621130636.1100016-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655816797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ApmOyMY8WCbI9OrJVHsmmnFq8NLAF9sp2p1TyA34Icg=;
 b=HG5BpnZam3wvycC1S/LKXWdO/3zTAQEOoiEEgLbIyA/cbxI7PZVc3DxPDbDZiU9tYoNmfj
 4+3uSGKjRisXALfHnR67gKbOjyNOfEM9OIsJo7kKlQhAmq+3YiIpBQFVRZUrGszCGcNCve
 iqH6QZPk++1mHtmCVRhs4F9Ssb7hTCP/JGmc+r7bI0gyXS7f8NirSr7VgXZfYVxwKiMaHe
 97zMEnLlCsI1pyhFSB8pFlephWWy72JOMt8m93TC7Q52xEWklguzZERp1oZIXfZqQsLToO
 fqbAzUbKBc80xCHzx9GLFI2/lj5gBffzZtGW9s2GeAfb+tYdVLo9TKFuBJBtvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HG5BpnZa
Subject: [Buildroot] [PATCH] boot/optee-os: add support for custom tarball
 URL
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
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, etienne.carriere@linaro.org,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

For now only latest release and custom git repository was supported.
This patch adds support for custom tarball URL.

It also adds configuration verification for custom git repository and
tarball URL.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/optee-os/Config.in   | 11 +++++++++++
 boot/optee-os/optee-os.mk | 25 +++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 0be6e68b0c..d56cf53c8a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -25,6 +25,9 @@ config BR2_TARGET_OPTEE_OS_LATEST
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+	bool "Custom tarball"
+
 config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 	bool "Custom Git repository"
 	help
@@ -32,6 +35,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
 endchoice
 
+if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+
+config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION
+	string "URL of custom OP-TEE OS tarball"
+
+endif
+
 if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
 config BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL
@@ -53,6 +63,7 @@ endif
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
 	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 88f14b48e4..cc90cff2cb 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -13,14 +13,22 @@ endif
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+ifeq ($(OPTEE_OS_VERSION),custom)
+# Handle custom U-Boot tarballs as specified by the configuration
+OPTEE_OS_TARBALL = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))
+OPTEE_OS_SITE = $(patsubst %/,%,$(dir $(OPTEE_OS_TARBALL)))
+OPTEE_OS_SOURCE = $(notdir $(OPTEE_OS_TARBALL))
+else ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
 OPTEE_OS_SITE = $(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL))
 OPTEE_OS_SITE_METHOD = git
-BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
 else
 OPTEE_OS_SITE = $(call github,OP-TEE,optee_os,$(OPTEE_OS_VERSION))
 endif
 
+ifeq ($(BR2_TARGET_OPTEE_OS)$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
+endif
+
 OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
 
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
@@ -130,6 +138,19 @@ ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
 ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_PLATFORM)),)
 $(error No OP-TEE OS platform set. Check your BR2_TARGET_OPTEE_OS_PLATFORM setting)
 endif
+
+ifeq ($(OPTEE_OS_VERSION),custom)
+ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))),)
+$(error No tarball location specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION))
+endif
+endif
+
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)),)
+$(error No repository specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_REPO_URL)
+endif
+endif
+
 endif # BR2_TARGET_OPTEE_OS && BR2_BUILDING
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
