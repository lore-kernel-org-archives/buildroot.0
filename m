From: Allen Shockley <ashockley@consumerengineering.com>
Date: Tue, 10 Oct 2006 11:33:26 -0400
Subject: [Buildroot] Freescale i.mx Arm serial port cramfs and mdev
Message-ID: <a48afea10610100833y775e1ff6t6e3b413e704b0156@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To the list,

Today is my 34th birthday and I what I want more than anything is some help
with this problem, so I can move on to the hard stuff.

A brief project history.

When using an i.mxl Arm processor and 2.4 Kernel with cramfs root disk, all
was calm and easily configured.

Necessary changes arose after a year and a half, (Specifically a change from
Master I2C to Slave), which I thought would be better undertaken on the
latest branch of the Kernel (and a much better mainline drivers).
I did not like my previous build system. If you call building each piece by
hand on the command line and creating a filesystem, a system.
I looked around and found a couple promising candidates. I settled on
BuildRoot for its simplicity of design and extensibility. (Kudos all around
fellas)
Penguintronix has a similar system ptxdist but its a little to hectic to
parse easily and I'm on a schedule.
After a few initial bad builds i was successful. (Damn that soft-float)

My problems started cropping up pretty early on. Mostly due to the fact that
the i.mx serial port has been redesignated ttySMX0 in the new kernel tree.
Bummer can't open tty1
Bummer can't open tty2
Bummer can't open tty3

I decide to go with the flow of things and work through it step by step.
which has led me through alternating between the above output repaeting
nonstop or
Can't open intitial console.

I hated the enormity of the /dev directory. Slowly I was able to piece
enough information together to decide that udev is not very apealing, but
mdev sounds nice. So for around about 10 days I have been playing chicken
and the egg on a ro filesystem trying to uncover the secret on how to
populate the /dev entry for the initial console and still mount it in ram
(tmpfs) to use mdev -s to fill it with devices found in /sys.

If I comment out the device table entries pointing to /dev, I have no
console. If I populate it with the barest essentials needed for console, I
have no way to mount it as tmpfs.
The obvious solution is to mount it then add bare essentails and then use
mdev. I believe this would work if I was using a standard serial port but
right now I'm stuck trying to get it to see ttySMX0 again.

I am absolutely sure I am missing a very small detail somewhere but cannot
find it.

Any thoughts, or direction where I can get more information are welcomed.
Even suggestions that I'm being foolhardy for implementing mdev in a fixed
embedded system that never changes. I considered this, but there is an
attraction to the idea of the kernel filing the /dev entry over hard coding
the root disk device entries. I'd hate for it to lead to this problem on the
next kernel change.

I can post configs and copies of the device table and inittab and others if
you need it. (Unfortunately, I am building inside a VM and I'm away from it
now.)

Allen Shockley
ashockley at consumerengineering.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061010/c985faf1/attachment.htm 
