Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCA0C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA3A4105C;
	Sun, 12 May 2024 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39KFoc1UR70Q; Sun, 12 May 2024 10:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC01040CB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC01040CB3;
	Sun, 12 May 2024 10:20:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E66131BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1DD742136
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FmmHLHOzM9q for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CED35420DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CED35420DF
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:20:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C2087099; Sun, 12 May 2024 10:20:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 12:19:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cb0f6e011d9975f7c4f8b2dc553b086bceef1dc
X-Git-Newrev: e32d404f6c4fb5fce2a65996efac53281f97ce5c
X-Patchwork-Hint: ignore
Message-Id: <20240512102052.B5C2087099@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: allow riscv32 noMMU configuration
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

commit: https://git.buildroot.net/buildroot/commit/?id=e32d404f6c4fb5fce2a65996efac53281f97ce5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.riscv | 2 --
 package/Makefile.in  | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index d62e4ebc6c..23d095d1a6 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -51,7 +51,6 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
-	select BR2_USE_MMU
 
 config BR2_RISCV_64
 	bool "64-bit"
@@ -62,7 +61,6 @@ endchoice
 config BR2_RISCV_USE_MMU
 	bool "MMU support"
 	default y
-	depends on BR2_RISCV_64
 	select BR2_USE_MMU
 	help
 	  Enable this option if your RISC-V core has a MMU (Memory
diff --git a/package/Makefile.in b/package/Makefile.in
index b350c4b7b5..f415e55f84 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -41,9 +41,9 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# FLAT binary format needs uclinux, except RISC-V 64-bits which needs
-# the regular linux name.
-ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
+# FLAT binary format needs uclinux, except RISC-V which needs the
+# regular linux name.
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_riscv),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
@@ -181,7 +181,7 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-ifeq ($(BR2_RISCV_64),y)
+ifeq ($(BR2_riscv),y)
 TARGET_CFLAGS += -fPIC
 endif
 ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
