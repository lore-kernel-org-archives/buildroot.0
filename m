Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5080C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 20:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B8083E89;
	Sun, 17 Jul 2022 20:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33B8083E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvkERirgjCKn; Sun, 17 Jul 2022 20:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315F683E7A;
	Sun, 17 Jul 2022 20:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 315F683E7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45B9A1BF35C
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3B9441619
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 20:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3B9441619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtbHQGdf8YF2 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 20:04:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8BD41612
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD8BD41612
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 20:04:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6EEB31BF204;
 Sun, 17 Jul 2022 20:04:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 22:04:06 +0200
Message-Id: <20220717200407.1400318-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658088254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QcUQ+DX/TFJGj2nMvgcf+k4KS5TIkiPbQ5GRumuohoE=;
 b=fHodbzB6H/UqRNQndO3VHfysqzIwIkcCCXNK+bikerUzFsAnmJiJnsuz9hmw0gqO5FZ9Wx
 OWPXcIbD+8SnSeOUTCFHdjabD7rweBt0HmECJjfJmWX0CM8E4EsWD5RmjGgO+GCcKa3RSR
 +xlN8mMcyKTXcGVNuqvm/+uSTZ6hci7IfZ4xBWS+SqXkciMS17D3vSdrctk8gmon94CBHD
 sYX4qU3DJp4gLVwFnnWYapiUZ+pBG6JX5bG4z6xUP35GYv1wkwBzuI3I+4JiXDyx3apA0/
 Wwe32MgLQ9c24PxEV44O6pYzJDFBZE/JNZ+E2t4e2yWdS/wRAJkM6F7gn3Oswg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fHodbzB6
Subject: [Buildroot] [PATCH] arch: remove support for BR2_ARC_PAGE_SIZE_4K
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_ARC_PAGE_SIZE_4K=y is broken with both glibc and uClibc. The link
of the C library fails with:

ld: common page size (0x2000) > maximum page size (0x1000)

This is due to BR2_ARC_PAGE_SIZE_4K=y settings
-Wl,-z,max-page-size=4096, but binutils apparently defaulting to
common-page-size=8192.

While this could potentially be fixed by passing
-Wl,-z,common-page-size=4096, these failures indicates that nobody has
tested 4KB page sizes on ARC in the context of Buildroot, so it is
more sensible to drop support for this feature. Should anybody need
this, and have the ability to ensure that it works, we would certainly
be able to re-introduce the feature.

Fixes:

  http://autobuild.buildroot.net/results/c8b2f331c98453670cd982558144c4fd84674a3d/ (uclibc)
  http://autobuild.buildroot.net/results/3a22f7aac38145b26c549254b819f87329e7a77e/ (glibc)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy   | 7 +++++++
 arch/Config.in.arc | 5 -----
 arch/arch.mk.arc   | 4 +---
 linux/linux.mk     | 4 ----
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 956da10a9f..1590a9fa25 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_ARC_PAGE_SIZE_4K
+	bool "Support for 4KB pages on ARC removed"
+	select BR2_LEGACY
+	help
+	  The support to use 4KB pages on the ARC architecture has
+	  been removed, as it was broken with both glibc and uClibc.
+
 config BR2_PACKAGE_PHP_EXT_WDDX
 	bool "php wddx removed"
 	select BR2_LEGACY
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 388d3496bc..58103ad171 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -103,10 +103,6 @@ choice
 	  size matching the hardware configuration. Otherwise
 	  user-space applications will fail at runtime.
 
-config BR2_ARC_PAGE_SIZE_4K
-	bool "4KB"
-	depends on !BR2_arc750d
-
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
 	help
@@ -121,7 +117,6 @@ endchoice
 
 config BR2_ARC_PAGE_SIZE
 	string
-	default "4K" if BR2_ARC_PAGE_SIZE_4K
 	default "8K" if BR2_ARC_PAGE_SIZE_8K
 	default "16K" if BR2_ARC_PAGE_SIZE_16K
 
diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
index 32b818b0e0..697c0ff524 100644
--- a/arch/arch.mk.arc
+++ b/arch/arch.mk.arc
@@ -6,9 +6,7 @@ ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
 endif
 
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
-ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
-ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
-else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
+ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
 else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9..f012689a9e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -362,10 +362,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI))
 	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR))
-	$(if $(BR2_ARC_PAGE_SIZE_4K),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
-		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
-		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_16K))
 	$(if $(BR2_ARC_PAGE_SIZE_8K),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARC_PAGE_SIZE_4K)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_8K)
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
