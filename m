Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9ACC282EC
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8099831C1;
	Tue, 18 Mar 2025 15:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7IjVajtRSsN; Tue, 18 Mar 2025 15:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4BA483FAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BA483FAA;
	Tue, 18 Mar 2025 15:06:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 471E1D94
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F29D9409DA
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2DnzGIL9ySk for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A425240859
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A425240859
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98CAE84755; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 20:45:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce3dae7a83b2539737cb9a321a6dc73005aece4e
X-Git-Newrev: cb97f6a9b32456b33e160afbc6677db089ad9412
X-Patchwork-Hint: ignore
Message-Id: <20250318150244.98CAE84755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: carry the tini init
 symlink
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb97f6a9b32456b33e160afbc6677db089ad9412
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tini can be used standalone, not just as an init injected by docker.
As such, creating the docker-engine's init symlink does not belong to
tini itself, but to docker-engine.

This will also help later, when we allow docker-engine to use another
init alternative, catatonit (already paclkaged in Buildroot, but not
integrated with docker).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Cc: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-engine/docker-engine.mk | 8 ++++++++
 package/tini/tini.mk                   | 2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba4e7a4ae0..7467f13b39 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,6 +35,14 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT),y)
+define DOCKER_ENGINE_INIT
+	mkdir -p $(TARGET_DIR)/usr/libexec/docker
+	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
+endef
+DOCKER_ENGINE_POST_INSTALL_TARGET_HOOKS += DOCKER_ENGINE_INIT
+endif
+
 ifneq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
 endif
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 83e86237d4..c195c69023 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -31,8 +31,6 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
-	mkdir -p $(TARGET_DIR)/usr/libexec/docker
-	ln -sf ../../bin/tini $(TARGET_DIR)/usr/libexec/docker/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
