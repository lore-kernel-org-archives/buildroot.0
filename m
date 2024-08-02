Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F25C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65592410E5;
	Fri,  2 Aug 2024 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai6MuthrqWej; Fri,  2 Aug 2024 20:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA06641061
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA06641061;
	Fri,  2 Aug 2024 20:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3112B1BF487
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F3A2606C6
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Le_lIsMtgpQ for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302F0606C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 302F0606C0
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18F1383BD2; Fri,  2 Aug 2024 20:03:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 21:55:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 905409a245a5adfbca4dcf934a52aaca992a5435
X-Git-Newrev: d9c6e47534e4dadbcf727857d0be387299cabb2b
X-Patchwork-Hint: ignore
Message-Id: <20240802200322.18F1383BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: add support for
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9c6e47534e4dadbcf727857d0be387299cabb2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball
version does not match the latest optee-client version supported by
Buildroot, optee-client might not build or run properly. This patch
adds support for an optee-client custom tarball URL to address this
potential issue.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/Config.in       | 38 ++++++++++++++++++++++++++++++++++++
 package/optee-client/optee-client.mk | 21 ++++++++++++++++++--
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 4061164cbb..738d43f837 100644
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
+	bool "4.3.0"
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
+	default "4.3.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
+
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
 	string "Path for normal world OS secure storage"
 	default "/data/tee"
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index c1813cd9b1..de3ff1df7f 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,12 +4,23 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 4.3.0
-OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
+OPTEE_CLIENT_VERSION = $(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
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
 OPTEE_CLIENT_CONF_OPTS = \
 	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
 	-DCFG_WERROR=OFF
@@ -38,4 +49,10 @@ define OPTEE_CLIENT_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
 endef
 
+ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL)$(BR_BUILDING),yy)
+ifeq ($(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)),)
+$(error No tarball location specified. Please check BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL_LOCATION)
+endif
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
