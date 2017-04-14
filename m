From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 14 Apr 2017 19:23:38 -0400
Subject: [Buildroot] [PATCH 2/2] configs: add raspberrypi3 64bits
 defconfig
In-Reply-To: <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
 <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
 <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
Message-ID: <20170414232338.y6ueynmpcghtr4ve@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Apr 15, 2017 at 12:22:12AM +0200, Arnout Vandecappelle wrote:
> 
> On 14-04-17 23:45, Ga?l PORTAY wrote:
> [snip]
> > diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> > index b2bb07067..e4127c9ea 100755
> > --- a/board/raspberrypi/post-image.sh
> > +++ b/board/raspberrypi/post-image.sh
> > @@ -16,6 +16,29 @@ dtoverlay=pi3-miniuart-bt
> >  __EOF__
> >  	fi
> >  	;;
> > +	--aarch64)
> > +	# Run a 64bits kernel (armv8)
> > +	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> > +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +
> > +# enable 64bits support
> > +arm_control=0x200
> > +__EOF__
> > +	fi
> > +
> > +	# Enable uart console
> > +	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> > +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > +
> > +# enable rpi3 ttyS0 serial console
> > +enable_uart=1
> > +__EOF__
> > +	fi
> > +
> > +	# Use 64bits conffile
> > +	GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}-64.cfg"
> 
>  Isn't it better to just make a new raspberrypi3-64 symlink?
> 

Indeed, the symlink make sense.

> > +	;;
> >  esac
> >  
> >  rm -rf "${GENIMAGE_TMP}"

Regards,
Ga?l
