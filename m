From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 May 2016 23:56:54 +0200
Subject: [Buildroot] [PATCH 2/3] OrangePi Plus files required to
	generate SD card image and a self extracting fel-boot command
	for booting from RAM using USB-OTG and sunxi-fel
In-Reply-To: <1463268790-1076-3-git-send-email-troy@dack.com.au> (Troy Dack's
 message of "Sun, 15 May 2016 09:33:09 +1000")
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
 <1463268790-1076-3-git-send-email-troy@dack.com.au>
Message-ID: <874m9zgf2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Troy" == Troy Dack <troy@dack.com.au> writes:

 > Signed-off-by: Troy Dack <troy@dack.com.au>
 > ---
 >  board/orangepi/orangepi_plus/boot-fel.cmd    |  4 +++
 >  board/orangepi/orangepi_plus/boot-sdcard.cmd |  8 +++++

Is there any specific reason to support fel boot? As we create a full
blown sd card image, isn't that just as easy to use as fel boot?

 >  board/orangepi/orangepi_plus/boot.cmd        |  4 +++

This looks identical to boot-fel.cmd.

 > +++ b/board/orangepi/orangepi_plus/decompress
 > @@ -0,0 +1,21 @@
 > +#!/bin/bash
 > +echo ""
 > +echo "Self Extracting sunxi-fel USB boot"
 > +echo ""
 > +
 > +export TMPDIR=`mktemp -d /tmp/selfextract.XXXXXX`
 > +
 > +ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`
 > +
 > +tail -n+$ARCHIVE $0 | tar xjv -C $TMPDIR
 > +
 > +CDIR=`pwd`
 > +cd $TMPDIR
 > +./fel-boot.sh
 > +
 > +cd $CDIR
 > +rm -rf $TMPDIR
 > +
 > +exit 0
 > +
 > +__ARCHIVE_BELOW__

A description what this is about would be nice.


> diff --git a/board/orangepi/orangepi_plus/payload.sh b/board/orangepi/orangepi_plus/payload.sh
 > new file mode 100644
 > index 0000000..ca247fd
 > --- /dev/null
 > +++ b/board/orangepi/orangepi_plus/payload.sh
 > @@ -0,0 +1,21 @@
 > +#!/bin/bash
 > +cd ${BINARIES_DIR}
 > +tar czf .tar ./*
 > +
 > +if [ -e "payload.tar" ]; then
 > +    gzip payload.tar
 > +
 > +    if [ -e "payload.tar.gz" ]; then
 > +        cat decompress payload.tar.gz > selfextract.bsx
 > +    else
 > +        echo "payload.tar.gz does not exist"
 > +        exit 1
 > +    fi
 > +else
 > +    echo "payload.tar does not exist"
 > +    exit 1
 > +fi
 > +
 > +echo "selfextract.bsx created"
 > +exit 0

And this as well?

 > +++ b/board/orangepi/orangepi_plus/post-image.sh
 > @@ -0,0 +1,54 @@
 > +#!/bin/sh
 > +
 > +BOARD_DIR="$(dirname ${BR2_CONFIG})/$(dirname $0)"
 > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +
 > +echo ">>> Generating fel-boot.bsx self-extracting boot image"
 > +# Create fel-boot.sh
 > +cat > ${BINARIES_DIR}/fel-boot.sh <<__EOF__
 > +#!/bin/bash
 > +
 > +SUNXI_TOOLS=${HOST_DIR}
 > +BINARIES_DIR=${BINARIES_DIR}
 > +
 > +sudo \${SUNXI_TOOLS}/usr/bin/sunxi-fel -v -p \\

Calling sudo from the post-image.sh script isn't nice. I think the best
option is perhaps to just drop all the fel stuff, unless you have a
specific reason to have it?


> +echo ">>> Generating SD card image"
 > +# Generate SD Card image
 > +rm -rf "${GENIMAGE_TMP}"
 > +
 > +genimage                               \
 > +	--rootpath "${TARGET_DIR}"     \
 > +	--tmppath "${GENIMAGE_TMP}"    \
 > +	--inputpath "${BINARIES_DIR}"  \
 > +	--outputpath "${BINARIES_DIR}" \
 > +	--config "${GENIMAGE_CFG}"
 > +
 > +
 > +exit $?

The exit line (and empty lines above) can be dropped.

> diff --git a/board/orangepi/orangepi_plus/readme.txt b/board/orangepi/orangepi_plus/readme.txt
 > new file mode 100644
 > index 0000000..818cfa5
 > --- /dev/null
 > +++ b/board/orangepi/orangepi_plus/readme.txt
 > @@ -0,0 +1,35 @@
 > +OrangePi Plus
 > +
 > +Intro
 > +=====
 > +
 > +This default configuration will allow you to start experimenting with the
 > +buildroot environment for the OrangePi PC. With the current configuration

s/OrangePi PC/OrangePi Plus/

> +it will bring-up the board, and allow access through the serial console.


> +
 > +How to build it
 > +===============
 > +
 > +Configure Buildroot:
 > +
 > +    $ make orangepi_plus_defconfig
 > +
 > +Compile everything and build the self extracting initrd FEL boot image:
 > +
 > +    $ make
 > +
 > +Booting
 > +=======
 > +
 > +Once the build process is finished you will have a script called 
 > +"fel-boot.bsx" in the output/images/ directory.
 > +
 > +Make sure sunxi-tools/sunxi-fel is in your current PATH if they are
 > +not installed.

If needed, we should use the tools built by buildroot (but I think we
shold just drop the fel stuff).

> +
 > +Connect your OrangePi Plus via the OSB-OTG port and put it into FEL
 > +mode by pressing the FEL button. Run fel-boot.bsx and the OrangePi
 > +Plus will boot from the compiled image.
 > +
 > +  $ sudo fel-boot.bsx

It would be better to document how to use the sd card image.

-- 
Bye, Peter Korsgaard
