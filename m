From: Rob Landley <rob@landley.net>
Date: Tue, 10 Oct 2006 17:33:08 -0400
Subject: [Buildroot] Freescale i.mx Arm serial port cramfs and mdev
In-Reply-To: <a48afea10610100833y775e1ff6t6e3b413e704b0156@mail.gmail.com>
References: <a48afea10610100833y775e1ff6t6e3b413e704b0156@mail.gmail.com>
Message-ID: <200610101733.08959.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 10 October 2006 11:33 am, Allen Shockley wrote:
> I hated the enormity of the /dev directory. Slowly I was able to piece
> enough information together to decide that udev is not very apealing, but
> mdev sounds nice. So for around about 10 days I have been playing chicken
> and the egg on a ro filesystem trying to uncover the secret on how to
> populate the /dev entry for the initial console and still mount it in ram
> (tmpfs) to use mdev -s to fill it with devices found in /sys.

Well, as the author of mdev I find it fairly straightforward to use, but I 
would, wouldn't I? :)

Just add a /dev/console to initramfs, then overmount /dev with a tmpfs 
(mount -t tmpfs /dev /dev), populate it with mdev (mount -t sysfs /sys /sys; 
mdev -s), and then if you're going to switch_root to another filesystem do a 
mount --move /dev new/dev (and either umount /sys or --move it too).

Your initramfs needs a /dev/console for the kernel to open stdin/stdout/stderr 
for init before it can exec pid1, but you don't need that after init is 
running.  I wouldn't bother to delete it either, switch_root should do that 
for you if you remove the overmount.  (Unless you're not going to call 
switch_root, in which case an rm statement in your init script is probably 
slightly bigger than the amount of memory you'll save by doing so. :P )

> If I comment out the device table entries pointing to /dev, I have no
> console. If I populate it with the barest essentials needed for console, I
> have no way to mount it as tmpfs.

A) You only need the one entry, which is two initramfs entries (one to 
create /dev and one to create /dev/console).

B) Just overmount it.

Or if you're staying with initramfs just call mdev -s, which doesn't mind a 
node it's trying to create already exists.

> The obvious solution is to mount it then add bare essentails and then use
> mdev. I believe this would work if I was using a standard serial port but
> right now I'm stuck trying to get it to see ttySMX0 again.

I don't know if the "console=" command line parsing actually needs a /dev 
entry in initramfs for the device you point it at.  I don't think it does, 
that would be in the linux kernel source's init directory, I think.

> I am absolutely sure I am missing a very small detail somewhere but cannot
> find it.

What exactly are you currently trying to do?

> Any thoughts, or direction where I can get more information are welcomed.

Ask me. :)

> Even suggestions that I'm being foolhardy for implementing mdev in a fixed
> embedded system that never changes.

Nah, that's part of what it's for.  It's small and simple.

> I considered this, but there is an 
> attraction to the idea of the kernel filing the /dev entry over hard coding
> the root disk device entries. I'd hate for it to lead to this problem on the
> next kernel change.

Yahtzee.  Bingo.  That sort of thing.

> I can post configs and copies of the device table and inittab and others if
> you need it. (Unfortunately, I am building inside a VM and I'm away from it
> now.)

Feel free.  In general mdev just looks at /sys and does a lot of mknods 
in /dev.  Setting up partitions and stuff is the caller's problem...

> Allen Shockley
> ashockley at consumerengineering.com

Rob
-- 
"Perfection is reached, not when there is no longer anything to add, but when 
there is no longer anything to take away." - Antoine de Saint-Exupery
