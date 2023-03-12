Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E653C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 338C760B32;
	Sun, 12 Mar 2023 17:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 338C760B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQtw7Uqjbyab; Sun, 12 Mar 2023 17:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7207860B26;
	Sun, 12 Mar 2023 17:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7207860B26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA771BF574
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9DE140102
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 17:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9DE140102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88ulUAxNuv_Q for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 17:45:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36A62400A4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 17:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A62400A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2625B86F59; Sun, 12 Mar 2023 17:45:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 18:45:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ce952170e1e8229da0bdac81566a627a87e56bee
X-Git-Newrev: 38c581b05cd8e7967783410b36c14b9b561acd12
X-Patchwork-Hint: ignore
Message-Id: <20230312174518.2625B86F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/spike_riscv64: bump
 kernel to 6.1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c581b05cd8e7967783410b36c14b9b561acd12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Linux Kernel 6.1 now being officially promoted to be a LTS, this
commit bump the kernel version of this defconfig to 6.1.14.

A Kernel config fragment "linux.fragment" is now needed as the kernel
no longer enable SBI v0.1 support and the earlycon RISC-V SBI in its
riscv arch defconfig. See [1] [2].

The Spike riscv-isa-sim was updated upstream accordingly [3].

In order to keep a smooth transition, this kernel config fragment
re-enable those options to make sure this kernel will work with
both old Spike versions (not including commit [3] like the v1.1.0
currently included in Buildroot), and newer versions. This commit
was also successfully tested with riscv-isa-sim at commit
0d1a48c0c0.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=6f562570b9c5d6a3e30d87aec60a9d8f22a3203c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3938d5a2f9369d1ebd56320629fed395ce327e9c
[3] https://github.com/riscv-software-src/riscv-isa-sim/commit/191634d2854dfed448fc323195f9b65c305e2d77

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/spike/riscv64/linux.fragment | 3 +++
 configs/spike_riscv64_defconfig    | 5 +++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/board/spike/riscv64/linux.fragment b/board/spike/riscv64/linux.fragment
new file mode 100644
index 0000000000..b443b0ab36
--- /dev/null
+++ b/board/spike/riscv64/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_RISCV_SBI_V01=y
+CONFIG_HVC_RISCV_SBI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
diff --git a/configs/spike_riscv64_defconfig b/configs/spike_riscv64_defconfig
index e23f1ce32c..73ea566084 100644
--- a/configs/spike_riscv64_defconfig
+++ b/configs/spike_riscv64_defconfig
@@ -2,9 +2,10 @@ BR2_riscv=y
 BR2_RISCV_64=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/spike/riscv64/linux.fragment"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_ROOTFS_CPIO=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_OPENSBI=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
