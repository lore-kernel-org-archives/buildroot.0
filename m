From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 09:40:07 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <201301030056.01956.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
Message-ID: <201301030940.07495.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On Thursday 03 January 2013 01:32:52 Steve Calfee wrote:
> On Wed, Jan 2, 2013 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Arnout, Steve, All,
> >
> > On Wednesday 02 January 2013 Arnout Vandecappelle wrote:
> >> On 12/25/12 04:52, Steve Calfee wrote:
> >> > On Sun, Dec 23, 2012 at 4:00 PM, Yann E. MORIN<yann.morin.1998@free.fr>  wrote:
> > [--SNIP--]
> >> >> For now, buildroot can build a single filesystem image. This is not useable
> >> >> for these systems. The only possibility as of today is to configure BR to
> >> >> generate a tarball, and have a custom script that does the required split up
> >> >> of the different components.
> >>
> >>   That's not really true, is it? Buildroot generates the ext2fs and the
> >> boot loader and kernel images, you only have to create the partitions and
> >> the fatfs and pull everything together into a single image.
> >
> > So, you said the same as me: Buildroot (without external tools) can
> > not generate more than one *filesystem* image (ext2, tar, whatever).
> >
> 
> Hi Yann,
> 
> Maybe we are talking about different things. I think there is a config
> option in buildroot that allows you to build multiple output
> filesystems, I believe I have created ext4 and a tar.gz as outputs. I
> think there are also various flash file systems you can create.

Indeed, we're not speaking the same. Yes, Buildroot can generate different
filesystem images with the *same* content.

I am trying to address the case where different parts of the filesystem
hierarchy have to be stored in different filesystems, because they have
to be in different partitions.

For example, on the Raspberry Pi, we have to have:
  - the first partition must be vfat and must contain the few binary
    blobs (bootloader and config for the GPU, the Linux kernel and its
    command line)
  - the rest of the filesystem hierarchy can be whatever (eg. an extN
    filesystem for / on the second partition, and another one for /home
    on yet a third partition)

Buildroot can not handle this case, which is the one I want to address
if it makes sense.

> They do all contain the identical built rootfs, so for raspberry pi
> where for now you want the first boot partition to be fat and the rest
> ext4,  buildroot does not build both of them. However the images are
> correctly made and can easily be installed by the user manually or via
> a script. Building for instance the boot fat file system does not make
> much sense, you still need to somehow install the built stuff onto
> flash. Doing an install is highly developer specific (and frequently
> requires manual insertion of flash etc), and I don't think should be
> part of the the BR make system.

The reason for wanting to include such a feature in Buildroot is to
keep Buildroot ximple to use for the *end-user*, not necessarily for
the Buildroot developpers. A little bit of complexity in the Buildroot
Makefiles and script is OK if it makes for an smoother user experience.

And if you have those files in images/ :
  - images/boot-vfat.img
  - images/root-squahfs.img
  - images/home-ext2.img

Then it is a matter of running (/dev/sdX is the sd-card):
  - dd if=images/boot-vfat.img of=/dev/sdX1
  - dd if=images/root-squashfs.img of=/dev/sdX2
  - dd if=images/home-ext2.img of=/dev/sdX3

This is much simpler from an end-user perspective, than having to write
a script that extracts images/root.tar, splits the extracted stuff, calls
the corresponding genXXXfs. And not forgetting to run that script via
fakeroot to not lose the special files and the permissions...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
