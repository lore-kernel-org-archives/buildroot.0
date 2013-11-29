From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Nov 2013 20:01:53 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <20131129092715.24d2b199@skate>
References: <20131128205515.GB3337@free.fr>
 <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
 <20131129092715.24d2b199@skate>
Message-ID: <20131129190153.GA4639@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-29 09:27 +0100, Thomas Petazzoni spake thusly:
> Dear Jeremy Rosen,
> 
> On Fri, 29 Nov 2013 09:00:19 +0100 (CET), Jeremy Rosen wrote:
> 
> > Basically, you build the root filesystem the way it will look when all
> > sub-filesystems are mounted, you describe how they are mounted and 
> > the system builds the partitions accordingly.
> 
> I don't necessarily agree here, because this strategy makes the
> confusion between two things:
> 
>  * The contents of the /boot directory in the root filesystem.
> 
>  * The contents of the boot partition needed for some platforms (OMAP,
>    RPi, UEFI-based x86 platforms, etc.)
> 
> Those are two different things, and Yann's proposal merges them. As an
> example, provided your bootloader has ext3 support and you're on an
> OMAP platform, you may want to have something like:
> 
>  * The /boot directory in the root filesystem contains the kernel image
>    (uImage, zImage)
> 
>  * The boot partition contains just the bootloader images (MLO,
>    u-boot.img).
> 
> There is no point to have the kernel image in the boot partition, and
> there is no point in having the bootloader images in the /boot
> directory of the root filesystem.

OK, now I can follow what you mean (although one may argue whether the
kernel is part of those 'boot' files, since it does not make sense to
have it in the root file system).

However, this means that each 'platform' (eg. the RPi, your special
OMAP board...) will each have to provide a manifest of things to install
in the boot partition, and 'genimages' will have to interpret this
manifest to populate the boot partition.

I won't say I like this, even if I see your point. And from a more
global perspective, the boot partition might also be something else than
a filesystem.

So OK, I'll see how to manage this. Here is a quick proposal:

1) genimages should be able to create board-specific partitions, eg.:
   (a) a filesystem mounted on, and filled from /boot
   (b) an unmounted filesystem filled with an arbitrary set of files
   (c) a binary blob

  - For (a), we can already do that, it's like any other filesystem.
  - For (b), the submitted genimages can't do that, but the one in
    buildroot.config can, so I just have to reinstate my 'fs_filler'
    hook.
  - For (c), this has to be implemented. I suggest we postpone this
    until the basic genimages is upstream, and we have an actual
    use-case for it (no need to over-engineer the sutff, YAGNI...)

Of course, there are the cases where we may need any conbinations of one
or more of:
  - a boot blob (eg. MBR, UEFI; obviously only one!)
  - a binary blob partition (eg. a U-Boot image)
  - a mounted /boot filesystem
  - a unmounted filesystem

2) bootloaders for case (a) will have to:
   (a) install their files in $(TARGET_DIR)/boot

genimages should be prepared to generate a partition with a filesystem
filed from the content of /boot, and add an entry for it in fstab.
(Done! :-) )

We currently (as far as I know) have no such bootloader; not even
rpi-firmware fits in this category.

3) bootloaders for case (b) will have to:
   (a) install their files, and a manifest of those files, in a known
       location
   (b) that location should be platform-agnostic, so that genimages will
       find it; $(BINARIES_DIR)/boot-files/ looks like a good candidate.

genimages should be prepared to generate a partition with a filesystem
filled by copying files listed in a manifest file.
(Relatively easy, I think.)

The kind of bootloaders I know that fit in this category are
rpi-firmware and grub. There may have others.

4) bootloaders for case (c) will have to:
   (a) install the binary blob in a known location;
       $(BINARIES_DIR)/boot-files/ looks like a good candidate.

genimages should be prepared to generate a partition by simply dumping
the content of a file.

The bootloaders that fit in this category are U-Boot, RedBoot... Note
that this does not imply an MBR-type of partitioning.

Any comment on the above?

And thanks for the guidance and enlightment! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
