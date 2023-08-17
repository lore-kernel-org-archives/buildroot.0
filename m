Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43658C5320E
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0EC361531;
	Thu, 17 Aug 2023 19:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0EC361531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGujK9Q9YH-9; Thu, 17 Aug 2023 19:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A1960F19;
	Thu, 17 Aug 2023 19:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A1960F19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79C611BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D78839A4
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53D78839A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88nILZqshO_0 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:46:48 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 203BC83955
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 203BC83955
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdc8081147so9451865ad.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692301607; x=1692906407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6q6lO3c3SQLz9agIWJRDmoN2xHEUbY+Ky0F/55EsMQ=;
 b=F1OZdecJ4dQuJRJQ17sIPbf70I9GkTzwqp990vkDuKVmC2B7hULEv3i7yRzICccizZ
 u8pLUZrRMz8Olye4wO3QJS7/twOdoNhcEdyOJG+4Q3zUHiAPgWnZTT2qd9OU4begfum0
 WPchgeI16JcuQwtD6pwqlW3gNlmjuLwa1To8ifthP4rFNYOMAbyY/v4D3R3GOf7rfr6S
 JmRSxukUsrkgJAZxrbB8Y7iCkshWX+F8F9VA6qg/IrgJnDqDmuIlbK19tfqbwzz9wsL+
 btzwMPeMsW76q9IoSN09SxmBRjPf7psexVe6QpFXF+SZrrWwb+iypsMm0aHVMC6Jmih6
 5tow==
X-Gm-Message-State: AOJu0YxzY93/XRB29CeXMOufBPDnjjSkciKaGjESDqyoyswmKS4VUzBQ
 rNYvEc0xQagzBD8Cna2NeiTPnXFduAQ2mnVYTNY=
X-Google-Smtp-Source: AGHT+IHeZxjQ/pGM1qLg1eNR3++L7aqq6aictHBnVMAuqWWjqgIOVUtzRALtJFUdpCU3zhnxF5elUA==
X-Received: by 2002:a17:902:d2c4:b0:1bc:7837:366a with SMTP id
 n4-20020a170902d2c400b001bc7837366amr382966plc.19.1692301607165; 
 Thu, 17 Aug 2023 12:46:47 -0700 (PDT)
Received: from fedora.. ([75.174.130.12]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001bdd62cf7a1sm137569pll.236.2023.08.17.12.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 12:46:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 13:46:38 -0600
Message-ID: <20230817194638.780863-8-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
References: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692301607; x=1692906407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6q6lO3c3SQLz9agIWJRDmoN2xHEUbY+Ky0F/55EsMQ=;
 b=HvnhRcFXniTcVfJFet3qFRC+qJLVKw6VyYln07QUB30c91Gx8aJxrjisXU3D8HCVOX
 CJLNNYe6cO/VnVb8Ui3+V/tfZzXATMyq24rdcmNK6KTRpjm5jid2GtQrF15Z1WzYIu5D
 OQB6M0fM/l43/ko6IA7n/6C3eMh6zaKzs1OAw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HvnhRcFX
Subject: [Buildroot] [PATCH v3] configs/flutter_x86_64_efi_demo_defconfig:
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This config uses board/flutter_x86_64 to demonstrate Buildroots new flutter
capabilities. When ran, flutter-gallery automatically starts on boot.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                                    |  2 +
 board/flutter_x86_64/linux-vkms.fragment      |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 10 +++
 board/flutter_x86_64/readme.txt               | 18 ++++++
 configs/flutter_x86_64_efi_demo_defconfig     | 62 +++++++++++++++++++
 6 files changed, 95 insertions(+)
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
index 0000000000..640a82bb91
--- /dev/null
+++ b/configs/flutter_x86_64_efi_demo_defconfig
@@ -0,0 +1,62 @@
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
