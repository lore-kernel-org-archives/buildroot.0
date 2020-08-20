From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Aug 2020 18:42:09 +0200
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <20200425120825.GP5035@scaer> (Yann E. MORIN's message of "Sat,
 25 Apr 2020 14:08:25 +0200")
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
 <20200425120825.GP5035@scaer>
Message-ID: <878se9z2u6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Timo, All,
 > On 2019-09-23 10:58 +0000, Timo Ketola spake thusly:
 >> When booting with 'console=<empty>' in the kernel command line (as e.g.
 >> U-Boot does with silent flags in effect), opening /dev/console fails.
 >> That is fatal in the /init script and kernel will panic. It is also
 >> needless, because the kernel tries to open it anyway (well, as long as
 >> we have console node in initramfs /dev; cpio.mk creates that alright).
 >> 
 >> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

 > I've applied to master, after extending the commit log with all the gory
 > details explaininng why we can indeed safely remove those redisrections
 > now.

 > Thank you for the patience on this patch.

 > Thanks also to Peter for helping on IRC about this research.

It unfortunately causes a regression :/

I have a setup booting from an initramfs, using devtmpfs, busybox init
and glibc. One of the initscripts used ttyname_r(3) (through the busybox
tty applet), and with this change ttyname_3() fails rather than
returning /dev/console.

Looking at the glibc code, it does a fstat on fd(0), and then compares
st_ino / st_dev (and optionally st_rdev) against all the entries under
/dev.

As the kernel does not mount devtmpfs for us, fd 0 refers to the
/dev/console entry in the rootfs (cpio), but after devtmpfs is mounted,
/dev/console is the entry in the devtmpfs so st_dev / st_ino will no
longer match :/

This logic seems to be added to support containers. See the following
glibc commit:

commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
Author: Christian Brauner <christian.brauner@canonical.com>
Date:   Fri Jan 27 15:59:59 2017 +0100

    linux ttyname and ttyname_r: do not return wrong results

    If a link (say /proc/self/fd/0) pointing to a device, say /dev/pts/2, in a
    parent mount namespace is passed to ttyname, and a /dev/pts/2 exists (in a
    different devpts) in the current namespace, then it returns /dev/pts/2.
    But /dev/pts/2 is NOT the current tty, it is a different file and device.

    Detect this case and return ENODEV.  Userspace can choose to take this as a hint
    that the fd points to a tty device but to act on the fd rather than the link.

    Signed-off-by: Serge Hallyn <serge@hallyn.com>
    Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>


Notice: Once logged in, tty does work correctly. Presumably login
reopens stdin/stdout/stderr.

Any great ideas about how we can fix this? I would prefer to not add a
lot of logic in /init, so preferably not having to mount /proc and so
on. If we don't have a good solution, what then? Do we revert or keep it
like this?

-- 
Bye, Peter Korsgaard
