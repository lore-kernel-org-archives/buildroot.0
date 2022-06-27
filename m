Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F11C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A80FA40574;
	Mon, 27 Jun 2022 21:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A80FA40574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BUBcnFqs_ykp; Mon, 27 Jun 2022 21:26:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBFCC4019F;
	Mon, 27 Jun 2022 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBFCC4019F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5457E1BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E5734019F
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E5734019F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYyV745bQ9wj for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:26:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C1A6400D8
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C1A6400D8
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F3567875D5; Mon, 27 Jun 2022 21:14:10 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:26:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f089aa9877b0f31bd206714449cf41ade196f8e5
X-Git-Newrev: 9c79b369d69c536344f75f577f74de4b33e81e1c
X-Patchwork-Hint: ignore
Message-Id: <20220627211410.F3567875D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/optee-os: add support for custom
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c79b369d69c536344f75f577f74de4b33e81e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now only latest release and custom git repository was supported.
This patch adds support for custom tarball URL.

It also adds configuration verification for custom git repository and
tarball URL.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Etienne Carriere <etienne.carriere@linaro.rog> for the v2.
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/optee-os/Config.in   | 19 +++++++++++++++++++
 boot/optee-os/optee-os.mk | 24 ++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 0be6e68b0c..62e4adcf55 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -25,6 +25,17 @@ config BR2_TARGET_OPTEE_OS_LATEST
 	  Use the latest release tag from the OP-TEE OS official Git
 	  repository.
 
+config BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
+	bool "Custom tarball"
+	help
+	  This option allows to specify a URL pointing to a kernel
+	  source tarball. This URL can use any protocol recognized by
+	  Buildroot, like http://, ftp://, file:// or scp://.
+
+	  When pointing to a local tarball using file://, you may want
+	  to use a make variable like $(TOPDIR) to reference the root of
+	  the Buildroot tree.
+
 config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 	bool "Custom Git repository"
 	help
@@ -32,6 +43,13 @@ config BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
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
@@ -53,6 +71,7 @@ endif
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
 	default "3.17.0"	if BR2_TARGET_OPTEE_OS_LATEST
+	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
 	default BR2_TARGET_OPTEE_OS_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_OPTEE_OS_CUSTOM_GIT
 
diff --git a/boot/optee-os/optee-os.mk b/boot/optee-os/optee-os.mk
index 88f14b48e4..fa6ee93137 100644
--- a/boot/optee-os/optee-os.mk
+++ b/boot/optee-os/optee-os.mk
@@ -13,14 +13,21 @@ endif
 OPTEE_OS_INSTALL_STAGING = YES
 OPTEE_OS_INSTALL_IMAGES = YES
 
-ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_GIT),y)
+ifeq ($(BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL),y)
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
 
+ifeq ($(BR2_TARGET_OPTEE_OS):$(BR2_TARGET_OPTEE_OS_LATEST_VERSION),y:)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_OS_SOURCE)
+endif
+
 OPTEE_OS_DEPENDENCIES = host-openssl host-python3 host-python-pyelftools
 
 ifeq ($(BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY),y)
@@ -130,6 +137,19 @@ ifeq ($(BR2_TARGET_OPTEE_OS)$(BR_BUILDING),yy)
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
