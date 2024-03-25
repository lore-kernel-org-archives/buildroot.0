Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4540C54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 07:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 835E281757;
	Mon, 25 Mar 2024 07:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KcA6b17FsxYD; Mon, 25 Mar 2024 07:34:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C2381E40
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C2381E40;
	Mon, 25 Mar 2024 07:34:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DDD91BF3A3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBC8E40A39
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDHhJTYZVdxR for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 099EA408CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 099EA408CA
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:34:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDEB883CE3; Mon, 25 Mar 2024 07:34:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:29:07 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4310f2747b5ceea7b9b7e7fa4808b267e4ea7c4d
X-Git-Newrev: 9af8ad53b37ead14c9d4bcbf7dd8d0662bcc683b
X-Patchwork-Hint: ignore
Message-Id: <20240325073405.EDEB883CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/docker-engine:
 fix btrfs handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af8ad53b37ead14c9d4bcbf7dd8d0662bcc683b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

btrfs doesn't depend on btrfs-progs but on headers >= 4.12 since bump to
version 24.0.2 in commit 314f62eda347ba02b4688ac94c6bab55b4a4d6c9 and
https://github.com/moby/moby/commit/3208dcabdc8997340b255f5b880fef4e3f54580d
resulting in the following build failure:

daemon/graphdriver/btrfs/btrfs.go:13:6: error: #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
     #error "Headers from kernel >= 4.12 are required to build with Btrfs support."
      ^~~~~
daemon/graphdriver/btrfs/btrfs.go:14:6: error: #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
     #error "HINT: Set 'DOCKER_BUILDTAGS=exclude_graphdriver_btrfs' to build without Btrfs."
      ^~~~~
daemon/graphdriver/btrfs/btrfs.go:18:10: fatal error: linux/btrfs_tree.h: No such file or directory
 #include <linux/btrfs_tree.h>
          ^~~~~~~~~~~~~~~~~~~~

Fixes: 314f62eda347ba02b4688ac94c6bab55b4a4d6c9
 - http://autobuild.buildroot.org/results/7d07eba37149d341dc86f9742bd166de874dcd5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e30b38f1c5bcc62d387f4b96d20a7a9f4715c7a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in        | 7 ++++---
 package/docker-engine/docker-engine.mk | 4 +---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 71bf670f17..d48ffe6484 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -21,12 +21,13 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
-	depends on BR2_USE_MMU # btrfs-progs
-	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
-	select BR2_PACKAGE_BTRFS_PROGS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs filesystem driver for Docker.
 
+comment "brtfs filesystem driver needs headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 262be2df20..05bf23ad3d 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -35,9 +35,7 @@ DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
 endif
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
-DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
-else
+ifneq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
