From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 22:01:41 +0200
Subject: [Buildroot] PATCH Working config for Raspberry PI 3 in aarch64
 mode
In-Reply-To: <01fe8921-f6b3-28e5-4593-7c198790e473@t-online.de>
References: <a17fc93a-ff61-1093-b28e-45043a696a83@t-online.de>
 <01fe8921-f6b3-28e5-4593-7c198790e473@t-online.de>
Message-ID: <20161027220141.5c60d98f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 21:48:51 +0200, Maik Scholz wrote:

> patch -p1 <
> ../../buildroot_aarch64/outgoing/0001-rpi3-aarch64-defconfig.patch
> make raspberrypi3_aarch64_defconfig
> make
> dd if=output/images/sdcard.img of=/dev/sdc bs=1024

Thanks for your patch, but please send your patches with "git
send-email", as explained in the Buildroot documentation. Your patch
has been badly rewrapped by your mail client, and therefore it cannot
be applied.

> 
>  From 361ad2e2087c0a4675d8222604cb20b648611e2b Mon Sep 17 00:00:00 2001
> From: Your Name <you@example.com>

Please make sure to use a real name here.

> Date: Thu, 27 Oct 2016 20:27:12 +0200
> Subject: [PATCH 1/1] -

Please include a proper commit title and commit log.

> 
> Signed-off-by: Your Name <you@example.com>

And your real name here as well.

> diff --git a/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
> b/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
> new file mode 100644
> index 0000000..4168eb4
> --- /dev/null
> +++ b/board/raspberrypi/genimage-raspberrypi3-aarch64.cfg
> @@ -0,0 +1,31 @@
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      "bcm2710-rpi-3-b.dtb",
> +      "rpi-firmware/bootcode.bin",
> +      "rpi-firmware/cmdline.txt",
> +      "rpi-firmware/config.txt",
> +      "rpi-firmware/fixup.dat",
> +      "rpi-firmware/start.elf",
> +      "rpi-firmware/overlays",
> +      "kernel8.img"
> +    }
> +  }
> +  size = 32M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext4"
> +  }
> +}

Can we re-use board/raspberrypi/genimage-raspberrypi3.cfg somehow? Or
does the kernel image absolutely needs to be called kernel8.img in the
FAT partition ?

Generally speaking, do we need to keep the 32 bit support for the
RaspberryPi 3 ?

> +rm -rf "${GENIMAGE_TMP}"
> +# copy Image to kernel8.img

This comment is useless, as it just says what the following command is
doing. Instead replace it with a comment that says *why* you are doing
this.

> +cp ${BINARIES_DIR}/Image ${BINARIES_DIR}/kernel8.img
> +
> +echo "add arm_64bit=1 in ${BINARIES_DIR}/rpi-firmware/config.txt"

Useless echo.

> +grep -v '^kernel=' output/images/rpi-firmware/config.txt | grep -v
> '^arm_64bit=' | cat > ${BINARIES_DIR}/rpi-firmware/config.txt

You're hardcoding output/images/ here, that's not good. If I understand
correctly, you are removing the kernel= and arm_64bit= lines, correct?
What is re-adding the kernel= line?

> diff --git a/configs/raspberrypi3_aarch64_defconfig
> b/configs/raspberrypi3_aarch64_defconfig
> new file mode 100644
> index 0000000..af273fe
> --- /dev/null
> +++ b/configs/raspberrypi3_aarch64_defconfig
> @@ -0,0 +1,20 @@
> +BR2_aarch64=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

Please leave it as the default, i.e don't enable C++ support.

> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index c2983aa..7b37a30 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in

The change to the rpi-firmware package should be in a separate patch.

> -RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5
> +#RPI_FIRMWARE_VERSION = ad8608c08b122b2c228dba0ff5070d6e9519faf5

Please don't keep commented code.

Could you fix the above issues and submit an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
