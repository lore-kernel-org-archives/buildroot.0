From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 14 Oct 2015 18:04:33 +0200
Subject: [Buildroot] [PATCH 1/2] board/freescale: refresh
	create-boot-sd.sh
In-Reply-To: <1444831418-13483-2-git-send-email-vincent.stehle@freescale.com>
References: <1444831418-13483-1-git-send-email-vincent.stehle@freescale.com>
 <1444831418-13483-2-git-send-email-vincent.stehle@freescale.com>
Message-ID: <561E7D11.7040207@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

Vincent Stehl? wrote:
> Starting with version 2.26, sfdisk defaults to a unit of 512 B sectors.
> With those recent versions of sfdisk, the create-boot-sd.sh script ends
> up creating a boot partition of 240 KB, which is too small to contain a
> Linux kernel.

Ouch!

>
> Version 2.25 of sfdisk and older defaulted to cylinders; a
> media-dependant unit, typically much larger than 512 B. With those
> versions the create-boot-sd.sh creates paritions, large enough to hold a

paritions -> partitions, and remove the ',' after it.

> kernel.
>
> We update the create-boot-sd.sh script to use the more readable and more
> stable named-fields sfdisk format for the partitioning command, and set
> the boot partition size to 64 MB, which should be enough for everyone.
>
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>   board/freescale/create-boot-sd.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/board/freescale/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
> index af45115..cfb1101 100755
> --- a/board/freescale/create-boot-sd.sh
> +++ b/board/freescale/create-boot-sd.sh
> @@ -60,8 +60,8 @@ sync
>   # - FAT partition starting at 1MB offset, containing uImage and *.dtb
>   # - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
>   sfdisk ${DEV} <<EOF
> -32,480,b
> -512,,L
> +start=1MiB, size=64MiB, type=b

Is the "MiB" suffix supported on older sfdisk releases? Ubuntu 14.04
ships sfdisk 2.20.1, and its manpage does not contain "MiB".

If that is not supported, then I guess "--unit M" should work. It's in
the manpage, but I haven't tested it yet.

I strongly think we should support the latest Ubuntu LTS, AFAIK it's
widely used by embedded Linux developers.

-- 
Luca
