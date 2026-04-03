Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308F8E85373
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FA481211;
	Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NN_5uvM0BGt; Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4CA811BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775227838;
	bh=3GRTqkxvuSybgyskydU8Ugs+C8Y5oPcpBf6djt/+8yY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sdw0G3sMJWC5rdaRLkiOVFH+NgE0z817o5BRFjjWoI+XT4U5L288sIoM7suXl7pcb
	 WBglsbcQR5XT9Fj1RMf3nAdMXcTsXMznQcIELhZi81JF3AM7MkKGlkDgx85F5/LweX
	 dM5Lv2BZVWTh5LALf5m+9ye9MRIxJc05zHfZY2/r9lFAbVPTXcbSzkhtB4awecwhYC
	 MLYtnDNcvPkYyosBHNU2Q73XfLoQcZqcUoJw1TTAyQUwf/TC4TPJWdQ1PIMcEEEBnh
	 +UKNIo2jahrsnGWkg3AjmrN+nQ5KcnHrGXXJS1mYfse8REOuGjuxiNJtGpjZc//Jw6
	 UtRbNrHD0Ocqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4CA811BC;
	Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0689D1F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D45D4811BC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui5fTffX3I3R for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 14:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACD28811B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACD28811B7
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACD28811B7
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso19963135e9.2
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 07:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775227833; x=1775832633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y/+v6BBPI530qTFwcNkkqPDCEDoBPqyCoZNO7GfE7Pk=;
 b=fYPjjjOMRS0IRSDCpPvbfRndIi+OARLidKUJHlKfMsOSJrzDnrpxznq7EQ5tFpWMPx
 jnUeROUCC8wEF1ZhBk6ffVMRhSIZ6qX4Ifd8CJ+YU7r7JOT7kN3HyExz4rRJq+VD6zHe
 ZAws5/2PYaMqJgGMx/3hvL00Wd3L1zPnokFuoahQT5RacibdvczqgnlNaLmFBV9QgZQI
 Z3lcTEvOOi5W72Uq6rKpnzihEa2tYTpTBeh8duQCTRqkdplsKcA1J+Bw55yHzUZpodp3
 68ECXZCNSiPym+/MIVwGFkmGeez4W/l4cSFjlKYefbqTzTbn23pZmxVZax62FTwcD0OZ
 Ai/g==
X-Gm-Message-State: AOJu0YzWIMmVS/O1ycQHd3uyozvESWq7hIms/3BBN6aKfe2dyhD9zump
 FCyi70FcBPPU3zdL0QSdVZLXMUw0uY1j+oc6dc113IliiQHb0ELkpD4CY98CktDdA6EpsEeq14p
 72PEIVtg=
X-Gm-Gg: ATEYQzxiQfKIziA5oClqnHYV8/C1D/IXRNHp5zeKdjWkFVKgdkOg9Pu0nlLLhslsJv9
 GBxoaO8xbA61niCtTMs4ZOO2XagA3ZEC+7KcyFnGl7t0E0Ral1fXH+MYDIVgxYhqFqhowdd0Nkt
 zcyjX0ILlNO2D2axz00zhjzM+6Sf5PsJrmyOK8ed3WXAsh4Oyu58+jxrXF+tSznEtVskRRMci3N
 6BpixzW7PutgZFNpqNUdTIy+mDwN3cgJvaZ/PWRBOJnEgIcjjx/aM+t5wIAqoqTh6wM+IDnc8AV
 J/3P1PJL2AYTPaobPG3wnTTddBrKnCVUro9EYNtRc59czz9t8fSKFM71jgPpGXogWWobVHlGSIU
 HWuu1Rz87r/8LHir0AcqKK7olNdmqnTircfPwRAo8NbIRfkjQaGKWxsx9CFO58PwAvkrIDru+dT
 f7RRiUvtQScJOCC8dFCBRFLZgAlLXHGOMnRqnUzSFJ23sA/LfQq20q57i34SRuQwCzCVE9ZHtDV
 TurGbuOvYlvtsu/aGQzL8BWHGyTSrk=
X-Received: by 2002:a05:600c:1381:b0:485:6e40:5584 with SMTP id
 5b1f17b1804b1-488996afdaemr54344355e9.6.1775227833317; 
 Fri, 03 Apr 2026 07:50:33 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488983db4fbsm22419265e9.13.2026.04.03.07.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 07:50:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  3 Apr 2026 16:50:20 +0200
Message-ID: <20260403145022.1532257-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403145022.1532257-1-dowan.gullient@smile.fr>
References: <20260403145022.1532257-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1775227833; x=1775832633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/+v6BBPI530qTFwcNkkqPDCEDoBPqyCoZNO7GfE7Pk=;
 b=BUubK7nN+yQJIws113BsvoEpNk8WAd2Zcij8YqJg6XaJhBX9nZ1gdzwnxbO4PLSCTK
 rUlzGzXX4zb3mN7iI/tfJ4UCbz9wqCnZdBQOoXYUyt6TEtYBTsRhzw8gz6Hgih5fvLi0
 KjXU1jZlGKJ6WCRZ/8kZJoQl/p2z+bM6Q1/bc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BUubK7nN
Subject: [Buildroot] [PATCH v1 1/3] support/testing: add builtin kernel
 configuration for ARMv5 Versatile
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

This serie adds builtin kernel configurations for ARMv5 Versatile and ARMv7 Vexpress
platforms, and a manual trigger to generate the binaries in GitLab CI.
Those binaries can be used later by the testsuite, thus the interest to use reproductible
and maintainable platforms, without relying on external, non-modifiable binaries.
With this patch, the binaries used can regenerated and updated by creating a manual pipeline
with the variable ARCH_NAME = all , arm5 or arm7.
Other architechtures might be added later if needed.

This configuration is based on the one used in the CI for a long time, but with
some fixes to be able to build it with more recent toolchains and kernel versions,
and to be able to update it when needed.
It also uses an external bootlin toolchain.
It was tested in QEMU and booted successfully with a rootfs generated with the same
configuration.

A hash file was added for the kernel source (version 6.18.15), and post-image.sh script
was created to format the name of the generated binaries, and a linux fragment file is
provided to have a custom, minimal config that can be updated when needed.

To manually test this config you can use :

qemu-system-arm \
    -M versatilepb \
    -kernel images/kernel-versatile-pb-6.18.15 \
    -dtb images/versatile-pb-6.18.15.dtb \
    -drive file=images/rootfs.ext2,format=raw,if=scsi \
    -append "console=ttyAMA0,115200 root=/dev/sda rw rootwait" \
    -net nic,model=rtl8139 -net user \
    -nographic

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../buildroot_arm5_versatile.config           | 14 +++++
 .../linux_arm5_versatile.fragment             | 51 +++++++++++++++++++
 .../arm5-versatile/patches/linux/linux.hash   |  2 +
 support/testing/builtin-kernels/post-image.sh | 13 +++++
 4 files changed, 80 insertions(+)
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment
 create mode 100644 support/testing/builtin-kernels/arm5-versatile/patches/linux/linux.hash
 create mode 100755 support/testing/builtin-kernels/post-image.sh

diff --git a/support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config b/support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config
new file mode 100644
index 0000000000..6db2308581
--- /dev/null
+++ b/support/testing/builtin-kernels/arm5-versatile/buildroot_arm5_versatile.config
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/builtin-kernels/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="versatile-pb $(BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
+BR2_LINUX_KERNEL_DEFCONFIG="versatile"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/versatile-pb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment b/support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment
new file mode 100644
index 0000000000..0a3a1d97f6
--- /dev/null
+++ b/support/testing/builtin-kernels/arm5-versatile/linux_arm5_versatile.fragment
@@ -0,0 +1,51 @@
+# Options for debug and logs
+CONFIG_ARCH_VERSATILE=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+CONFIG_INPUT_EVDEV=y
+
+# Sytemd and Docker fixups (see the commit 241a8b06) 
+CONFIG_AUTOFS_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUPS=y
+CONFIG_DMIID=y
+CONFIG_FAIR_GROUP_SCHED=y
+CONFIG_FHANDLE=y
+CONFIG_FW_LOADER_USER_HELPER=n
+CONFIG_INOTIFY_USER=y
+CONFIG_KCMP=y
+CONFIG_MEMCG=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_FQ_CODEL=y
+CONFIG_PSI=y
+CONFIG_RT_GROUP_SCHED=n
+CONFIG_SYSFS_DEPRECATED=n
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+CONFIG_USER_NS=y
+
+# Create a config file for maintenance
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+
+# Fix the entropy problem during the boot
+CONFIG_HW_RANDOM=y
+
+# Other QEMU options
+#Storage
+CONFIG_PCI=y
+CONFIG_PCI_VERSATILE=y
+CONFIG_SCSI=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_EXT4_FS=y
+#Network
+CONFIG_8139CP=y
+CONFIG_PHYLIB=y
diff --git a/support/testing/builtin-kernels/arm5-versatile/patches/linux/linux.hash b/support/testing/builtin-kernels/arm5-versatile/patches/linux/linux.hash
new file mode 100644
index 0000000000..473cc598b5
--- /dev/null
+++ b/support/testing/builtin-kernels/arm5-versatile/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
diff --git a/support/testing/builtin-kernels/post-image.sh b/support/testing/builtin-kernels/post-image.sh
new file mode 100755
index 0000000000..4de78d8b16
--- /dev/null
+++ b/support/testing/builtin-kernels/post-image.sh
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+BINARIES_DIR="$1"
+BOARD_NAME="$2"
+KERNEL_VERSION="$3"
+
+if [ -f "${BINARIES_DIR}/zImage" ]; then
+    mv "${BINARIES_DIR}/zImage" "${BINARIES_DIR}/kernel-${BOARD_NAME}-${KERNEL_VERSION}"
+fi
+
+if [ -f "${BINARIES_DIR}/${BOARD_NAME}.dtb" ]; then
+    mv "${BINARIES_DIR}/${BOARD_NAME}.dtb" "${BINARIES_DIR}/${BOARD_NAME}-${KERNEL_VERSION}.dtb"
+fi
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
