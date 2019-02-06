From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 13:36:21 +0100
Subject: [Buildroot] [PATCH 0/8] board/raspberrypi: post-image
 customisations.
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <bda143a4-0e98-773a-2eed-3cbbad26b7c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Robert,

 Thank you for this work, excellent to see the raspberrypi support improved. We
discussed this at the Buildroot developer meeting.

 However, we would like to suggest a slightly different approach that is more
amenable to reuse in other context and also simplifies things in general, we
think. See below for our thoughts and suggestions. Thus, the series is marked as
Changes Requested in patchwork.

On 29/01/2019 14:23, Robert J. Heywood wrote:
> Hi all.
> 
> I wanted to do use u-boot and mainline kernel sources with my raspies
> but in trying to do so, found that doing it required a lot of changes
> to the genimage cfg files.

 Note that the intention is actually that when you change the configuration of
your target, you also change the genimage.cfg file. That said, if it is easy to
support more use cases with a single genimage.cfg file (especially if there are
in-tree use cases as well), that is something we might want to support in the
provided genimage.cfg files.

> All the files were basically the same, and I found that they, and the
> post-image script define constants which are no longer correct if the
> corresponding options are changed in buildroot.
> (eg. BR2_LINUX_KERNEL_INTREE_DTS_NAME)
> 
> I've improved the situation by first removing the replication in the
> cfg files (consolidating them into a single generic file). And then
> parsing the .config file for the board specific pieces; like the
> device tree files, and the kernel target (zimage vs image).

 This .config approach we don't like. Instead, we think it is more appropriate
to add support for wildcards to genimage itself (and send that change upstream
to pengutronix as well). That way, you can add "*.dtb" to genimage.cfg instead
of the current board-specific names.

 This approach can then be reused for other boards as well, like the freescale
boards on which you probably based this approach. Back in the day that approach
of a post-image script that autodiscovers things looked like the right thing to
do, but it is actually somewhat complicated and confusing.


> 
> Then I added some new options;
> - Adding files to the boot partition,
>   Allowing me to include uboot.bin.

 If you want to do something like this, I really think it's more appropriate to
make a custom genimage.cfg and config.txt that includes everything you want.
Note that if you make a custom genimage.cfg, you also don't need to use the
raspberrypi post-image script. Instead, use support/scripts/genimage.sh as the
post-image script.

 For the zImage vs. image, you could use "*mage" but I actually think it's more
appropriate to keep separate genimage.cfg files for them.

> - Changing the kernel in the config.txt file,
>   Allowing me to boot uboot.bin.

 Cfr. above.

 In fact, I don't really like the way the post-image script is updating the
config.txt. I think it makes much more sense to have a different config.txt for
each board instead of SEDing it. There are two options to handle this: either
copy the board-specific config.txt in the post-image script, or (more
generically) extend support/scripts/genimage.cfg with options that point to
directories/files that have to be copied to IMAGES_DIR before running genimage.

> - Specifying a different rootfs file,
>   Since i would like to use btrfs instead of ext4.

 This one certainly is better done in a custom genimage.cfg.

> - An option to skip creating the full sdimg.
>   As I'm using btrfs, in some cases I only need the vfat boot blob
>   from genimage.

 Again, make a custom genimage.cfg.


> There are a couple of aspects you might find questionable that I would
> welcome comments on;
> 
> The script now modifies the generic genimage.cfg file and creates a
> temporary cfg file to be used with genimage. I've chosen to place
> the file at; ${BUILD_DIR}/genimage.cfg
> This might not be the best choice.

 The freescale scripts now use mktemp, but actually I prefer your choice of
putting it in BUILD_DIR.


> I'm using a conbination of grep and eval to pull specific values out
> of the .config file and get them into the script. That might not be
> best practice.

 I personally prefer to use 'make printvars VARS=...' because you can also
extract make-derived variables that way (e.g. LINUX_IMAGE_NAME to get the
zImage/image). But either way is fine.

 Regards,
 Arnout

> Maybe theres a cleaner way of accessing those variables?
> 
> Kind regards,
> ~rob.
> 
> Robert J. Heywood (8):
>   board/raspberrypi: Unify the genimage config files
>   board/raspberrypi: post-image --overlays option.
>   board/raspberrypi: post-image, include .config dfs files.
>   board/raspberrypi: post-image, include .config kernel target.
>   board/raspberrypi: post-image --file option
>   board/raspberrypi: post-image --rootfs option
>   board/raspberrypi: post-image --skip-sdimg option
>   board/raspberrypi: post-image --kernel option
> 
>  DEVELOPERS                                         |  3 ++
>  ...rrypi2.cfg => genimage-raspberrypi-generic.cfg} |  7 +--
>  board/raspberrypi/genimage-raspberrypi.cfg         | 32 ------------
>  board/raspberrypi/genimage-raspberrypi0.cfg        | 30 ------------
>  board/raspberrypi/genimage-raspberrypi0w.cfg       | 31 ------------
>  board/raspberrypi/genimage-raspberrypi3-64.cfg     | 32 ------------
>  board/raspberrypi/genimage-raspberrypi3.cfg        | 33 -------------
>  board/raspberrypi/post-image.sh                    | 57 +++++++++++++++++++++-
>  8 files changed, 62 insertions(+), 163 deletions(-)
>  rename board/raspberrypi/{genimage-raspberrypi2.cfg => genimage-raspberrypi-generic.cfg} (85%)
>  delete mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
>  delete mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
>  delete mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
>  delete mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
>  delete mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg
> 
