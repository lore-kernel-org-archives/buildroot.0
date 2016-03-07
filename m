From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon, 7 Mar 2016 08:42:24 +0100
Subject: [Buildroot] [PATCH v3] configs/olimex_imx233_olinuxino: switch
	to u-boot
In-Reply-To: <87pov75prw.fsf@dell.be.48ers.dk>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456598432-4783-1-git-send-email-phil@zankapfel.net>
 <87pov75prw.fsf@dell.be.48ers.dk>
Message-ID: <CAPiYbRKwwmyTz4vSEVUVdQZvGmd2MVzRKpktwHhOWih42dSCaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 March 2016 at 21:12, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
>
>  > mxs-bootlets broke somewhere in between toolchain version bumps.
>  > Directly boot u-boot, as this is supported now, but it requires updated
>  > partitioning (see readme.txt)
>
>  > Drop mxs-bootlets patches, they aren't needed anymore.
>
>  > Kernel is built as an uImage because the u-boot defconfig expects an
>  > uImage on the second partition.
>
>  > Tested on iMX233-OLinuXino-MINI hardware.
>
>  > Signed-off-by: Phil Eichinger <phil@zankapfel.net>
>  > ---
>  > Changes v3 -> v2:
>  >  - Explain why an uImage is used
>  >  - Add tested on which hardware
>  >  - Set u-boot version to 2006.01
>  >   (suggested by Thomas Petazzoni)
>
> Committed with the changes suggested by Arnout, thanks.

Thank you! Haven't had time to come up with a v4 yet.


>  >  You'll need a spare MicroSD card with Freescale's special partition layout.
>  > -This is basically two partitions:
>  > +This is basically three partitions:
>
>  > -1) Type 53, the bootstrap + bootloader/kernel partition, should be 16MB.
>  > -2) Anything you like, for this example an ext2 partition, type 83 (linux).
>  > +1) Type 53, the u-boot partition, should be 16MB.
>  > +2) VFAT, place Kernel as uImage there
>  > +3) Anything you like, for this example an ext2 partition, type 83 (linux).
>
>  >  Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
>  >  and from the buildroot project top level directory:
>
> This seems like a good fit for genimage. Can you verify that you are
> able to boot from a complete sdcard image generated with genimage and
> then send a patch to create it in a post-image script?
>
> See E.G. board/orangepi/orangepipc for an example, thanks!

I had a look. Some genimage.cfg use a fixed size of 512MB for the
rootfs, some just use the size of the rootfs.
I do prefer the later, as I'm able to fit a as small as possible SD
card. Especially since 512MB + some MB for the Kernel and bootloader
would at least require a 1GB card. What's the intent behind using a
512MB rootfs partition in that case?

Regards, Phil
