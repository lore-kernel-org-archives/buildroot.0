From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:21:12 +0200
Subject: [Buildroot] [PATCH 1/1] board: add support for Acme Systems
 Acqua A5
In-Reply-To: <6c4a7d31-8de0-4ead-9d49-11c2d8c674aa@grenoble.cnrs.fr>
References: <6c4a7d31-8de0-4ead-9d49-11c2d8c674aa@grenoble.cnrs.fr>
Message-ID: <20210330222112.2c4d748f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Edgar,

Thanks a lot for this contribution!

On Mon, 22 Mar 2021 18:14:24 +0100
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> The Acqua A5 is a system on module based on the Microchip SAMA5D31 SoC:
> 
>     https://www.acmesystems.it/acqua
> 
> It is available in both 256 MiB and 512 MiB versions, hence the two
> defconfig files. These configs build microSD card images with:
> 
>     - AT91Bootstrap 3
>     - Linux 5.4.107
>     - default buildroot packages (uClibc, Busybox)
> 
> The device tree blob comes from Acme Systems:
> 
>     https://github.com/AcmeSystems/dts-archive
> 
> It is licensed under GPLv2 or later.

It is a bit annoying that we have to include the .dts directly in
Buildroot, but it seems easier than creating a package for just
downloading this Device Tree file, so I've kept your solution there.

> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  .../acqua-a5/at91-sama5d3_acqua.dts           | 301 ++++++++++++++++++
>  board/acmesystems/acqua-a5/genimage.cfg       |  28 ++
>  board/acmesystems/acqua-a5/readme.txt         |  44 +++
>  configs/acmesystems_acqua_a5_256mb_defconfig  |  20 ++
>  configs/acmesystems_acqua_a5_512mb_defconfig  |  20 ++
>  5 files changed, 413 insertions(+)

And entry in the DEVELOPERS file was missing, so I've added that.

> +BR2_PACKAGE_HOST_GENIMAGE=y

This is not sufficient for your genimage configuration, you also need:

+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y

since you have a FAT partition.

I've fixed those two minor issues, and applied your patch to our master
branch. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
