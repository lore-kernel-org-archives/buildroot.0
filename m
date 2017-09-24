From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 24 Sep 2017 10:12:07 -0400
Subject: [Buildroot] [PATCH 2/3] raspberrypi: post-image.sh add new
	gpu_mem option
In-Reply-To: <8c1d85a4-4390-047f-1d21-af37842a0040@mind.be>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
 <8c1d85a4-4390-047f-1d21-af37842a0040@mind.be>
Message-ID: <20170924141207.muyixrdd2u27n7uw@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Sep 24, 2017 at 12:15:09PM +0200, Arnout Vandecappelle wrote:
> 
> On 24-09-17 01:30, Ga?l PORTAY wrote:
> > The amount of GPU memory can be set using the new option --gpu_mem_XXX
> > (where XXX is the total amount of memory available on the board).
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > ---
> >  board/raspberrypi/post-image.sh | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> > index 1b49f0ea30..9091476ced 100755
> > --- a/board/raspberrypi/post-image.sh
> > +++ b/board/raspberrypi/post-image.sh
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >  
> >  BOARD_DIR="$(dirname $0)"
> >  BOARD_NAME="$(basename ${BOARD_DIR})"
> > @@ -38,6 +38,11 @@ enable_uart=1
> >  __EOF__
> >  		fi
> >  		;;
> > +		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
> > +		# Set GPU memory
> > +		gpu_mem="${1:2}"
> > +		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> 
>  In the end, the config.txt is just for one board, right? So can't we just have
> a single --gpu_mem=XXX option and do
> 
> 		sed -i -e "/^gpu_mem_[0-9]*=/s/=.*/${1##*=}/" \
> 			"${BINARIES_DIR}/rpi-firmware/config.txt"
> 

If we consider the output is only for one target (rpi, rpi2, rpi3 or
rpi3-64), so yes we can have only a single gpu_mem option; but we have
to remove all gpu_mem_xxx= in the config.txt (rpi-firmware). If set,
these options overrides gpu_mem= (if unset, it default value is 64).

According the config.txt memory documentation [*]:

	gpu_mem
	
	GPU memory in megabytes. This sets the memory split between the CPU and GPU; the CPU gets the remaining memory. Minimum value is 16; maximum value is 192, 448, or 944, depending on whether you are using a 256M, 512MB, or 1024MB Pi. The default value is 64.
	
	Setting gpu_mem to low values may automatically disable certain firmware features, as there are some things the GPU cannot do if it has access to too little memory. So if a feature you are trying to use isn't working, try setting a larger GPU memory split.
	
	Using gpu_mem_256, gpu_mem_512, and gpu_mem_1024 allows you to swap the same SD card between 256MB, 512MB, and 1024MB Pis without having to edit config.txt each time:

>  Note that you no longer need to strip off the -- and that you no longer need bash.
>

Indeed.

In the end, what I would like to have is to give config.txt options as
arguments to post-image.sh; that are echo'ed to the file. Because some
options are already presents in the config.txt file, we have either to
sed or to echo/cat.

Something arround...

	$ post-image.sh skip-first-arg enable_uart=1 dtoverlay=pi3-miniuart-bt gpu_mem=200

and...

	shift
	while [ $# -eq 0 ]; do
		echo "$1" >>$BINARIES_DIR/rpi-firmware/config.txt
		shift
	done

	genimage ...

So we no longer needs to update the script each time we need to add a
new argument that plays with the config.txt.

What do you think?

>  As you can see in the example, I also prefer if the options (-i) come in the
> beginning, and to use / as the delimiter unless there actually are /-es in any
> of the strings. But that's just personal preference.
> 

Okay. It is fine for me, I will update it.

>  Regards,
>  Arnout
> 
> > +		;;
> >  	esac
> >  	shift
> >  done
> > 

Regards,
Gael

[*]: https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md
