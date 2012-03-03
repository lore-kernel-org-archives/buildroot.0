From: PHilip RUshik <prushik@gmail.com>
Date: Sun, 4 Mar 2012 04:52:58 +0900
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
 device (flash drive)
In-Reply-To: <201203022300.01500.arnout@mind.be>
References: <jio6ql$25v$1@dough.gmane.org> <20120301175921.5811b398@skate>
 <201203022300.01500.arnout@mind.be>
Message-ID: <CAGmOteNfhZcK3N8taTC6ipOpAWbH9Y2rOmSXEBk3W-J3vyEYqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 3, 2012 at 8:00 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

> On Thursday 01 March 2012 16:59:21 Thomas Petazzoni wrote:
> > You need to run grub so that it installs itself on your /dev/sdc
> > device. Something like:
> >
> > printf "device (hd0) /dev/sdc\nroot (hd0,0)\nsetup (hd0)\nquit\n" |
> output/staging/sbin/grub --device-map=/dev/null --no-floppy
> >
> > Let us know if that works. We should certainly extend the documentation
> > with more details about this.
>
>  It probably won't work if your target is uclibc-based (unless your host
> happens to be uclibc-based as well :-).  You'd need a host-grub to get
> that right.  I tried to do that half a year ago, but it wasn't so easy -
> unfortunately I don't remember why not.  Could be a problem with 32/64 bit.
> Or with ccache.
>

What you could do is use qemu to get your bootloader installed. I typically
use lilo for uclibc images, so I don't know the exact commands, but
basically get the grub source code or binary on your image, then copy the
kernel and initrd (if you have one) onto you host system, then start qemu
using your flash drive as qemu's hard drive and use the -kernel and -append
options on qemu. Then once it boots and you log in, just install grub as
you would if you were installing it on your hard drive, since qemu will
make it look like your flash drive is a hard drive.

the command to star qemu would look something like this:
qemu-system-x86_64 -kernel ./vmlinux -append "root=/dev/sda1" -hda /dev/sdc

make sure /dev/sdc* is NOT mounted anywhere else when you do this or else
it could get corrupted pretty bad.



 --PHil

I'm sending it to the mailing list this time :-P
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120304/ef9a9bec/attachment.html>
