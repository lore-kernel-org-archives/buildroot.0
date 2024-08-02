Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F58C52D6F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E7441061;
	Fri,  2 Aug 2024 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVUlYRdFqdGM; Fri,  2 Aug 2024 20:03:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD9041197
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD9041197;
	Fri,  2 Aug 2024 20:03:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 366871BF990
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F9D7844FD
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNAzIDJESgUx for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42E65820B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42E65820B1
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 300BE83BD4; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 21:55:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9826d06cb3b8f7236a863597b3cb27df52b228a6
X-Git-Newrev: 500ff76216a58df2eff2fd254e8efcd64565ba63
X-Patchwork-Hint: ignore
Message-Id: <20240802200322.300BE83BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-examples: add support for
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=500ff76216a58df2eff2fd254e8efcd64565ba63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
does not match the latest optee-examples version supported by Buildroot,
optee-examples might not build or run properly. This patch adds support for
an optee-examples custom tarball URL to address this potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-examples/Config.in         | 42 ++++++++++++++++++++++++++++++++
 package/optee-examples/optee-examples.mk | 21 ++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index eb6ee16502..52ef268ac4 100644
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
+	bool "4.3.0"
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
+	default "4.3.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
+
+endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index 8eb8724ff6..fc90cfcff6 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,11 +4,22 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 4.3.0
-OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
+OPTEE_EXAMPLES_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL),y)
+OPTEE_EXAMPLES_TARBALL = $(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION))
+OPTEE_EXAMPLES_SITE = $(patsubst %/,%,$(dir $(OPTEE_EXAMPLES_TARBALL)))
+OPTEE_EXAMPLES_SOURCE = $(notdir $(OPTEE_EXAMPLES_TARBALL))
+else
+OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES):$(BR2_PACKAGE_OPTEE_EXAMPLES_LATEST),y:)
+BR_NO_CHECK_HASH_FOR += $(OPTEE_EXAMPLES_SOURCE)
+endif
+
 OPTEE_EXAMPLES_DEPENDENCIES = optee-client optee-os
 
 # Trusted Application are not built from CMake due to ta_dev_kit dependencies.
@@ -28,4 +39,10 @@ endef
 OPTEE_EXAMPLES_POST_BUILD_HOOKS += OPTEE_EXAMPLES_BUILD_TAS
 OPTEE_EXAMPLES_POST_INSTALL_TARGET_HOOKS += OPTEE_EXAMPLES_INSTALL_TAS
 
+ifeq ($(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
