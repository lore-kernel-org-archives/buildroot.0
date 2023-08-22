Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686AEE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6377660A82;
	Tue, 22 Aug 2023 19:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6377660A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_h1i8SijnGY; Tue, 22 Aug 2023 19:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 688516123A;
	Tue, 22 Aug 2023 19:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 688516123A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310F11BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 084CC60BF7
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 084CC60BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPUKYORim02K for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BE6E60A82
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE6E60A82
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68a3c55532fso2016629b3a.3
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 12:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692733695; x=1693338495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTzkVoEzmsgL/b4kn/yaMo1+vnQ8hvs+fsaFIRdActY=;
 b=UQ2Ecc+2DjNa6sX79QRKjugwKgyXVZb4j0WYuxKyarOVvEDFxGqKgpYtsjEPnEcpFp
 diZUIlqERhSzMkYrhk6JQmpXC0OablrCkFY0uMjcVAXR5WhOS5ol9YJ2SElYJoiOhfGj
 8KM2nGTKjC/XaYQAuZQ0fS0c7JH5FIceXsvB7wZHeD8q4y6qEFemhKqX8ly4avudwiEV
 p4GHy2QMc9ZyIgM1+sJK5QUSZJHw8bMm6birmSVDRUhzOzeo8Jbz5Xt/V+/sw4fwhYCz
 6sWZ9GHqHMnQEcn4uFLKHCcpTXDyOR4TdHjIm+sn/gkSZk1+7wX4t+ulGQXza9yvGmnO
 b/4Q==
X-Gm-Message-State: AOJu0YyShV7S25yCGvlO6oEsyIG2AG31Aev39GYvVyHe2pxFNtmKauV+
 KOnynV449hjQaXiVE2O5hjgmtE06yfZqIb1Bxik=
X-Google-Smtp-Source: AGHT+IHKU67LKkOLt9jqIjOIJc1C5v3I20sgSmCOUGPNPAmraMd3d2117mkS/Ax/HqLx87vOME8sBg==
X-Received: by 2002:a05:6a00:80e:b0:68a:5395:7a9c with SMTP id
 m14-20020a056a00080e00b0068a53957a9cmr7265363pfk.9.1692733695222; 
 Tue, 22 Aug 2023 12:48:15 -0700 (PDT)
Received: from localhost.localdomain ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b0067aea93af40sm8128584pfa.2.2023.08.22.12.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 12:48:14 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 13:47:57 -0600
Message-ID: <20230822194757.1004572-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
References: <20230822194757.1004572-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692733695; x=1693338495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTzkVoEzmsgL/b4kn/yaMo1+vnQ8hvs+fsaFIRdActY=;
 b=kIwtY53nn9CAzzwpVZZBliyttGC8mxyHkUxMseZfcJ6befi6aGvrEGuEhd7OrG8cgm
 WiQYbdHiTddyzgihTkf0bzHZ9I5crBloqULChH+3tUPSf5qJDfCxdCezyXZ+diJuAoL5
 hgQoUy/QaXE1T+rclcIOIhcEhZm9U713h2j+0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kIwtY53n
Subject: [Buildroot] [PATCH v5 7/7]
 configs/flutter_x86_64_efi_demo_defconfig: new flutter demo config
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

Currently, building host-flutter-sdk-bin with the testing framework results in
the error:
'Oops; flutter has exited unexpectedly: "Null check operator used on a null
 value".'

As such, the best option is a simple board demonstration.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
Changes v4 -> v5:
  - Remove CMake [Yann]
  - Remove linux firmware and Connman

Changes v3 -> v4:
  - Add BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y to  flutter_x86_64_efi_demo_defconfig

 DEVELOPERS                                    |  2 +
 board/flutter_x86_64/linux-vkms.fragment      |  2 +
 .../flutter-gallery.service                   |  1 +
 .../systemd/system/flutter-gallery.service    | 10 +++++
 board/flutter_x86_64/readme.txt               | 18 +++++++++
 configs/flutter_x86_64_efi_demo_defconfig     | 39 +++++++++++++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 board/flutter_x86_64/linux-vkms.fragment
 create mode 120000 board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/readme.txt
 create mode 100644 configs/flutter_x86_64_efi_demo_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e34a11f03a..7ad29713e9 100644
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
index 0000000000..324bddc281
--- /dev/null
+++ b/configs/flutter_x86_64_efi_demo_defconfig
@@ -0,0 +1,39 @@
+BR2_x86_64=y
+BR2_x86_corei7_avx=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_PER_PACKAGE_DIRECTORIES=y
+BR2_INIT_SYSTEMD=y
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
+BR2_ROOTFS_OVERLAY="$(TOPDIR)/board/flutter_x86_64/overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.46"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/flutter_x86_64/linux-vkms.fragment"
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
+BR2_PACKAGE_ACPID=y
+BR2_PACKAGE_FLUTTER_ENGINE=y
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
