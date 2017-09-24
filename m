From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 24 Sep 2017 12:49:05 -0400
Subject: [Buildroot] [PATCH 2/3] raspberrypi: post-image.sh add new
 gpu_mem option
In-Reply-To: <71439ed0-48d7-ac9f-3cf5-33748f566fea@mind.be>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
 <8c1d85a4-4390-047f-1d21-af37842a0040@mind.be>
 <20170924141207.muyixrdd2u27n7uw@gportay>
 <71439ed0-48d7-ac9f-3cf5-33748f566fea@mind.be>
Message-ID: <20170924164905.qapjtso5vh37mbyj@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 24, 2017 at 04:20:41PM +0200, Arnout Vandecappelle wrote:
> On 24-09-17 16:12, Ga?l PORTAY wrote:
> > In the end, what I would like to have is to give config.txt options as
> > arguments to post-image.sh; that are echo'ed to the file. Because some
> > options are already presents in the config.txt file, we have either to
> > sed or to echo/cat.
> > 
> > Something arround...
> > 
> > 	$ post-image.sh skip-first-arg enable_uart=1 dtoverlay=pi3-miniuart-bt gpu_mem=200
> > 
> > and...
> > 
> > 	shift
> > 	while [ $# -eq 0 ]; do
> > 		echo "$1" >>$BINARIES_DIR/rpi-firmware/config.txt
> > 		shift
> > 	done
> > 
> > 	genimage ...
> > 
> > So we no longer needs to update the script each time we need to add a
> > new argument that plays with the config.txt.
> > 
> > What do you think?
> 
>  Well, then it's probably easier to just copy a config.txt, no? Perhaps adding
> options for custom config.txt to rpi-firmware?
>

Yes. For now, it is simple to have one config.txt per rpi-board as there
is a limited number of raspberrypi config. But, the config.txt will
probably be duplicated many times.

For a user point of view, my suggestion makes the customization more
versatile.

If the user have a rpi3 with a lirc-rpi module (do not know what it is),
he will have to edit manually the config.txt.

	# cat <<EOF >output/images/rpi-firmare/config.txt
	dtoverlay=lirc-rpi
	EOF

This is fair.

If the user want it to be mainlined, he will have to add an extra option
in the post-image script. And we probably have to maintain many (all? or
at least dtoverlays) config.txt options.

With my suggestion, the user is able to add dtoverlay=lirc-rpi to the
list of post-scripts arguments.

	BR2_ROOTFS_POST_SCRIPT_ARGS="... dtoverlay=lirc-rpi"

Thus we do not need to maintain all config.txt options in the script
post-image.sh. The config.txt can be tunned using make menuconfig. 

	shift
	while [ $# -eq ]; do
		case "$1" in
		# keep legacy cases (--add-pi3-miniuart-bt-overlay, --aarch64...)
		*) # or *=*)
			echo "$1" >>${BINARIES_DIR}/rpi-firmware/config.txt
			# or sed -i -e "/^${1#=}/d;\$a$1" ${BINARIES_DIR}/rpi-firmware/config.txt
			;;
		esac
		shift
	done

Note: Maybe, we should reduce the config.txt to the bare minimum set of
option and rely on default values.
