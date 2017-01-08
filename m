From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 08 Jan 2017 20:07:28 +0100
Subject: [Buildroot] Need help with genimage
In-Reply-To: <20170108190251.s43skw4rbni6tk6g@tarshish>
References: <1483876731.4757.1.camel@embedded.rocks>
 <20170108174537.jaz3hgr6zau623r7@tarshish>
 <1483900357.4757.3.camel@embedded.rocks>
 <20170108190251.s43skw4rbni6tk6g@tarshish>
Message-ID: <1483902448.4757.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2017-01-08 at 21:02 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Sun, Jan 08, 2017 at 07:32:37PM +0100, J?rg Krause wrote:
> > On Sun, 2017-01-08 at 19:45 +0200, Baruch Siach wrote:
> > > On Sun, Jan 08, 2017 at 12:58:51PM +0100, J?rg Krause wrote:
> > > > I am able to generate the sd card image and copy it to the sd
> > > > card
> > > > using Suses imagewriter. The board boots fine. However, the
> > > > rootfs
> > > > size
> > > > is not 512MB as expected:
> > > > 
> > > > # df -hT
> > > > Filesystem???????????Type????????????Size??????Used Available
> > > > Use%
> > > > Mounted on
> > > > /dev/root????????????ext4???????????38.7M?????37.9M?????????0
> > > > 100%
> > > > /
> > > > devtmpfs?????????????devtmpfs??????501.9M?????????0????501.9M??
> > > > ?0%
> > > > /dev
> > > > tmpfs????????????????tmpfs?????????502.4M?????????0????502.4M??
> > > > ?0%
> > > > /dev/shm
> > > > tmpfs????????????????tmpfs?????????502.4M??????3.9M????498.4M??
> > > > ?1%
> > > > /tmp
> > > > tmpfs????????????????tmpfs?????????502.4M?????24.0K????502.4M??
> > > > ?0%
> > > > /run
> > > > 
> > > > I am not able to create any file larger file on the filesystem
> > > > nor
> > > > start some programs.
> > > > 
> > > > What am I missing here? Can somebody enlighten me please :-)
> > > 
> > > Unless you set BR2_TARGET_ROOTFS_EXT2_BLOCKS and
> > > BR2_TARGET_ROOTFS_EXT2_INODES?
> > > you'll get a minimal ext2/3/4 filesystem with no free space.
> > > Alternatively,?
> > > you may run on target the resize2fs tool from the e2fsprogs
> > > package
> > > on the?
> > > root filesystem to expand the filesystem to the size of the
> > > partition.
> > 
> > Which values should I use for blocks and inodes if I set the rootfs
> > size to 512M in genimage.cfg? Any suggestions?
> 
> The Buildroot package/mke2img/mke2img script assumes a 1KB block
> size, so you?
> need 512K blocks.
> 
> The number of inodes determines the number of file entries in the
> filesystem.?
> A safe "inode ratio" default is one inode per 16384 bytes. That is
> the native?
> e2fsprogs package mke2fs tool default, but YMMV.

I see! Many thanks!

I wonder why only one defconfig (nanopi_neo) is setting the blocks and
inodes. However, maybe it's best to enable the resize2fs package by
default in the defconfig and add a comment in the readme of the board.

J?rg
