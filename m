From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 13:59:22 +0200
Subject: [Buildroot] asking for advice on improving our buildroot setup
In-Reply-To: <1310033360.2076.18.camel@sven>
References: <1310033360.2076.18.camel@sven>
Message-ID: <20110707135922.5b7ff449@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

Thanks for your feedback on this, it is really interesting to see how
people are using Buildroot, what are their use cases, and how we could
improve things to match more use cases.

Le Thu, 07 Jul 2011 12:09:20 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> We are building factory images, USB rescue images and update images
> for our Raumfeld evices. In order to do this we need to build, for
> each target platform (2 platforms currently):
> 
>  (1) a kernel and initramfs with some basic tools
>  (2) an ext2 rootfs that contains factory tests as well
>      as tools to format the flash and unpack a tar.gz
>      rootfs on it
>  (3) the actual rootfs of the devices as tar.gz
>      this includes a kernel and modules and this kernel
>      may be different from the kernel built in step 1
> 
> So what we are doing currently is that we are running full independent
> buildroot builds for each of the steps listed above and then build our
> images from the results of those runs. That is we pick up the kernel
> with initramfs from step 1, combine it with the ext rootfs that is
> created in step 2 and add the rootfs.tar.gz from step 3.

I am not sure to understand why (2) and (3) are separate things here.
Can't you just build a single rootfs with all normal production
applications and factory tests, and after the build simply copy the
rootfs and remove factory tests from that copy ?

> (1) Add an initial step that builds a toolchain and then use that
>     toolchain from the following steps. This would save the time
>     to rebuild the toolchain for each of the steps.

You can even remove that step. Either use a pre-compiled toolchain or
build a toolchain once for all with Crosstool-NG and Buildroot. Keep
that toolchain around as a reference, and use it for all your builds.
To me, it really doesn't make any sense rebuilding a toolchain over and
over again: while it is likely that you make multiple changes to your
kernel and rootfs, it is quite unlikely that you do many changes at the
toolchain level. So just generate it once and use it for all your
builds. Of course, keep the recipe use to generate the toolchain
somewhere, so that if you ever need to regenerate the toolchain to make
some modification, you know how to do it.

> (2) Combine all steps and build different rootfs from within the
>     same buildroot tree. I read that this would be supported. But
>     I would like to get advice from you first. Is there a chance
>     that this will work for the described setup?

There is currently no plan in Buildroot to support more than one rootfs
in one build.

To reduce the build time and number of builds, I would:

 *) Generate the toolchain once for all, as detailed above. If your
 root filesystems are quite small, then there is a big chance that 50,
 60 or 70% of the build time is due to the toolchain building.

 *) Combine your (2) and (3) rootfs into one build, if possible (see my
 question above)

 *) If possible, do not generate two different rootfs for your two
 devices, but generate a single rootfs that works on both (of course
 this is only possible if the CPU architecture is the same)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
