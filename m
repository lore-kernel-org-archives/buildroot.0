Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFACAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1196F807C2;
	Fri, 19 Sep 2025 12:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oom4eHhIcDsF; Fri, 19 Sep 2025 12:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A0F080819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A0F080819;
	Fri, 19 Sep 2025 12:54:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EFF8E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80D8940B35
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m4hpjUspOPc for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB5F40A7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB5F40A7A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2088085FD5; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:30:57 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: eb399a6825df69cee7546dc2cebfc67d77ae5786
X-Git-Newrev: d142844ce38aa8f009fabe4b6e262ab49cda7da7
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.2088085FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/docker-engine:
 depend on cgroup v2 and kernel >=5.2 without systemd
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d142844ce38aa8f009fabe4b6e262ab49cda7da7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Without systemd package/docker-engine requires another way to mount
/sys/fs/cgroup, so far provided by BR2_PACKAGE_CGROUPFS_MOUNT for
cgroup v1. Replace this with BR2_PACKAGE_CGROUPFS_V2_MOUNT for cgroup
v2 support. 5.2 is the minimum recommended version for cgroup v2
support according to the Docker documentation: "v4.15 or later (v5.2
or later is recommended)" [1].

Depending on the selected container runtime users may need to adjust
kernel configurations to enable options required by that runtime with
cgroup v2 (e.g. CONFIG_CGROUP_BPF for runc).

Propagate dependencies accordingly: The Docker btrfs filesystem driver
does not need a separate and lower minimum headers version,
package/mender-update-modules needs to apply the new "depends on".

[1] https://docs.docker.com/engine/containers/runmetrics/#running-docker-on-cgroup-v2

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit b07b0bb4560ce49f1c4e0e54a21c28435f17bf17)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/docker-engine/Config.in         | 13 +++++--------
 package/mender-update-modules/Config.in |  7 ++++---
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 6338eeeef1..ae07b5e19d 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -3,11 +3,12 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
-	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
+	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_IPTABLES # runtime dependency
@@ -22,13 +23,9 @@ if BR2_PACKAGE_DOCKER_ENGINE
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs filesystem driver for Docker.
 
-comment "brtfs filesystem driver needs headers >= 4.12"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
-
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER
 	bool "devicemapper filesystem driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
@@ -83,11 +80,11 @@ config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT_NAME
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 76158ab6c7..e71309c3d6 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -79,8 +79,9 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccom
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2 # docker-engine
 	select BR2_PACKAGE_DOCKER_ENGINE
 	select BR2_PACKAGE_DOCKER_CLI
 	select BR2_PACKAGE_JQ # runtime
@@ -97,13 +98,13 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
 
-comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 3.17"
+comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 5.2"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_TOOLCHAIN_USES_UCLIBC || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_MENDER_UPDATE_MODULES_IPK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
