Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E583C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBC4240FEA;
	Wed,  1 Jun 2022 21:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSbp1r-KJqIM; Wed,  1 Jun 2022 21:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B94B240FEE;
	Wed,  1 Jun 2022 21:34:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DA271BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37A87400DD
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDRHnpOeAWNN for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:33:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EABB400E7
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:33:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9B1486946; Wed,  1 Jun 2022 21:21:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:32:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4db0560ac13aa7a927b8fb876a14c21cddf98d9
X-Git-Newrev: a3a1da05fcc36dc256ebae98c5498ae384a65aff
X-Patchwork-Hint: ignore
Message-Id: <20220601212144.E9B1486946@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/uboot: add
 BR2_TARGET_UBOOT_NEEDS_GNUTLS option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3a1da05fcc36dc256ebae98c5498ae384a65aff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since U-Boot 2022.04 a host dependency to gnutls is required if the
U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_GNUTLS
to solve this problem.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d525faea1c..91d98c7e63 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -182,6 +182,14 @@ config BR2_TARGET_UBOOT_NEEDS_LZOP
 	  the case when the board configuration has CONFIG_SPL_LZO
 	  enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_GNUTLS
+	bool "U-Boot needs gnutls"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires gnutls to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_TOOLS_MKEFICAPSULE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index cb26fc8d3e..5808e30818 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -227,6 +227,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_LZOP),y)
 UBOOT_DEPENDENCIES += host-lzop
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_GNUTLS),y)
+UBOOT_DEPENDENCIES += host-gnutls
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
