Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4793C64EB4
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 21:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8F883A92;
	Thu, 17 Aug 2023 21:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8F883A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pg-1gy6pELgC; Thu, 17 Aug 2023 21:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CD583F4C;
	Thu, 17 Aug 2023 21:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CD583F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98AB41BF215
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FD7183EDF
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FD7183EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e3lbjFtQqcfz for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:59:06 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C678383EC1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C678383EC1
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-268299d5d9fso169415a91.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305945; x=1692910745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MephcDPz60kU/2quEjJVDlF0o5+gcG/LwM9axdjsPbE=;
 b=ck+ICV6WKmvAJbLgJAnkNztoEhyRKMVVYRZBMBXQpMhzYmsYANFrMYi2NUQTP+yHLa
 zDPmHEFRuU9boJageE0gT0UTbjiOc4tCscVZY/ycKtOkLoVikaDj2Ew65g+8CIe8U28L
 Mbv786/x9KmsyHl+A6/SKn2M2YYQzdb1LtSvfskPQavotdDdJl5HqfmnyD+XBUZWb/dF
 tgWffA/oKFD2IrdZq+86Wrig9W2jrweSrigllccXrn3P7Fy1ZLGo8sec7PZlnyykUSOJ
 w+m43NxVZuzSL4UonbTffx+n1ENWMok6FTH7zRF45lLfByzo/E34AkAle6DAxyTx5Tef
 dJFg==
X-Gm-Message-State: AOJu0Yx3uZO27t2PWH1TaOA1i5g08UZXEnRNZsrKs5gCNQzYR2kJsA/t
 gao4kwUcbDwIDq9gWU9Bgp3JD+TMjTTiKSMp4qc=
X-Google-Smtp-Source: AGHT+IHBd35lxX+KjvUVU5cTj5YKPe8dgsMBJg2KHdK1/IkEhLeG8tD8RdSIeE9jJGfop8ZtuSls9w==
X-Received: by 2002:a17:90a:2a01:b0:26b:e80:11de with SMTP id
 i1-20020a17090a2a0100b0026b0e8011demr597820pjd.25.1692305944783; 
 Thu, 17 Aug 2023 13:59:04 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([75.174.130.12])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a3f1600b0026d034f6badsm243143pjc.38.2023.08.17.13.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:59:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:58:55 -0600
Message-ID: <20230817205855.1556239-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
References: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692305945; x=1692910745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MephcDPz60kU/2quEjJVDlF0o5+gcG/LwM9axdjsPbE=;
 b=FO1EZ+D/rn5uTUPSRKOfQdLGcQ+0kaSJFM+wZls7lrHDU69Wk/j4QAGC6Lp7J+CqSN
 43AkdDhCLuUVj4iXChmXk8QsbhXcwFf3x2JgKn64CaCcBg2ty3gVWYZOyvVXQ/oxfOvf
 tgx7Dix/q4/Z3KA7N+AQ7R3ICRmaWe1dKeHG0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FO1EZ+D/
Subject: [Buildroot] [PATCH v4] configs/flutter_x86_64_efi_demo_defconfig:
 new flutter demo config
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This config uses board/flutter_x86_64 to demonstrate Buildroots new flutter
capabilities. When ran, flutter-gallery automatically starts on boot.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v3 -> v4:
  - Add BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y to  flutter_x86_64_efi_demo_defconfig

 DEVELOPERS                                    |  2 +
 board/flutter_x86_64/linux-vkms.fragment      |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 10 +++
 board/flutter_x86_64/readme.txt               | 18 ++++++
 configs/flutter_x86_64_efi_demo_defconfig     | 63 +++++++++++++++++++
 6 files changed, 96 insertions(+)
 create mode 100644 board/flutter_x86_64/linux-vkms.fragment
 create mode 120000 board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/readme.txt
 create mode 100644 configs/flutter_x86_64_efi_demo_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1988c265fb..73ea022044 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -27,6 +27,8 @@
 #   modify packages that use this infrastructure.
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	board/flutter_x86_64/
+F:	configs/flutter_x86_64_efi_demo_defconfig
 F:	package/depot-tools/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
diff --git a/board/flutter_x86_64/linux-vkms.fragment b/board/flutter_x86_64/linux-vkms.fragment
new file mode 100644
index 0000000000..3fc7a5dded
--- /dev/null
+++ b/board/flutter_x86_64/linux-vkms.fragment
@@ -0,0 +1,2 @@
+CONFIG_DEBUG_FS=y
+CONFIG_DRM_VKMS=y
diff --git a/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service b/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
new file mode 120000
index 0000000000..40993fb16c
--- /dev/null
+++ b/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
@@ -0,0 +1 @@
+../../../../usr/lib/systemd/system/flutter-gallery.service
\ No newline at end of file
diff --git a/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service
new file mode 100644
index 0000000000..0cf66d9ce4
--- /dev/null
+++ b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=flutter-gallery daemon
+After=dbus.service systemd-udevd.service
+
+[Service]
+ExecStart=/usr/bin/flutter-pi --release /usr/share/flutter/gallery/3.10.6/release/
+Type=notify
+
+[Install]
+WantedBy=multi-user.target
diff --git a/board/flutter_x86_64/readme.txt b/board/flutter_x86_64/readme.txt
new file mode 100644
index 0000000000..ec4e527b1c
--- /dev/null
+++ b/board/flutter_x86_64/readme.txt
@@ -0,0 +1,18 @@
+Run the emulation with:
+
+qemu-system-x86_64 -enable-kvm -M pc \
+-m 512 \
+-cpu IvyBridge \
+-kernel output/images/bzImage \
+-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
+-drive file=output/images/rootfs.ext2,if=virtio,format=raw \
+-usb -device usb-tablet \
+-net nic,model=virtio \
+-serial stdio \
+-vga virtio \
+-display sdl,show-cursor=on
+
+
+Optionally add -smp N to emulate a SMP system with N CPUs.
+
+The flutter-gallery app will automatically run.
diff --git a/configs/flutter_x86_64_efi_demo_defconfig b/configs/flutter_x86_64_efi_demo_defconfig
new file mode 100644
index 0000000000..426eb98e73
--- /dev/null
+++ b/configs/flutter_x86_64_efi_demo_defconfig
@@ -0,0 +1,63 @@
+BR2_x86_64=y
+BR2_x86_corei7_avx=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_CCACHE=y
+BR2_CCACHE_DIR="$(HOME)/Downloads/ccache/flutter-x86_64"
+BR2_CCACHE_INITIAL_SETUP="--max-size=5G"
+BR2_PER_PACKAGE_DIRECTORIES=y
+BR2_INIT_SYSTEMD=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
+BR2_ROOTFS_OVERLAY="$(TOPDIR)/board/flutter_x86_64/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.45"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(TOPDIR)/board/flutter_x86_64/linux-vkms.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_PACKAGE_FLUTTER_PI=y
+BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN=y
+BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=y
+BR2_PACKAGE_FLUTTER_GALLERY=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_FLUTTER_ENGINE=y
+BR2_PACKAGE_CONNMAN=y
+BR2_PACKAGE_CONNMAN_WIFI=y
+BR2_PACKAGE_CONNMAN_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
