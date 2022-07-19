Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175F3C43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 20:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D6783298;
	Tue, 19 Jul 2022 20:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61D6783298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cn9TC0gpubgN; Tue, 19 Jul 2022 20:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7941083268;
	Tue, 19 Jul 2022 20:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7941083268
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1E71BF267
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16BDD40CDF
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 20:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16BDD40CDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tttXC8KgNXhC for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 20:46:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B636400B8
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 20:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B636400B8
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A847B83ED4; Tue, 19 Jul 2022 20:32:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 22:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a6cd7e4d306e59f583a161576d5e73d39d5e993
X-Git-Newrev: 25edf486060092a1805ff821d325af495781c37f
X-Patchwork-Hint: ignore
Message-Id: <20220719203231.A847B83ED4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: add
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX option
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

commit: https://git.buildroot.net/buildroot/commit/?id=25edf486060092a1805ff821d325af495781c37f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since U-Boot 2022.04 a host dependency to util-linux (-luuid) is required if
the U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
introduce a new BR U-Boot config option
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX to solve this problem.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr: fix check-package]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 91d98c7e63..557472b58b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -190,6 +190,14 @@ config BR2_TARGET_UBOOT_NEEDS_GNUTLS
 	  typically the case when the board configuration has
 	  CONFIG_TOOLS_MKEFICAPSULE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
+	bool "U-Boot needs util-linux"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires util-linux (-luuid) to be available on the host.
+	  This is typically the case when the board configuration
+	  has CONFIG_TOOLS_MKEFICAPSULE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5808e30818..70d4d585f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -231,6 +231,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_GNUTLS),y)
 UBOOT_DEPENDENCIES += host-gnutls
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
+UBOOT_DEPENDENCIES += host-util-linux
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
