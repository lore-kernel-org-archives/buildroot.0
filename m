From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 26 Sep 2013 13:20:40 -0700
Subject: [Buildroot] [PATCH 2/4] nitrogen6x: use
 6x_bootscript/6x_upgrade instead of older 6q_ versions
In-Reply-To: <871u4b761c.fsf@dell.be.48ers.dk>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>	<1380136072-9879-3-git-send-email-eric.nelson@boundarydevices.com>	<87r4cb7ip6.fsf@dell.be.48ers.dk>	<52444F34.1060308@boundarydevices.com>
 <871u4b761c.fsf@dell.be.48ers.dk>
Message-ID: <52449718.6090900@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 09/26/2013 12:10 PM, Peter Korsgaard wrote:
>>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:
>
> Hi Eric,
>
>   >> - Comparing 6q_upgrade and 6x_upgrade I see we used to write the raw
>   >> u-boot.bin to offset 0 in the spi flash, and now are writing
>   >> u-boot.imx (which presumably is u-boot.bin with a freescale header) to
>   >> offset 1K. I see that the .imx file is 4K bigger than the .bin
>   >> file, so that's presumably the size of the freescale header.
>   >>
>   Eric> The switch from "u-boot.bin" to "u-boot.imx" occurred when we
>   Eric> switched from using a Freescale-derived U-Boot 2009.08 to
>   Eric> main-line U-Boot sources (currently 2013.07).
>
> Ahh, I guess the confusion comes from the fact that I missed the change
> to u-boot.imx when I updated the u-boot version back in April:
>
> http://git.buildroot.net/buildroot/commit/configs/nitrogen6x_defconfig?id=184850a4239c967742
>

I'll try to post updates to the ML with each quarterly release.

The next upgrade will be 2013-10, that I hope enables USB OTG support.

>
>   Eric> Details in this post:
>   Eric> 	http://boundarydevices.com/switching-u-boot-versions-on-i-mx6/
>
>   >> I'll go and add a option for u-boot.imx to the u-boot package, but would
>   >> like to hear if 6x_upgrade is doing the right thing here.
>   >>
>   Eric> A short description of the change is that Freescale's build process
>   Eric> generated u-boot.bin with 512 bytes of padding at the beginning,
>   Eric> while main-line U-Boot generates u-boot.imx without the padding.
>
> I guess you mean 1K of padding to match the new script?
>
> hexdump -C u-boot.bin|head   /tmp/boundarydevices-u-boot-2009-08-1f7edab
> 00000000  c6 01 00 ea 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000400  d1 00 20 40 20 07 80 27  00 00 00 00 2c 04 80 27  |.. @ ..'....,..'|
> 00000410  20 04 80 27 00 04 80 27  00 00 00 00 00 00 00 00  | ..'...'........|
> 00000420  00 00 80 27 74 30 03 00  00 00 00 00 d2 02 f0 40  |...'t0.........@|
> 00000430  cc 02 ec 04 02 0e 05 a8  00 00 00 30 02 0e 05 b0  |...........0....|
> 00000440  00 00 00 30 02 0e 05 24  00 00 00 30 02 0e 05 1c  |...0...$...0....|
> 00000450  00 00 00 30 02 0e 05 18  00 00 00 30 02 0e 05 0c  |...0.......0....|
> 00000460  00 00 00 30 02 0e 05 b8  00 00 00 30 02 0e 05 c0  |...0.......0....|
>

Yep. 1k (0x400)

>
>   Eric> There are also a handful of discrepancies in the syntax for
>   Eric> various commands between the two versions, especially in the
>   Eric> areas of SPI NOR (sf probe command), which prompted us to switch
>   Eric> the name of the upgrade script (6q_upgrade == old/6x_upgrade == new)
>   Eric> when switching to main-line based code.
>
>   Eric> Note that unlike many ARM-based boards out there, our devices boot
>   Eric> to SPI-NOR, so building U-Boot is a convenience. It's not needed
>   Eric> to build an SD card image and the choice of when to upgrade should
>   Eric> largely be based on the need for features or bug fixes and not
>   Eric> tied to each userspace build.
>
> Yes, I know. My nitrogen6x board still runs the original 2009.08
> bootloader it was shipped with (which has problems using ext2 rev0
> filesystems among others), so I should probably upgrade ;)
>

Upgrading is definitely recommended.

The other notable enhancements are display support and support for SATA.

Regards,


Eric
