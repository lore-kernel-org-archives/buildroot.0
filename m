Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F2C25B74
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234DD6129E;
	Thu,  9 May 2024 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpWhRJdlPiFm; Thu,  9 May 2024 20:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D53C61320
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D53C61320;
	Thu,  9 May 2024 20:55:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E74E71BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D34A384002
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlCYbCBvReRM for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B5D83FF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13B5D83FF0
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:55:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BBBF86DD2; Thu,  9 May 2024 20:55:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:55:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72bcff308164db81341e37053d7817339f6bf67c
X-Git-Newrev: e28418dd4181fde155b799724e7e672938427804
X-Patchwork-Hint: ignore
Message-Id: <20240509205524.0BBBF86DD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add option to include git submodules
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

commit: https://git.buildroot.net/buildroot/commit/?id=e28418dd4181fde155b799724e7e672938427804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some kernel users find it useful to store submodules in the kernel
source tree for cross source trees definitions. Add option to download
these submodules.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 6 ++++++
 linux/linux.mk  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e8dc79c822..ca6b9a08b0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -126,6 +126,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 
 endif
 
+config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
+	bool "Download also git submodules"
+	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+	help
+	  Include git submodules in the kernel source tree.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.8.6" if BR2_LINUX_KERNEL_LATEST_VERSION
diff --git a/linux/linux.mk b/linux/linux.mk
index 4e12b36c1f..16d9f19470 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -24,6 +24,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES),y)
+LINUX_GIT_SUBMODULES = YES
+endif
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
