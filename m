Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22615C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36D7412D8;
	Fri,  2 Aug 2024 20:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTfq4QUg30Lq; Fri,  2 Aug 2024 20:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4271C412EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4271C412EE;
	Fri,  2 Aug 2024 20:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FE4B1BF487
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D88A40286
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L2RynGOZ5dx for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BEAF401A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BEAF401A1
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23EEC83BA3; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 21:55:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9c6e47534e4dadbcf727857d0be387299cabb2b
X-Git-Newrev: 9826d06cb3b8f7236a863597b3cb27df52b228a6
X-Patchwork-Hint: ignore
Message-Id: <20240802200322.23EEC83BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-test: add support for custom
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9826d06cb3b8f7236a863597b3cb27df52b228a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
does not match the latest optee-test version supported by Buildroot,
optee-test might not build or run properly. This patch adds support for
an optee-test custom tarball URL to address this potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-test/Config.in     | 41 ++++++++++++++++++++++++++++++++++++++++
 package/optee-test/optee-test.mk | 21 ++++++++++++++++++--
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 57a7834c75..a29eb355ac 100644
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
+	bool "4.3.0"
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
+	default "4.3.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
+
+endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 9037678b1d..c250639d06 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,11 +4,22 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 4.3.0
-OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
+OPTEE_TEST_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
 
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
+
 OPTEE_TEST_DEPENDENCIES = optee-client optee-os
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
@@ -34,4 +45,10 @@ endef
 OPTEE_TEST_POST_BUILD_HOOKS += OPTEE_TEST_BUILD_TAS
 OPTEE_TEST_POST_INSTALL_TARGET_HOOKS += OPTEE_TEST_INSTALL_TAS
 
+ifeq ($(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
