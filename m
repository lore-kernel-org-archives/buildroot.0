Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE872C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80E9E40925;
	Mon, 15 Jul 2024 14:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LENQEERrDJr; Mon, 15 Jul 2024 14:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5DA24042B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5DA24042B;
	Mon, 15 Jul 2024 14:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C08561BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B730A4035F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uYs3fMRxgAi for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE274035C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE274035C
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CCAB86D15; Mon, 15 Jul 2024 14:49:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:46:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99381a141ecc6101801e905e20c8bfa1944206ae
X-Git-Newrev: 9ba1fa13e43cc67869f0319cdc95db53f289b9ea
X-Patchwork-Hint: ignore
Message-Id: <20240715144956.6CCAB86D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: allow taking the entire
 default environment from a text file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ba1fa13e43cc67869f0319cdc95db53f289b9ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default U-Boot builds a default environment from its own configuration
and a board-specific set of variables. However it also allows to bypass
this entirely and define the entire default environment from a text file.

Expose this feature to Buildroot. This allows to have a file e.g. in
board/.../uboot.env which contains an easy to maintain text file with the
wanted default environment, without patching the U-Boot source code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/uboot/Config.in | 29 +++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |  9 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 626585b378..57aac06e20 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,6 +136,35 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main U-Boot configuration file.
 endif
 
+config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
+	string "Text file with default environment"
+	select BR2_TARGET_UBOOT_NEEDS_XXD
+	help
+	  Text file containing the variables to be used as the default
+	  environment in U-Boot.
+
+	  If empty, let U-Boot generate the default enviromnent from the
+	  source code and other U-Boot configuration values, which is
+	  the default behaviour.
+
+	  If set to the path to a file, instructs U-Boot to define the
+	  entire U-Boot default environment from the provided file,
+	  disabling all the default behaviour.
+
+	  From the U-Boot documentation:
+
+	    The format is the same as accepted by the mkenvimage tool,
+	    with lines containing key=value pairs. Blank lines and
+	    lines beginning with '#' are ignored.
+
+	  Based on the USE_DEFAULT_ENV_FILE and DEFAULT_ENV_FILE U-Boot
+	  configuration variables.
+
+	  For more info see:
+	  https://docs.u-boot.org/en/latest/usage/environment.html#external-environment-file
+
+	  Requires U-Boot >= v2018.05.
+
 config BR2_TARGET_UBOOT_NEEDS_DTC
 	bool "U-Boot needs dtc"
 	select BR2_PACKAGE_HOST_DTC
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 19f4cdb557..6cc87b35d3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -390,6 +390,14 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # override again. In addition, host-ccache is not ready at kconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
+
+UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
+ifneq ($(UBOOT_DEFAULT_ENV_FILE),)
+define UBOOT_KCONFIG_DEFAULT_ENV_FILE
+	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
+	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
+endef
+endif
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 UBOOT_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
@@ -530,6 +538,7 @@ define UBOOT_KCONFIG_FIXUP_CMDS
 	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
 	$(UBOOT_ZYNQMP_KCONFIG_PM_CFG)
 	$(UBOOT_ZYNQMP_KCONFIG_PSU_INIT)
+	$(UBOOT_KCONFIG_DEFAULT_ENV_FILE)
 endef
 
 ifeq ($(BR2_TARGET_UBOOT)$(BR_BUILDING),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
