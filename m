From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2014 18:05:30 +0100
Subject: [Buildroot] [PATCH 3/5] board/raspberrypi: provide partition
 description for the new genimages
In-Reply-To: <CAGduivyP4sdDKUpSG4ZJcfV5b5S7gipteUd=gFsWZ=_KfOMk7A@mail.gmail.com>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <ac4d914078b3e77edc1704e0ada84c4fa8ef57f5.1388768519.git.yann.morin.1998@free.fr>
 <CAGduivyP4sdDKUpSG4ZJcfV5b5S7gipteUd=gFsWZ=_KfOMk7A@mail.gmail.com>
Message-ID: <20140104170530.GB3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-01-04 17:40 +0100, Maxime Hadjinlian spake thusly:
> On Fri, Jan 3, 2014 at 6:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Now we can generate a complete target storage image with the genimages
> > infra, add a partition table layout description for the Raspberry Pi
> > as an example for how to use genimages.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  board/raspberrypi/partitions  | 35 +++++++++++++++++++++++++++++++++++
> >  configs/raspberrypi_defconfig |  3 +++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 board/raspberrypi/partitions
> >
> > diff --git a/board/raspberrypi/partitions b/board/raspberrypi/partitions
> > new file mode 100644
> > index 0000000..dea9aff
> > --- /dev/null
> > +++ b/board/raspberrypi/partitions
> > @@ -0,0 +1,35 @@
> > +[global]
> > +extract=tar
> > +devices=mmcblk0
> > +
> > +[mmcblk0]
> > +type=boot
> > +boot_type=mbr
> > +partitions=boot,root
> > +partalign=$((1048576))
> > +
> > +[root]
> > +type=fs
> > +size=$((32*1048576))
> > +mbr_type=$((0x83))
> > +fs_type=ext
> > +fs_vfstype=ext4
> > +fs_mntops=discard
> > +fs_root=/
> > +fs_label=ROOT
> > +ext_gen=4
> > +ext_rev=1
> > +
> > +[boot]
> > +type=fs
> > +size=$((9*1048576))
> > +mbr_type=$((0xc))
> > +fs_type=vfat
> > +fs_files_0=rpi-firmware/bootcode.bin
> > +fs_files_1=rpi-firmware/start.elf
> > +fs_files_2=rpi-firmware/fixup.dat
> > +fs_files_3=rpi-firmware/config.txt
> > +fs_files_4=rpi-firmware/cmdline.txt
> > +fs_files_5=zImage
> > +fs_label=BOOT
> > +vfat_size=16
> > diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> > index 6a17165..50caf5f 100644
> > --- a/configs/raspberrypi_defconfig
> > +++ b/configs/raspberrypi_defconfig
> > @@ -21,3 +21,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="75d03120bc36b1cc3166973b8edc11f033ab7c0d"
> >  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
> >  BR2_LINUX_KERNEL_ZIMAGE=y
> > +
> > +BR2_TARGET_ROOTFS_CUSTOM=y
> > +BR2_TARGET_ROOTFS_CUSTOM_PARTITION_TABLE="$(TOPDIR)/board/raspberrypi/partitions"
> > --
> > 1.8.1.2
> Could you please add comments over the various size and also the
> different type used, 0x83 is not really user friendly to read.

0x83 and 0xc are partition types, and there is a pointer in the manual
for where to find their meanings and the different values:

    * mbr_type (mandatory): the partition [type]

where [type] is a pointer to:
    https://en.wikipedia.org/wiki/Partition_type#List_of_partition_IDs

But I can add such comments as this is an example.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
