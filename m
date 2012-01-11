From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 11 Jan 2012 08:04:26 -0600
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <20120111090228.GA3269@krikkit>
References: <20120111090228.GA3269@krikkit>
Message-ID: <201201110804.29267.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed January 11 2012, Paul Kuntke wrote:
> Hi to all,
> I'm very new to buildroot and building Initrds and I would like to set up a
> minimalistic environment for booting PCs (i386) over PXE. 
> 
> For this I would like to set up a Kernel and an initrd as System-Filesystem.
> After everything was build fine I wanted to test the environment. But every
> tries ended in a Kernel-Panic moaning about no /init to find. I've also tried
> to set the "init" kernel-parameter to /bin/busybox. But even then it is not
> able to start /bin/busybox. 
> 
> As testing environment I tried qemu as well as some real PCs with syslinux
> over PXE. 
> 
> Kernel-Parameters I've tried: "root=/dev/ram init=/init" 
>

Try: rdinit=/bin/sh (or rdinit=/bin/bash) -
One or the other should be there, either in person or by a sym-link to BB.

That should give you an interactive shell, after early user-space is loaded,
but before anything of its scripting is executed.

You probably will not get far until you mount /proc and /sys ;-)

If your Busybox isn't optioned as a standalone shell and the application
links do not pre-exit, use the direct access:
'/bin/busybox ap-name options' form (such as for 'mount' command).

With /proc and /sys mounted...

If BB isn't configured as a stand-alone shell, and the application links
do not pre-exist, the links can be populated with:
/bin/busybox --install
(You may need to make /sbin, /usr/bin, /usr/sbin - depending on your image.)

If the image and kernel wasn't optioned to populate /dev @ devtmpfs, and you
have mdev available (and /sys mounted), you can populate that with:
mdev -s

At which point you should have a fairly functional, ram resident, shell
and tool environment with which to discover what is going wrong.

Mike
> As Initrd I tried to use the bzImage with the build in initrd-image as well as
> the rootfs.cpio.bz2 or rootfs.cpio.
> 
> Do I have to set some special Kernel-Params or do I have to set some special
> options in the buildroot config?
> 
> Thanks,
>  Paul
> 
