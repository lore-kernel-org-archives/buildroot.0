Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6598AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 128BF401FF;
	Sat,  8 Jan 2022 22:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbVJCPfM4xh6; Sat,  8 Jan 2022 22:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568A5401F2;
	Sat,  8 Jan 2022 22:37:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4554A1BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F83E81465
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dygVD4AEtdwr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF1DF8146E
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 92D9A832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e5d2c0b9559f1aef62c8d547f9b38cc2ebb2099
X-Git-Newrev: ffc503fab767c9d2381f7152bcaab024a6358748
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.92D9A832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gocryptfs: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffc503fab767c9d2381f7152bcaab024a6358748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds the gocryptfs encrypted FUSE filesystem.

Currently uses without_openssl build tag, to use the native Go cryptography.
However, the package could be improved by conditionally enabling openssl if it
is also configured to be built by Buildroot.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/gocryptfs/Config.in      | 12 ++++++++++++
 package/gocryptfs/gocryptfs.hash |  3 +++
 package/gocryptfs/gocryptfs.mk   | 19 +++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2e3500e788..259cace487 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,7 @@ F:	package/docker-proxy/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
+F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/mosh/
 F:	package/pkg-golang.mk
diff --git a/package/Config.in b/package/Config.in
index f127b6bf45..081268527c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -221,6 +221,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/gocryptfs/Config.in"
 	source "package/imx-usb-loader/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
diff --git a/package/gocryptfs/Config.in b/package/gocryptfs/Config.in
new file mode 100644
index 0000000000..2630cafdcf
--- /dev/null
+++ b/package/gocryptfs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GOCRYPTFS
+	bool "gocryptfs"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  gocryptfs is an encrypted FUSE overlay filesystem.
+
+	  https://github.com/rfjakob/gocryptfs
+
+comment "gocryptfs needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
new file mode 100644
index 0000000000..94487815f5
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4d89b76fe0b0c7218099f6f0ea6c1c87efe13927d95579a6ede82f20b6dbe48a  gocryptfs-2.2.0.tar.gz
+sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
new file mode 100644
index 0000000000..2a00e9a959
--- /dev/null
+++ b/package/gocryptfs/gocryptfs.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# gocryptfs
+#
+################################################################################
+
+GOCRYPTFS_VERSION = 2.2.0
+GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
+GOCRYPTFS_LICENSE = MIT
+GOCRYPTFS_LICENSE_FILES = LICENSE
+
+GOCRYPTFS_GOMOD = github.com/rfjakob/gocryptfs/v2
+
+GOCRYPTFS_LDFLAGS = \
+	-X main.GitVersion=$(GOCRYPTFS_VERSION) \
+	-X main.GitVersionFuse=[vendored]
+GOCRYPTFS_TAGS = without_openssl
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
