Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C3C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CB6C60C00;
	Sun, 16 Apr 2023 19:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB6C60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEfNxIL6U7A2; Sun, 16 Apr 2023 19:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E85C60E09;
	Sun, 16 Apr 2023 19:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E85C60E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1417B1C410D
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B5541D8B
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B5541D8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AP2g8rlBHb46 for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:42:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D76341D8A
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D76341D8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE79842FC; Sun, 16 Apr 2023 19:42:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 21:41:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9a13ae0838174d1c05f026cee3ff66482620626
X-Git-Newrev: 7c73f93218c293cd7a2245763c63d02910de88b8
X-Patchwork-Hint: ignore
Message-Id: <20230416194250.5AE79842FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c73f93218c293cd7a2245763c63d02910de88b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Corepack is a zero-runtime-dependency Node.js script that acts as a
bridge between Node.js projects and the package managers.  It ships
with Node.js but is disabled by default.

Some JavaScript packages, such as vuejs and vuejs-router can benefit
from having Corepack installed on the host.  Therefore, add an option
to enable Corepack with host-nodejs.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nodejs/Config.in.host | 21 +++++++++++++++++++--
 package/nodejs/nodejs.mk      | 21 +++++++++++++++++----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index f7f2b80a9b..06a1ca22ad 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,3 +1,6 @@
+comment "host nodejs needs a host gcc >= 8"
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
 	depends on BR2_HOST_GCC_AT_LEAST_8
@@ -10,5 +13,19 @@ config BR2_PACKAGE_HOST_NODEJS
 
 	  http://nodejs.org/
 
-comment "host nodejs needs a host gcc >= 8"
-	depends on !BR2_HOST_GCC_AT_LEAST_8
+if BR2_PACKAGE_HOST_NODEJS
+
+config BR2_PACKAGE_HOST_NODEJS_COREPACK
+	bool "Corepack"
+	help
+	  Enable Corepack with host nodejs.
+
+	  Corepack is a zero-runtime-dependency Node.js script that
+	  acts as a bridge between Node.js projects and the package
+	  managers they are intended to be used with during
+	  development. In practical terms, Corepack will let you use
+	  Yarn and pnpm without having to install them - just like
+	  what currently happens with npm, which is shipped by Node.js
+	  by default.
+
+endif
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 367d5d2058..539ded06cd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -109,10 +109,17 @@ define HOST_NODEJS_BUILD_CMDS
 		$(HOST_NODEJS_MAKE_OPTS)
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
+define HOST_NODEJS_ENABLE_COREPACK
+	$(COREPACK) enable
+endef
+endif
+
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		$(HOST_NODEJS_MAKE_OPTS)
+	$(HOST_NODEJS_ENABLE_COREPACK)
 endef
 
 ifeq ($(BR2_i386),y)
@@ -223,8 +230,7 @@ endef
 NODEJS_MODULES_LIST= $(call qstrip,\
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
-# Define NPM for other packages to use
-NPM = $(TARGET_CONFIGURE_OPTS) \
+NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
 	npm_config_arch=$(NODEJS_CPU) \
@@ -232,8 +238,15 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 	npm_config_prefix=$(TARGET_DIR)/usr \
-	npm_config_cache=$(BUILD_DIR)/.npm-cache \
-	$(HOST_DIR)/bin/npm
+	npm_config_cache=$(BUILD_DIR)/.npm-cache
+
+# Define various packaging tools for other packages to use
+NPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/npm
+ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
+COREPACK = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/corepack
+PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
+YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
+endif
 
 #
 # We can only call NPM if there's something to install.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
