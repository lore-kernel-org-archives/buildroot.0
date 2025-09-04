Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B92CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C9460808;
	Thu,  4 Sep 2025 16:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egiZC6L6nrY3; Thu,  4 Sep 2025 16:34:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F41A60837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F41A60837;
	Thu,  4 Sep 2025 16:34:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 329BA106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45E2D400B7
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtIyNNLkogT0 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9992A40070
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9992A40070
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97B1587EEF; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:22:08 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 89d924939df8720f399d5b7991609a32644f6f5b
X-Git-Newrev: 6fe30ffa6bf0143e5c33fd142cc0b2857a4661e5
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.97B1587EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/qemu_{arm,
 aarch64}_{ebbr, sbsa}*: linux needs host python3
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0403595696048742167=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0403595696048742167==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6fe30ffa6bf0143e5c33fd142cc0b2857a4661e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since Buildroot commit [1] updating qemu defconfigs from Kernel 6.6.32
to 6.12.9, qemu_aarch64_ebbr_defconfig, qemu_aarch64_sbsa_defconfig
and qemu_arm_ebbr_defconfig can fail to build with error:

    /bin/sh: 1: python3: not found
    make[7]: *** [drivers/gpu/drm/msm/Makefile:182: drivers/gpu/drm/msm/generated/a2xx.xml.h] Error 127

The issue can happen on build hosts without Python, and if the Linux
kernel is built before any package having host-python3 in its
dependencies (e.g. host-qemu, optee-os, ...).

Starting with Linux 6.10, the arm and arm64 architecture defconfigs need
python3 to build. [2]

This commit fixes this issue by adding
BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y in those defconfigs.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/44075c19555df409ea7c2859729abb02d341df29
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=0fddd045f88e34d6160785a3a5e506d374566454

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
[Julien:
 - reword commit log to add the commit introducing the issue
 - fix qemu_aarch64_sbsa_defconfig which has the same issue
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6001601544eceb263187aa446622cfebdc668ee3)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 configs/qemu_aarch64_ebbr_defconfig | 1 +
 configs/qemu_aarch64_sbsa_defconfig | 1 +
 configs/qemu_arm_ebbr_defconfig     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
index 80e7c101ee..0299c2855a 100644
--- a/configs/qemu_aarch64_ebbr_defconfig
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_OPTEE_CLIENT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 49511f87af..92e27573f2 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index dc1b917ef1..a3adb4c381 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_OPTEE_CLIENT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y

--===============0403595696048742167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0403595696048742167==--
