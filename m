From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Fri, 10 Jul 2015 14:58:28 -0400
Subject: [Buildroot] Buildroot for STM32F4 with Nuttx kernel
In-Reply-To: <20150710101923.67e70822@free-electrons.com>
References: <CAOudHSXE+XrCKsi=bT+XjfTUhU3W9YiW=MjjJN2t9KEX8nzh-Q@mail.gmail.com>
 <20150710101923.67e70822@free-electrons.com>
Message-ID: <CAOudHSXAdOsTde2Zi3YCcwVX1mbaoGpPVpfrd0tK+wYDannezQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

So, there seems to be some confusion with the filesystem. I suspect
this will answer a few questions. I modified Nuttx so you can add a
romfs image when you build the kernel. This romfs image will
automatically get mounted when nuttx starts. (It isn't mounted as root
yet, but one problem at a time). This is why I have genromfs, this is
why I have the extra step after generating the filesystem, and why
there is the tiny skeleton. It is designed so that a package could be
installed into the filesystem, and then Nuttx could run it.

Also, sorry, there are still some random fragments in there debugging
when I was trying to get everything to work. Deadlines...

> Hello,
>
> On Thu, 9 Jul 2015 17:40:10 -0400, Cjw X wrote:
>
> > I modified buildroot to create a distribution for the STM32F4 processor.
> > (It should be fairly portable to different Cortex-M processors though, the
> > STM32F4 is the only one I've tested so far).
> >
> > So far it:
> > Builds the toolchain
> > Builds a modified Nuttx RTOS
> > Builds the icsp tools for programming and debugging (openocd/gdb)
> > It also integrates the filesystem buildroot generates into the Nuttx kernel
> > so it shows up in Nuttx's filesystem.
> >
> > It still has a ways to go, but right now it builds everything and works on
> > my hardware.
> > So far I've tested it on hardware I built, and on the STM32F407 discovery
> > board with the attached baseboard.
> >
> > You can find instructions here http://www.vxmdesign.com/STM32.html
> > The git repo is https://github.com/vxmdesign/prjpluto.git and
> > vdsc_defconfig is the config for the discovery board.
>
> Thanks for posting this! I had a look at the github repository, and I'm
> actually nicely surprised to see that the changes are not that big to
> make things work. Of course, there are some crude things here and there
> that would need to be addressed, but overall it doesn't seem
> completely crazy.
>
> I think the biggest question for me is whether it makes sense to have
> all this in Buildroot. On the one hand, I do understand the benefit of
> using Buildroot: all the toolchain logic is there, the logic to build
> packages is there, the menuconfig infrastructure makes things easy, etc.
>
> On the other hand, the biggest value of Buildroot is really in the
> "Target packages", and here none of them are usable because they are
> all Linux-specific.
>
> Do you think it would be possible to re-organize your patches into
> cleaner patches, at least having one patch for each "topic" rather than
> seeing all the history of your attempts/fixes, etc? It would make the
> review easier.
>
> A few comments/questions:

>
>  * I'm not a big fan of the BR2_ROOTFS_SKELETON_TINY thing, at least in
>    the way it's implemented with a separate $(BUILD_DIR)/.tiny target.
This is related to the filesystem thing

>
>  * Adding TARGETS to the os-release file seems a bit
>    unnecessary/unrelated to the change.
With was for debugging, it is unnecessary

>
>  * Can you explain why you need this new TARGETS_POST thing? Is it
>    something that needs to be called *after* the images have been
>    generated? Can you explain a bit what is happening in the nuttx
>    package at this stage?
This is part of the filesystem thing

>
>  * If there is a filesystem, is there a way of building certain
>    third-party applications? If so, which ones?
Yes, you can install third party application. Nuttx is pretty close to
being posix complient from what I can tell. There is still work to be
done, but I had this in mind when I was designing it.

>
>  * The pluto_defconfig should be re-generated using savedefconfig, to
>    make the patch smaller.
Fixed already

>
>  * In fs/common.mk, any reason to not call makedevs? You could for
>    example use an empty device table, that would probably be more
>    logical.
/dev is similar in Nuttx, it contains the system devices. However,
Nuttx's psuedofilesystem doesn't handle it the same way as linux. This
is a big part of the problem with mounting romfs as root right now.

>
>  * I like how Linux and NuttX are seen as two distinct operating
>    systems.
Thanks!

>
>  * Make sure to remove trailing whitespace everywhere.
>
>  * Add the usual comment header in nuttx.mk.
>
>  * Don't put host-gcc-final in NUTTX_DEPENDENCIES, this is not needed.
>    nuttx is a target package, so it automatically depends on the
>    'toolchain' package, which depends on 'toolchain-buildroot', which
>    depends on 'host-gcc-final'.
>
>  * Remove unneeded empty lines.
>
>  * Use $(INSTALL) -D -m 0644 to install the nuttx image.
>
>  * Put the nuttx image installation in NUTTX_INSTALL_IMAGES_CMDS and
>    not NUTTX_INSTALL_TARGET_CMDS. You will have to set
>    NUTTX_INSTALL_IMAGES = YES to make this work.
>
I can take care of all those easily enough.

>  * The nuttx_install_image thing in TARGETS_POST is a bit annoying. I
>    think we need to understand this a bit better to see how to
>    implement this nicely.
>
I completely agree. I spent some time looking into this, but I
eventually had to use a less than ideal solution because of time
constraints for the project.

>  * Why do you need genromfs in menuconfig?
>
For the filesystem.

>  * In package/Makefile.in, I don't think you need to have a special
>    GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(ABI) for newlib.
>    $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI) should would
>    work fine, as long as LIBC is empty, no?
>
>  * In binutils.mk, removing the --disable-sim and --disable-gdb options
>    will require some other solution. Why are you doing this in the
>    first place?
>
>  * Enabling --enable-interwork when newlib is enabled does not make
>    sense, it needs to be related to some other option. Also, isn't
>    interwork only to make ARM and Thumb code cohabit? So on ARMv7 which
>    uses Thumb-2, this should be unnecessary. Why are you using this?
>
>  * In gcc-final.mk, according the -mthumb -march=armv7-m flags
>    definitely won't work in a generic way.
>
>  * Why do you need --disable-libstdcxx-pch ? This also needs to be made
>    conditional on something.
>
>  * Ditto gcc.mk: some explanation about the different changes are
>    needed, and they need to be reworked to be generic (i.e continue to
>    work with something else than your use case).
>
Getting gcc to build correctly took a very long time. There were a lot
of modifications, (and I'm sure there are a few things that are
unnecessary), and unfortunately, I don't remember the answers to all
of those questions. I'd be happy to look into if there is interest.
This sections alone probably requires its own very long email.

>  * newlib.mk should be using autotools-package instead of
>    generic-package.
>
>  * NEWLIB_APPLY_PATCHES is unneeded, applying patches is done
>    automatically by Buildroot. See
>    http://buildroot.org/downloads/manual/manual.html#patch-policy.
>
>  * Remove commented code in newlib.mk.
>
>  * The newlib patches should be named 0001-....patch and 0002-...patch,
>    carry a description and Signed-off-by.
I'll look into it.

>
>  * The OpenOCD bump to 0.8.0 has been merged in Buildroot, so if you
>    rebase your patch on top of the latest Buildroot, you won't have to
>    carry these changes.
Awesome!

>
>  * How is uClibc++ used compared to libstdc++ from gcc? Does it simply
>    overwrites the libstdc++ library installed by gcc? Is it only usable
>    with newlib?
uClibc++ is designed as an alternative to libstdc++ for a smaller
footprint. (The STM32F4 has 1MB-2MB of flash depending on device) I'd
be surprised if it was only usable with newlib, I'd guess you could
use it with uclibc as well, though I haven't looked into it. Debugging
this was not fun. Even the default Nuttx doesn't handle this
correctly.

>
>  * We should make sure that the user cannot enable Linux-only packages
>    when NuttX is selected.
>
I agree

> All in all, I think if we want to start merging that we should start by
> merging the support for building a newlib based toolchain, that's quite
> certainly the first step.
I would also agree.

>
> Are you interested in pushing this up to the point where it becomes
> clean enough to be merged in the official Buildroot?
Yes! I know there are plenty of hacks in what I have now that need to
get ironed out. (My Nuttx build has plenty more). I've used Buildroot
for years to create many embedded Linux systems. (I have another
all-in-one build for the Zynq Microzed on my github too). I created
this mod for some STM32F4 hardware I built because I wanted it to meet
my standards for quality embedded development.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

Happy programming!
-Chris
