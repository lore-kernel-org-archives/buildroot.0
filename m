Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE1AC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 15:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB0181F6B;
	Mon, 10 Apr 2023 15:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB0181F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaFanUnb3Zks; Mon, 10 Apr 2023 15:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F7481F48;
	Mon, 10 Apr 2023 15:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8F7481F48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062F21C3B17
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC395409CB
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 15:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC395409CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csv8AbmhSKk4 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF7F6409E7
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7F6409E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DE6183C6C; Mon, 10 Apr 2023 15:25:12 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 17:24:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36bdfd29d87d48c3519876d93738b2aae9d7cb97
X-Git-Newrev: 0b9efc991f8a2c1b6388e4e575641228262eadd1
X-Patchwork-Hint: ignore
Message-Id: <20230410152512.9DE6183C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: use BR2_MAKE
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b9efc991f8a2c1b6388e4e575641228262eadd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since kernel version 6.2, the minimum GNU Make version is 3.82 [1]. We
have an optional host-make 4.0 minimum dependency, so we can use it as
is. It's a bit unfortunate that we have to apply this even to older
kernel versions, but make itself builds fairly fast compared to the
kernel.

Use BR2_MAKE and BR2_MAKE1 for linux, and depend on
BR2_MAKE_HOST_DEPENDENCY. In addition, we need to set LINUX_MAKE to
BR2_MAKE for use in the kconfig infrastructure.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.mk | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 03d89cd204..37797fc4f0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -70,7 +70,10 @@ LINUX_MAKE_ENV = \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES = host-kmod
+LINUX_DEPENDENCIES = \
+	host-kmod \
+	$(BR2_MAKE_HOST_DEPENDENCY)
+LINUX_MAKE = $(BR2_MAKE)
 
 # The kernel CONFIG_EXTRA_FIRMWARE feature requires firmware files at build
 # time. Make sure they are available before the kernel builds.
@@ -183,7 +186,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 
@@ -433,7 +436,7 @@ LINUX_DEPENDENCIES += host-bison host-flex
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
@@ -481,7 +484,7 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed. We call the 'all' and
 # '$(LINUX_TARGET_NAME)' targets separately because calling them in
-# the same $(MAKE) invocation has shown to cause parallel build
+# the same $(BR2_MAKE) invocation has shown to cause parallel build
 # issues.
 # The call to disable gcc-plugins is a stop-gap measure:
 #   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
@@ -490,8 +493,8 @@ define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
 endef
@@ -540,7 +543,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
-		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
+		$(LINUX_MAKE_ENV) $(BR2_MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
 	fi
@@ -639,7 +642,7 @@ linux-rebuild-with-initramfs: rootfs-cpio
 linux-rebuild-with-initramfs:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image(s) to its(their) final destination
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
