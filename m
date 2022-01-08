Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF581C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B36640185;
	Sat,  8 Jan 2022 22:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHI1phBbQaj1; Sat,  8 Jan 2022 22:37:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8859640241;
	Sat,  8 Jan 2022 22:37:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDBA1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4E6A40220
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id na2YkAdhW__i for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B94EE40241
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8752983460; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43c580ac9f848449333ecbe4336c2c9f2ba12158
X-Git-Newrev: 4e5d2c0b9559f1aef62c8d547f9b38cc2ebb2099
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.8752983460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/embiggen-disk: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e5d2c0b9559f1aef62c8d547f9b38cc2ebb2099
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

embiggen-disk is a tool to automatically resize disks to fill available space.

Patch submitted upstream: https://github.com/bradfitz/embiggen-disk/pull/13

Adds support for /dev/mmcblk0pN type paths.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/embiggen-disk/Config.in          | 19 +++++++++++++++++++
 package/embiggen-disk/embiggen-disk.hash |  3 +++
 package/embiggen-disk/embiggen-disk.mk   | 12 ++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ab6648cec2..2e3500e788 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -528,6 +528,7 @@ F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-engine/
 F:	package/docker-proxy/
+F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/mbpfan/
diff --git a/package/Config.in b/package/Config.in
index ad6741f74c..f127b6bf45 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2528,6 +2528,7 @@ menu "System tools"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
+	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
new file mode 100644
index 0000000000..667d71c86e
--- /dev/null
+++ b/package/embiggen-disk/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_EMBIGGEN_DISK
+	bool "embiggen-disk"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
+	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_UTIL_LINUX # sfdisk
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk
+	help
+	  embiggen-disk is a tool to resize disk partitions at runtime.
+
+	  https://github.com/bradfitz/embiggen-disk
+
+comment "embiggen-disk needs a glibc or musl toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
new file mode 100644
index 0000000000..3a290e2ec8
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  514cde66ab9fe6af91b97f17acc19b37976f675ebea0e1be741d6bd621811d87  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62.tar.gz
+sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
new file mode 100644
index 0000000000..66f2087dbd
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# embiggen-disk
+#
+################################################################################
+
+EMBIGGEN_DISK_VERSION = 9e7b2fc7b99c4dece41a805489a6ca377ce55a62
+EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_LICENSE = Apache-2.0
+EMBIGGEN_DISK_LICENSE_FILES = LICENSE
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
