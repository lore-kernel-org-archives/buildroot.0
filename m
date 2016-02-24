From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 24 Feb 2016 10:49:26 +0100
Subject: [Buildroot] user question about ubi nand
In-Reply-To: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
References: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
Message-ID: <1456307366.1989.30.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Di, 2016-02-23 at 19:34 -0800, Steve Calfee wrote:
> Ubi seems very well supported in buildroot and linux. The problem is
> figuring out how to use it.
> 
> I have created two nand partitions, one rootfs and one data. I would
> like the rootfs to be readonly and data to be r/w. After tons of
> searches I have configured the rootfs and stored the buildroot built
> image in it.
> 
> My question is how do I move r/w areas from rootfs into the r/w
> partition. Examples are /etc/ files /run files which start as
> /var/run
> and finally application files like mysql databases which are in
> /usr/share/. I assume the post scripts can be used, but I cannot find
> examples. In post scripts how do I set permissions/user/group fields.
> How do I link to a mounted partition.
> 
> http://free-electrons.com/blog/creating-flashing-ubi-ubifs-images/
> has
> lots of info. But say I want a custom ubi.cfg file, where do I put it
> or how do i menuconfig it? Say I want 2 partitions, one ro and one rw
> I assume I need a special cfg file. Ubi asks for lots of magic
> numbers, how do I get them - such as erasesize, subpagesize, offsets
> etc? I assume defaults are good, but how can I know. Typical Linux
> stuff, however these thing are knowable, how do I find it out (via
> web
> searches etc). How do I do set the config file in BR2_EXTERNAL?
> 
> All info I find is schizophrenic. Net searches say how to do things
> like this in uboot and linux. Sometimes in the same doc paragraph. It
> is never clear which instruction matches which of uboot and linux.
> For
> buildroot the best is stuff mainly done in the build, but something
> must be done on the target. What is the recommended procedure for
> mass
> building systems?
> 
> What if the nand and rootfs is bigger than ram? How do you update it
> in uboot?

These are a lot of questions :-)

I guess you already read the MTD docs [1]. It has a lot of useful
information about NAND, UBI, and UBIFS...

I use Buildroot to build a ro rootfs, a rw overlayfs and a rw data
partition. I configured to BR to create a UBIFS rootfs
(BR2_TARGET_ROOTFS_UBIFS). The parameters like LEB size depends on your
NAND device and partition layout (see [1]).

The data UBIFS and UBI image is created in the post-image script.
Again, the parameter values for the mkfs.ubifs and ubinize tools
depends on your NAND device and partition layout.

To append the data parition to your filesystem you'll need to add an
entry to fstab, eg.
"ubi1:data	/data	ubifs	defaults	0	0"

You can use fstab to move parts of your system to another partition,
tool.

I know it's like a big puzzle to get all pieces together. It took me
some while to go to all the available documentation thoroughly, take
one step-by-step and adapt it all to my needs.

Good luck!

[1]?http://www.linux-mtd.infradead.org/doc/general.html

Best regards
J?rg Krause
