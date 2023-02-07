Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95372C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EE8D40186;
	Tue,  7 Feb 2023 21:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EE8D40186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPu5AA3OE8hJ; Tue,  7 Feb 2023 21:39:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A58A40B34;
	Tue,  7 Feb 2023 21:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A58A40B34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 490B11BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3082E60B65
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3082E60B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXl5seOjgfmo for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:38:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF3EB60C05
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3EB60C05
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCD8484378; Tue,  7 Feb 2023 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 22:37:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f79a9c775ff0a59027f274a237d98b5f8d31c022
X-Git-Newrev: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e
X-Patchwork-Hint: ignore
Message-Id: <20230207213844.DCD8484378@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: disable assembly when not
 supported
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8dc5315eb712eca0a5cbf793a6714a47ab6e57e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wolfssl contains some assembly code and its configure.ac script
enables the assembly code depending on the CPU architecture. However,
the detection logic is not sufficient and leads to using the assembly
code in situation where it should not.

Here are two examples:

 - As soon as the architecture is mips64/mips64el, it uses assembly
   code, but that assembly code is not mips64r6 compatible.

 - As soon as the architecture is RISC-V, it uses assembly code, but
   that assembly code uses multiplication instructions, without paying
   attention that the "M" extension may not be available in the RISC-V
   CPU instruction set.

In order to avoid this, we introduce a
BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS hidden boolean to decide when to
enable/disable assembly code. We set an initial value with the
supported CPU architectures, with the exclusion of the problematic
cases described above.

It is pretty likely that this variable will need tuning progressively,
as it is difficult to determine which CPU variants exactly are
supported by the assembly code in wolfssl.

Fixes:

 - MIPS64 case: http://autobuild.buildroot.net/results/43e/43ee1a457cbeb986d958c9a70cac0676377661c0/
 - RISC-V case: http://autobuild.buildroot.net/results/f05/f056ebe7749a69994afba39a9d4967e2774c45ea/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolfssl/Config.in  | 12 ++++++++++++
 package/wolfssl/wolfssl.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 3a97125e8d..c41bdb6888 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -1,3 +1,15 @@
+config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_powerpc
+	default y if BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips || BR2_mipsel
+	default y if BR2_riscv && BR2_RISCV_ISA_RVM
+	default y if BR2_s390x
+
 config BR2_PACKAGE_WOLFSSL
 	bool "wolfssl"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 8f6cba56ec..9f06bb1b4b 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -32,6 +32,12 @@ else
 WOLFSSL_CONF_OPTS += --disable-sslv3
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS),y)
+WOLFSSL_CONF_OPTS += --enable-asm
+else
+WOLFSSL_CONF_OPTS += --disable-asm
+endif
+
 # enable ARMv8 hardware acceleration
 ifeq ($(BR2_aarch64),y)
 WOLFSSL_CONF_OPTS += --enable-armasm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
