From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Jan 2013 17:05:21 +0100
Subject: [Buildroot] [PATCH v2] configs: add RaspberryPi defconfig
In-Reply-To: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20130111170521.44d1bdb0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Fri, 11 Jan 2013 14:17:30 +0100, Maxime Hadjinlian wrote:
> --- /dev/null
> +++ b/board/raspberrypi/README.txt
> @@ -0,0 +1,35 @@
> +## RaspberryPi
> +
> +When you use the rpi_defconfig to build a rootfs for your RaspberryPi, a few
> +items are created in output/images :

It does not build only a rootfs, so:

When you use the rpi_defconfig to build an embedded Linux system for
your Rasberry Pi, the following elements will be generated in
output/images:

> +	output/images/
> +	??? rootfs.tar
> +	??? rpi-firmware
> +	??? ??? bootcode.bin
> +	??? ??? config.txt
> +	??? ??? fixup_cd.dat
> +	??? ??? fixup.dat
> +	??? ??? start_cd.elf
> +	??? ??? start.elf
> +	??? zImage
> +
> +In order to have a working SDCard, you should have at least two partitions :
> +
> +    - First partition :
> +	This will be the boot partition (It must be formated in fat32 and have
> +        bootable flags).
> +	It should contains the *content* of output/images/rpi-firmware/.
> +        It will also contain the kernel binary.
> +        For the kernel to be found, you have two choices :
> +	    1 - Rename zImage to kernel.img since it's the default kernel file
> +                name here.
> +            2 - Add 'kernel=zImage' to config.txt (without the quotes).
> +
> +    - Second partition :
> +        This will contains the rootfs and should be formated in ext4.
> +	If you chose another filesystem, you should modify the cmdline in
> +        config.txt.
> +        Then simply extract rootfs.tar to this partition.

The indentation is really strange here. What about something like:

==
In order to boot your Rasberry Pi, you'll need to prepare your SD card
with at least two partitions:

 * The first partition is the boot partition.

   It should be FAT32-formatted and have the bootable flags.

   It should contain the contents of the output/images/rpi-firmware/
   directory: it contains bootloaders and the kernel image for the
   Rasberry Pi.

 * The second partition is the root filesystem partition.

   It should be ext4 formatted (if you choose another filesystem,
   remember to adjust the kernel command line in the config.txt file).

   Simply extract (as root!) the contents of the rootfs.tar archive
   into this partition.
==

I removed the discussion about kernel=zImage, because I think it should
be the default in our rpi-firmware package.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
