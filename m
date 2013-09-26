From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 26 Sep 2013 08:13:56 -0700
Subject: [Buildroot] [PATCH 2/4] nitrogen6x: use
 6x_bootscript/6x_upgrade instead of older 6q_ versions
In-Reply-To: <87r4cb7ip6.fsf@dell.be.48ers.dk>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>	<1380136072-9879-3-git-send-email-eric.nelson@boundarydevices.com>
 <87r4cb7ip6.fsf@dell.be.48ers.dk>
Message-ID: <52444F34.1060308@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 09/26/2013 07:37 AM, Peter Korsgaard wrote:
>>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:
>
> Hi Eric,
>
>   Eric> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
>
>   Eric> +++ b/board/boundarydevices/nitrogen6x/post-build.sh
>   Eric> @@ -1,18 +1,20 @@
>   Eric>  #!/bin/sh
>   Eric>  # post-build fixups
>   Eric> -# for furthe details, see
>   Eric> -# http://boundarydevices.com/u-boot-conventions-for-i-mx6-nitrogen6x-and-sabrelite/
>   Eric> +# for further details, see
>   Eric> +#
>   Eric> +#  http://boundarydevices.com/u-boot-on-i-mx6/
>   Eric> +#
>
>   Eric>  TARGET_DIR=$1
>   Eric>  IMAGES_DIR=$1/../images
>   Eric>  BOARD_DIR="$(dirname $0)"
>
>   Eric>  # bd u-boot looks for bootscript here
>   Eric> -cp $BOARD_DIR/6q_bootscript $TARGET_DIR
>   Eric> +cp $BOARD_DIR/6x_bootscript $TARGET_DIR
>
>   Eric>  # u-boot / update script for bd upgradeu command
>   Eric> -if [ -e $IMAGES_DIR/u-boot.bin ];
>   Eric> +if [ -e $IMAGES_DIR/u-boot.imx ];
>   Eric>  then
>   Eric> -    cp $IMAGES_DIR/u-boot.bin $TARGET_DIR
>   Eric> -    cp $BOARD_DIR/6q_upgrade $TARGET_DIR
>   Eric> +    cp $IMAGES_DIR/u-boot.imx $TARGET_DIR
>   Eric> +    cp $BOARD_DIR/6x_upgrade $TARGET_DIR
>
> Hmm, how is that supposed to work? I don't know the details of the imx6
> boot sequence, but:
>
> - We don't currently have an option in the u-boot package to install
>    u-boot.imx to IMAGES_DIR/, so this will never run
>
> - Comparing 6q_upgrade and 6x_upgrade I see we used to write the raw
>    u-boot.bin to offset 0 in the spi flash, and now are writing
>    u-boot.imx (which presumably is u-boot.bin with a freescale header) to
>    offset 1K. I see that the .imx file is 4K bigger than the .bin
>    file, so that's presumably the size of the freescale header.
>
The switch from "u-boot.bin" to "u-boot.imx" occurred when we
switched from using a Freescale-derived U-Boot 2009.08 to
main-line U-Boot sources (currently 2013.07).

Details in this post:
	http://boundarydevices.com/switching-u-boot-versions-on-i-mx6/

> I'll go and add a option for u-boot.imx to the u-boot package, but would
> like to hear if 6x_upgrade is doing the right thing here.
>
A short description of the change is that Freescale's build process
generated u-boot.bin with 512 bytes of padding at the beginning,
while main-line U-Boot generates u-boot.imx without the padding.

There are also a handful of discrepancies in the syntax for
various commands between the two versions, especially in the
areas of SPI NOR (sf probe command), which prompted us to switch
the name of the upgrade script (6q_upgrade == old/6x_upgrade == new)
when switching to main-line based code.

Note that unlike many ARM-based boards out there, our devices boot
to SPI-NOR, so building U-Boot is a convenience. It's not needed
to build an SD card image and the choice of when to upgrade should
largely be based on the need for features or bug fixes and not
tied to each userspace build.

The 6x_bootscript is required though, and provides the distribution-
specifics of how/where to load kernel, DTS file, ram disk, et cetera.

Regards,


Eric
