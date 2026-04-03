Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68FBE85374
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 14:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 926EF81339;
	Fri,  3 Apr 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xk0ZRtNQb6eq; Fri,  3 Apr 2026 14:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC194811BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775227839;
	bh=UZWgTDJWloUDOIOrauNBgXHzsBlJrbP2N0PswmWAVfY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kFOjYPqjR4Vi0R5nMazSent1rtQ3i3HN7lZmr9SsWh2SxgffZPMBHq1Kz1W1S9dpx
	 h9F3u0uUp2B51R6jH20EOFZRSUcqQhEZEfdZ2CJMxeDAe5Db8+o5GfzpkngYRG4DRH
	 qhaOBSchJX/5oS5aOLIR8/0RN7jQ7ef9qZyu/0D/Gq3x2rKYZnSYc5BL+uMHpheQQB
	 1+WQphSgVcsC8cNW1eW++4LfBTbI4CrfMnKrtsh/y1eCj4hLM2F/nHVbHWwHXjqPvX
	 CUEtKS/0aAzNex4/g4pTJG/fC2kegfCE0UM8T9dtUzSrPecOaZqtoRJgBpoikLL9WV
	 rPu4LrbBOFVTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC194811BC;
	Fri,  3 Apr 2026 14:50:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECD71A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6534A4030D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLS5wmjXcoJZ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 14:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 140AE4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 140AE4003D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 140AE4003D
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 14:50:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4888375f735so16971725e9.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 07:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775227835; x=1775832635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l75kk+krpatzHAIyHDSogOmN4sKbyq3XGcrUfYcwjLU=;
 b=TQHf7nY2CEadDErqLV8wyejyAtfiPhTVzMtzK8v0RLTA+9d3Co6rl3SiUSezp4jM9K
 VuzsB/Q1xuhp63iVGdjD4HF4aEMLzpHdSa+/B41Qi/5eH1QZSsVxQHPFaGn62WkJrXpK
 x/MExTkKiP2yiIJbcnPb9D0p5YAIeLYiU+CvLQiQq1fo6RJmU4x2NG6OrgZPAB16ysYE
 GmAR5+fdW1MA+ieVtxXMIKEzALEuc6aHl0uFxnET04MPPzVbNcPc91+zwWokb0D0l4N6
 fDbPMmwGLtSSSaDoGd7WDuVFu+BoYzW95cJr8AMJuS/zaiA2rsSNC/hMm3L4y6CZxJ7L
 3Uqg==
X-Gm-Message-State: AOJu0YxiazTqrBXqXMaRS00BDkT/uFGuo08lWx/g5STKsoNXukuY609u
 i9JkMMU3LL+PSr/mfrhj9gK4eDTHxlTwa59+ECp+9o0MlEd0E3uSnYpeJl79IEwfdHCfF5DgNej
 9NpXd+kU=
X-Gm-Gg: ATEYQzyYh0rRyEQC5kDUhoPywlRXGWfkMndDjeRokPpQwK1OrJspGfwLABiw4q4U1yi
 ot+A4Mo3dJ5F0JSL7bzxV4eUSda/69pA9F6r8zi5m2D7F6SXOtaKWH+vjShT4H5LnnGVU9LyWcM
 M3jiegdgof/phsYae0ODRMnOXtkjiDYQFUQByWPX39882/7Fu9i2NSkgSQ6u0FatEnFjRyUB2Y7
 aSTYhu8BO6S9ONKqAlj8SWRYg8mtyRTWZ+eerERbq2yQODxjIDzwpZqZQeH1L5kkzOD7xqEgtsN
 36aKM8EW27ohBBURB7KddSBIcwG0cd+Ag+7ZK5ubCvsZUGfOuGNpe9s3dlxoM2+ZWLU2JpBTETz
 4kBpOw/fzNo/CgBZZVRdIEa2cimixkTNyZfQYzYUijUS81MrVoTMROP0fi8HFUvFBzMpoSA2xZq
 RKBY2YLde7gvbmP11cAPp9nmOFuUXMnYo2mDCH97cYvuQsTd8052HZyqUZ1NfKwR3Maznlz/f7W
 A+sa/JhViUv7m4WNlKx
X-Received: by 2002:a05:600c:c0c8:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-488996e0cd4mr35963935e9.4.1775227834635; 
 Fri, 03 Apr 2026 07:50:34 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488983db4fbsm22419265e9.13.2026.04.03.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 07:50:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  3 Apr 2026 16:50:21 +0200
Message-ID: <20260403145022.1532257-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403145022.1532257-1-dowan.gullient@smile.fr>
References: <20260403145022.1532257-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1775227835; x=1775832635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l75kk+krpatzHAIyHDSogOmN4sKbyq3XGcrUfYcwjLU=;
 b=g6EUPf7HkG5pkKj5NuqRzgYn2MhHlibKRY/eqhcE7VXedJoWf1/PeuHs+RR+H4UjOR
 tHmwUU3CnINcYpTE3YgdY+9ikyHd2OlvePy6DMz4/kyLTwOlaU2sk+VyZ0q+UGz4+BET
 bcxY2binJOjt0ajr+aDN1iURFl7CD2q/sBnMg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=g6EUPf7H
Subject: [Buildroot] [PATCH v1 2/3] support/testing: add builtin kernel
 configuration for ARMv7 Vexpress
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

This configuration is based on the one used in the CI for a long time, but with
some fixes to be able to build it with more recent toolchains and kernel versions,
and to be able to update it when needed.
It also uses an external bootlin toolchain.
It was tested in QEMU and booted successfully with a rootfs generated with the same
configuration.

A hash file is added for the kernel source (version 6.18.15), and a
fragment file is provided to be able to update the kernel configuration when needed.

To manually test this config you can use :

qemu-img resize images/rootfs.ext2 64M

qemu-system-arm \
    -M vexpress-a9 \
    -kernel images/kernel-vexpress-v2p-ca9-6.18.15 \
    -dtb images/vexpress-v2p-ca9-6.18.15.dtb \
    -drive file=images/rootfs.ext2,format=raw,if=sd \
    -append "console=ttyAMA0,115200 root=/dev/mmcblk0 rw rootwait" \
    -net nic -net user \
    -nographic

Linux buildroot 5.10.202 #1 SMP Wed Dec 6 00:43:44 CET 2023 armv7l GNU/Linux

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../buildroot_arm7_vexpress.config            | 17 +++++++
 .../linux_arm7_vexpress.fragment              | 46 +++++++++++++++++++
 .../arm7-vexpress/patches/linux/linux.hash    |  2 +
 3 files changed, 65 insertions(+)
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment
 create mode 100644 support/testing/builtin-kernels/arm7-vexpress/patches/linux/linux.hash

diff --git a/support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config b/support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config
new file mode 100644
index 0000000000..9a69131365
--- /dev/null
+++ b/support/testing/builtin-kernels/arm7-vexpress/buildroot_arm7_vexpress.config
@@ -0,0 +1,17 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/testing/builtin-kernels/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="vexpress-v2p-ca9 $(BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.15"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
diff --git a/support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment b/support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment
new file mode 100644
index 0000000000..2515202c01
--- /dev/null
+++ b/support/testing/builtin-kernels/arm7-vexpress/linux_arm7_vexpress.fragment
@@ -0,0 +1,46 @@
+# Options for debug and logs
+CONFIG_ARCH_VEXPRESS=y
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
+CONFIG_AUTOFS4_FS=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUPS=y
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
+CONFIG_PHYLIB=y
diff --git a/support/testing/builtin-kernels/arm7-vexpress/patches/linux/linux.hash b/support/testing/builtin-kernels/arm7-vexpress/patches/linux/linux.hash
new file mode 100644
index 0000000000..473cc598b5
--- /dev/null
+++ b/support/testing/builtin-kernels/arm7-vexpress/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
