Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A808C5479A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 20:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E36660A5E;
	Thu, 17 Aug 2023 20:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E36660A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJnpi6mEde2g; Thu, 17 Aug 2023 20:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2919A60A69;
	Thu, 17 Aug 2023 20:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2919A60A69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A22841BF360
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89B26400C1
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89B26400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LBf1sV7lw_n5 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:25:23 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E584C40003
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E584C40003
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so2836819a12.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692303921; x=1692908721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NnlV79hnC+4ulE2naTXkpNnq1g2i0SujAAdzDn1SDU=;
 b=mCbf5Cf68SVT1HSs6UtPkhJ2Dc//oI7S+9FrS5fgdf3cyIazkN09TfXQO7Kj7ZV0vb
 k1wTSDkaJmygtaJU8N1oFbvSSJyt7btzqBEoWIly3B2Zi03fm/JSSt3CNxkThmWXDIte
 mLR8nz4W9VvXC1AMqWCECSN1VUl47xkfNeLXBw9yzhNAkH0a9F4G6fxmSjqmlRr0jKdX
 EJx4Dei2sbtoVXyyESMc0FI6O3XK3ooORyV1PooV4U3k/jFcAZHAx6PbdtCEo9yTCgPW
 2IOr0J3vqktEOtJNIFxZBRGkLG4PfTg1mA07U/PNlLlwU5buCUis5PilzPRuIsfDG6Le
 ao2w==
X-Gm-Message-State: AOJu0YzF7iKtw4E/sUQXfRAuQib3CjYNcLXkOIdLGmZpLgdbYYOAayPc
 Rlaor87q+kBTT7yAGUg8O3uDNE5irf2PiZRZM0ZHAmL5KZE+XPdPGUA=
X-Google-Smtp-Source: AGHT+IEukI13Zg3ByRGxdjUM0ruISw6tEdoAcEn2TZYKvh5uQj6tRmpVcbucGzqNlEC9ysc6uCyDtvpgNfZiLulFUbk=
X-Received: by 2002:a17:907:6091:b0:993:f664:ce25 with SMTP id
 ht17-20020a170907609100b00993f664ce25mr5248126ejc.19.1692303920393; Thu, 17
 Aug 2023 13:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
 <20230817194638.780863-8-adam.duskett@amarulasolutions.com>
In-Reply-To: <20230817194638.780863-8-adam.duskett@amarulasolutions.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 17 Aug 2023 14:25:09 -0600
Message-ID: <CAHDQB6OXX_wttQO75x6Hbp4C8oof+9cPvu5-EiQn8Xxg1UNuxQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692303921; x=1692908721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8NnlV79hnC+4ulE2naTXkpNnq1g2i0SujAAdzDn1SDU=;
 b=Gf+acBvtHElbbqkX7xf0SX2mcDWnSuH1xb2/5HhqO6k91L0mw7qU2cBjNwpzWHwAOk
 p8XJgGpfsvapM21OJQpfl0+mFmhLcGxi+fbyVKSIEVeVkPwJMvwwJgbYZvY9YwHFjjsF
 mmSr2xSMMYBdhFjMm66cH139zrK75JpOyA1IA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Gf+acBvt
Subject: Re: [Buildroot] [PATCH v3]
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: multipart/mixed; boundary="===============2423824152290031086=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2423824152290031086==
Content-Type: multipart/alternative; boundary="0000000000000703a70603243688"

--0000000000000703a70603243688
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All;

BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=3Dy needs to be added to the defconfig
before testing.
Thomas or Yann, I can submit a new patch series later if you want me to.

Sorry about that!

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Aug 17, 2023 at 1:46=E2=80=AFPM Adam Duskett <
adam.duskett@amarulasolutions.com> wrote:

> This config uses board/flutter_x86_64 to demonstrate Buildroots new flutt=
er
> capabilities. When ran, flutter-gallery automatically starts on boot.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  DEVELOPERS                                    |  2 +
>  board/flutter_x86_64/linux-vkms.fragment      |  2 +
>  .../flutter-gallery.service                   |  1 +
>  .../systemd/system/flutter-gallery.service    | 10 +++
>  board/flutter_x86_64/readme.txt               | 18 ++++++
>  configs/flutter_x86_64_efi_demo_defconfig     | 62 +++++++++++++++++++
>  6 files changed, 95 insertions(+)
>  create mode 100644 board/flutter_x86_64/linux-vkms.fragment
>  create mode 120000
> board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/f=
lutter-gallery.service
>  create mode 100644
> board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.servi=
ce
>  create mode 100644 board/flutter_x86_64/readme.txt
>  create mode 100644 configs/flutter_x86_64_efi_demo_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1988c265fb..73ea022044 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -27,6 +27,8 @@
>  #   modify packages that use this infrastructure.
>
>  N:     Adam Duskett <adam.duskett@amarulasolutions.com>
> +F:     board/flutter_x86_64/
> +F:     configs/flutter_x86_64_efi_demo_defconfig
>  F:     package/depot-tools/
>  F:     package/flutter-engine/
>  F:     package/flutter-gallery/
> diff --git a/board/flutter_x86_64/linux-vkms.fragment
> b/board/flutter_x86_64/linux-vkms.fragment
> new file mode 100644
> index 0000000000..3fc7a5dded
> --- /dev/null
> +++ b/board/flutter_x86_64/linux-vkms.fragment
> @@ -0,0 +1,2 @@
> +CONFIG_DEBUG_FS=3Dy
> +CONFIG_DRM_VKMS=3Dy
> diff --git
> a/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants=
/flutter-gallery.service
> b/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants=
/flutter-gallery.service
> new file mode 120000
> index 0000000000..40993fb16c
> --- /dev/null
> +++
> b/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants=
/flutter-gallery.service
> @@ -0,0 +1 @@
> +../../../../usr/lib/systemd/system/flutter-gallery.service
> \ No newline at end of file
> diff --git
> a/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.ser=
vice
> b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.ser=
vice
> new file mode 100644
> index 0000000000..0cf66d9ce4
> --- /dev/null
> +++
> b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.ser=
vice
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3Dflutter-gallery daemon
> +After=3Ddbus.service systemd-udevd.service
> +
> +[Service]
> +ExecStart=3D/usr/bin/flutter-pi --release
> /usr/share/flutter/gallery/3.10.6/release/
> +Type=3Dnotify
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/board/flutter_x86_64/readme.txt
> b/board/flutter_x86_64/readme.txt
> new file mode 100644
> index 0000000000..ec4e527b1c
> --- /dev/null
> +++ b/board/flutter_x86_64/readme.txt
> @@ -0,0 +1,18 @@
> +Run the emulation with:
> +
> +qemu-system-x86_64 -enable-kvm -M pc \
> +-m 512 \
> +-cpu IvyBridge \
> +-kernel output/images/bzImage \
> +-append "rootwait root=3D/dev/vda console=3Dtty1 console=3DttyS0" \
> +-drive file=3Doutput/images/rootfs.ext2,if=3Dvirtio,format=3Draw \
> +-usb -device usb-tablet \
> +-net nic,model=3Dvirtio \
> +-serial stdio \
> +-vga virtio \
> +-display sdl,show-cursor=3Don
> +
> +
> +Optionally add -smp N to emulate a SMP system with N CPUs.
> +
> +The flutter-gallery app will automatically run.
> diff --git a/configs/flutter_x86_64_efi_demo_defconfig
> b/configs/flutter_x86_64_efi_demo_defconfig
> new file mode 100644
> index 0000000000..640a82bb91
> --- /dev/null
> +++ b/configs/flutter_x86_64_efi_demo_defconfig
> @@ -0,0 +1,62 @@
> +BR2_x86_64=3Dy
> +BR2_x86_corei7_avx=3Dy
> +BR2_TOOLCHAIN_EXTERNAL=3Dy
> +BR2_CCACHE=3Dy
> +BR2_CCACHE_DIR=3D"$(HOME)/Downloads/ccache/flutter-x86_64"
> +BR2_CCACHE_INITIAL_SETUP=3D"--max-size=3D5G"
> +BR2_PER_PACKAGE_DIRECTORIES=3Dy
> +BR2_INIT_SYSTEMD=3Dy
> +BR2_TARGET_GENERIC_GETTY_PORT=3D"tty1"
> +BR2_SYSTEM_DEFAULT_PATH=3D"/bin:/sbin:/usr/bin:/usr/sbin"
> +BR2_ROOTFS_OVERLAY=3D"$(TOPDIR)/board/flutter_x86_64/overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/pc/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/pc/post-image-efi.sh"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.45"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/pc/linux.config"
>
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"$(TOPDIR)/board/flutter_x86_64=
/linux-vkms.fragment"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> +BR2_PACKAGE_FLUTTER_PI=3Dy
> +BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN=3Dy
> +BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=3Dy
> +BR2_PACKAGE_FLUTTER_GALLERY=3Dy
> +BR2_PACKAGE_MESA3D=3Dy
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=3Dy
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=3Dy
> +BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=3Dy
> +BR2_PACKAGE_ACPID=3Dy
> +BR2_PACKAGE_FLUTTER_ENGINE=3Dy
> +BR2_PACKAGE_CONNMAN=3Dy
> +BR2_PACKAGE_CONNMAN_WIFI=3Dy
> +BR2_PACKAGE_CONNMAN_CLIENT=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"512M"
> +BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D"-O 64bit"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_GRUB2=3Dy
> +BR2_TARGET_GRUB2_X86_64_EFI=3Dy
> +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> +BR2_PACKAGE_HOST_MTOOLS=3Dy
> --
> 2.41.0
>
>

--0000000000000703a70603243688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All;</div><div><br></div><div>BR2_LINUX_KERNEL_NEEDS_=
HOST_LIBELF=3Dy needs to be added to the defconfig before testing.</div><di=
v>Thomas or Yann, I can submit a new patch series later if you want me to.<=
/div><div><br></div><div>Sorry about that!</div><div><br></div><div><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7999999999999=
998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fa=
mily:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertic=
al-align:baseline;white-space:pre-wrap">Adam Duskett</span></p><p dir=3D"lt=
r" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospa=
ce;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap">Senior Embedded Systems Developer</span></p><p dir=3D"l=
tr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monosp=
ace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;w=
hite-space:pre-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blan=
k">adam.duskett@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"=
line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb=
(0,0,0);background-color:transparent;vertical-align:baseline;white-space:pr=
e-wrap">__________________________________</span></p><p dir=3D"ltr" style=
=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color=
:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spac=
e:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubuntu,san=
s-serif;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">Amarula Solutions BV</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;colo=
r:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spa=
ce:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p><p dir=
=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,m=
onospace;color:rgb(0,0,0);background-color:transparent;vertical-align:basel=
ine;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=3D"font-s=
ize:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);bac=
kground-color:transparent;vertical-align:baseline;white-space:pre-wrap"><br=
></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,m=
onospace;color:rgb(0,0,0);background-color:transparent;vertical-align:basel=
ine;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions.com" targ=
et=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=
=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><a hre=
f=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"fon=
t-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);=
background-color:transparent;vertical-align:baseline;white-space:pre-wrap">=
www.amarulasolutions.com</span></a></p><div><br></div></span></div></div></=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 17, 2023 at 1:46=E2=80=AFPM Adam Duskett &lt;<a=
 href=3D"mailto:adam.duskett@amarulasolutions.com">adam.duskett@amarulasolu=
tions.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This config uses board/flutter_x86_64 to demonstrate Buildroots =
new flutter<br>
capabilities. When ran, flutter-gallery automatically starts on boot.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +<br>
=C2=A0board/flutter_x86_64/linux-vkms.fragment=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +<br>
=C2=A0.../flutter-gallery.service=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../systemd/system/flutter-gallery.service=C2=A0 =C2=A0 | 10 +++<br>
=C2=A0board/flutter_x86_64/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 ++++++<br>
=C2=A0configs/flutter_x86_64_efi_demo_defconfig=C2=A0 =C2=A0 =C2=A0| 62 +++=
++++++++++++++++<br>
=C2=A06 files changed, 95 insertions(+)<br>
=C2=A0create mode 100644 board/flutter_x86_64/linux-vkms.fragment<br>
=C2=A0create mode 120000 board/flutter_x86_64/overlay/etc/systemd/system/mu=
lti-user.target.wants/flutter-gallery.service<br>
=C2=A0create mode 100644 board/flutter_x86_64/overlay/usr/lib/systemd/syste=
m/flutter-gallery.service<br>
=C2=A0create mode 100644 board/flutter_x86_64/readme.txt<br>
=C2=A0create mode 100644 configs/flutter_x86_64_efi_demo_defconfig<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 1988c265fb..73ea022044 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -27,6 +27,8 @@<br>
=C2=A0#=C2=A0 =C2=A0modify packages that use this infrastructure.<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Adam Duskett &lt;<a href=3D"mailto:adam.duskett=
@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com<=
/a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0board/flutter_x86_64/<br>
+F:=C2=A0 =C2=A0 =C2=A0configs/flutter_x86_64_efi_demo_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/depot-tools/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-engine/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/flutter-gallery/<br>
diff --git a/board/flutter_x86_64/linux-vkms.fragment b/board/flutter_x86_6=
4/linux-vkms.fragment<br>
new file mode 100644<br>
index 0000000000..3fc7a5dded<br>
--- /dev/null<br>
+++ b/board/flutter_x86_64/linux-vkms.fragment<br>
@@ -0,0 +1,2 @@<br>
+CONFIG_DEBUG_FS=3Dy<br>
+CONFIG_DRM_VKMS=3Dy<br>
diff --git a/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.tar=
get.wants/flutter-gallery.service b/board/flutter_x86_64/overlay/etc/system=
d/system/multi-user.target.wants/flutter-gallery.service<br>
new file mode 120000<br>
index 0000000000..40993fb16c<br>
--- /dev/null<br>
+++ b/board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wan=
ts/flutter-gallery.service<br>
@@ -0,0 +1 @@<br>
+../../../../usr/lib/systemd/system/flutter-gallery.service<br>
\ No newline at end of file<br>
diff --git a/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-ga=
llery.service b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter=
-gallery.service<br>
new file mode 100644<br>
index 0000000000..0cf66d9ce4<br>
--- /dev/null<br>
+++ b/board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.s=
ervice<br>
@@ -0,0 +1,10 @@<br>
+[Unit]<br>
+Description=3Dflutter-gallery daemon<br>
+After=3Ddbus.service systemd-udevd.service<br>
+<br>
+[Service]<br>
+ExecStart=3D/usr/bin/flutter-pi --release /usr/share/flutter/gallery/3.10.=
6/release/<br>
+Type=3Dnotify<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/board/flutter_x86_64/readme.txt b/board/flutter_x86_64/readme.=
txt<br>
new file mode 100644<br>
index 0000000000..ec4e527b1c<br>
--- /dev/null<br>
+++ b/board/flutter_x86_64/readme.txt<br>
@@ -0,0 +1,18 @@<br>
+Run the emulation with:<br>
+<br>
+qemu-system-x86_64 -enable-kvm -M pc \<br>
+-m 512 \<br>
+-cpu IvyBridge \<br>
+-kernel output/images/bzImage \<br>
+-append &quot;rootwait root=3D/dev/vda console=3Dtty1 console=3DttyS0&quot=
; \<br>
+-drive file=3Doutput/images/rootfs.ext2,if=3Dvirtio,format=3Draw \<br>
+-usb -device usb-tablet \<br>
+-net nic,model=3Dvirtio \<br>
+-serial stdio \<br>
+-vga virtio \<br>
+-display sdl,show-cursor=3Don<br>
+<br>
+<br>
+Optionally add -smp N to emulate a SMP system with N CPUs.<br>
+<br>
+The flutter-gallery app will automatically run.<br>
diff --git a/configs/flutter_x86_64_efi_demo_defconfig b/configs/flutter_x8=
6_64_efi_demo_defconfig<br>
new file mode 100644<br>
index 0000000000..640a82bb91<br>
--- /dev/null<br>
+++ b/configs/flutter_x86_64_efi_demo_defconfig<br>
@@ -0,0 +1,62 @@<br>
+BR2_x86_64=3Dy<br>
+BR2_x86_corei7_avx=3Dy<br>
+BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
+BR2_CCACHE=3Dy<br>
+BR2_CCACHE_DIR=3D&quot;$(HOME)/Downloads/ccache/flutter-x86_64&quot;<br>
+BR2_CCACHE_INITIAL_SETUP=3D&quot;--max-size=3D5G&quot;<br>
+BR2_PER_PACKAGE_DIRECTORIES=3Dy<br>
+BR2_INIT_SYSTEMD=3Dy<br>
+BR2_TARGET_GENERIC_GETTY_PORT=3D&quot;tty1&quot;<br>
+BR2_SYSTEM_DEFAULT_PATH=3D&quot;/bin:/sbin:/usr/bin:/usr/sbin&quot;<br>
+BR2_ROOTFS_OVERLAY=3D&quot;$(TOPDIR)/board/flutter_x86_64/overlay&quot;<br=
>
+BR2_ROOTFS_POST_BUILD_SCRIPT=3D&quot;board/pc/post-build.sh&quot;<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/pc/post-image-efi.sh&quot;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.45&quot;<br>
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/pc/linux.config&quot;<br=
>
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;$(TOPDIR)/board/flutter_x86=
_64/linux-vkms.fragment&quot;<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
+BR2_PACKAGE_FLUTTER_PI=3Dy<br>
+BR2_PACKAGE_FLUTTER_PI_KEYBOARD_PLUGIN=3Dy<br>
+BR2_PACKAGE_FLUTTER_PI_TEXT_INPUT_PLUGIN=3Dy<br>
+BR2_PACKAGE_FLUTTER_GALLERY=3Dy<br>
+BR2_PACKAGE_MESA3D=3Dy<br>
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=3Dy<br>
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=3Dy<br>
+BR2_PACKAGE_MESA3D_OPENGL_ES=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2B=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=3Dy<br>
+BR2_PACKAGE_ACPID=3Dy<br>
+BR2_PACKAGE_FLUTTER_ENGINE=3Dy<br>
+BR2_PACKAGE_CONNMAN=3Dy<br>
+BR2_PACKAGE_CONNMAN_WIFI=3Dy<br>
+BR2_PACKAGE_CONNMAN_CLIENT=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;512M&quot;<br>
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS=3D&quot;-O 64bit&quot;<br>
+# BR2_TARGET_ROOTFS_TAR is not set<br>
+BR2_TARGET_GRUB2=3Dy<br>
+BR2_TARGET_GRUB2_X86_64_EFI=3Dy<br>
+BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
+BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div>

--0000000000000703a70603243688--

--===============2423824152290031086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2423824152290031086==--
