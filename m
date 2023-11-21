Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E8EC61D90
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 21:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A29D811FF;
	Tue, 21 Nov 2023 21:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A29D811FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxN1TSV-_3Bq; Tue, 21 Nov 2023 21:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA34E813E3;
	Tue, 21 Nov 2023 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA34E813E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62C2D1BF3F6
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 21:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A55D60F1D
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 21:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A55D60F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n14dB-x3K30d for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 21:41:32 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63AC960B88
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 21:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63AC960B88
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40839807e82so1239425e9.0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 13:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700602889; x=1701207689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AwhUtEpB9VZoCh2T43a8NZcjreHdL5bU9p+s9LAqswY=;
 b=SZrf/2gQq9flk7D/MSPIT7RyYlwtBaDsynlvlXiE6paeYt2NbVSIJ2tkAlxbRZG+Zl
 RuEmIDYrQXRTWUZlkDJd/KG3YxTvHlOojhClULXiGuZGd4kLdkgiNYtSIQ0iSa9Pxtd0
 A8jmWLrN/F4re6PJ5NP1MD0yiC8BX7/sOJN0ZdP5nx02txfODypCPpTgxci5jAUWkFxp
 a8QaKNkrhuHx1usRwiJS9CGkKgdEGamwl7pBMdl0W18ghaQ3F8bTbrxqOGj3jz3acwUs
 iJ5O1k/5w4OOxaxe+3ZH07mddsqsuQNGzjRxb2xIArIFzL1VdMt1/IA+fbnD3bqZWEYC
 tk6A==
X-Gm-Message-State: AOJu0YxvwABvvkCixqyOPP+J6Lo8Il9xmOB7ELzY5tyv/DJVH92AESbq
 3jfJ/40FxiOSeAi+58CF2tEPSQ==
X-Google-Smtp-Source: AGHT+IFfjOj+xKK+8ipie82NLO45EISZW+0WiRPlgBl8/Fy3djWf9CPRtGPvWeb9XYSGgj9g3qvlxw==
X-Received: by 2002:a05:600c:5101:b0:403:c70b:b688 with SMTP id
 o1-20020a05600c510100b00403c70bb688mr528879wms.6.1700602888911; 
 Tue, 21 Nov 2023 13:41:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a05600c4a9300b003fc16ee2864sm17761551wmp.48.2023.11.21.13.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 13:41:28 -0800 (PST)
Message-ID: <6f2a8850-7610-4e6b-bc50-43394f6c2eeb@mind.be>
Date: Tue, 21 Nov 2023 22:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Hanyuan Zhao <hanyuan-z@qq.com>, buildroot@buildroot.org
References: <tencent_3E8054E385AF0DCBE94DC17FAD12060E6707@qq.com>
In-Reply-To: <tencent_3E8054E385AF0DCBE94DC17FAD12060E6707@qq.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1700602889; x=1701207689; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwhUtEpB9VZoCh2T43a8NZcjreHdL5bU9p+s9LAqswY=;
 b=BRLRxKrIs9JW061kZYEAmiKjVqKEDcFvLqVjk7btTzelMpQ8ApMSff6kurHjEu/a8t
 vIubR1OsmJxES/xoZMxZnnJcmhVqoyMuMpTqSmVm1inDzWJqKfy9LbKN8rvkT910t5gZ
 j4K8EjCiHgGfeLUdexhWGDJj7QCSqdc3Vzb+SZ8MMaq9GrDV1qx3ZFXlwyqX1s3tKB3z
 +1jY6FDGOsWxC4XRfwb/D2Iuz/YSkME173dbF8CJrgnX3cqehpkx4gBK/onjeM5TBV90
 u3U94NsRJ52ynCH+XORiaKVw810BKuZcG9fZxaLI587SrBdKqZHcieQL4DFnR+T82GQ7
 EQ/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BRLRxKrI
Subject: Re: [Buildroot] [PATCH 1/2] configs/milkv_duo: new defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Hanyuan,

  Thank you for your patch. Please find below a quick, incomplete review.

On 20/11/2023 16:20, Hanyuan Zhao via buildroot wrote:
> Milk-V Duo is an ultra-compact embedded development platform based on the CV1800B chip.
> It can run Linux and RTOS, providing a reliable, low-cost, and high-performance platform
> for professionals, industrial ODMs, AIoT enthusiasts, DIY hobbyists, and creators.
> 
> Co-authored-by: Emil S <emil.soltys@outlook.com>
> Co-authored-by: GP Orcullo <kinsamanka@gmail.com>
> Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>
> ---
>   board/milkv/duo/README.md                     |  64 +++++
>   board/milkv/duo/genimage.cfg                  |  30 ++
>   board/milkv/duo/overlay/etc/dnsmasq.conf      |   4 +
>   board/milkv/duo/overlay/etc/init.d/S05runonce |  32 +++
>   board/milkv/duo/overlay/etc/init.d/S10hwinit  |  44 +++
>   board/milkv/duo/overlay/etc/init.d/S15swap    |  25 ++
>   board/milkv/duo/overlay/etc/init.d/S99user    |  27 ++
>   board/milkv/duo/overlay/etc/milkv-duo.conf    |  56 ++++
>   board/milkv/duo/overlay/etc/profile           |  36 +++
>   .../duo/overlay/etc/runonce.d/01make-swap     |   6 +
>   .../overlay/etc/runonce.d/05store-eth0-mac    |  12 +
>   .../duo/overlay/etc/runonce.d/ran/.gitkeep    |   0
>   .../milkv/duo/overlay/opt/milkv-duo/blink.sh  |  25 ++
>   .../duo/overlay/opt/milkv-duo/duo-init.sh     |   8 +
>   .../duo/overlay/opt/milkv-duo/run_usb.sh      | 265 ++++++++++++++++++
>   .../milkv/duo/overlay/opt/milkv-duo/uhubon.sh |  63 +++++
>   .../duo/overlay/opt/milkv-duo/usb-host.sh     |   3 +
>   .../overlay/opt/milkv-duo/usb-mass-storage.sh |  10 +
>   .../duo/overlay/opt/milkv-duo/usb-rndis.sh    |  14 +
>   ...ensbi-porting-adapt-to-CV180X-CV181X.patch |  44 +++
>   ...csr-zifencei-and-kill-compile-errors.patch |  59 ++++
>   ...ize-the-value-of-a-variable-in-stack.patch |  26 ++
>   board/milkv/duo/post-image.sh                 |  52 ++++

  Buildroot defconfigs should be _minimal_, i.e. just enough to boot the device 
and perhaps get a (wired) network connection. Looking at all those files, 
clearly these defconfigs are _not_ minimal. I think pretty much everything in 
the overlay can be removed.

>   configs/milkv_duo_musl_riscv64_64mb_defconfig |  94 +++++++
>   configs/milkv_duo_musl_riscv64_defconfig      |  93 ++++++
>   25 files changed, 1092 insertions(+)
>   create mode 100644 board/milkv/duo/README.md
>   create mode 100644 board/milkv/duo/genimage.cfg
>   create mode 100644 board/milkv/duo/overlay/etc/dnsmasq.conf
>   create mode 100755 board/milkv/duo/overlay/etc/init.d/S05runonce
>   create mode 100755 board/milkv/duo/overlay/etc/init.d/S10hwinit
>   create mode 100755 board/milkv/duo/overlay/etc/init.d/S15swap
>   create mode 100755 board/milkv/duo/overlay/etc/init.d/S99user
>   create mode 100644 board/milkv/duo/overlay/etc/milkv-duo.conf
>   create mode 100644 board/milkv/duo/overlay/etc/profile
>   create mode 100755 board/milkv/duo/overlay/etc/runonce.d/01make-swap
>   create mode 100755 board/milkv/duo/overlay/etc/runonce.d/05store-eth0-mac
>   create mode 100644 board/milkv/duo/overlay/etc/runonce.d/ran/.gitkeep
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/blink.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/run_usb.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-host.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-mass-storage.sh
>   create mode 100755 board/milkv/duo/overlay/opt/milkv-duo/usb-rndis.sh
>   create mode 100644 board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
>   create mode 100644 board/milkv/duo/patches/opensbi/0002-fix-set-zicsr-zifencei-and-kill-compile-errors.patch
>   create mode 100644 board/milkv/duo/patches/opensbi/0003-fix-initialize-the-value-of-a-variable-in-stack.patch
>   create mode 100755 board/milkv/duo/post-image.sh
>   create mode 100644 configs/milkv_duo_musl_riscv64_64mb_defconfig
>   create mode 100644 configs/milkv_duo_musl_riscv64_defconfig
> 
> diff --git a/board/milkv/duo/README.md b/board/milkv/duo/README.md
> new file mode 100644
> index 0000000000..f302d24de9
> --- /dev/null
> +++ b/board/milkv/duo/README.md

  The readme should be called readme.txt (and not be in markdown).

> @@ -0,0 +1,64 @@
> +
> +## Milk-V Duo Introduction
> +
> +Milk-V Duo is an ultra-compact embedded development platform based on the rv64 CV1800B chip.
> +
> +It can run Linux and RTOS, providing a reliable, cost-effective, and high-performance platform for professionals, industrial ODMs, AIoT enthusiasts, DIY enthusiasts, and creators.

  Please wrap text at 80 columns.

> +
> +Features:
> +
> +- [x] The RISC-V C906 processor with clock speeds of 1GHz and 700MHz.
> +- [x] CSI-2 (MIPI Serial Camera Interface)
> +- [x] Ethernet PHY
> +- [x] USB RNDIS & USB HOST & USB Mass Storage
> +- [x] Multiple peripherals
> +	- [x] -   Up to 3x I2C
> +	- [x] -   Up to 5x UART
> +	- [x] -   Up to 1x SDIO1
> +	- [x] -   Up to 1x SPI
> +	- [x] -   Up to 2x ADC
> +	- [x] -   Up to 7x PWM
> +	- [x] -   Up to 1x RUN
> +	- [x] -   Up to 1x JTAG
> +
> +## How to build
> +
> +```shell
> +$  make milkv_duo_musl_riscv64_defconfig
> +$  make
> +```
> +
> +By default, a portion of the RAM is allocated to ION, which is the memory used when running algorithms with the camera. If you are not using the camera, please try:
> +
> +```shell
> +$  make milkv_duo_musl_riscv64_64mb_defconfig
> +$  make
> +```
> +
> +To have all the 64mb free memory.
> +
> +
> +To configure the kernel or u-boot or others, please try:
> +
> +```shell
> +$  make linux-menuconfig # act like kernel's make menuconfig
> +$  make linux-rebuild
> +```
> +
> +## Usage of the sdcard.img
> +
> +The `sdcard.img` is in `output/images`, you can directly write the image into your TF card, which could automatically boot and load the USB as rndis function by default.

  Wow, I had to consult wikipedia to find out about a TF card! I never heard a 
microSD card being called a TF card before. I think the same goes for most 
people, so please use microSD or uSD or just SD card.


> +
> +## Usage of the rootfs
> +
> +Find the `rootfs.tar.xz` in `output/images`, mount the `mmcblk0p2` part to a directory. Then:
> +
> +```shell
> +$ cd path/to/mmcblk0p2
> +$ rm -rf *
> +$ sync
> +
> +$ tar -xf rootfs.tar.xz --directory=path/to/mmcblk0p2

  I didn't understand this... Is the idea to avoid rewriting the entire SD card? 
Doesn't seem very useful to me, the SD card image is pretty small so it should 
flash fast, especially with `dd conv=sparse`.


> +$ cd path/to/mmcblk0p2
> +$ sync
> +```
> diff --git a/board/milkv/duo/genimage.cfg b/board/milkv/duo/genimage.cfg
> new file mode 100644
> index 0000000000..ed19e4fd3d
> --- /dev/null
> +++ b/board/milkv/duo/genimage.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"fip.bin",
> +			"boot.sd",
> +		}
> +	}
> +	size = 64M

  64M? Really? Shouldn't a few MB be sufficient?

> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +
> +	partition empty {
> +		partition-type = 0x82
> +		size = 256M
> +	}

  Drop this partition, there is no need for it (see also below).

> +}
> \ No newline at end of file

  Make sure there's a newline at the end of each file.

[snip]
> diff --git a/board/milkv/duo/overlay/etc/init.d/S10hwinit b/board/milkv/duo/overlay/etc/init.d/S10hwinit
> new file mode 100755
> index 0000000000..ef7dc0f8c4
> --- /dev/null
> +++ b/board/milkv/duo/overlay/etc/init.d/S10hwinit
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +
> +#
> +# Initialize hardware
> +#
> +export SYSTEMPATH=/opt/milkv-duo/

  We don't use /opt in upstream buildroot, /opt is for local stuff.

> +CONFIG=/etc/milkv-duo.conf
> +source ${CONFIG}
> +
> +case "$1" in
> +  start)
> +
> +        if [ -f $SYSTEMPATH/duo-init.sh ]; then
> +                . $SYSTEMPATH/duo-init.sh &
> +        fi
> +
> +        if [ ! -z $ETH0_MAC_ADDR ]; then
> +                ifconfig eth0 hw ether ${ETH0_MAC_ADDR}

  Nice trick to save the random MAC address that is generated on first boot, but 
we don't include such things in the minimal defconfig, especially if it's not 
board specific.

> +        fi
> +
> +        if [ "$DUO_USB_FUNC" == "RNDIS" ]; then
> +                if [ -f $SYSTEMPATH/usb-rndis.sh ]; then
> +                        . $SYSTEMPATH/usb-rndis.sh &
> +                fi
> +        elif [ "$DUO_USB_FUNC" == "HOST" ]; then
> +                if [ -f $SYSTEMPATH/usb-host.sh ]; then
> +                        . $SYSTEMPATH/usb-host.sh &
> +                fi
> +        elif [ "$DUO_USB_FUNC" == "MASS-STORAGE" ]; then
> +                if [ -f $SYSTEMPATH/usb-mass-storage.sh ]; then
> +                        . $SYSTEMPATH/usb-mass-storage.sh &
> +                fi

  This USB stuff is also not board-specific, is just generic USB gadget 
configuration. It might make sense to create a Buildroot package with those 
scripts though.

> +        fi
> +        ;;
> +  stop)
> +        ;;
> +  restart|reload)
> +        ;;
> +  *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +esac
> +
> +exit $?
> diff --git a/board/milkv/duo/overlay/etc/init.d/S15swap b/board/milkv/duo/overlay/etc/init.d/S15swap
> new file mode 100755
> index 0000000000..6b5ef76326
> --- /dev/null
> +++ b/board/milkv/duo/overlay/etc/init.d/S15swap
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +#
> +# Activate swap, depending on option
> +#
> +CONFIG=/etc/milkv-duo.conf
> +source ${CONFIG}
> +
> +case "$1" in
> +  start)
> +
> +        if [ "$ENABLE_SWAP" == "1" ]; then
> +        swapon /dev/mmcblk0p3

  I would be very surprised if swap is actually useful, and for sure we don't 
want it in a defconfig.

  Also, it's probably better to manage swap in fstab.

> +        fi
> +        ;;
> +  stop)
> +        ;;
> +  restart|reload)
> +        ;;
> +  *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +esac
> +
> +exit $?
> diff --git a/board/milkv/duo/overlay/etc/init.d/S99user b/board/milkv/duo/overlay/etc/init.d/S99user
> new file mode 100755
> index 0000000000..3abd073738
> --- /dev/null
> +++ b/board/milkv/duo/overlay/etc/init.d/S99user
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +${CVI_SHOPTS}
> +
> +#
> +# Start firmware
> +#
> +export SYSTEMPATH=/opt/milkv-duo/
> +
> +case "$1" in
> +  start)
> +
> +        echo "Starting app..."
> +
> +        if [ -f $SYSTEMPATH/blink.sh ]; then
> +                . $SYSTEMPATH/blink.sh &

  This "app" also doesn't seem very board-specific (except for the specific GPIO 
that corresponds to a LED).

  Also, it's a completely useless app. Blinking a LED in Linux is doen with the 
LED Timer Trigger.

[snip]
> diff --git a/board/milkv/duo/overlay/opt/milkv-duo/blink.sh b/board/milkv/duo/overlay/opt/milkv-duo/blink.sh
> new file mode 100755
> index 0000000000..3d14977cc9
> --- /dev/null
> +++ b/board/milkv/duo/overlay/opt/milkv-duo/blink.sh
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +
> +CONFIG=/etc/milkv-duo.conf
> +source ${CONFIG}
> +
> +if test -d ${LED_PATH}; then
> +    echo "GPIO${LED_GPIO} already exported"
> +else
> +    ${DUO_WRITE} ${LED_GPIO} >/sys/class/gpio/export

  If the GPIO is wired to a LED, it should be specified as such in the device 
tree (and bound to the leds_gpio driver).

> +fi
> +
> +${DUO_WRITE} out >${LED_PATH}/direction
> +
> +while true; do
> +    source ${CONFIG}
> +    if [ "$ENABLE_BLINK" == "1" ]; then
> +        ${DUO_WRITE} 0 >${LED_PATH}/value
> +        sleep 0.5
> +        ${DUO_WRITE} 1 >${LED_PATH}/value
> +        sleep 0.5
> +    else
> +        ${DUO_WRITE} 0 >${LED_PATH}/value
> +        sleep 2
> +    fi
> +done
> diff --git a/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh b/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
> new file mode 100755
> index 0000000000..298e43bc8d
> --- /dev/null
> +++ b/board/milkv/duo/overlay/opt/milkv-duo/duo-init.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +# Set Pin-29(PWR_SEQ2) to GPIO
> +devmem 0x0502707c 32 0x111
> +devmem 0x03001068 32 0x3
> +
> +# Set Pin-19(SD0_PWR_EN) to GPIO
> +devmem 0x0300101c 32 0x3

  I have no idea what this is supposed to do, but shouldn't it have a proper 
Linux driver instead devmem?

[snip]
> diff --git a/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh b/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh
> new file mode 100755
> index 0000000000..8a06949e3f
> --- /dev/null
> +++ b/board/milkv/duo/overlay/opt/milkv-duo/uhubon.sh

  This script _is_ board specific, so it does make sense to have it in the 
overlay! However, it should be in /usr/bin, not in /opt.

  This script should definitely be mentioned in the readme. Normally, 
host/device mode is selected automatically with the ID pin, so if this is not 
the case on this board it's probably better to explain it.

> @@ -0,0 +1,63 @@
> +CONFIG=/etc/milkv-duo.conf
> +source ${CONFIG}
> +
> +hub_on() {
> +  echo "turn on usb hub"
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBPORT_EN ]; then
> +      ${DUO_WRITE} $GPIO_HUBPORT_EN >/sys/class/gpio/export
> +  fi
> +
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_ROLESEL ]; then
> +      ${DUO_WRITE} $GPIO_ROLESEL >/sys/class/gpio/export
> +  fi
> +
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBRST ]; then
> +      ${DUO_WRITE} $GPIO_HUBRST >/sys/class/gpio/export
> +  fi
> +
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/direction
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_ROLESEL/direction
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBRST/direction

  Please don't use the deprecated sysfs access for GPIOs, instead use gpioset 
and friends from libgpiod.

> +
> +  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/value
> +  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_ROLESEL/value
> +  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_HUBRST/value
> +}
> +
> +hub_off() {
> +  echo "turn off usb hub"
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBPORT_EN ]; then
> +      ${DUO_WRITE} $GPIO_HUBPORT_EN >/sys/class/gpio/export
> +  fi
> +
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_ROLESEL ]; then
> +      ${DUO_WRITE} $GPIO_ROLESEL >/sys/class/gpio/export
> +  fi
> +
> +  if [ ! -d $SYS_GPIO/gpio$GPIO_HUBRST ]; then
> +      ${DUO_WRITE} $GPIO_HUBRST >/sys/class/gpio/export
> +  fi
> +
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/direction
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_ROLESEL/direction
> +  ${DUO_WRITE} "out" >/sys/class/gpio/gpio$GPIO_HUBRST/direction
> +
> +  ${DUO_WRITE} 0 >/sys/class/gpio/gpio$GPIO_HUBPORT_EN/value
> +  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_ROLESEL/value
> +  ${DUO_WRITE} 1 >/sys/class/gpio/gpio$GPIO_HUBRST/value
> +}
> +
> +case "$1" in
> +  host)
> +	insmod /mnt/system/ko/dwc2.ko

  This is weird... Modules should be in /lib/modules. Also, the module should 
have been loaded automatically.

> +  ${DUO_WRITE} host > /proc/cviusb/otg_role
> +	;;
> +  device)
> +	${DUO_WRITE} device > /proc/cviusb/otg_role
> +	;;
> +  *)
> +	echo "Usage: $0 host"
> +	echo "Usage: $0 device"
> +	exit 1
> +esac
> +exit $?
[snip]
> diff --git a/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch b/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
> new file mode 100644
> index 0000000000..cd784948be
> --- /dev/null
> +++ b/board/milkv/duo/patches/opensbi/0001-opensbi-porting-adapt-to-CV180X-CV181X.patch
> @@ -0,0 +1,44 @@
> +From 2e8190643f1abdfcf6c8b5981b6d6863dea78a08 Mon Sep 17 00:00:00 2001
> +From: "sam.xiang" <sam.xiang@sophgo.com>
> +Date: Tue, 21 Feb 2023 20:43:18 +0800
> +Subject: [PATCH 1/3] [opensbi] porting: adapt to CV180X / CV181X

  There should not be a 1/3 in the subject line. Run 'make check-package' to 
detect such issues.

> +
> +Change-Id: Id7b3c64d203eb2c9af6c66f195bf0d8a05f0164c
> +Signed-off-by: Hanyuan Zhao <hanyuan-z@qq.com>

  There's also an Upstream: link missing.

> +---
> + lib/utils/serial/fdt_serial_uart8250.c | 1 +
> + platform/generic/config.mk             | 3 ++-
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> + mode change 100644 => 100755 lib/utils/serial/fdt_serial_uart8250.c

[snip]
> diff --git a/board/milkv/duo/post-image.sh b/board/milkv/duo/post-image.sh
> new file mode 100755
> index 0000000000..bebd76a4ad
> --- /dev/null
> +++ b/board/milkv/duo/post-image.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +
> +###########################################################
> +# File: post-image.sh
> +# Author: GP Orcullo <kinsamanka@gmail.com>
> +# Description: this sh will make the fip.bin and boot.sd,
> +#              then pack everything to an image file.
> +###########################################################
> +if grep -Eq "^BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y$" ${BR2_CONFIG}; then
> +    if grep -Eq "^BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y$" ${BR2_CONFIG}; then

  Both conditions are set in both defconfigs, so there probably isn't a need to 
check for them.

> +        ${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \

  Please use tab for indentation in shell scripts. It's not yet done 
consistently, but we're trying to go in that direction.

> +        --MONITOR_RUNADDR=0x80000000 \
> +        --CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
> +        --NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
> +        --NAND_INFO=00000000 \
> +        --BL2=${BINARIES_DIR}/bl2.bin \
> +        --BLCP_IMG_RUNADDR=0x05200200 \
> +        --BLCP_PARAM_LOADADDR=0 \
> +        --DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
> +        --MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
> +        --LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
> +        --BLCP=${BINARIES_DIR}/empty.bin \
> +        --BLCP_2ND=${BINARIES_DIR}/cvirtos.bin \

  Actually, I think it's better to check for the existence of this file to 
decide whether or not to include the smallcore image.

> +        --BLCP_2ND_RUNADDR=0x83f40000 \
> +        > ${BINARIES_DIR}/fip.log 2>&1
> +        echo "[Duo Post-Image fiptool.py] FreeRTOS integrated"
> +    else
> +        ${BINARIES_DIR}/fiptool.py genfip ${BINARIES_DIR}/fip.bin \
> +        --MONITOR_RUNADDR=0x80000000 \
> +        --CHIP_CONF=${BINARIES_DIR}/chip_conf.bin \
> +        --NOR_INFO=FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF \
> +        --NAND_INFO=00000000 \
> +        --BL2=${BINARIES_DIR}/bl2.bin \
> +        --BLCP_IMG_RUNADDR=0x05200200 \
> +        --BLCP_PARAM_LOADADDR=0 \
> +        --DDR_PARAM=${BINARIES_DIR}/ddr_param.bin \
> +        --MONITOR=${BINARIES_DIR}/fw_dynamic.bin \
> +        --LOADER_2ND=${BINARIES_DIR}/u-boot.bin \
> +        > ${BINARIES_DIR}/fip.log 2>&1
> +        echo "[Duo Post-Image fiptool.py] No FreeRTOS integrated"
> +    fi
> +
> +    cp ${BINARIES_DIR}/u-boot.dtb ${BINARIES_DIR}/cv1800b_milkv_duo_sd.dtb
> +    lzma -fk ${BINARIES_DIR}/Image
> +    mkimage -f ${BINARIES_DIR}/multi.its ${BINARIES_DIR}/boot.sd
> +    echo "[Duo Post-Image] > boot.sd generated!"
> +    support/scripts/genimage.sh -c $(pwd)/board/milkv/duo/genimage.cfg
> +    gzip -fk ${BINARIES_DIR}/sdcard.img
> +    echo "[Duo Post-Image] > sdcard.img generated!"
> +else
> +    echo "[Duo Post-Image] Not requested to generate the boot files and sdcard.img"
> +fi
> \ No newline at end of file
> diff --git a/configs/milkv_duo_musl_riscv64_64mb_defconfig b/configs/milkv_duo_musl_riscv64_64mb_defconfig
> new file mode 100644
> index 0000000000..e97677d891
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_64mb_defconfig
> @@ -0,0 +1,94 @@
> +BR2_riscv=y
> +BR2_riscv_g=y
> +BR2_RISCV_ISA_RVC=y

  Please put comments in the defconfig, like in e.g. configs/canaan_kd233_defconfig

> +BR2_TOOLCHAIN_BUILDROOT_MUSL=y

  Does it really have to be musl? Our defconfigs normally use uClibc.

> +BR2_KERNEL_HEADERS_5_10=y

  Please use the default BR2_KERNEL_HEADERS_AS_KERNEL.

> +BR2_GCC_VERSION_13_X=y

  Please use the default GCC version; if that is not appropriate, add a comment why.

> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_TARGET_LDFLAGS="-march=rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync"

  Wow, this definitely needs some explanation!

  Oh, hang on, it's using that non-standard T-Head CPU, that explains it... And 
it also explains why you need GCC 13. I'm surprised though that it's sufficient 
to put it in LDFLAGS, don't you need it for compilation as well?

  I actually think we probably should have a riscv subarchitecture option for 
the T-Head, since there will be multiple boards using that SoC (including the 
BeagleV-Ahead).

> +BR2_GLOBAL_PATCH_DIR="board/milkv/duo/patches"
> +BR2_TARGET_GENERIC_HOSTNAME="milkv-duo"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Milk-V"
> +BR2_TARGET_GENERIC_ROOT_PASSWD="milkv"
> +BR2_ROOTFS_OVERLAY="board/milkv/duo/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/milkv/duo/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="duo-linux-5.10.4"
> +BR2_LINUX_KERNEL_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_LINUX_KERNEL_LZMA=y
> +BR2_PACKAGE_BZIP2=y
> +BR2_PACKAGE_GZIP=y
> +BR2_PACKAGE_LZIP=y
> +BR2_PACKAGE_UNZIP=y
> +BR2_PACKAGE_ZIP=y
> +BR2_PACKAGE_GDB=y
> +BR2_PACKAGE_GDB_DEBUGGER=y
> +BR2_PACKAGE_SPIDEV_TEST=y
> +BR2_PACKAGE_STRACE=y
> +BR2_PACKAGE_BINUTILS=y
> +BR2_PACKAGE_GREP=y
> +BR2_PACKAGE_MAKE=y
> +BR2_PACKAGE_PATCH=y
> +BR2_PACKAGE_TREE=y
> +BR2_PACKAGE_DOSFSTOOLS=y
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y

  None of the packages above should be needed for a minimal bootable system.

> +BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL=y
> +BR2_PACKAGE_MILKV_DUO_FIRMWARE_FSBL_64MB=y
> +BR2_PACKAGE_MILKV_DUO_SMALLCORE_FREERTOS=y

  These are only added in patch 2/2, so the two patches should be swapped - the 
other one should come first. (But the other one should actually be split into 
three as well, one per package.)

  Although this firmware is probably not strictly needed for booting, I do think 
it's a good idea to include it, so you have a complete system. The readme.txt 
should point to some documentation of that FreeRTOS image however.

> +BR2_PACKAGE_MILKV_DUO_PINMUX=y
> +BR2_PACKAGE_EVTEST=y
> +BR2_PACKAGE_PYTHON3=y
> +BR2_PACKAGE_PYTHON_EVDEV=y
> +BR2_PACKAGE_PYTHON_LXML=y
> +BR2_PACKAGE_PYTHON_MODBUS_TK=y
> +BR2_PACKAGE_PYTHON_PILLOW=y
> +BR2_PACKAGE_PYTHON_PIP=y
> +BR2_PACKAGE_PYTHON_SMBUS_CFFI=y
> +BR2_PACKAGE_PYTHON_SPIDEV=y
> +BR2_PACKAGE_FREETYPE=y
> +BR2_PACKAGE_JSON_C=y
> +BR2_PACKAGE_DHCPCD=y
> +BR2_PACKAGE_DNSMASQ=y
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_LRZSZ=y
> +BR2_PACKAGE_NTP=y
> +BR2_PACKAGE_NTP_NTPDATE=y
> +BR2_PACKAGE_NTP_NTPTIME=y
> +BR2_PACKAGE_WPA_SUPPLICANT=y
> +BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
> +BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
> +BR2_PACKAGE_NEOFETCH=y
> +BR2_PACKAGE_TMUX=y
> +BR2_PACKAGE_WHICH=y
> +BR2_PACKAGE_HTOP=y
> +BR2_PACKAGE_KMOD=y
> +BR2_PACKAGE_NANO=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"

  If you don't include all those packages, the default 60M should be sufficient.

> +BR2_TARGET_ROOTFS_TAR_XZ=y

  Normally there should not be a reason to have the tarball at all.

> +BR2_TARGET_OPENSBI=y
> +BR2_TARGET_OPENSBI_CUSTOM_GIT=y
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/T-head-Semi/opensbi.git"
> +BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="4e77060e0512ad981eee55d5a2501f6d88a41fd9"
> +BR2_TARGET_OPENSBI_PLAT="generic"
> +BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
> +BR2_TARGET_OPENSBI_FW_FDT_PATH=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/milkv-duo/milkv-duo-u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2021.10_64mb"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="cvitek_cv1800b_milkv_duo_sd"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
> +BR2_PACKAGE_HOST_CMAKE=y

  There normally shouldn't be any reason to set this option.

> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_LZMA_ALONE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
> diff --git a/configs/milkv_duo_musl_riscv64_defconfig b/configs/milkv_duo_musl_riscv64_defconfig
> new file mode 100644
> index 0000000000..bd79f138f6
> --- /dev/null
> +++ b/configs/milkv_duo_musl_riscv64_defconfig

  I'm not sure if we want both defconfigs. I think it's sufficient to put in the 
readme.txt that if you want to use ION/camera, that U-Boot should switch to the 
other defconfig.


  Regards,
  Arnout


[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
