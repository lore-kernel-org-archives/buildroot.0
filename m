From: Barney Barumba <barney.b@iname.com>
Date: Thu, 28 May 2009 17:19:54 +1000
Subject: [Buildroot] Illegal instruction with buildroot busybox for ARM
	DNS323
Message-ID: <20090528071954.43F938735C@cal1-1.us4.outblaze.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build a buildroot/busybox system for a DLink DNS323 (1), and
I'm getting an "Illegal instruction" error when I run busybox.

For my first attempt I:

- downloaded buildroot-2009.05-rc3
- configured this for a generic ARM EABI
- built the toolchain and busybox with the default busybox configuration
- ran "make busybox-menuconfig" to build busybox as a static library
- rebuilt busybox
- built an initramfs image of the root file system

- downloaded a Debian ARM netboot image (2)
- extracted the kernel .config file
- downloaded the vanilla 2.6.30-rc7 kernel source
- built a kernel using the buildroot toolchain

- converted both the initramfs and kernel to uboot images
- sent them to the DNS323 over a serial line
- booted it

At this point, the kernel would fire up and dump it's startup messages to
the console attached to the serial line, but when it attempted to run the
init script on the initramfs (which just dropped to a busybox shell) it
would fail with the "Attempting to kill init" message.

So then I:

- expanded the initramfs from the Debian netboot image
- fixed the init script to drop to a shell using the Debian built busybox
- added the buildroot built busybox (busybox-br) alongside the Debian one
- rebuilt the initramfs and uboot image
- sent this to the DNS323 and boted with the same kernel as before

This then dropped into a working shell, provided by the Debian busybox
(built with glibc, if that matters). From there, I could run the buildroot
busybox to see what was going on.

For simple commands, such as "/bin/busybox-br ls" this worked perfectly, but
trying more complicated commands, such as "/bin/busybox-br sh" failed with 
the "Illegal instruction" error.

I also get exactly the same problem with buildroot-2009.02.

So I'm hoping this is as simple as a problem with my toolchain config files
for the DNS323. Has anyone built a target system for this platform, and have
a config file they could share? Or is there some other point I'm missing
here somewhere?

Any help is much appreciated, as I've been trying to get this working for
quite some time now, and it looks like there's just this final hurdle to
getting it all working.

Cheers,

Barney

(1) http://wiki.dns323.info/
(2) http://www.cyrius.com/debian/orion/d-link/dns-323/install.html



-- 
Be Yourself @ mail.com!
Choose From 200+ Email Addresses
Get a Free Account at www.mail.com
