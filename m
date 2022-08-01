Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD4DC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 22:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDDD401EC;
	Mon,  1 Aug 2022 22:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDDD401EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxfLCIM1u-zM; Mon,  1 Aug 2022 22:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB224018C;
	Mon,  1 Aug 2022 22:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB224018C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE5D41BF31F
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94FA60675
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94FA60675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LSTTLHrIwLIL for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 22:08:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DAEB605B0
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 22:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DAEB605B0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1927D86C6D; Mon,  1 Aug 2022 21:54:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Aug 2022 00:07:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b265fa5c7f2257c51b0ff363c2ff017b2e91d680
X-Git-Newrev: 88cac04de3c256cfdb629a181c5e0d5d4b3725c2
X-Patchwork-Hint: ignore
Message-Id: <20220801215433.1927D86C6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm: Support for RISC-V on the
 LLVM package
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

commit: https://git.buildroot.net/buildroot/commit/?id=88cac04de3c256cfdb629a181c5e0d5d4b3725c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The initial support for the LLVM package did not include RISC-V, and
needed to be added. Some special casing is needed for the
LLVM_TARGETS_TO_BUILD variable, which expects a RISCV value regardless
of whether riscv32 or riscv64 is chosen.

Signed-off-by: Abel Bernabeu <abel@x-silicon.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/Config.in | 3 +++
 package/llvm/llvm.mk   | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index c1887e36dd..768af4971e 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -4,12 +4,15 @@ config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_aarch64
 	default y if BR2_arm || BR2_armeb
+	default y if BR2_riscv
 
 config BR2_PACKAGE_LLVM_TARGET_ARCH
 	string
 	default "AArch64" if BR2_aarch64
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
+	default "riscv32" if BR2_riscv && !BR2_ARCH_IS_64
+	default "riscv64" if BR2_riscv && BR2_ARCH_IS_64
 
 config BR2_PACKAGE_LLVM
 	bool "llvm"
diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 4670773ca3..977c0a08c2 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -41,8 +41,13 @@ HOST_LLVM_CONF_OPTS += -DCMAKE_INSTALL_RPATH="$(HOST_DIR)/lib"
 # Get target architecture
 LLVM_TARGET_ARCH = $(call qstrip,$(BR2_PACKAGE_LLVM_TARGET_ARCH))
 
-# Build backend for target architecture. This include backends like AMDGPU.
+# Build backend for target architecture. This include backends like
+# AMDGPU. We need to special case RISCV.
+ifneq ($(filter riscv%,$(LLVM_TARGET_ARCH)),)
+LLVM_TARGETS_TO_BUILD = RISCV
+else
 LLVM_TARGETS_TO_BUILD = $(LLVM_TARGET_ARCH)
+endif
 HOST_LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 LLVM_CONF_OPTS += -DLLVM_TARGETS_TO_BUILD="$(subst $(space),;,$(LLVM_TARGETS_TO_BUILD))"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
