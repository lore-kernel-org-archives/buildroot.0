Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF16C282E5
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 20:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5609660676;
	Wed,  5 Mar 2025 20:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euyLot8JjWKW; Wed,  5 Mar 2025 20:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6475E60710
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6475E60710;
	Wed,  5 Mar 2025 20:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE8E194
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA2E960B4E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io3knWcKGehR for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 20:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA6060676
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCA6060676
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 20:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A69FC87F33; Wed,  5 Mar 2025 20:02:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 20:06:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66a0513e0eb08b55e1246ba414f80f4f0358fb08
X-Git-Newrev: 5472d93d1c10dd457322e0a7767346ed69700fd9
X-Patchwork-Hint: ignore
Message-Id: <20250305200228.A69FC87F33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add support for device tree overlays
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5472d93d1c10dd457322e0a7767346ed69700fd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux kernel can build device tree overlays (.dtbo) itself. Add
support to build and copy them along with the actual device trees.
These can either be in-tree device tree overlays
(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES) or they can be provided outside of
the kernel (BR2_LINUX_KERNEL_CUSTOM_DTS_PATH). In the latter case, the
overlay source files will be copied into the kernel tree first.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 14 +++++++++++---
 linux/linux.mk  |  7 +++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 30fc9f095f..d6a0ace6c0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -426,12 +426,20 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 	  the trailing .dts. You can provide a list of
 	  dts files to build, separated by spaces.
 
+config BR2_LINUX_KERNEL_INTREE_DTSO_NAMES
+	string "In-tree Device Tree Overlay file names"
+	help
+	  Names of in-tree device tree overlay, without the trailing
+	  .dtso which should be built and installed into the target
+	  system, separated by spaces.
+
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
-	  Source Include (.dtsi) files, separated by spaces. These files
-	  will be copied to the kernel sources and the .dts files will
+	  Paths to out-of-tree Device Tree Source (.dts), Device Tree
+	  Source Include (.dtsi) and Device Tree Overlay Source (.dtso)
+	  files, separated by spaces. These files will be copied to the
+	  kernel sources and the .dts files will
 	  be compiled from there.
 
 config BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME
diff --git a/linux/linux.mk b/linux/linux.mk
index 12699b8ee4..9c621c18d5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,14 +203,17 @@ endif
 LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_DTSO_NAMES += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTSO_NAMES))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
+LINUX_DTSO_NAMES += $(basename $(filter %.dtso,$(notdir $(LINUX_CUSTOM_DTS_PATH))))
 
-LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
+LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME)) $(addsuffix .dtbo,$(LINUX_DTSO_NAMES))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
