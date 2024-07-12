Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D821C3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 004FE41108;
	Fri, 12 Jul 2024 15:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuCvf-vt60Jn; Fri, 12 Jul 2024 15:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C5F412A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99C5F412A4;
	Fri, 12 Jul 2024 15:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2641BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2452D412A4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_SeCAEZkZu2 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C076E41108
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C076E41108
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:19:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB16A86061; Fri, 12 Jul 2024 15:19:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 17:18:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b01c3c3331f3c33268c4232900079ee9166fc14
X-Git-Newrev: 4cb762efa4f35fa62a63475154c9431fd0da8e97
X-Patchwork-Hint: ignore
Message-Id: <20240712151919.AB16A86061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: share download files
 with uboot
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cb762efa4f35fa62a63475154c9431fd0da8e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ti-k3-r5-loader is just a U-Boot SPL running on the R5 core on TI's K3
processors, so it makes sense to just share the downloads with U-Boot.

With commit ebe238f2b595 (package/pkg-download: use _DL_SUBDIR as root
dir of generated archives), the root of the generated archive will also
be based on _DL_SUBDIR, but the name of the archive, _SOURCE, is still
based on the current package unless explicitly set. For ti-k3-r5-loader,
that would create an archive which fiename does not match its root
directory; although Buildroot does not care (we --strip-components=1
when extracting), this would be a bit surprising to anyone manually
extrating the archive, as it diverges from the usual expectations.

Do like we do for linux-headers, and force the ti-k3-r4-loader archive
filename to be u-boot-VERSION.tar.gz

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Cc: Paresh Bhagat <p-bhagat@ti.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 98a6d473f1..e426f039e0 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
+TI_K3_R5_LOADER_DL_SUBDIR = uboot
 
 ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration
@@ -14,12 +15,15 @@ TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = git
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = hg
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
 TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
 TI_K3_R5_LOADER_SITE_METHOD = svn
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
 else
 # Handle stable official U-Boot versions
 TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
