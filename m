From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 3 Feb 2016 23:17:14 +0100
Subject: [Buildroot] [PATCH] board: Add support for Acmesystems Arietta
	g25
In-Reply-To: <87a8nj7400.fsf@dell.be.48ers.dk>
References: <1453591076-30009-1-git-send-email-angelo.compagnucci@gmail.com>
 <87a8nj7400.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9V=SQGBsh6EKwGZF+hA_yLO11OE_8BNQgKkas2o6=4gR-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

2016-02-02 12:20 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch adds a minimal working configuration for
>  > Acmesystems Arietta g25
>
>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Thanks, see below for a few comments.
>
>  > ---
>  >  board/acmesystems/arietta-g25/readme.txt        | 50 +++++++++++++++++++++++++
>  >  configs/acmesystems_arietta_g25_128mb_defconfig | 23 ++++++++++++
>  >  configs/acmesystems_arietta_g25_256mb_defconfig | 23 ++++++++++++
>  >  3 files changed, 96 insertions(+)
>  >  create mode 100644 board/acmesystems/arietta-g25/readme.txt
>  >  create mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
>  >  create mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig
>
>  > diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
>  > new file mode 100644
>  > index 0000000..bccdb61
>  > --- /dev/null
>  > +++ b/board/acmesystems/arietta-g25/readme.txt
>  > @@ -0,0 +1,50 @@
>  > +Build instructions
>  > +==================
>  > +
>  > +As a regular user configure and then build:
>  > +
>  > +$ make acmesystems_arietta_g25_128mb_defconfig (128MB RAM variant)
>  > +  or...
>  > +$ make acmesystems_arietta_g25_256mb_defconfig (256MB RAM variant)
>
> It's a pity that we need two different configurations when they are so
> similar. It's been a few years since I've used at91bootstrap, I take it
> that doesn't have any sdram size detection logic like U-Boot has
> nowadays? (get_ram_size()).

Nope, at least not in the version used by the hardware vendor.

>
>
>> +$ make
>  > +
>  > +Writing to the MicroSD card
>  > +===========================
>  > +
>  > +You'll need a blank MicroSD (obviously) initialized
>  > +in a particular way to be able to boot from it.
>  > +
>  > +Assuming the card is seen as /dev/sdb in your PC/laptop/other device
>  > +you'll need to run the following commands as root or via sudo.
>  > +
>  > +Make sure all of the card partitions are unmounted before starting.
>  > +
>  > +First we'll need to create two partitions:
>  > +
>  > +# sfdisk -uM /dev/sdb <<EOF
>  > +,32,6
>  > +;
>  > +EOF
>  > +
>  > +Then we'll need to create the empty filesystems:
>  > +
>  > +# mkdosfs -n SD_BOOT /dev/sdb1
>  > +# mkfs.ext4 -L SD_ROOT /dev/sdb2
>  > +
>  > +We'll populate the first partition (boot) with the relevant files:
>  > +
>  > +# mount /dev/sdb1 /mnt
>  > +# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
>  > +# cp output/images/zImage /mnt
>  > +# cp output/images/at91-ariag25.dtb /mnt
>  > +# umount /mnt
>  > +
>  > +And the root filesystem afterwards:
>  > +
>  > +# mount /dev/sdb2 /mnt
>  > +# tar -C /mnt output/images/rootfs.tar
>  > +# umount /mnt
>  > +
>  > +You're done, insert the MicroSD card in the slot and enjoy.
>
> Could you convert this to genimage instead of all these manual steps?
> Have a look at board/orangepi/orangepipc/genimage.cfg for an example.

I just sent a v2 where genimage is used.

>
> Thanks!
>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
