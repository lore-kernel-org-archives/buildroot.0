Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBBEC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6CDC415DD;
	Sun, 12 Mar 2023 20:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CDC415DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwzNG66RYeRh; Sun, 12 Mar 2023 20:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEF8F415E5;
	Sun, 12 Mar 2023 20:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF8F415E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F34401BF4E3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C6D60BA1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 20:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C6D60BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8W7_d5PWyB19 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 20:08:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0242460767
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 20:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0242460767
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E28BE86FAD; Sun, 12 Mar 2023 20:08:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 20:43:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e93f96b717f31ab26d047c8daac8ae55622396bd
X-Git-Newrev: 1807ef104904912472191114f274042a9cfc9d20
X-Patchwork-Hint: ignore
Message-Id: <20230312200840.E28BE86FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: libseccomp is
 mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=1807ef104904912472191114f274042a9cfc9d20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libseccomp is mandatory since bump to version 23.0.0 in commit
485b47e025541a58358d8852c600b8e7644b4ec6:
https://github.com/moby/moby/pull/42501

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15321

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/Config.in        | 10 ++++++++--
 package/docker-engine/docker-engine.mk |  6 +-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b5a356eab9..570b2ff681 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,9 +5,12 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_LIBSECCOMP
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
@@ -48,8 +51,11 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	depends on BR2_USE_MMU
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f8d31de0fe..c61aa491c2 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -10,7 +10,7 @@ DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
-DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
+DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
 DOCKER_ENGINE_CPE_ID_VENDOR = docker
@@ -30,10 +30,6 @@ ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_DEPENDENCIES += libseccomp
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
