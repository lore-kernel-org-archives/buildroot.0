From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 23:24:05 +0200
Subject: [Buildroot] [PATCH 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20180528171227.8352-1-jagan@amarulasolutions.com>
References: <20180528171227.8352-1-jagan@amarulasolutions.com>
Message-ID: <3c41758f-8915-8e55-c076-a7709e32208a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jagan,

 A few loose remarks, not a full review...

On 28-05-18 19:12, Jagan Teki wrote:
[snip]
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.itb"
> +		offset = 40K
> +		size = 1M # 1MB - 40K

 What is it, 1M or 1M - 40K?

 Anyway, I think it's better to remove size, and instead put offset in the first
real partition. I *think* genimage will complain if the image overflows over
that offset.

> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"
> +	}
[snip]
> +++ b/board/amarula/a64-relic/readme.txt
> @@ -0,0 +1,60 @@
> +Amarula A64 Relic
> +================
> +
> +Amarula A64-Relic is A64 based IoT device, which support
                                                    contains
> +- Allwinner A64 Cortex-A53
> +- Mali-400MP2 GPU
> +- AXP803 PMIC
> +- 1GB DDR3 RAM
> +- 8GB eMMC
> +- AP6330 Wifi/BLE
> +- MIPI-DSI
> +- CSI: OV5640 sensor
> +- USB OTG
> +- 12V DC power supply
> +
> +Build
> +=====
> +
> +  $ make amarula_a64_relic_defconfig
> +
> +  $ make
> +
> +build files at output/images/:
> +  - sunxi-spl.bin
> +  - u-boot.itb
> +  - Image
> +  - sun50i-a64-amarula-relic.dtb
> +  - boot.vfat
> +  - rootfs.ext2
              ext4
> +  - sdcard.img
> +
> +Write eMMC
> +=========
> +
> +Open minicom with ttyUSBx with 115200N8 and power-on board.

 You may want to start with a sentence "Connect the board with USB to the host."
And maybe even before that: "The board comes with an operating system preloaded
on the eMMC. To replace it with the Buildroot-built system, take the following
steps."

> +
> +Stay in U-Boot and write images on eMMC

 Maybe add how to stay in U-Boot: "Interrupt U-Boot by pressing enter."

> +
> +DOS:

 I guess you mean "To create an MBR partition table on the eMMC:"

> +
> +  => mmc dev 1
> +  => ums 0 mmc 1
> +
> +  host
> +  $ dd if=sdcard.img of=/dev/sdx
> +  $ sync
> +
> +GPT:
> +
> +  => mmc dev 1
> +  => gpt write mmc 1 $partitions
> +  => fastboot 0
> +
> +  host
> +  $ fastboot -i 0x1f3a flash loader1 spl/sunxi-spl.bin

 Are you sure about the spl/ part? If yes, it's wrong in the list of images above.

 Also, better specify that you have to cd to output/images first.

> +  $ fastboot -i 0x1f3a flash loader2 u-boot.itb
> +  $ fastboot -i 0x1f3a flash esp boot.vfat
> +  $ fastboot -i 0x1f3a flash system rootfs.ext2

 ext4.

> +
> +Enjoy!
> diff --git a/board/amarula/a64-relic/uboot.fragment b/board/amarula/a64-relic/uboot.fragment
> new file mode 100644
> index 0000000000..7b204598bc
> --- /dev/null
> +++ b/board/amarula/a64-relic/uboot.fragment
> @@ -0,0 +1,3 @@
> +# A64-Relic need few user-defined configs enable on top of
> +# uboot mainline default defconfig

 This comment is not very useful IMO. Especially since you're not using mainline
U-Boot, you're using the amarula fork.

 Regards,
 Arnout

> +CONFIG_CMD_USB_MASS_STORAGE=y
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
