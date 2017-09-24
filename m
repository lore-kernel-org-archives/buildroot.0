From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 24 Sep 2017 09:25:51 -0400
Subject: [Buildroot] [PATCH 1/3] raspberrypi: post-image.sh handles many
	arguments
In-Reply-To: <f843fcf3-4bc0-53ec-8b75-34694270bab1@mind.be>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
 <20170923233007.13772-2-gael.portay@savoirfairelinux.com>
 <f843fcf3-4bc0-53ec-8b75-34694270bab1@mind.be>
Message-ID: <20170924132551.uvxo7nhtxbvbggo5@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Sep 24, 2017 at 12:04:19PM +0200, Arnout Vandecappelle wrote:
> 
> On 24-09-17 01:30, Ga?l PORTAY wrote:
> > This post-image script now handles many optional arguments given
> > through the command-line.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
>  Can you evaluate how this patch interacts with [1] ? Note that I haven't looked
> at either of them in detail.
> 
> [1] http://patchwork.ozlabs.org/patch/788904/
>

Both patches does the same thing.

The only difference is that my patch parses arguments using a while loop
(and shifts the first argument), while the patch from Erik parses
argument using a for loop.

Here is a diff of both patches.

	-+: mine
	++: Erik

	@@ -27,9 +11,9 @@
	 -	if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
	 -		echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
	 -		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
	-+shift
	-+while [ $# -ne 0 ]; do
	-+	case "${1}" in
My patch is using a while --^ (+ shift)
	++for arg in "$@"
	++do
	++	case "${arg}" in
Erik's solution uses a for -^
	 +		--add-pi3-miniuart-bt-overlay)
	 +		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
	 +			echo "Adding 'dtoverlay=pi3-miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."

Erik's forgot to indent the esac.

Otherwise, only the `-+ shift' would have been present is that chunk [*]. 

	@@ -71,15 +55,12 @@
	  __EOF__
	 -	fi
	 -	;;
	--esac
	 +		fi
	 +		;;
	-+	esac
	-+	shift
[*]: ---^-----------^
	-+done
	+ esac
	
	++done
	++
	  rm -rf "${GENIMAGE_TMP}"

Regards,
Gael
