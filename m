Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE18C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36F7940644;
	Sat, 23 Mar 2024 12:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVsdY9nX4w-F; Sat, 23 Mar 2024 12:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD234064D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FD234064D;
	Sat, 23 Mar 2024 12:48:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39F071BF3E1
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 341B0605DE
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTUoCQ94sRQs for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B91605D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64B91605D1
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 454FF836E5; Sat, 23 Mar 2024 12:48:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 13:44:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 752ab5a9e635f4c039c031ed00381356b60f4398
X-Git-Newrev: 43ca417c0c883f245dde9be82d49c49adaceea2c
X-Patchwork-Hint: ignore
Message-Id: <20240323124835.454FF836E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: fix btrfs handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=43ca417c0c883f245dde9be82d49c49adaceea2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

btrfs handling doesn't depend on btrfs-progs but on kernel >= 4.12 since
bump to version 1.7.7 in commit 79e01ef9506a6cdc4836912607dc594ae7b1999d
and
https://github.com/containerd/containerd/commit/024a748c092cbddde0918f2e93a646ce50116e11
resulting in the following build failure:

In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
./btrfs.h:19:2: error: #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
 #error "Headers from kernel >= 4.12 are required on compilation time (not on run time)"
  ^~~~~
In file included from vendor/github.com/containerd/btrfs/v2/btrfs.go:21:0:
./btrfs.h:22:10: fatal error: linux/btrfs_tree.h: No such file or directory
 #include <linux/btrfs_tree.h>
          ^~~~~~~~~~~~~~~~~~~~

Fixes: 79e01ef9506a6cdc4836912607dc594ae7b1999d
 - http://autobuild.buildroot.org/results/d6afeef47daae1783dcce3e2b6a0a16e3e5d5fbd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/Config.in     | 7 ++++---
 package/containerd/containerd.mk | 4 +---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/containerd/Config.in b/package/containerd/Config.in
index 12a53bc111..2dd04b109c 100644
--- a/package/containerd/Config.in
+++ b/package/containerd/Config.in
@@ -20,12 +20,13 @@ if BR2_PACKAGE_CONTAINERD
 
 config BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS
 	bool "btrfs snapshot driver"
-	depends on BR2_USE_MMU # btrfs-progs
-	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
-	select BR2_PACKAGE_BTRFS_PROGS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	help
 	  Build the btrfs snapshot driver for containerd.
 
+comment "brtfs snapshot driver needs headers >= 4.12"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+
 config BR2_PACKAGE_CONTAINERD_DRIVER_DEVMAPPER
 	bool "devmapper snapshot driver"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 50c2965b87..9bf51c93ae 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -35,9 +35,7 @@ CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 CONTAINERD_TAGS += seccomp
 endif
 
-ifeq ($(BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS),y)
-CONTAINERD_DEPENDENCIES += btrfs-progs
-else
+ifneq ($(BR2_PACKAGE_CONTAINERD_DRIVER_BTRFS),y)
 CONTAINERD_TAGS += no_btrfs
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
