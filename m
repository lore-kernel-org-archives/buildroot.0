Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A625EC3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8342F4038B;
	Mon, 16 Sep 2024 11:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaoYh0gixvK5; Mon, 16 Sep 2024 11:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E908C40B31
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E908C40B31;
	Mon, 16 Sep 2024 11:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C77691BF5A0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C22840390
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ELVwKipyepH for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598C240073
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 598C240073
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B1368386E; Mon, 16 Sep 2024 11:10:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:07:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32805c4edefe4ad904f8bc29422a6db6ecacd82
X-Git-Newrev: abce4a2b365276a7fa081d327289e5e6d8bdca7e
X-Patchwork-Hint: ignore
Message-Id: <20240916111004.4B1368386E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
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
Content-Type: multipart/mixed; boundary="===============6911688889308037595=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6911688889308037595==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=abce4a2b365276a7fa081d327289e5e6d8bdca7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel commit [1] introduced MSM GPU driver header generation with a
Python script. This commit was first included in v6.10. This driver is
also enabled as a module in the arm64 architecture default
configuration. See [2]. This is a common situation.

This missing dependency is not detected in the Buildroot CI, because
the reference docker image contains a python3 interpreter. See [3].

For information, the Linux latest kernel version was updated in
Buildroot commit 2b6dba00b "linux: bump latest version to 6.10".
See [4].

The issue can be observed by running the following commands on a host
without the python3 interpreter installed:

    cat <<EOF >.config
    BR2_aarch64=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
    BR2_TOOLCHAIN_EXTERNAL=y
    EOF
    make olddefconfig
    make linux

The Kernel build fails with output:

      GENHDR  drivers/gpu/drm/msm/generated/a2xx.xml.h
    /bin/sh: 1: python3: not found
    make[7]: *** [drivers/gpu/drm/msm/Makefile:176: drivers/gpu/drm/msm/generated/a2xx.xml.h] Error 127

This commit fixes this issue by introducing a new
BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3 configuration that will need to be
selected in relevant situations.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0fddd045f88e34d6160785a3a5e506d374566454
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/configs/defconfig?h=v6.10.8#n868
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08-rc3/support/docker/Dockerfile?ref_type=tags#L40
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/2b6dba00be27a09bc7e88faf0871f82bf95589cf

Reported-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 11 +++++++++++
 linux/linux.mk  |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 023fa0a2ec..b4e88214d6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -492,6 +492,17 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
 	  such as "BTF: .tmp_vmlinux.btf: pahole (pahole) is not
 	  available".
 
+config BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3
+	bool "Needs host python3"
+	help
+	  Some Linux kernel configuration options (such as the
+	  CONFIG_DRM_MSM in v6.10 and greater) require a host python3
+	  interpreter. Enabling this option will ensure host-python3
+	  gets built before the Linux kernel.
+
+	  Enable this option if you get a Linux kernel build failure
+	  such as "python3: not found".
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f19470..92035d0da9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -138,6 +138,10 @@ define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 endef
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3),y)
+LINUX_DEPENDENCIES += host-python3
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)

--===============6911688889308037595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6911688889308037595==--
