From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Mon, 4 Apr 2016 08:20:37 +0200
Subject: [Buildroot] [PATCH 1/3] configs: atmel: add sama5d2 xplained sd
 card image generation
In-Reply-To: <20160402173525.08870304@free-electrons.com>
References: <1459497706-1663-1-git-send-email-ludovic.desroches@atmel.com>
 <20160402173525.08870304@free-electrons.com>
Message-ID: <20160404062037.GG14018@odux.rfo.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 02, 2016 at 05:35:25PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 1 Apr 2016 10:01:44 +0200, Ludovic Desroches wrote:
> > Use genimage to generate a sd card with a fat partition (at91bootstrap,
> > u-boot, kernel, dtbs) and an ext4 partition (rootfs).
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Thanks for working on this!
> 
> 
> > diff --git a/board/atmel/sama5d2_xplained_mmc/post-image.sh b/board/atmel/sama5d2_xplained_mmc/post-image.sh
> > new file mode 100755
> > index 0000000..c82b189
> > --- /dev/null
> > +++ b/board/atmel/sama5d2_xplained_mmc/post-image.sh
> > @@ -0,0 +1,16 @@
> > +#!/bin/sh
> > +
> > +BOARD_DIR="$(dirname $0)"
> > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
> > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> > +
> > +rm -rf "${GENIMAGE_TMP}"
> > +
> > +genimage                               \
> > +	--rootpath "${TARGET_DIR}"     \
> > +	--tmppath "${GENIMAGE_TMP}"    \
> > +	--inputpath "${BINARIES_DIR}"  \
> > +	--outputpath "${BINARIES_DIR}" \
> > +	--config "${GENIMAGE_CFG}"
> > +
> > +exit $?
> 
> This last line is not needed.
> 

Ok.

> We really need at some point to provide a generic mechanism for
> genimage, because this script is duplicated all over the place. But
> that's a separate issue, we can definitely accept your patch without
> doing this refactoring.
> 
> 
> > +BR2_PACKAGE_HOST_GENIMAGE=y
> 
> You need to add:
> 
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_MTOOLS=y
>
> Which are used to generate the FAT filesystem. You may not have noticed
> if you have those tools installed on your machine, but they are needed.
> 

I'll add these packages.

> Last but not least, could you add a patch at the end of the series that
> updates the documentation in board/atmel/readme.txt to simplify the SD
> card installation details? Indeed we no longer need to tell the user to
> create the partitions, copy the files manually and so on.
> 

I thought it could be useful if the user wanted to generate it by
himself. But you are right why doing it this way if he only has to
change genimage.cfg

Regards

Ludovic
