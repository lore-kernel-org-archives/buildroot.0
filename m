Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAACC4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D0D409EB;
	Mon,  5 Dec 2022 20:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D0D409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18kE_T4_DghY; Mon,  5 Dec 2022 20:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAF63410AB;
	Mon,  5 Dec 2022 20:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAF63410AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2837B1BF2B3
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DE56402EB
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 20:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DE56402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 461wxTjb2EBu for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 20:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A8740104
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61A8740104
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 20:27:34 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c17so8902664edj.13
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 12:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gDJbDp9VpXPc0YVHSCubslzbmrAsItNSecaHCp+Mayo=;
 b=gie2/5RYUkdW9O1l6cP8ANzDw5Zx6rqNJB1WDyd11SN9ERH1PZBAWAwsOuFoHBLyKe
 gMxc99wd1HGB2WXSwWIrsNVZ0+1gy6vWoW3OGwzaK0zgbFF/ba9pt9QUxD/+DPbrZR7Q
 kCiD0eKM2s2rHLw7/CkNc/lCQ1pl/zxVYWy0kNz0mMVJtziDB4tm3UWMeNqkehn3HEwH
 XnHfIuegocyatR3sb4jjLYBIYNX8QpUBz+lvSHJUIhEiJW8IBnniCwuKPLXa8pEOosCK
 xugCzerTIaHiBodcI+aQokQTDWHDT5o/JCXO67FEuo2qbgC68VuPQYGTAIGYLcU00prY
 iTpA==
X-Gm-Message-State: ANoB5pnRtcmSvDmKTb5ObaVsF3m3e7lEmnXC52l55nxCzN1JhdBUoAEB
 J3NZEGbFmjkmFymcQCav8hUgl16Vn/ERvSUzPWezNg==
X-Google-Smtp-Source: AA0mqf495yQ8feiGbhWI9j9kAW4ELGTNm5gjRT97G+PpG6YAvZ0xbmpRwgLzVivdDXQK5m1H0f2eBfl7SL7LAyFLM38=
X-Received: by 2002:aa7:dd43:0:b0:467:4595:fc5c with SMTP id
 o3-20020aa7dd43000000b004674595fc5cmr73713847edw.114.1670272052142; Mon, 05
 Dec 2022 12:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20221117001511.1753592-1-gadiyar@ti.com>
 <20221117001511.1753592-4-gadiyar@ti.com>
In-Reply-To: <20221117001511.1753592-4-gadiyar@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 5 Dec 2022 21:27:20 +0100
Message-ID: <CAB0FRss+4up-N76tsrc_9=xPxe5QO1+r-2FoAj_HNoSgOi=qeA@mail.gmail.com>
To: Anand Gadiyar <gadiyar@ti.com>
Subject: Re: [Buildroot] [PATCH v6 3/3] board/ti/am64x_sk: add new board
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============6992882664649791646=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6992882664649791646==
Content-Type: multipart/alternative; boundary="00000000000058b70c05ef1a8448"

--00000000000058b70c05ef1a8448
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 17 nov. 2022 =C3=A0 01:15, Anand Gadiyar via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> From: Xuanhao Shi <x-shi@ti.com>
>
> Adds support for ti's am64x_sk board.
> Adds the configs for generating output sdcard image.
> Adds the defconfigs for am64x_sk.
>
> The AM64x_sk board is designed for the AM642 SoC with
> two ARM Cortex-A53 and four ARM Cortex-R5. It also
> supports RJ 45 Ethernet, Wi-Fi, and Bluetooth.
>
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM64
>
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Bryan Brattlof <bb@ti.com>
> ---
>  DEVELOPERS                     |  4 +++
>  board/ti/am64x_sk/genimage.cfg | 27 +++++++++++++++++++
>  board/ti/am64x_sk/readme.txt   | 49 ++++++++++++++++++++++++++++++++++
>  configs/am64x_sk_defconfig     | 46 +++++++++++++++++++++++++++++++
>  4 files changed, 126 insertions(+)
>  create mode 100644 board/ti/am64x_sk/genimage.cfg
>  create mode 100644 board/ti/am64x_sk/readme.txt
>  create mode 100644 configs/am64x_sk_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e699b6ec81..38ccec2f20 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -129,8 +129,10 @@ F: package/libxmlrpc/
>  F:     package/python-docopt/
>
>  N:     Anand Gadiyar <gadiyar@ti.com>
> +F:     board/ti/am64x_sk/
>  F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
> +F:     configs/am64x_sk_defconfig
>
>  N:     Andr=C3=A9 Zwing <nerv@dawncrow.de>
>  F:     package/libkrb5/
> @@ -3050,8 +3052,10 @@ N:       Wojciech Nizi=C5=84ski <niziak@spox.org>
>  F:     package/fwup/
>
>  N:     Xuanhao Shi <X15000177@gmail.com>
> +F:     board/ti/am64x_sk/
>  F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
> +F:     configs/am64x_sk_defconfig
>
>  N:     Yair Ben Avraham <yairba@protonmail.com>
>  F:     package/casync/
> diff --git a/board/ti/am64x_sk/genimage.cfg
> b/board/ti/am64x_sk/genimage.cfg
> new file mode 100644
> index 0000000000..26304fe98f
> --- /dev/null
> +++ b/board/ti/am64x_sk/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +       vfat {
> +               files =3D {
> +                       "tiboot3.bin",
> +                       "tispl.bin",
> +                       "u-boot.img",
> +               }
> +       }
> +
> +       size =3D 16M
> +}
> +
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot {
> +               partition-type =3D 0xC
> +               bootable =3D "true"
> +               image =3D "boot.vfat"
> +       }
> +
> +       partition rootfs {
> +               partition-type =3D 0x83
> +               image =3D "rootfs.ext4"
> +       }
> +}
> diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt
> new file mode 100644
> index 0000000000..8096fcb2d4
> --- /dev/null
> +++ b/board/ti/am64x_sk/readme.txt
> @@ -0,0 +1,49 @@
> +Texas Instuments AM64x SK Test and Development Board
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +These configurations will build a complete image and
> +device tree blobs for the the TI AM64x_sk board.
> +
> +How to build it
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Select the default configuration for the target:
> +$ make am64x_sk_defconfig
> +
> +Optional: modify the configuration:
> +$ make menuconfig
> +
> +Build:
> +$ make
> +
> +Result of the build:
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +output/images/
> ++-- soc
> ++-- ti-connectivity
> ++-- bl31.bin
> ++-- boot.vfat
> ++-- Image
> ++-- k3-am642-sk.dtb
> ++-- r5-u-boot-spl.bin
> ++-- rootfs.ext2
> ++-- rootfs.ext4
> ++-- rootfs.tar
> ++-- sdcard.img
> ++-- tee.bin
> ++-- tee-header_v2.bin
> ++-- tee-pageable_v2.bin
> ++-- tee-pager_v2.bin
> ++-- tiboot3.bin
> ++-- tispl.bin
> ++-- u-boot.img
> +
> +To copy the image file to the sdcard use dd:
> +$ dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
> +
> +Insert the SDcard into the AM64x_sk board, and power it up with
> +a USB Type-C connector. The system should come up. You can use
> +a micro-USB to connect to the connector labled MAIN_UART0 to
> +communicate with the board.
> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> new file mode 100644
> index 0000000000..f1acd49326
> --- /dev/null
> +++ b/configs/am64x_sk_defconfig
> @@ -0,0 +1,46 @@
> +BR2_aarch64=3Dy
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/ti/am64x_sk/genimage.cfg"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.0.9"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am642-sk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.7.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD=3D"lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"SPD=3Dopteed"
>
useless, SPD=3Dopteed is already added in boot/arm-trusted-firmware.mk when
aarch64


> +BR2_TARGET_OPTEE_OS=3Dy
> +BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy
>
BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY is useless (checked with
`make savedefconfig`)

Fran=C3=A7ois


> +BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> +BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> +BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> +BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D"am64x_evm_r5"
> +BR2_TARGET_UBOOT=3Dy
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2022.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"am64x_evm_a53"
> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=3Dy
> +BR2_TARGET_UBOOT_SPL=3Dy
> +BR2_TARGET_UBOOT_SPL_NAME=3D"tispl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D"TEE=3D$(BINARIES_DIR)/tee-pager_v2.b=
in"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> +BR2_PACKAGE_HOST_MTOOLS=3Dy
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000058b70c05ef1a8448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 17 nov. 2022 =C3=A0=C2=
=A001:15, Anand Gadiyar via buildroot &lt;<a href=3D"mailto:buildroot@build=
root.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Xuanhao Shi &lt;<a href=
=3D"mailto:x-shi@ti.com" target=3D"_blank">x-shi@ti.com</a>&gt;<br>
<br>
Adds support for ti&#39;s am64x_sk board.<br>
Adds the configs for generating output sdcard image.<br>
Adds the defconfigs for am64x_sk.<br>
<br>
The AM64x_sk board is designed for the AM642 SoC with<br>
two ARM Cortex-A53 and four ARM Cortex-R5. It also<br>
supports RJ 45 Ethernet, Wi-Fi, and Bluetooth.<br>
<br>
More information about the board can be found at:<br>
<a href=3D"https://www.ti.com/tool/SK-AM64" rel=3D"noreferrer" target=3D"_b=
lank">https://www.ti.com/tool/SK-AM64</a><br>
<br>
Signed-off-by: Xuanhao Shi &lt;<a href=3D"mailto:x-shi@ti.com" target=3D"_b=
lank">x-shi@ti.com</a>&gt;<br>
Signed-off-by: Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.com" target=
=3D"_blank">gadiyar@ti.com</a>&gt;<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br>
Acked-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=3D"_blank">=
afd@ti.com</a>&gt;<br>
Cc: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_b=
lank">romain.naour@gmail.com</a>&gt;<br>
Cc: Bryan Brattlof &lt;<a href=3D"mailto:bb@ti.com" target=3D"_blank">bb@ti=
.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +++<br>
=C2=A0board/ti/am64x_sk/genimage.cfg | 27 +++++++++++++++++++<br>
=C2=A0board/ti/am64x_sk/readme.txt=C2=A0 =C2=A0| 49 +++++++++++++++++++++++=
+++++++++++<br>
=C2=A0configs/am64x_sk_defconfig=C2=A0 =C2=A0 =C2=A0| 46 ++++++++++++++++++=
+++++++++++++<br>
=C2=A04 files changed, 126 insertions(+)<br>
=C2=A0create mode 100644 board/ti/am64x_sk/genimage.cfg<br>
=C2=A0create mode 100644 board/ti/am64x_sk/readme.txt<br>
=C2=A0create mode 100644 configs/am64x_sk_defconfig<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index e699b6ec81..38ccec2f20 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -129,8 +129,10 @@ F: package/libxmlrpc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-docopt/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.=
com" target=3D"_blank">gadiyar@ti.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0board/ti/am64x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+F:=C2=A0 =C2=A0 =C2=A0configs/am64x_sk_defconfig<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Andr=C3=A9 Zwing &lt;<a href=3D"mailto:nerv@daw=
ncrow.de" target=3D"_blank">nerv@dawncrow.de</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libkrb5/<br>
@@ -3050,8 +3052,10 @@ N:=C2=A0 =C2=A0 =C2=A0 =C2=A0Wojciech Nizi=C5=84ski =
&lt;<a href=3D"mailto:niziak@spox.org" target=3D"_blank">niziak@spox.org</a=
>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/fwup/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Xuanhao Shi &lt;<a href=3D"mailto:X15000177@gma=
il.com" target=3D"_blank">X15000177@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0board/ti/am64x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+F:=C2=A0 =C2=A0 =C2=A0configs/am64x_sk_defconfig<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Yair Ben Avraham &lt;<a href=3D"mailto:yairba@p=
rotonmail.com" target=3D"_blank">yairba@protonmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/casync/<br>
diff --git a/board/ti/am64x_sk/genimage.cfg b/board/ti/am64x_sk/genimage.cf=
g<br>
new file mode 100644<br>
index 0000000000..26304fe98f<br>
--- /dev/null<br>
+++ b/board/ti/am64x_sk/genimage.cfg<br>
@@ -0,0 +1,27 @@<br>
+image boot.vfat {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tiboot3.bin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tispl.bin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;u-boot.img&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
+}<br>
+<br>
+image sdcard.img {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext4&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt<br=
>
new file mode 100644<br>
index 0000000000..8096fcb2d4<br>
--- /dev/null<br>
+++ b/board/ti/am64x_sk/readme.txt<br>
@@ -0,0 +1,49 @@<br>
+Texas Instuments AM64x SK Test and Development Board<br>
+<br>
+Description<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+These configurations will build a complete image and<br>
+device tree blobs for the the TI AM64x_sk board.<br>
+<br>
+How to build it<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Select the default configuration for the target:<br>
+$ make am64x_sk_defconfig<br>
+<br>
+Optional: modify the configuration:<br>
+$ make menuconfig<br>
+<br>
+Build:<br>
+$ make<br>
+<br>
+Result of the build:<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+output/images/<br>
++-- soc<br>
++-- ti-connectivity<br>
++-- bl31.bin<br>
++-- boot.vfat<br>
++-- Image<br>
++-- k3-am642-sk.dtb<br>
++-- r5-u-boot-spl.bin<br>
++-- rootfs.ext2<br>
++-- rootfs.ext4<br>
++-- rootfs.tar<br>
++-- sdcard.img<br>
++-- tee.bin<br>
++-- tee-header_v2.bin<br>
++-- tee-pageable_v2.bin<br>
++-- tee-pager_v2.bin<br>
++-- tiboot3.bin<br>
++-- tispl.bin<br>
++-- u-boot.img<br>
+<br>
+To copy the image file to the sdcard use dd:<br>
+$ dd if=3Doutput/images/sdcard.img of=3D/dev/sdX<br>
+<br>
+Insert the SDcard into the AM64x_sk board, and power it up with<br>
+a USB Type-C connector. The system should come up. You can use<br>
+a micro-USB to connect to the connector labled MAIN_UART0 to<br>
+communicate with the board.<br>
diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig<br>
new file mode 100644<br>
index 0000000000..f1acd49326<br>
--- /dev/null<br>
+++ b/configs/am64x_sk_defconfig<br>
@@ -0,0 +1,46 @@<br>
+BR2_aarch64=3Dy<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/ti/am64x_sk/genimage.cfg&quot=
;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.0.9&quot;<br>
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;ti/k3-am642-sk&quot;<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;120M&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D&quot;v2.7.0&quot;<=
br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;k3&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD=3D&quot;lite&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D&quot;SPD=3Dopteed&=
quot;<br></blockquote><div>useless, SPD=3Dopteed is already added in boot/<=
a href=3D"http://arm-trusted-firmware.mk">arm-trusted-firmware.mk</a> when =
aarch64<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+BR2_TARGET_OPTEE_OS=3Dy<br>
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy<br></blockquote><div>BR2=
_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY is useless (checked with `make s=
avedefconfig`)</div><div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D&quot;am64x_evm_r5&quot;<br>
+BR2_TARGET_UBOOT=3Dy<br>
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2022.10&quot;<br>
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;am64x_evm_a53&quot;<br>
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy<br>
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set<br>
+BR2_TARGET_UBOOT_FORMAT_IMG=3Dy<br>
+BR2_TARGET_UBOOT_SPL=3Dy<br>
+BR2_TARGET_UBOOT_SPL_NAME=3D&quot;tispl.bin&quot;<br>
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D&quot;TEE=3D$(BINARIES_DIR)/tee-pager_v=
2.bin&quot;<br>
+BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
+BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000058b70c05ef1a8448--

--===============6992882664649791646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6992882664649791646==--
