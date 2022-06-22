Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E7C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 08:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5043F6126D;
	Wed, 22 Jun 2022 08:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5043F6126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chDyT99ZoZCx; Wed, 22 Jun 2022 08:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C362611BD;
	Wed, 22 Jun 2022 08:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C362611BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1DE21BF410
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 08:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC2BB611BD
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 08:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2BB611BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f1-wOdyAaISm for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 08:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 698D560BBA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 698D560BBA
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 08:34:36 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FE5B40011;
 Wed, 22 Jun 2022 08:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 10:34:33 +0200
Message-Id: <20220622083433.1201789-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655886874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=elkRS2Gb4ufoiaVpCs4cTcNdzLACNXonTl9zNmzCXC0=;
 b=XUGkstmXpQLWApxaR6lYKdTuQ05tVil7E+jWHpiWj6gJV3SBn7q4ZDkm/Nkgp0DB0jz5b9
 7dDUJY0xhEeOYLK0fAfHw7ia3bmdkrRe5KrGQh6yt9nE1LcV1kv1vtqqyOR25NXPcEWd8P
 Wbt2BorcfIyTK1XknLdDUd7mMvnMig3oGdeOxH5KLHwQRthcui66MDmo2VVaCEkT/PIyff
 Z/B2e1lYBw6DmXqy8r8YWCm1pdBFg4vAa06EPZ6egYvuhX8/0a0kNQTSB9TRL+gEjd8yz9
 QS5uMrsWrTlu2fZRq7918sLk0dxUJcPiJrhqY5lCIe5DO/R60C8cSqCSSHyQKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XUGkstmX
Subject: [Buildroot] [PATCH v2] boot/optee-os: add support for custom
 tarball URL
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

Change since v1:
- Update the test condition on custom tarball selection.
- Remeved extra ending parentheses.

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
index 88f14b48e4..cddc1f2448 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -13,14 +13,22 @@ endif
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
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
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
+ifeq ($(call qstrip,$(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION)
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
