From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 11 Feb 2013 21:11:52 +0000 (UTC)
Subject: [Buildroot] kernel drivers
References: <1360613608.96975.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <kfbmqn$im$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-02-11, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:

> What I would like to know is how can I incorporate some new kernel
> driver (having it's source) into kernel build?

IMO, the easiest way to work on kernel stuff is to not use buildroot
to build the kernel.  I do my kernel development outside of buildroot.
[There have probably been recent changes I don't know about that make
kernel development using buildroot easier, but it used to be a bit
awkward.] When you are finished testing your kernel changes, you can
do one of two things:

 1) Combine your kernel with the root filesystem built by buildroot.
    If you're using U-Boot, this is trivial: you can create a "multi"
    uImage file (outfile.uImage) that contains the kernel image
    (vmlinuz) and the root filesystem image (rootfs.cpio.gz):

      mkimage -A arm -O Linux -T multi -C none -n "My kernel+rootfs image" -d zImage:rootfs.cpio.gz outfile.uImage

 2) Zip up the modified kernel sources and configure buildroot to use them
    to build your "production" kernel along with your rootfs.

> First, where should I put it in kernel source tree, then can I
> compile it independently, without rebuilding whole kernel (I imagine
> modules can do the job)?

You can either develop it as a module or as an in-kernel driver.  In
either case, you don't have to rebuild the whole kernel when you make
changes to your driver.

If you develop it in-kernel when you modify your driver you _will_
have to recompile it and re-link the kernel (e.g. "make vmlinuz") and
then reboot to try out the new kernel.

If you develop it as a module, you can unload/reload the module to do
your testing.  To save on resources, many embedded systems don't
support module loading/unloading (it's your memory, your choice).

> How can I compile it as a module or to be more precise, do I write
> driver in some special way to be a module?

Yes, drivers that are to be buildable as modules have to be written in
a special way.  But, the extra code required to be module is simple
and it's not difficult to do.

Some of these references are getting a bit old, but still have a lot
of good info.  Also don't foreget about /usr/src/linux/Documentation.

http://lwn.net/Kernel/LDD3/
http://www.amazon.com/Linux-Device-Drivers-3rd-Edition/dp/0596005903
http://www.amazon.com/Linux-Kernel-Development-3rd-Edition/dp/0672329468
http://www.amazon.com/Writing-Linux-Device-Drivers-exercises/dp/1448672384
http://www.amazon.com/Essential-Device-Drivers-Sreekrishnan-Venkateswaran/dp/0132396556
http://www.linuxforu.com/tag/linux-device-drivers/
http://oldpapyrus.wordpress.com/2012/04/29/writing-linux-device-driver-tutorials/

-- 
Grant Edwards               grant.b.edwards        Yow! hubub, hubub, HUBUB,
                                  at               hubub, hubub, hubub, HUBUB,
                              gmail.com            hubub, hubub, hubub.
