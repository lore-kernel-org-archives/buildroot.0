From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:34:21 +0100
Subject: [Buildroot] [PATCH] board: add support for ARC HS Development
 Kit (HSDK)
In-Reply-To: <20171207170628.2806-1-didin@synopsys.com>
References: <20171207170628.2806-1-didin@synopsys.com>
Message-ID: <20171213083421.327551f7@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Dec 2017 20:06:28 +0300, Evgeniy Didin wrote:
> Synopsys DesignWare HSDK (which stands for ARC HS
> Development Kit) is the latest and greatest development
> platform that sports quad-core ARC HS38 in real silicon.
> 
> Most noticeable features of the board are:
>  * Quad-core ARC HS38 CPU running at 1GHz
>  * 4Gb of DDR
>  * Built-in Vivante GPU (well supported via open source
>    Etnaviv drivers)
>  * Built-in Wi-Fi/Bluetooth module (RedPine RS-9113)

Nice. Do you send free boards ? :-)

>  board/synopsys/hsdk/genimage-hsdk.cfg | 26 +++++++++++++++++++++++++

genimage.cfg is enough as a name I'd say.


> +mkenvimage -s 0x4000 -o output/images/uboot.env ${BOARD_DIR}/uboot.env.txt

This can be done using BR2_TARGET_UBOOT_ENVIMAGE.

> +
> +genimage                           \
> +        --rootpath "${TARGET_DIR}"     \
> +        --tmppath "${GENIMAGE_TMP}"    \
> +        --inputpath "${BINARIES_DIR}"  \
> +        --outputpath "${BINARIES_DIR}" \
> +        --config "${GENIMAGE_CFG}"

This should instead use the generic support/scripts/genimage.sh

> +tar czf output/images/sdcard.img.tar.gz --directory="./output/images"  sdcard.img

And this is not needed.

So basically, you can remove your post-image script, and point to
support/scripts/genimage.sh directly.

Finally, add an entry in the DEVELOPERS file, and update
the .gitlab-ci.yml file by running "make .gitlab-ci.yml" and committing
the result.

Other than that, looks good to me!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
