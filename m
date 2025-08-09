Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8925C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 16:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9254C80D97;
	Sat,  9 Aug 2025 16:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLRhn0K-9OY4; Sat,  9 Aug 2025 16:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76FAE81DFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76FAE81DFC;
	Sat,  9 Aug 2025 16:33:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1E781D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C898260749
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMnO4mhYA1Rl for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 16:33:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB1B26071D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB1B26071D
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 16:33:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2BD687064; Sat,  9 Aug 2025 16:33:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 18:22:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67c91e85b7ccaef7c9bccb173f75accee9a154dc
X-Git-Newrev: bc28c3df6fb6a812de689a25d0d2dea1388b4b9d
X-Patchwork-Hint: ignore
Message-Id: <20250809163310.E2BD687064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/loongarch: Mark lp64f and lp64s as
 broken
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc28c3df6fb6a812de689a25d0d2dea1388b4b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Toolchain failed to bootstrap with LP64F and LP64S ABIs.

As reported by Julien in [1]:

Testing the "lp64f" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_32=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-initial with output:

     Assembler messages:
     /tmp/ccEkwSsD.s:28: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:30: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:50: Error: register save offset not a multiple of 8

See also autobuilder failures such as [2].

Testing the "lp46s" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_NONE=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-final with output:

     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find crti.o: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find -lc: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find crtn.o: No such file or directory

See also autobuilder failures with as [3].

This commit marks those ABIs as broken at the moment to allow time
for investigation. Also, since gcc defaults to the "lp64d" ABI which
requires a 64bit FPU is present, the BR2_LOONGARCH_FPU_32 and
BR2_LOONGARCH_FPU_NONE options also needs to be marked as broken
as well. See [4].

[1] https://lore.kernel.org/buildroot/e17da108d1fb4e6abda26445dc053b35@free.fr/
[2] https://autobuild.buildroot.org/results/f98570293823867e6c43a1672e1a4b43ca1e4be5
[3] https://autobuild.buildroot.org/results/cf56c37fabcae964dbf4f96eb43a7e4d964452b6
[4] https://lore.kernel.org/buildroot/7b0f1cb629fce8a57d9b644b8beb8b2a@free.fr/

Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[Julien:
 - add link to mailing list discussion
 - add configuration to reproduce issues to help future investigations
 - add links to autobuilder failures in commit log
 - mark BR2_LOONGARCH_FPU_{32,NONE} as broken
]
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.loongarch | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index fa1b13bc52..4b50b98710 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -38,12 +38,16 @@ config BR2_LOONGARCH_FPU_64
 
 config BR2_LOONGARCH_FPU_32
 	bool "32"
+	# Only supported by lp64s and lp64f ABIs which are marked as broken
+	depends on BR2_BROKEN
 	help
 	  Allow the use of hardware floating-point instructions for
 	  32-bit operations only.
 
 config BR2_LOONGARCH_FPU_NONE
 	bool "none"
+	# Only supported by lp64s ABI which is marked as broken
+	depends on BR2_BROKEN
 	help
 	  Prevent the use of hardware floating-point instructions.
 endchoice
@@ -87,11 +91,15 @@ config BR2_LOONGARCH_ABI_LP64D
 config BR2_LOONGARCH_ABI_LP64F
 	bool "lp64f"
 	depends on BR2_ARCH_IS_64
+	# Failed to build host GCC initial, pending investigation
+	depends on BR2_BROKEN
 	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
 
 config BR2_LOONGARCH_ABI_LP64S
 	bool "lp64s"
 	depends on BR2_ARCH_IS_64
+	# GCC can't find libraries, pending investigation
+	depends on BR2_BROKEN
 endchoice
 
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
