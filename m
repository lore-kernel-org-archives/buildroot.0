Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C2C19F4F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A6B541559;
	Tue, 30 Apr 2024 20:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOvbkAbcw85f; Tue, 30 Apr 2024 20:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679E74155A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679E74155A;
	Tue, 30 Apr 2024 20:57:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB491BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 174908200E
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG-YmZebgS2U for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F0781A58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30F0781A58
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:57:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2294F8631D; Tue, 30 Apr 2024 20:57:52 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:56:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9fcd69510a5947092f2789a146ad284ce24d1c
X-Git-Newrev: f8d068929b3b5ef5ae28691a3d0d7e1948435d7b
X-Patchwork-Hint: ignore
Message-Id: <20240430205752.2294F8631D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_ppc64*defconfig: add missing
 libelf dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f8d068929b3b5ef5ae28691a3d0d7e1948435d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While building the kernel tools, libelf header is missing:

[...]tools/objtool/include/objtool/elf.h:10:10: fatal error: gelf.h: No such file or directory
   10 | #include <gelf.h>

Select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to build host-libelf.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6664587290 (qemu_ppc64le_powernv8_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119951 (qemu_ppc64le_pseries_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119946 (qemu_ppc64_pseries_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_ppc64_pseries_defconfig    | 1 +
 configs/qemu_ppc64le_powernv8_defconfig | 1 +
 configs/qemu_ppc64le_pseries_defconfig  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 8c58fec24f..350380578a 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_ppc64le_powernv8_defconfig
index 23ad5772c2..fd8936a1fa 100644
--- a/configs/qemu_ppc64le_powernv8_defconfig
+++ b/configs/qemu_ppc64le_powernv8_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="powernv"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 207e5f5b40..ebc3b7a6fd 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
