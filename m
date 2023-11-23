Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDCFC61D99
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 00:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B356D81F17;
	Thu, 23 Nov 2023 00:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B356D81F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99V4gaOLLO2S; Thu, 23 Nov 2023 00:08:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA5E381EF3;
	Thu, 23 Nov 2023 00:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA5E381EF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B30E41BF4D6
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A3FC4015A
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 00:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3FC4015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWXx_ySCRupL for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 00:08:24 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53796400D8
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 00:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53796400D8
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6cb749044a2so382207b3a.0
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 16:08:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700698103; x=1701302903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z4QpkvlE1NrXEFrHvytgOqxfgr+jEh9DV8dWm83rjgo=;
 b=UmgW4YXUAyxL6FdgRHail/TcYwGqG+KzVgn7ctdKFHwAVVT0u+9oBvjQdRI6drEn0N
 2iYJMlANyHMH2RyLU2h5EKyRqKZzmkVuljzZqlsoLibX/z102m/RVN4aJQImnyknqATU
 pLP6OgkO0RoGbguvWeHLTCzDg+ItfsWlx29VJUIRz820bUJnb3+t6b/SCBUlJdR99xB1
 YcNEHB1Aa1JL6GnRnfmBCnBC7QcDvJJ5nhXwcWqyiIbtffd5A6UNBzpzdVWnR2Wm2UJL
 bn987MoRr9AZGWZ5GfcqmSEl4j9U0ewqQzYxQvnB/wvUU5zsftH/RoAYp6grUuJKfypw
 rdDA==
X-Gm-Message-State: AOJu0Yyvmny7mdPcWC3y+4DVabLAsBha09WF3eDzL5rd3Ia6hFKzXZJL
 6UzrOtWFAAuu/662po/OWYPcpxeVbpZgH4vwOtk=
X-Google-Smtp-Source: AGHT+IE2VqEPH7pw2MVl79yZtBZ6QRzij/id3n7ynLQS1KiFeCOLbI3m2rpaSnLGeWrF+Y4qx5bSKQ==
X-Received: by 2002:a05:6a00:2e8d:b0:6be:5a1a:3bb8 with SMTP id
 fd13-20020a056a002e8d00b006be5a1a3bb8mr4777735pfb.28.1700698102632; 
 Wed, 22 Nov 2023 16:08:22 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 fb6-20020a056a002d8600b006cb907e8059sm56858pfb.9.2023.11.22.16.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 16:08:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 17:08:06 -0700
Message-ID: <20231123000819.488595-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700698103; x=1701302903;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4QpkvlE1NrXEFrHvytgOqxfgr+jEh9DV8dWm83rjgo=;
 b=fz5g0DTGuN+q3RuwrOAyEk5+y9BZG/6h+IlCgtBLVHmpJb/fL+CX1YpSDSfWAJAANZ
 KYXLrjh2+Yr+TZAREs7DJiHoiUf7L8Kv24d5kEuL2gMYnVMmWpX9+Xx2JCMLis0tqFL9
 n82pTe1S6yztGqCiafEJdjebQjjtsrvWkioTA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fz5g0DTG
Subject: [Buildroot] [PATCH 00/13] Sway fixups
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To test the ivi-homescreen package, I needed to figure out how to use Wayland
and a compositor, which led me to the Sway package. However, in its current
form, the package has several issues.
  - All the options that make it worthwhile are disabled.
  - Sway's default terminal (foot) doesn't exist as a package.
  - BR2_PACKAGE_XKEYBOARD_CONFIG isn't selected, which is a runtime dependency
    (same as Weston)

Included are several patches to make Sway a worthwhile package for most people
looking for a Wayland compositor to test packages with.

If you wish to test the changes, below is the defconfig I used:

```
BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.2"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="support/testing/tests/package/test_flutter/linux-vkms.fragment"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_FOOT=y
BR2_PACKAGE_FOOT_GRAPHEME_CLUSTERING=y
BR2_PACKAGE_FOOT_THEMES=y
BR2_PACKAGE_SWAY=y
BR2_PACKAGE_SWAY_DEFAULT_WALLPAPER=y
BR2_PACKAGE_SWAY_SWAYBAR=y
BR2_PACKAGE_SWAY_SWAYBAR_TRAY=y
BR2_PACKAGE_SWAY_SWAYNAG=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=y
BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_LIBUTEMPTER=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
```

And the qemu-system-x86_64 script I used:

```
#!/usr/bin/env bash
set -e

LIBGL_DRIVERS_PATH=/usr/lib64/dri \
FONTCONFIG_PATH=/etc/fonts \
qemu-system-x86_64 \
  -enable-kvm \
  -M pc \
  -cpu host \
  -m 1024M \
  -bios /usr/share/OVMF/OVMF_CODE.fd \
  -drive file=output/images/disk.img,if=virtio,format=raw \
  -net nic,model=virtio \
  -net user \
  -device virtio-vga-gl \
  -display gtk,gl=es,show-cursor=on \
  -usb \
  -device usb-ehci,id=ehci \
  -device usb-tablet,bus=usb-bus.0
```

At the main prompt, run `export XDG_RUNTIME_DIR=/tmp && sway`

By default:
super + return: opens the terminal
super + shift + e: opens an exit prompt on the tray
suprt + {1,2,3...} changes desktops

Enjoy!

Adam Duskett (13):
  package/sway/Config.in: select BR2_PACKAGE_XKEYBOARD_CONFIG
  package/dmenu-wayland: new package
  package/tllist: new package
  package/fcft: new package
  package/libutempter: new package
  package/foot: new package
  package/ncurses: install terminfo if foot is selected
  package/sway: enable bash-completion support
  package/sway: enable default-wallpaper support
  package/sway: enable swaybar support
  package/sway: enable swaybar tray support
  package/sway: enable swaynag support
  package/sway/Config.in: Add a help note about the default terminal

 DEVELOPERS                                    |  5 ++
 package/Config.in                             |  5 ++
 package/dmenu-wayland/Config.in               | 26 ++++++++++
 package/dmenu-wayland/dmenu-wayland.hash      |  3 ++
 package/dmenu-wayland/dmenu-wayland.mk        | 28 ++++++++++
 package/fcft/Config.in                        | 52 +++++++++++++++++++
 package/fcft/fcft.hash                        |  3 ++
 package/fcft/fcft.mk                          | 44 ++++++++++++++++
 package/foot/Config.in                        | 36 +++++++++++++
 package/foot/foot.hash                        |  3 ++
 package/foot/foot.mk                          | 51 ++++++++++++++++++
 .../0001-force-symlink-creation.patch         | 36 +++++++++++++
 package/libutempter/Config.in                 | 11 ++++
 package/libutempter/libutempter.hash          |  3 ++
 package/libutempter/libutempter.mk            | 27 ++++++++++
 package/ncurses/ncurses.mk                    |  7 +++
 package/sway/Config.in                        | 34 ++++++++++++
 package/sway/sway.mk                          | 35 +++++++++++--
 package/tllist/Config.in                      |  6 +++
 package/tllist/tllist.hash                    |  3 ++
 package/tllist/tllist.mk                      | 16 ++++++
 21 files changed, 429 insertions(+), 5 deletions(-)
 create mode 100644 package/dmenu-wayland/Config.in
 create mode 100644 package/dmenu-wayland/dmenu-wayland.hash
 create mode 100644 package/dmenu-wayland/dmenu-wayland.mk
 create mode 100644 package/fcft/Config.in
 create mode 100644 package/fcft/fcft.hash
 create mode 100644 package/fcft/fcft.mk
 create mode 100644 package/foot/Config.in
 create mode 100644 package/foot/foot.hash
 create mode 100644 package/foot/foot.mk
 create mode 100644 package/libutempter/0001-force-symlink-creation.patch
 create mode 100644 package/libutempter/Config.in
 create mode 100644 package/libutempter/libutempter.hash
 create mode 100644 package/libutempter/libutempter.mk
 create mode 100644 package/tllist/Config.in
 create mode 100644 package/tllist/tllist.hash
 create mode 100644 package/tllist/tllist.mk

-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
