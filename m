Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06922C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1764684993;
	Mon, 19 May 2025 11:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TCBSqY_IY6v; Mon, 19 May 2025 11:04:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1384B84994
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1384B84994;
	Mon, 19 May 2025 11:04:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 526B2E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EB72410B6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6Ib6t6OMcEm for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1991441E62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1991441E62
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15943872E7; Mon, 19 May 2025 10:40:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:34:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a474642fdcd8c69e12126bbe8304479aa855d916
X-Git-Newrev: 6debbd693b920ffa618b8d30ac5eb6edbff814f2
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.15943872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mender-update-modules:
 enable docker, rpm, and script modules
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6debbd693b920ffa618b8d30ac5eb6edbff814f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Starting with mender 5.x, the docker, rpm and script modules provided by
the mender package now reside in the mender-update-modules repository.

Even though the mender package provided by Buildroot is not updated yet to 5.x,
it is best to enable the modules here to help facilitate the future update of
the mender package to 5.x, and to ensure that any future modifications or bug
fixes to these modules are easy to apply by simply bumping the upstream package
version.

Script is enabled by default to preserve the existing behavior of the mender
package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in            | 56 ++++++++++++++++++++++
 .../mender-update-modules/mender-update-modules.mk | 10 ++++
 package/mender/mender.mk                           |  7 +--
 3 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 8181cfe91b..beec9d24e7 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -72,6 +72,40 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/dirty
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
+	bool "docker"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS # docker-engine, docker-cli
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS # docker-engine, docker-cli
+	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
+	depends on BR2_USE_MMU # containerd
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccom
+	select BR2_PACKAGE_DOCKER_ENGINE
+	select BR2_PACKAGE_DOCKER_CLI
+	select BR2_PACKAGE_JQ # runtime
+	help
+	  The Docker Update Module handles the Docker images that shall
+	  be running in the device. A deployment with this module will
+	  stop all currently running Docker containers in the device,
+	  and start new containers with the provided list of Docker
+	  images in the Mender Artifact.
+
+	  In case of an unforeseen error during the process, the module
+	  will use the rollback mechanism of the Mender client to
+	  restore the previously running Docker containers.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
+
+comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	depends on BR2_USE_MMU
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
 	bool "ipk"
 	select BR2_PACKAGE_OPKG
@@ -157,6 +191,28 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_ROOTFS_VERSION_CHECK
 comment "rootfs version check needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
+config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
+	bool "rpm"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_RPM
+	help
+	  The Rpm Update Module updates software on the device using
+	  the native local package manager.
+
+	  A Mender Artifact containing one or more software packages
+	  is sent to the device, where the Update Module will call
+	  the package manager to install them in alphabetical order.
+
+	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
+
+comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 90c076ea96..0024acc189 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -10,6 +10,8 @@ MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
 MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
 MENDER_UPDATE_MODULES_DEPENDENCIES = host-mender-artifact mender
 
+MENDER_UPDATE_MODULES_MODULES = script
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DFU),y)
 MENDER_UPDATE_MODULES_MODULES += dfu
 endif
@@ -22,6 +24,10 @@ ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DIRTY),y)
 MENDER_UPDATE_MODULES_MODULES += dirty
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER),y)
+MENDER_UPDATE_MODULES_MODULES += docker
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK),y)
 MENDER_UPDATE_MODULES_MODULES += ipk
 endif
@@ -49,6 +55,10 @@ endef
 MENDER_UPDATE_MODULES_POST_INSTALL_TARGET_HOOKS += MENDER_UPDATE_MODULES_INSTALL_MENDER_COMPARE_VERSIONS
 endif
 
+ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM),y)
+MENDER_UPDATE_MODULES_MODULES += rpm
+endif
+
 ifeq ($(BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU),y)
 MENDER_UPDATE_MODULES_MODULES += swu
 endif
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 146e6b2b73..770589390f 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -45,12 +45,7 @@ MENDER_DEPENDENCIES = host-pkgconf openssl
 
 MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
 
-MENDER_UPDATE_MODULES_FILES = \
-	directory \
-	script \
-	single-file \
-	$(if $(BR2_PACKAGE_DOCKER_CLI),docker) \
-	$(if $(BR2_PACKAGE_RPM),rpm)
+MENDER_UPDATE_MODULES_FILES = directory single-file
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
