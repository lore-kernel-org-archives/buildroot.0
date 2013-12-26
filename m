From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 10:51:21 +0100
Subject: [Buildroot] [PATCH] Add Armadeus systems APF51 SOM basic
 support.
In-Reply-To: <1388051094-3666-1-git-send-email-julien.boibessot@free.fr>
References: <1388051094-3666-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20131226105121.4694c243@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Thu, 26 Dec 2013 10:44:54 +0100, julien.boibessot at free.fr wrote:
> From: Julien Boibessot <julien.boibessot@armadeus.com>
> 
> Buildroot uClibc toolchain, UBIFS rootfs, linux kernel (board is mainlined).
> 
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>

Thanks! Some comments below.

> --- /dev/null
> +++ b/board/armadeus/post-image.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +#
> +# arg1: BR images dir
> +# arg2: board name
> +# arg3: i.MX processor type
> +
> +# images renaming according to board name
> +if [ "$2" != "" ]; then
> +	for rootfstype in ubi ubifs tar jffs2; do
> +		if [ -f "$1/rootfs.$rootfstype" ]; then
> +			mv -u $1/rootfs.$rootfstype $1/$2-rootfs.$rootfstype
> +		fi
> +	done
> +	if [ -f "$1/uImage" ]; then
> +		mv -u $1/uImage $1/$2-linux.bin
> +	fi
> +	if [ -f "$1/$3-$2dev.dtb" ]; then
> +		mv -u $1/$3-$2dev.dtb $1/$2.dtb
> +	fi
> +fi

Why do we want this? We don't do this for any of the boards in
Buildroot, and I'm not sure to see why the apf51 should be different
here.

Surely, if you want to build Buildroot for several boards, you will
create one build tree for each board, and therefore each images
directory will contain only the images for this particular board:

	make O=../apf51 apf51_defconfig
	make O=../apf51

	make O=../apf27 apf27_defconfig
	make O=../apf27

And then in ../apf27/images/, you have images for APF27, and
in ../apf51/images/, you have images for APF51.

Other than that, it looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
