Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB9AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A4581433;
	Sat,  8 Jan 2022 18:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwDtPjM647Fw; Sat,  8 Jan 2022 18:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B5F8143A;
	Sat,  8 Jan 2022 18:05:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 325E31BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21E34408B6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pi1n_3ujTTdh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 536A44056A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 89D9C82BA3; Sat,  8 Jan 2022 17:58:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:04:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: babd5bdadbf249d8e0baa06987e33b042b2b3fe5
X-Git-Newrev: f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146
X-Patchwork-Hint: ignore
Message-Id: <20220108175845.89D9C82BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3ecd9ea4a40d601317f3b7195be4f5d1bdb3146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new package to build and install the Mali kernel driver for
Midgard and Bifrost GPU.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                    |  1 +
 package/mali-driver/Config.in        | 14 ++++++++++++++
 package/mali-driver/mali-driver.hash |  3 +++
 package/mali-driver/mali-driver.mk   | 15 +++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3b1c38db47..d32a87fe20 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,6 +512,7 @@ endmenu
 	source "package/lsuio/Config.in"
 	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
+	source "package/mali-driver/Config.in"
 	source "package/mali-t76x/Config.in"
 	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
diff --git a/package/mali-driver/Config.in b/package/mali-driver/Config.in
new file mode 100644
index 0000000000..fee67096c8
--- /dev/null
+++ b/package/mali-driver/Config.in
@@ -0,0 +1,14 @@
+comment "mali-driver needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_MALI_DRIVER
+	bool "mali-driver"
+	depends on BR2_LINUX_KERNEL
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Mali Midgard/Bifrost GPU, compatible with recent Linux
+	  kernels (>= 5.4). Note that it should be installed together
+	  with the corresponding userspace OpenGL libraries, which are
+	  usually provided as binaries only by hardware vendors.
+
+	  mali-driver requires a Linux kernel >= 5.4.
diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
new file mode 100644
index 0000000000..a144d5189e
--- /dev/null
+++ b/package/mali-driver/mali-driver.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 76464e5ed55e9d21062cf154733ce61217211172629ec8742af902607f14d41a  mali-driver-a742530232d1de41b57465744a1259fa6c35049e.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
new file mode 100644
index 0000000000..b12bfec69d
--- /dev/null
+++ b/package/mali-driver/mali-driver.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# mali-driver
+#
+################################################################################
+
+MALI_DRIVER_VERSION = a742530232d1de41b57465744a1259fa6c35049e
+MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
+MALI_DRIVER_DEPENDENCIES = linux
+MALI_DRIVER_LICENSE = GPL-2.0
+MALI_DRIVER_LICENSE_FILE = LICENSE
+MALI_DRIVER_MODULE_SUBDIRS = r8p0/drivers/gpu/arm/midgard
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
