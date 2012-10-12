From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 09:30:32 +0200
Subject: [Buildroot] post-buil script in chrooted
In-Reply-To: <5077A820.7050202@free.fr>
References: <5077A820.7050202@free.fr>
Message-ID: <20121012093032.7ef6b972@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Bonnin,

On Fri, 12 Oct 2012 07:18:24 +0200, David Bonnin wrote:

> Few ask in finalise target:
> 1- to do root task, i can only use permission: target in each 
> packages..........

Not sure I understand this part.

> CAN i use a "root script" in chrooted mode?
> ROOTFS_POST_BUILD_SCRIPT is not executed chrooted in the target.

No because it doesn't make sense. Buildroot is used in many cases for
cross-compilation, so the development machine is x86 or x86_64 and the
target filesystem contain ARM, PowerPC or MIPS binaries. So chrooting
into it is not possible (unless we use Qemu or something like that, but
it's not the idea of Buildroot, we want to do cross-compilation).

> 2-
> why rootfs targets are generated 2 times?   (in my case: rootfs.tar
> and rootfs.ubifs)
> Generate 1 time and then generate tar and UBIFS is quicker.....so why?

Well, this is exactly what Buildroot is doing:

 1) It generates your root filesystem in output/target

 2) At the end of the build it uses the contents of output/target to
    create the different root filesystem images you requested. So if
    you requested a tarball image and an UBIFS image, it is going to
    call tar inside fakeroot to create the tarball image using the
    contents of output/target, and then mkfs.ubifs inside fakeroot to
    create the UBIFS image using the contents of output/target.

Hope this helps,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
