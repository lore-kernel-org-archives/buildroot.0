Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDF9CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F4882112;
	Wed,  2 Oct 2024 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtuH-Qcxvs9l; Wed,  2 Oct 2024 20:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B882281DED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B882281DED;
	Wed,  2 Oct 2024 20:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77BDA1BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9278A407BB
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_F_RISIyhyR for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 658BE407A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 658BE407A1
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A38E84701; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:20:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edc0a6b1a43689fb832bc024b5997312e0770e99
X-Git-Newrev: 45c0a5114d44fa1c20b06ef9d2a4ae7ecf26658a
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.4A38E84701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert: "arch: drop now useless support
 for FDPIC"
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

commit: https://git.buildroot.net/buildroot/commit/?id=45c0a5114d44fa1c20b06ef9d2a4ae7ecf26658a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 58dcd28dfbed481becb822b009583a63efbc6ffa.

ARM supports FDPIC, so this code is needed once again.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in           | 14 ++++++++++++++
 package/uclibc/uclibc.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 2e7ac080ef..bd5f9ce470 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -12,6 +12,9 @@ config BR2_SOFT_FLOAT
 config BR2_USE_MMU
 	bool
 
+config BR2_ARCH_HAS_FDPIC_SUPPORT
+	bool
+
 choice
 	prompt "Target Architecture"
 	default BR2_i386
@@ -430,6 +433,7 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
+	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
@@ -441,6 +445,16 @@ config BR2_BINFMT_ELF
 	  and executables used across different architectures and
 	  operating systems.
 
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_ARCH_HAS_FDPIC_SUPPORT
+	select BR2_BINFMT_SUPPORTS_SHARED
+	help
+	  ELF FDPIC binaries are based on ELF, but allow the individual
+	  load segments of a binary to be located in memory
+	  independently of each other. This makes this format ideal for
+	  use in environments where no MMU is available.
+
 config BR2_BINFMT_FLAT
 	bool "FLAT"
 	depends on !BR2_USE_MMU
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index de834bac4f..600d72ce7b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -57,6 +57,13 @@ UCLIBC_LOCALES = \
 endif
 
 # noMMU binary formats
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_BINFMT_CONFIG
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT,$(@D)/.config)
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_FORMAT_FLAT_SEP_DATA,$(@D)/.config)
+	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FDPIC_ELF,$(@D)/.config)
+endef
+endif
 ifeq ($(BR2_BINFMT_FLAT),y)
 define UCLIBC_BINFMT_CONFIG
 	$(call KCONFIG_ENABLE_OPT,UCLIBC_FORMAT_FLAT)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
