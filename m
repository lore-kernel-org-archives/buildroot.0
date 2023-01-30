Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F98C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC54B610F0;
	Mon, 30 Jan 2023 21:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC54B610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIx7GTPIk8zv; Mon, 30 Jan 2023 21:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27096610D1;
	Mon, 30 Jan 2023 21:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27096610D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC501BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29294408A5
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29294408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QWjEpDqxjWEs for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A0284087A
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A0284087A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16A008257D; Mon, 30 Jan 2023 21:16:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:16:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76152e95a9749d05c0e334e1fa6affdf9aeafb7f
X-Git-Newrev: 319cc24aca38d6cb8898400694135b855731940f
X-Patchwork-Hint: ignore
Message-Id: <20230130211634.16A008257D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add BR2_TARGET_UBOOT_NEEDS_XXD
 option
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

commit: https://git.buildroot.net/buildroot/commit/?id=319cc24aca38d6cb8898400694135b855731940f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A host dependency to xxd is required if the U-Boot board
configuration has CONFIG_USE_DEFAULT_ENV_FILE enabled. So
introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_XXD
to solve this problem. xxd is provided by host-vim.

Signed-off-by: Jerry Kooyman <jerry.kooyman@entrust.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a729280060..282418c3ed 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -198,6 +198,14 @@ config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
 	  This is typically the case when the board configuration
 	  has CONFIG_TOOLS_MKEFICAPSULE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_XXD
+	bool "U-Boot needs xxd"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires xxd to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_USE_DEFAULT_ENV_FILE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 99e80ea5a1..4eae8e95c3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -239,6 +239,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
 UBOOT_DEPENDENCIES += host-util-linux
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
+UBOOT_DEPENDENCIES += host-vim
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
