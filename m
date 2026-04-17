Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A072F43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3324040CD9;
	Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvaLcqPUEsK3; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3B640CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416393;
	bh=Cg/RkghqV3r1O4QYK5Fpb3RA3q05PjVZP/63vr4V5C4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xymx+MzcmDXzWxX2Bqo+ZzYZnRNAIQWY934RGjKN0sXpgGaGenUPvl7ao1XiwOuqd
	 uPbky8QRwDUXMG4bIrfOFZI0StYDirNcqCAPJYc1YUvVcrjMj+xRrwdIhIZlcseMcF
	 08la3LpJ/buVra2QznaAOk34XzGJHGxlWZLhhuixgmjZfGNoGH/VaD58NafRcgkVCT
	 cIQ3ZdtkLToqsdhPlpR+zDVAT3bRY9DOQV2NV/txNcwU2WAfuxgthc4WBGkWdbfGCa
	 vjf71/aJHc0/VFn2setA6ytjJnCJWb0TjtNH5jeeWcfWMMZem3+pn2WBpdO7q0spCU
	 aXSj0XHVQFCJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE3B640CE1;
	Fri, 17 Apr 2026 08:59:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5154F396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3840340CBE
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtq7iYGzGNmd for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 168B740CBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168B740CBD
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 168B740CBD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488ba840146so4610875e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416385; x=1777021185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SFpdoB9U9FBEsFh/4MIzjaKvBGisNOMHqwQlMu2t4Ls=;
 b=DLh5ziT6u594ObQ9xUN7OyM0rF59UKOYXzkS7jWJ/4eFq66UQcQH9A1AJ8kWRqJzZD
 /Led027s/JZglfv47NBPEY/6oDzRXUKiS3jWtEcW3Siy5r1Nj3HGWBiLPR6vFi1R7b3c
 m8fGI5/u9dAxzzLjNwEZkXLDDASqhFkivLkS364fqw7XfLv4Zx/xGlYRRnVwRDaNYPI2
 M3tfrpaueVyy+O+mOOJj/13dz4qss56wHz/Y1uFc/rYfFEwy/lcDMRaULuLERYF9dWh7
 vki/N0VIZBtCqlshPZIGXVF5FYaOUqW7QSxW0IZ0VNxH3AqeXROo/gtj71WZz1cMp7Ay
 Q4HA==
X-Gm-Message-State: AOJu0YyiNCJaGR/K3fpA8Y7JKLe/iK8Ad7Y6LBk77SBUhFaa/QxnWtZu
 LGGBuDS8XV62+f7cAgtAYovHSYQMPQqwWJmHrDnSkiD3BdLiOLbi6+QzYy1qepU6dcBXS6N2ofk
 UX1V+7Ho=
X-Gm-Gg: AeBDies8FqBx7YO8+EMIM5NrZ3f4yO8sN8/mjTOYCbgW5GEph35wnAtt0gwUjCTCbtV
 YIzo79BdukmIGLRwfCI6ppjbOBKsoiNt7O6L+/vgDTPEKAiuGZGAfgMuEmZNF4gJpXh44t9ORWa
 G2K3Hdiy88iToWNQwKCy3CBOIv1DAnYDVwMCMNtRBvMTl2510vQz2btD6WlnM6duCsdtIZIYebm
 EhwO+VotFBZ6efoWshW8txVUCCwwl+fmf4uVjlhoDjljeaq6J+fgPXdH/+TgkgbRaYT4q4qeoae
 dOa9LzEdMKtavqQVjP5VlcFtHzmTlYVLpM686pJUI/UPs1C0ltOjiQ9Y8eBGcip5cEFWrpLgj0Q
 i847DBJjxgkSlODQ8Spt/s2fWuCng0DQOmX8ldges46bR2jN1f5PYDVOoWl5bylZraEcyoZ1XeM
 TKrY6mM8z+7S2qiCLnkM23v4OhNw9akvMkFbNjJEd3fGNPbTBejYA3vdHxjopkeKQzJDJpbb/3v
 Y/losl5ewJX3OyDppsdQ2pbZF4I1jEv7wckQ0yu4A==
X-Received: by 2002:a05:600c:1389:b0:485:9a50:338d with SMTP id
 5b1f17b1804b1-488fb739d3amr28318255e9.3.1776416384688; 
 Fri, 17 Apr 2026 01:59:44 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:21 +0200
Message-ID: <20260417085936.200528-7-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416385; x=1777021185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFpdoB9U9FBEsFh/4MIzjaKvBGisNOMHqwQlMu2t4Ls=;
 b=MYMgE3UvN4/jntN7uS4FPM4OAkrztKMlIPNPqovJMVTdfH1k/RgRCTXyogSARO6Bt4
 /wLi2vOHBEX12yRJosmri1ljrOerMGP/wGqmG+7OGyLzctn4s62/xXHd05y9MNOdwxtq
 2U+P8SP6ZEglhMExCam+yO/Ae7aWXUwcHgltk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=MYMgE3Uv
Subject: [Buildroot] [PATCH v1 06/21] support/testing : test_docker_compose
 : Bump kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit bump the kernel version of this docker test (5.4->6.18), and thus
fixes several issues preventing the Docker Compose runtime test from
succeeding due to this bump:

Kernel Infrastructure:
   The Docker daemon failed to start because the 'nat' table could not
   be initialized. This was due to missing legacy Netfilter support.
   - Enable CONFIG_NETFILTER_XTABLES_LEGACY to support iptables nat table.
   - Enable CONFIG_NAMESPACES and CONFIG_USER_NS for container isolation.
   - Enable CONFIG_TUN and CONFIG_VETH for container networking.
   - Enable CONFIG_IKCONFIG and CONFIG_IKCONFIG_PROC for easier debugging.

Build Fixes:
   While building the kernel tools, the libelf header was missing because
   objtool was not handled correctly for this kernel version. This resulted
   in a fatal error: "gelf.h: No such file or directory".
   - Select BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y to build host-libelf.

Resources and Stability:
   The previous 512MB of RAM was tight for the stack (Kernel +
   Docker + Containerd + Python), potentially leading to Out-Of-Memory kills.
   Idem for the disk size for Docker images/layers storage.
   - Increase QEMU RAM to 1024MB (-m 1024M).
   - Increase rootfs size to 1024MB.
   - Switch to EXT4 (BR2_TARGET_ROOTFS_EXT2_4=y) for better stability
     and modern feature support required by Docker's storage drivers.

Test Script Adjustments:
   - Update rootfs path in the test script to point to rootfs.ext4.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../testing/conf/docker-compose-kernel.config | 26 +++++++++----------
 .../tests/package/test_docker_compose.py      | 12 ++++++---
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/support/testing/conf/docker-compose-kernel.config b/support/testing/conf/docker-compose-kernel.config
index fd28da7a4a..cbaf5dfed3 100644
--- a/support/testing/conf/docker-compose-kernel.config
+++ b/support/testing/conf/docker-compose-kernel.config
@@ -1,8 +1,10 @@
-# CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 # CONFIG_CROSS_MEMORY_ATTACH is not set
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
@@ -13,11 +15,10 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_BPF=y
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
 CONFIG_SMP=y
 # CONFIG_X86_EXTENDED_PLATFORM is not set
-CONFIG_MCORE2=y
 # CONFIG_X86_MCE is not set
 # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
 CONFIG_LEGACY_VSYSCALL_NONE=y
@@ -25,10 +26,13 @@ CONFIG_LEGACY_VSYSCALL_NONE=y
 # CONFIG_ACPI is not set
 CONFIG_CPU_IDLE=y
 # CONFIG_VIRTUALIZATION is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_MQ_IOSCHED_DEADLINE is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_SWAP is not set
+# CONFIG_COMPAT_BRK is not set
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
@@ -38,7 +42,9 @@ CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 # CONFIG_IPV6_SIT is not set
 CONFIG_NETFILTER=y
+CONFIG_BRIDGE_NETFILTER=y
 CONFIG_NF_CONNTRACK=y
+CONFIG_NETFILTER_XTABLES_LEGACY=y
 CONFIG_NETFILTER_XT_MARK=y
 CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y
@@ -47,17 +53,9 @@ CONFIG_IP_VS=y
 CONFIG_IP_VS_RR=y
 CONFIG_IP_VS_NFCT=y
 CONFIG_IP_NF_IPTABLES=y
-CONFIG_IP_NF_FILTER=y
 CONFIG_IP_NF_NAT=y
 CONFIG_IP_NF_TARGET_MASQUERADE=y
-CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_RAW=y
-CONFIG_IP6_NF_IPTABLES=y
-CONFIG_IP6_NF_FILTER=y
-CONFIG_IP6_NF_MANGLE=y
-CONFIG_IP6_NF_RAW=y
-CONFIG_IP6_NF_NAT=y
-CONFIG_IP6_NF_TARGET_MASQUERADE=y
 CONFIG_BRIDGE=y
 # CONFIG_WIRELESS is not set
 CONFIG_PCI=y
@@ -65,6 +63,7 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_NETDEVICES=y
+CONFIG_TUN=y
 CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
 # CONFIG_ETHERNET is not set
@@ -73,13 +72,13 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
-# CONFIG_DEVMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM_INTEL is not set
 # CONFIG_HW_RANDOM_AMD is not set
 # CONFIG_HW_RANDOM_VIA is not set
 CONFIG_HW_RANDOM_VIRTIO=y
+# CONFIG_DEVMEM is not set
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
@@ -94,5 +93,4 @@ CONFIG_TMPFS=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_KEYS=y
 CONFIG_SECURITYFS=y
-# CONFIG_CRYPTO_HW is not set
 CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index a96c9d1481..db7e50914c 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -17,9 +17,10 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.296"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_DOCKER=y
         BR2_PACKAGE_CA_CERTIFICATES=y
@@ -27,7 +28,10 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
         BR2_PACKAGE_DOCKER_COMPOSE=y
         BR2_PACKAGE_DOCKER_ENGINE=y
         BR2_TARGET_ROOTFS_EXT2=y
-        BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_GEN=4
+        BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(
             infra.filepath("tests/package/copy-sample-script-to-target.sh"),
@@ -55,12 +59,12 @@ class BaseTestDockerCompose(infra.basetest.BRTest):
 
     def do_test(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
-        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext4")
         self.emulator.boot(arch="x86_64",
                            kernel=kernel,
                            kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
                            options=["-cpu", "Haswell",
-                                    "-m", "512M",
+                                    "-m", "1024M",
                                     "-device", "virtio-rng-pci",
                                     "-drive", "file={},format=raw,if=virtio".format(rootfs),
                                     "-net", "nic,model=virtio",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
