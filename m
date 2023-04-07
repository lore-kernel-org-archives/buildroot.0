Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470C8C77B61
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2285844D8;
	Fri,  7 Apr 2023 14:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2285844D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1MO1s9Xtbu6; Fri,  7 Apr 2023 14:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FC184580;
	Fri,  7 Apr 2023 14:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4FC184580
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4001C2E3E
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 14:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 725474170E
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 14:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 725474170E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UG9soARY_ZrG for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 14:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB0B40994
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB0B40994
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 14:19:45 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 3146D5FD0E;
 Fri,  7 Apr 2023 17:19:42 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Fri,  7 Apr 2023 17:19:42 +0300 (MSK)
From: Oleg Lyovin <ovlevin@sberdevices.ru>
To: <buildroot@buildroot.org>
Date: Fri, 7 Apr 2023 17:19:30 +0300
Message-ID: <20230407141930.694756-2-ovlevin@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407141930.694756-1-ovlevin@sberdevices.ru>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/07 12:09:00 #21057308
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1680877182;
 bh=Ty8MfJwYfEDO6aT9dfwFAR8BQCBTD0BVDFV+wP/ZGA0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=myXISiRzngPdZ0exKCiW2wP25PoIm6B8RYH1AIdJkHc9sdADEWYbrLPVG6dfRLuHm
 hoI3lxTuQuA32LP9B4KwGqy21YgDgw3armwJMLGB/NlI5/RmNn8pwKWGM7Gxh9ttS4
 /kwxNM3yD2DfgSMDPSP1acG5uTyeJw6+aeBEYVWNd2mr1enfWeWV8bkoxD/7Dta0Qo
 BrxOmPRUyVQeklTmDjelPudXiQGNIYrbjyEQYSV3DEhAOmmZs/7YVpNoy7txfdrEgL
 f7bbos0lrRciOqE4cTleoibwr4rv0uuhmQQn5VLAIJW3iJnD351P+YhvIwd28kezhK
 C90+lswG0SRPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=myXISiRz
Subject: [Buildroot] [PATCH 2/2] linux: use host-make
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
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU make package from the host machine may be too old,
so use the one built by buildroot.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
---
 linux/linux.mk | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 03d89cd204..408611a3cd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -61,6 +61,9 @@ BR_NO_CHECK_HASH_FOR += $(notdir $(LINUX_PATCHES))
 # be directories in the patch list (unlike for other packages).
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
+# We need to override pkg-kconfig default host make tool.
+LINUX_MAKE = $(BR2_MAKE)
+
 # while the kernel is built for the target, the build may need various
 # host libraries depending on config (and version), so use
 # HOST_MAKE_ENV here. In particular, this ensures that our
@@ -70,7 +73,9 @@ LINUX_MAKE_ENV = \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES = host-kmod
+LINUX_DEPENDENCIES = \
+	host-kmod \
+	$(BR2_MAKE_HOST_DEPENDENCY)
 
 # The kernel CONFIG_EXTRA_FIRMWARE feature requires firmware files at build
 # time. Make sure they are available before the kernel builds.
@@ -183,7 +188,7 @@ endif
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 # Filter out 'w' from MAKEFLAGS, to workaround a bug in make 4.1 (#13141)
-LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
+LINUX_VERSION_PROBED = `MAKEFLAGS='$(filter-out w,$(MAKEFLAGS))' $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
 LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 
@@ -433,7 +438,7 @@ LINUX_DEPENDENCIES += host-bison host-flex
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
@@ -481,7 +486,7 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed. We call the 'all' and
 # '$(LINUX_TARGET_NAME)' targets separately because calling them in
-# the same $(MAKE) invocation has shown to cause parallel build
+# the same $(BR2_MAKE) invocation has shown to cause parallel build
 # issues.
 # The call to disable gcc-plugins is a stop-gap measure:
 #   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
@@ -490,8 +495,8 @@ define LINUX_BUILD_CMDS
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
@@ -540,7 +545,7 @@ define LINUX_INSTALL_TARGET_CMDS
 	# Install modules and remove symbolic links pointing to build
 	# directories, not relevant on the target
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
-		$(LINUX_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
+		$(LINUX_MAKE_ENV) $(BR2_MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) modules_install; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
 	fi
@@ -639,7 +644,7 @@ linux-rebuild-with-initramfs: rootfs-cpio
 linux-rebuild-with-initramfs:
 	@$(call MESSAGE,"Rebuilding kernel with initramfs")
 	# Build the kernel.
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
+	$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
 	# Copy the kernel image(s) to its(their) final destination
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
