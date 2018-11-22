From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Nov 2018 09:05:30 -0200
Subject: [Buildroot] Issues with Freescale defconfigs
In-Reply-To: <20181122104556.1d89c074@windsurf>
References: <20181122104556.1d89c074@windsurf>
Message-ID: <CAOMZO5BGHXYKGrWyPsE6o9HZ=iBu86pKSbhXMpwitNXVu15yAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 22, 2018 at 7:46 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Fabio,
>
> We have a similar issue with several Freescale defconfigs in Buildroot.
> The U-Boot build fails with:
>
>   CFGS    board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp
>   CFGS    board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp
> mv: cannot stat 'board/freescale/mx6qsabreauto/.mx6dl.cfg.cfgtmp.tmp': No such file or directory
> arch/arm/imx-common/Makefile:75: recipe for target 'board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp' failed
> make[2]: *** [board/freescale/mx6qsabreauto/mx6dl.cfg.cfgtmp] Error 1

I sent a workaround for Buildroot for some targets:
0c4bccf9e882 ("configs/imxsabre: Fix U-Boot parallel build issue")

Then later this issue was properly fixed in U-Boot mainline by commit:

commit f916757300c15aa1a3f0ccc98e7abb8a84c97da0
Author: Trent Piepho <tpiepho@impinj.com>
Date:   Fri Apr 6 17:11:27 2018 -0700

    imx: Create distinct pre-processed mkimage config files

    Each imx image is created by a separate sub-make and during this process
    the mkimage config file is run though cpp.

    The cpp output is to the same file no matter what imx image is being
    created.

    This means if two imx images are generated in parallel they will attempt
    to independently produce the same pre-processed mkimage config file at
    the same time.

    Avoid the problem by making the pre-processed config file name unique
    based on the imx image it will be used in.  This way each image will
    create a unique config file and they won't clobber each other when run
    in parallel.

    This should fixed the build bug referenced in b5b0e4e3 ("imximage:
    Remove failure when no IVT offset is found").

    Cc: Breno Lima <breno.lima@nxp.com>
    Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
    Cc: Fabio Estevam <fabio.estevam@nxp.com>
    Signed-off-by: Trent Piepho <tpiepho@impinj.com>
    Tested-by: Fabio Estevam <fabio.estevam@nxp.com>

which does not exist in the NXP U-Boot tree.

So the proper fix is to apply either Trent's official fix or my
workaround to all rel_imx_4.9.x_1.0.0_ga NXP U-Boot users.

I haven't checked whether Trent's patch would apply cleanly or with
some minor changes.

Any preferences?

Will investigate it.

Regards,

Fabio Estevam
