Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EDEEE49A3
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C25B8176F;
	Tue, 22 Aug 2023 10:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C25B8176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rkAFgL2hQUin; Tue, 22 Aug 2023 10:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 835A48183D;
	Tue, 22 Aug 2023 10:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 835A48183D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 613A41BF951
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B4FD40B7C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B4FD40B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AONfNTrhSouA for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:04:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48255402E8
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48255402E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3576986097; Tue, 22 Aug 2023 10:04:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 11:53:54 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d6b2f14901b046fff443e32c52c9f24089277836
X-Git-Newrev: a77db2f34c06ef6b20e301b476339103488326a8
X-Patchwork-Hint: ignore
Message-Id: <20230822100434.3576986097@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/ti-k3-r5-loader: allow
 for full build source customization
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a77db2f34c06ef6b20e301b476339103488326a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The TI K3 R5 loader package essentially is a wrapper to build a special
version of U-boot SPL used as part of a multi-stage boot flow on TI K3
devices, and as such needs full flexibility as to specifying the U-Boot
sources used for the build. To accomodate this, add the same options as
already available in the regular U-Boot package. For most use cases, the
same source settings (repo URL, versions, etc.) should be used for both
ti-k3-r5-loader and uboot packages.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/ti-k3-r5-loader/Config.in          | 65 ++++++++++++++++++++++++++++++++-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 25 ++++++++++++-
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 10602c8df3..8c8368a1a5 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -2,13 +2,74 @@ config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
 	help
-	  Separate U-Boot build for R5 cores on TI's k3 boards.
+	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
 
 if BR2_TARGET_TI_K3_R5_LOADER
 
 choice
-	prompt "Configuration"
+	prompt "U-Boot Version"
+	help
+	  Select the specific U-Boot version you want to use to build
+	  the initial SPL running on the R5 core. Note that for most
+	  use cases you will want to use the exact same version/source
+	  here as it is used to build the main U-Boot package.
+
+config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	bool "2022.10"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official versions
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT
+	bool "Custom Git repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG
+	bool "Custom Mercurial repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+	bool "Custom Subversion repository"
+
+endchoice
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE
+	string "U-Boot version"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION
+	string "URL of custom U-Boot tarball"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+
+if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG || BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	help
+	  Revision to use in the typical format used by
+	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
+
+endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_VERSION
+	string
+	default "2022.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
+	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
+		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
+	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
+	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || \
+		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG  || \
+		   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
+choice
+	prompt "U-Boot Configuration"
 	default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
 
 config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index afa309aa98..0ffcb8235f 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -4,9 +4,32 @@
 #
 ################################################################################
 
-TI_K3_R5_LOADER_VERSION = 2022.10
+TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
+
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
+# Handle custom U-Boot tarballs as specified by the configuration
+TI_K3_R5_LOADER_TARBALL = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION))
+TI_K3_R5_LOADER_SITE = $(patsubst %/,%,$(dir $(TI_K3_R5_LOADER_TARBALL)))
+TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = git
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = hg
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
+TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
+TI_K3_R5_LOADER_SITE_METHOD = svn
+else
+# Handle stable official U-Boot versions
 TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
 TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
+endif
+
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(TI_K3_R5_LOADER_SOURCE)
+endif
+
 TI_K3_R5_LOADER_LICENSE = GPL-2.0+
 TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
