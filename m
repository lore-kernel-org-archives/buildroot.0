Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 949C4415E6;
	Thu, 13 Jan 2022 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DBq_fBFOTGU; Thu, 13 Jan 2022 21:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A435841634;
	Thu, 13 Jan 2022 21:40:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89A4B1BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA8284CDE
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MV5xzVuc7iMY for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:40:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A56AC84CE2
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 427FB82753; Thu, 13 Jan 2022 21:33:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 22:23:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddba0ef6b1e8e407c44bb1036a75aecaeb89da92
X-Git-Newrev: 2da2f359dba50aafef1202edda34374d99b77a14
X-Patchwork-Hint: ignore
Message-Id: <20220113213356.427FB82753@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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

commit: https://git.buildroot.net/buildroot/commit/?id=2da2f359dba50aafef1202edda34374d99b77a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CONFIG_DEBUG_BTF_INFO relies on pahole, so kernel DWARF are converted to BTF.
If CONFIG_DEBUG_BTF_INFO is set and BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE not,
an error message is shown and .config is not written.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 12 ++++++++++++
 linux/linux.mk  | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 891e2cdcb6..582f37ba7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -470,6 +470,18 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
 	  libelf-devel or elfutils-libelf-devel".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
+	bool "Needs host pahole"
+	help
+	  Some Linux kernel configuration options (such as
+	  CONFIG_DEBUG_INFO_BTF) require building a host program
+	  called pahole. Enabling this option will ensure host-pahole
+	  gets built before the Linux kernel.
+
+	  Enable this option if you get a Linux kernel build failure
+	  such as "BTF: .tmp_vmlinux.btf: pahole (pahole) is not
+	  available".
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 61fdc0c76c..dd2eebd446 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -114,6 +114,17 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
 LINUX_DEPENDENCIES += host-elfutils host-pkgconf
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_DEPENDENCIES += host-pahole
+else
+define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
+	if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
+		echo "To use CONFIG_DEBUG_INFO_BTF, enable host-pahole (BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE)" 1>&2; \
+		exit 1; \
+	fi
+endef
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
@@ -324,6 +335,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_DISABLE_OPT,$(opt))
 	)
 	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
+	$(LINUX_FIXUP_CONFIG_PAHOLE_CHECK)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
 	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
