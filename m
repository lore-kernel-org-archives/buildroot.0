Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9FEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2D3C4018D;
	Thu,  6 Jan 2022 21:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3X33lCb1ubR; Thu,  6 Jan 2022 21:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81309404BD;
	Thu,  6 Jan 2022 21:02:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 45A461C1148
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E48B4018D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U56vgW25fc6t for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B7C2400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:00:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B6BEEE0008;
 Thu,  6 Jan 2022 21:00:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@paral.in>,
 Buildroot List <buildroot@buildroot.org>,
 Matt Weber <Matthew.Weber@rockwellcollins.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu,  6 Jan 2022 21:59:58 +0100
Message-Id: <20220106210000.397694-11-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 10/11] package/embiggen-disk: new package
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
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Stewart via buildroot <buildroot@buildroot.org>

embiggen-disk is a tool to automatically resize disks to fill available space.

Patch submitted upstream: https://github.com/bradfitz/embiggen-disk/pull/13

Adds support for /dev/mmcblk0pN type paths.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-Fix-resizing-of-dev-mmcblk0pN-paths.patch | 45 +++++++++++++++++++
 package/embiggen-disk/Config.in               | 19 ++++++++
 package/embiggen-disk/embiggen-disk.hash      |  3 ++
 package/embiggen-disk/embiggen-disk.mk        | 12 +++++
 6 files changed, 81 insertions(+)
 create mode 100644 package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
 create mode 100644 package/embiggen-disk/Config.in
 create mode 100644 package/embiggen-disk/embiggen-disk.hash
 create mode 100644 package/embiggen-disk/embiggen-disk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 774deb012f..2649cf4ac4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -518,6 +518,7 @@ F:	package/delve/
 F:	package/docker-cli/
 F:	package/docker-engine/
 F:	package/docker-proxy/
+F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/mbpfan/
diff --git a/package/Config.in b/package/Config.in
index e47c49ade5..34a36279ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2516,6 +2516,7 @@ menu "System tools"
 	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
+	source "package/embiggen-disk/Config.in"
 	source "package/emlog/Config.in"
 	source "package/ftop/Config.in"
 	source "package/getent/Config.in"
diff --git a/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
new file mode 100644
index 0000000000..31cfea9dde
--- /dev/null
+++ b/package/embiggen-disk/0001-Fix-resizing-of-dev-mmcblk0pN-paths.patch
@@ -0,0 +1,45 @@
+From b628e4c561cb4d3ffc92a5d7aac8f4967e44977e Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 27 May 2021 20:07:07 -0700
+Subject: [PATCH] Fix resizing of /dev/mmcblk0pN paths
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ fs.go   | 4 +++-
+ part.go | 5 +++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/fs.go b/fs.go
+index 0b83e24..8ab3690 100644
+--- a/fs.go
++++ b/fs.go
+@@ -67,7 +67,9 @@ func (e fsResizer) DepResizer() (Resizer, error) {
+ 	if dev == "/dev/root" {
+ 		return nil, errors.New("unexpected device /dev/root from statFS")
+ 	}
+-	if (strings.HasPrefix(dev, "/dev/sd") || strings.HasPrefix(dev, "/dev/nvme")) &&
++	if (strings.HasPrefix(dev, "/dev/sd") ||
++		strings.HasPrefix(dev, "/dev/mmcblk") ||
++		strings.HasPrefix(dev, "/dev/nvme")) &&
+ 		devEndsInNumber(dev) {
+ 		vlogf("fsResizer.DepResizer: returning partitionResizer(%q)", dev)
+ 		return partitionResizer(dev), nil
+diff --git a/part.go b/part.go
+index 0315a6e..f3e280f 100644
+--- a/part.go
++++ b/part.go
+@@ -51,6 +51,11 @@ func diskDev(partDev string) string {
+ 	if strings.HasPrefix(partDev, "/dev/sd") {
+ 		return strings.TrimRight(partDev, "0123456789")
+ 	}
++	if strings.HasPrefix(partDev, "/dev/mmcblk") {
++		v := strings.TrimRight(partDev, "0123456789")
++		v = strings.TrimSuffix(v, "p")
++		return v
++	}
+ 	if strings.HasPrefix(partDev, "/dev/nvme") {
+ 		chopP := regexp.MustCompile(`p\d+$`)
+ 		if !chopP.MatchString(partDev) {
+-- 
+2.31.1
+
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
index 0000000000..274958edc4
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5ef943b1f6468cf0eaf9d7e6ca22d8b5692cbb5b80f19d95468fb41b675b986c  embiggen-disk-c554fc1c93a4004ce0b6a3f69b0dabe0481a2308.tar.gz
+sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
new file mode 100644
index 0000000000..5d5ac15ae8
--- /dev/null
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# embiggen-disk
+#
+################################################################################
+
+EMBIGGEN_DISK_VERSION = c554fc1c93a4004ce0b6a3f69b0dabe0481a2308
+EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_LICENSE = Apache-2.0
+EMBIGGEN_DISK_LICENSE_FILES = LICENSE
+
+$(eval $(golang-package))
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
