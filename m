From: Trent Piepho <tpiepho@impinj.com>
Date: Mon, 12 Mar 2018 17:24:22 +0000
Subject: [Buildroot] Is there a way to automatically detect the minimum
 required BR2_TARGET_ROOTFS_EXT2_SIZE?
In-Reply-To: <CAFXrp_dVR_5HHbQySfnyXh_bpY_6-YiyT40msj-b7us-8PotMg@mail.gmail.com>
References: <CAFXrp_exNc=GtVqbuRmYqKiDNXgD+pawnCSmRH-1FrF2dxXgLQ@mail.gmail.com>
 <20180310205841.GA2097@scaer>
 <CAFXrp_dVR_5HHbQySfnyXh_bpY_6-YiyT40msj-b7us-8PotMg@mail.gmail.com>
Message-ID: <1520875461.10662.8.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-03-11 at 09:57 +0000, Ciro Santilli wrote:
> On Sat, Mar 10, 2018 at 8:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Ciro, All,
> > 
> > On 2018-03-10 16:14 +0000, Ciro Santilli spake thusly:
> > > https://stackoverflow.com/questions/49211241/is-there-a-way-to-automatically-detect-the-minimum-required-br2-target-rootfs-ex
> > > 
> > > I'm when making a big non-embedded image, I keep hitting the error:
> > > 
> > >     *** Maybe you need to increase the filesystem size
> > > (BR2_TARGET_ROOTFS_EXT2_SIZE)
> > > 
> > > and then I have to do a `du` on `output/target` to find out how big I
> > > have to make `BR2_TARGET_ROOTFS_EXT2_SIZE`.
> > > 
> > > Is there a way to automate this, or a decent workaround?
> > 
> > No, becaaue it is not reliable, see commit:
> > 
> >     c6bca8cef fs/ext2: Remove support for auto-calculation of rootfs size
> > 
> > In the end, it does nto make sense to do auto-calculation, because on an
> > embedded device, you have to now the layout and size of your storage.
> > So, you know what size you want your ext filesystem to be.

The code that buildroot was using the guess the size was pretty simple.
 If you are willing to attempt more complex designs, it is possible to
be a lot more reliable. At least ext2 based filesystems.  Something
like reiserfs that merged tails would be pretty hard.

Another way to get a minimal ext2 image is to converge on the necessary
size by repeatedly generating the fs.  Since you can get the number of
free blocks, it's possible to arrive at the exact minimum after 2 or 3
iterations.

Since the advent of initramfs and it replacing ext2 ramdisk images,
this isn't as useful.  If you need to make the fs as small as possible,
use initramfs or squashfs.
