From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Sep 2013 16:37:09 +0200
Subject: [Buildroot] [PATCH 2/4] nitrogen6x: use
	6x_bootscript/6x_upgrade instead of older 6q_ versions
In-Reply-To: <1380136072-9879-3-git-send-email-eric.nelson@boundarydevices.com>
 (Eric Nelson's message of "Wed, 25 Sep 2013 12:07:50 -0700")
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
 <1380136072-9879-3-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <87r4cb7ip6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Nelson <eric.nelson@boundarydevices.com> writes:

Hi Eric,

 Eric> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>

 Eric> +++ b/board/boundarydevices/nitrogen6x/post-build.sh
 Eric> @@ -1,18 +1,20 @@
 Eric>  #!/bin/sh
 Eric>  # post-build fixups
 Eric> -# for furthe details, see
 Eric> -# http://boundarydevices.com/u-boot-conventions-for-i-mx6-nitrogen6x-and-sabrelite/
 Eric> +# for further details, see
 Eric> +#
 Eric> +#  http://boundarydevices.com/u-boot-on-i-mx6/
 Eric> +#
 
 Eric>  TARGET_DIR=$1
 Eric>  IMAGES_DIR=$1/../images
 Eric>  BOARD_DIR="$(dirname $0)"
 
 Eric>  # bd u-boot looks for bootscript here
 Eric> -cp $BOARD_DIR/6q_bootscript $TARGET_DIR
 Eric> +cp $BOARD_DIR/6x_bootscript $TARGET_DIR
 
 Eric>  # u-boot / update script for bd upgradeu command
 Eric> -if [ -e $IMAGES_DIR/u-boot.bin ];
 Eric> +if [ -e $IMAGES_DIR/u-boot.imx ];
 Eric>  then
 Eric> -    cp $IMAGES_DIR/u-boot.bin $TARGET_DIR
 Eric> -    cp $BOARD_DIR/6q_upgrade $TARGET_DIR
 Eric> +    cp $IMAGES_DIR/u-boot.imx $TARGET_DIR
 Eric> +    cp $BOARD_DIR/6x_upgrade $TARGET_DIR

Hmm, how is that supposed to work? I don't know the details of the imx6
boot sequence, but:

- We don't currently have an option in the u-boot package to install
  u-boot.imx to IMAGES_DIR/, so this will never run

- Comparing 6q_upgrade and 6x_upgrade I see we used to write the raw
  u-boot.bin to offset 0 in the spi flash, and now are writing
  u-boot.imx (which presumably is u-boot.bin with a freescale header) to
  offset 1K. I see that the .imx file is 4K bigger than the .bin
  file, so that's presumably the size of the freescale header.

I'll go and add a option for u-boot.imx to the u-boot package, but would
like to hear if 6x_upgrade is doing the right thing here.

-- 
Bye, Peter Korsgaard
