Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD9CC83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3192B83A05;
	Sat,  5 Jul 2025 17:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRLRVcCYzNlZ; Sat,  5 Jul 2025 17:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F7F9839BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7F9839BC;
	Sat,  5 Jul 2025 17:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC69E12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B6840C1E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRbK4zRbWMo7 for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2F6E40C1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2F6E40C1C
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B24A85FE9; Sat,  5 Jul 2025 17:47:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 19:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d
X-Git-Newrev: 286f5bacd750be4855deb60a9f2d183ba4d9ad6f
X-Patchwork-Hint: ignore
Message-Id: <20250705174708.8B24A85FE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: Introduce BR2_GCC_TARGET_SIMD
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=286f5bacd750be4855deb60a9f2d183ba4d9ad6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce BR2_GCC_TARGET_SIMD for gcc to handle --with-simd/-msimd
present at loongarch's gcc options.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in                                         | 6 ++++++
 arch/arch.mk                                           | 1 +
 package/gcc/gcc.mk                                     | 4 ++++
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 toolchain/toolchain-wrapper.c                          | 3 +++
 5 files changed, 18 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index fa8fe0f5ac..c60c42c1c5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -353,6 +353,12 @@ config BR2_GCC_TARGET_FPU
 config BR2_GCC_TARGET_FLOAT_ABI
 	string
 
+# The value of this option will be passed as --with-simd=<value> when
+# building gcc (internal backend) or -simd=<value> in the toolchain
+# wrapper (external toolchain)
+config BR2_GCC_TARGET_SIMD
+	string
+
 # The value of this option will be passed as --with-mode=<value> when
 # building gcc (internal backend) or -m<value> in the toolchain
 # wrapper (external toolchain)
diff --git a/arch/arch.mk b/arch/arch.mk
index 4174d33df5..4a7851a9fd 100644
--- a/arch/arch.mk
+++ b/arch/arch.mk
@@ -16,6 +16,7 @@ GCC_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
 GCC_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
 GCC_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 GCC_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
+GCC_TARGET_SIMD := $(call qstrip,$(BR2_GCC_TARGET_SIMD))
 GCC_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
 # Explicitly set LD's "max-page-size" instead of relying on some defaults
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 658f5a6b4f..ea96286c32 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -251,6 +251,10 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
 endif
 
+ifneq ($(GCC_TARGET_SIMD),)
+HOST_GCC_COMMON_CONF_OPTS += --with-simd=$(GCC_TARGET_SIMD)
+endif
+
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c08bf0a653..2c2afa76c0 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -217,6 +217,10 @@ ifneq ($(GCC_TARGET_FLOAT_ABI),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfloat-abi=$(GCC_TARGET_FLOAT_ABI)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(GCC_TARGET_FLOAT_ABI)"'
 endif
+ifneq ($(GCC_TARGET_SIMD),)
+TOOLCHAIN_EXTERNAL_CFLAGS += -msimd=$(GCC_TARGET_SIMD)
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SIMD='"$(GCC_TARGET_SIMD)"'
+endif
 ifneq ($(GCC_TARGET_MODE),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m$(GCC_TARGET_MODE)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(GCC_TARGET_MODE)"'
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 9970cad5e1..4dde0362b6 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -77,6 +77,9 @@ static char *predef_args[] = {
 #ifdef BR_SOFTFLOAT
 	"-msoft-float",
 #endif /* BR_SOFTFLOAT */
+#ifdef BR_SIMD
+	"-msimd=" BR_SIMD,
+#endif
 #ifdef BR_MODE
 	"-m" BR_MODE,
 #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
