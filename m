Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB2C28B30
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 20:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB77E607A2;
	Sat, 15 Mar 2025 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTdDl0Vw5xE7; Sat, 15 Mar 2025 20:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADB7D607BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB7D607BE;
	Sat, 15 Mar 2025 20:50:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47DE7C8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377B740477
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nrcI5u_FZyX for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 20:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC6954046C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC6954046C
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 20:50:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C43687F18; Sat, 15 Mar 2025 20:50:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 21:45:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb97f6a9b32456b33e160afbc6677db089ad9412
X-Git-Newrev: 022f49618cab99f7d944bf6608578ae4a5f543b3
X-Patchwork-Hint: ignore
Message-Id: <20250315205031.6C43687F18@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: add
 option to support catatonit as init
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=022f49618cab99f7d944bf6608578ae4a5f543b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

currently, docker-engine can only use tini as injected init. catatonit
as a package exists, but it does not create the symlink that would be
needed at runtime [0].

Add a choice at the docker-engine level, for which injected init to use,
bringing catatonit to the integration level of tini.

[0] that could be done in a post-build script, but that's not practical.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: move the legacy option to a new 2025.05 section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                       | 11 +++++++++++
 package/docker-engine/Config.in        | 32 +++++++++++++++++++++++++++-----
 package/docker-engine/docker-engine.mk |  6 ++++--
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f94a7db7b0..998e175d4a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,17 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2025.05"
+
+# BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT is still referenced in docker-engine
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+	bool "docker-engine init support is now a choice"
+	select BR2_LEGACY
+	help
+	  docker-engine init support is now a choice. The original
+	  setting has been adapted; be sure to review it in the
+	  docker-engine package.
+
 comment "Legacy options removed in 2025.02"
 
 config BR2_PACKAGE_ANGULARJS
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index e03ecceeff..6338eeeef1 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -48,16 +48,38 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 	help
 	  Build the vfs filesystem driver for Docker.
 
-config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
+choice
 	bool "support docker-init"
+	default BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT  # legacy
+	help
+	  Support providing a minimal init process for containers.
+	  Required to use "docker run --init".
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NONE
+	bool "none"
+	help
+	  Do not support docker-init.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
+	bool "catatonit"
+	select BR2_PACKAGE_CATATONIT # runtime
+	help
+	  Support providing a minimal init process for containers,
+	  using catatonit.
+
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
+	bool "tini"
 	select BR2_PACKAGE_TINI # runtime
 	help
 	  Support providing a minimal init process for containers,
-	  using tini. Required to use "docker run --init".
+	  using tini.
+
+endchoice
 
-	  This does not change the Docker engine build, the
-	  docker-init symlink is provided by the tini package
-	  itself. This option only adds the dependency.
+config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
+	string
+	default "tini" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_TINI
+	default "catatonit" if BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_CATATONIT
 
 endif
 
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 7467f13b39..c39dc2b440 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,10 +35,12 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
+DOCKER_ENGINE_INIT_NAME = $(call qstrip,$(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME))
+ifneq ($(DOCKER_ENGINE_INIT_NAME),)
 define DOCKER_ENGINE_INIT
 	mkdir -p $(TARGET_DIR)/usr/libexec/docker
-	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
+	ln -sf ../../bin/$(DOCKER_ENGINE_INIT_NAME) \
+		$(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
