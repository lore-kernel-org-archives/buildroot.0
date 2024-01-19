Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF4AC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E8F42D53;
	Fri, 19 Jan 2024 20:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E8F42D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTxX47ZHgGuf; Fri, 19 Jan 2024 20:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BB74285B;
	Fri, 19 Jan 2024 20:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BB74285B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555691BF239
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278D860ADA
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278D860ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdxEOyRCMlB8 for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 20:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 028EB60AAA
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 20:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028EB60AAA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E13D286268; Fri, 19 Jan 2024 20:29:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 21:19:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b200632b1abb8a4847fcda0b61188b9c4763c111
X-Git-Newrev: 7a59c3a4d4fd70b08ec6e9d1d54a3308d2a39281
X-Patchwork-Hint: ignore
Message-Id: <20240119202915.E13D286268@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: add support 16k page size on ARM64
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
Content-Type: multipart/mixed; boundary="===============6597246833809204388=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6597246833809204388==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7a59c3a4d4fd70b08ec6e9d1d54a3308d2a39281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BCM2712 of the RaspberryPi 5 supports for 16KB page size.

This adds support for 16 KB on ARM64.

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 4 ++++
 arch/arch.mk       | 2 +-
 linux/linux.mk     | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 78621e321c..b44a164e03 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -781,6 +781,9 @@ choice
 config BR2_ARM64_PAGE_SIZE_4K
 	bool "4KB"
 
+config BR2_ARM64_PAGE_SIZE_16K
+	bool "16KB"
+
 config BR2_ARM64_PAGE_SIZE_64K
 	bool "64KB"
 
@@ -789,6 +792,7 @@ endchoice
 config BR2_ARM64_PAGE_SIZE
 	string
 	default "4K" if BR2_ARM64_PAGE_SIZE_4K
+	default "16K" if BR2_ARM64_PAGE_SIZE_16K
 	default "64K" if BR2_ARM64_PAGE_SIZE_64K
 
 config BR2_ARCH
diff --git a/arch/arch.mk b/arch/arch.mk
index 2e737b92ac..4174d33df5 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -23,7 +23,7 @@ ifeq ($(BR2_ARC_PAGE_SIZE_4K)$(BR2_ARM64_PAGE_SIZE_4K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
 else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192 -Wl,-z,common-page-size=8192
-else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
+else ifeq ($(BR2_ARC_PAGE_SIZE_16K)$(BR2_ARM64_PAGE_SIZE_16K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384 -Wl,-z,common-page-size=16384
 else ifeq ($(BR2_ARM64_PAGE_SIZE_64K),y)
 ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=65536 -Wl,-z,common-page-size=65536
diff --git a/linux/linux.mk b/linux/linux.mk
index 1db5c6046d..53e2ad6d48 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -411,6 +411,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_4K_PAGES)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_16K_PAGES)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_64K_PAGES))
+	$(if $(BR2_ARM64_PAGE_SIZE_16K),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_4K_PAGES)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_16K_PAGES)
+		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_64K_PAGES))
 	$(if $(BR2_ARM64_PAGE_SIZE_64K),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_4K_PAGES)
 		$(call KCONFIG_DISABLE_OPT,CONFIG_ARM64_16K_PAGES)

--===============6597246833809204388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6597246833809204388==--
