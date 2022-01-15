Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407CDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E31E4400A6;
	Sat, 15 Jan 2022 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFiosrAXJk-N; Sat, 15 Jan 2022 20:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B016A400D6;
	Sat, 15 Jan 2022 20:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53EF21BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42E8081AF6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krNQdKYb7CDM for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BF2C81AF4
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:40 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z22so47640991edd.12
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYUqix41PiEblWwiVfY6yfm6GSca4L0j/pFjYlUKQL4=;
 b=PKJjS/stX8nVbs5DwWkH8q1l46w88DPE/ojvtyiGEEe9h7z95ePd+qUPc2aAk9Nj+K
 shZTnA6byiu7zgc8fz91d5s2o4VWUT5ILp2K1/7/0O73VhzpSkdXFceCc5CXJ8eVXTdU
 7hiaUTEEQWftAqED4Y9zkVAiLYCZsjYue3Bwu6C6matOD9ZCWWXMCV7NvSQgm0qIEy/6
 bGGZoqAF3orSEkYCeyGXRjeeJTW6ervNqIfTA6rJCZyD1AVY6zHqh7opOBLAGcKukuja
 Zkh6Lt5LayKVacFKuIiBl01M4gdIK+OH8dV7L/HaTO+zUgZHRymi/7B6uZxqdBw/eHPi
 xL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYUqix41PiEblWwiVfY6yfm6GSca4L0j/pFjYlUKQL4=;
 b=MYGYO5upVV8dqxBZ66OkHwbguK8n0gNo14nFPV07warLj/QKAMFHGrGB1PWiJ+Zxp0
 SH7NabLaYByQ7RQ8xXcXz9n5kOD/aJ/EaJH/vwySHxbrVbDKX6SWG46HsI3wiPIRUVtR
 r2NKfiX7wBPoX1K5NwTff2QbxPAqc96KzjgK2bsMr1eZ2yz4q6U+xp8k/f+/zn9JNTr2
 BQ0J62vjZVXXidZHEAP6jnP9IrSQZGfBvoqfwR8fuusfb7YqZeKfzUIGr7M2XHpef75m
 NbRz3dr0J8FTcTpHPQS7+PvZX2/kFWjhxDGqBDS6V1kY1HiLRSEGBobmP5vetqUMUxp0
 vMTA==
X-Gm-Message-State: AOAM530Jbp8txYG64T8xx3c0Cx80LQF0xvWFYRdwxl+L5w56b/aZk4mn
 atBzyfGQzUEnEGCQEKgwIUQUhoVPKIs41A==
X-Google-Smtp-Source: ABdhPJyjwutugVgPJACkHrfOXgc/yobCQeOKHnyyBg7HEIwf8DaUrRZGkGyIVhFkhNlItMJRoB7NuA==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr12006613ejc.641.1642277018306; 
 Sat, 15 Jan 2022 12:03:38 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id 27sm2849018ejm.41.2022.01.15.12.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:37 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:03:04 +0100
Message-Id: <20220115200306.14037-7-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220115200306.14037-1-patrickdepinguin@gmail.com>
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 6/7] configs: add new qemu defconfig
 'x86_multilib'
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>, romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Add a new qemu defconfig for an x86_64 target that will run an x86_64 kernel
but userspace in 32-bit (x86) mode, using BR2_KERNEL_ARCH_OVERRIDE.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---

Note that the defconfig refers to a toolchain at
autobuild.buildroot.org, but is not yet present at that location.
I uploaded the toolchain temporarily to:
http://patrickdepinguin.com/ctng-6737cfaa8ce6-x86_multilib-glibc-gcc11.tar.xz
md5sum:b085c0d8f137c078f8f09d116d8364f8
sha256sum 2a5241d9274239532e44d37c65509931fbc120db5991412f946eb38176db4dc2



 board/qemu/x86_multilib/linux.config  | 57 +++++++++++++++++++++++++++
 board/qemu/x86_multilib/post-build.sh | 11 ++++++
 board/qemu/x86_multilib/readme.txt    |  7 ++++
 configs/qemu_x86_multilib_defconfig   | 26 ++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 board/qemu/x86_multilib/linux.config
 create mode 100755 board/qemu/x86_multilib/post-build.sh
 create mode 100644 board/qemu/x86_multilib/readme.txt
 create mode 100644 configs/qemu_x86_multilib_defconfig

diff --git a/board/qemu/x86_multilib/linux.config b/board/qemu/x86_multilib/linux.config
new file mode 100644
index 0000000000..0ea9e53a06
--- /dev/null
+++ b/board/qemu/x86_multilib/linux.config
@@ -0,0 +1,57 @@
+CONFIG_SYSVIPC=y
+# CONFIG_USELIB is not set
+CONFIG_CGROUPS=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_IA32_EMULATION=y
+# CONFIG_COMPAT_32BIT_TIME is not set
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_PCI=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_BOCHS=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/qemu/x86_multilib/post-build.sh b/board/qemu/x86_multilib/post-build.sh
new file mode 100755
index 0000000000..bf83a002c2
--- /dev/null
+++ b/board/qemu/x86_multilib/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Add a console on tty1
+if [ -e ${TARGET_DIR}/etc/inittab ]; then
+    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
+	sed -i '/GENERIC_SERIAL/a\
+tty1::respawn:/sbin/getty -L  tty1 0 vt100 # QEMU graphical window' ${TARGET_DIR}/etc/inittab
+fi
diff --git a/board/qemu/x86_multilib/readme.txt b/board/qemu/x86_multilib/readme.txt
new file mode 100644
index 0000000000..fbc8ae9a6a
--- /dev/null
+++ b/board/qemu/x86_multilib/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-x86_64 -M pc -kernel output/images/bzImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio -net nic,model=virtio -net user # qemu_x86_multilib_defconfig
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The login prompt will appear in the graphical window.
diff --git a/configs/qemu_x86_multilib_defconfig b/configs/qemu_x86_multilib_defconfig
new file mode 100644
index 0000000000..1c3a8179c1
--- /dev/null
+++ b/configs/qemu_x86_multilib_defconfig
@@ -0,0 +1,26 @@
+BR2_KERNEL_ARCH_OVERRIDE="x86_64"
+BR2_x86_core2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/ctng-6737cfaa8ce6-x86_multilib-glibc-gcc11.tar.xz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="x86_64-multilib-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+# BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_OPTIMIZATION="-m32"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_multilib/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_multilib/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
