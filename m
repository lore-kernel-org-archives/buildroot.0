Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF4C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572D540186;
	Mon, 22 Jul 2024 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9Jmoa96YzrQ; Mon, 22 Jul 2024 16:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD06640192
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD06640192;
	Mon, 22 Jul 2024 16:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13CE71BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00F174023C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcZqlPBNhNbH for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 221A540320
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221A540320
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 066AB870CA; Mon, 22 Jul 2024 16:29:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:29:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd50b9be374726006f72e7e81ca4cef6808f17f7
X-Git-Newrev: 4c4afb415788efdb720b9a084af80b8a6bbfa12c
X-Patchwork-Hint: ignore
Message-Id: <20240722162955.066AB870CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c4afb415788efdb720b9a084af80b8a6bbfa12c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following warning occurs from commit "boot/uboot: allow taking the
entire default environment from a text file".

  boot/uboot/Config.in:141:warning: config symbol
  'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
  tristate

Add a hidden 'bool' config so we can enable dependencies.

In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
therefore we also need to depend on
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 9 ++++++++-
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 57aac06e20..c4d052595c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -136,9 +136,16 @@ config BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main U-Boot configuration file.
 endif
 
+# Hidden boolean that allows to select BR2_TARGET_UBOOT_NEEDS_XXD when
+# needed.
+config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED
+	bool
+	default y if BR2_TARGET_UBOOT_DEFAULT_ENV_FILE != ""
+	select BR2_TARGET_UBOOT_NEEDS_XXD
+
 config BR2_TARGET_UBOOT_DEFAULT_ENV_FILE
 	string "Text file with default environment"
-	select BR2_TARGET_UBOOT_NEEDS_XXD
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
 	  Text file containing the variables to be used as the default
 	  environment in U-Boot.
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 6cc87b35d3..45ad1c880f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -391,8 +391,8 @@ UBOOT_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # time, so use HOSTCC_NOCCACHE.
 UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=""
 
+ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED),y)
 UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
-ifneq ($(UBOOT_DEFAULT_ENV_FILE),)
 define UBOOT_KCONFIG_DEFAULT_ENV_FILE
 	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
 	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
