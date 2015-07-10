From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 10:19:23 +0200
Subject: [Buildroot] Buildroot for STM32F4 with Nuttx kernel
In-Reply-To: <CAOudHSXE+XrCKsi=bT+XjfTUhU3W9YiW=MjjJN2t9KEX8nzh-Q@mail.gmail.com>
References: <CAOudHSXE+XrCKsi=bT+XjfTUhU3W9YiW=MjjJN2t9KEX8nzh-Q@mail.gmail.com>
Message-ID: <20150710101923.67e70822@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jul 2015 17:40:10 -0400, Cjw X wrote:

> I modified buildroot to create a distribution for the STM32F4 processor.
> (It should be fairly portable to different Cortex-M processors though, the
> STM32F4 is the only one I've tested so far).
> 
> So far it:
> Builds the toolchain
> Builds a modified Nuttx RTOS
> Builds the icsp tools for programming and debugging (openocd/gdb)
> It also integrates the filesystem buildroot generates into the Nuttx kernel
> so it shows up in Nuttx's filesystem.
> 
> It still has a ways to go, but right now it builds everything and works on
> my hardware.
> So far I've tested it on hardware I built, and on the STM32F407 discovery
> board with the attached baseboard.
> 
> You can find instructions here http://www.vxmdesign.com/STM32.html
> The git repo is https://github.com/vxmdesign/prjpluto.git and
> vdsc_defconfig is the config for the discovery board.

Thanks for posting this! I had a look at the github repository, and I'm
actually nicely surprised to see that the changes are not that big to
make things work. Of course, there are some crude things here and there
that would need to be addressed, but overall it doesn't seem
completely crazy.

I think the biggest question for me is whether it makes sense to have
all this in Buildroot. On the one hand, I do understand the benefit of
using Buildroot: all the toolchain logic is there, the logic to build
packages is there, the menuconfig infrastructure makes things easy, etc.

On the other hand, the biggest value of Buildroot is really in the
"Target packages", and here none of them are usable because they are
all Linux-specific.

Do you think it would be possible to re-organize your patches into
cleaner patches, at least having one patch for each "topic" rather than
seeing all the history of your attempts/fixes, etc? It would make the
review easier.

A few comments/questions:

 * I'm not a big fan of the BR2_ROOTFS_SKELETON_TINY thing, at least in
   the way it's implemented with a separate $(BUILD_DIR)/.tiny target.

 * Adding TARGETS to the os-release file seems a bit
   unnecessary/unrelated to the change.

 * Can you explain why you need this new TARGETS_POST thing? Is it
   something that needs to be called *after* the images have been
   generated? Can you explain a bit what is happening in the nuttx
   package at this stage?

 * If there is a filesystem, is there a way of building certain
   third-party applications? If so, which ones?

 * The pluto_defconfig should be re-generated using savedefconfig, to
   make the patch smaller.

 * In fs/common.mk, any reason to not call makedevs? You could for
   example use an empty device table, that would probably be more
   logical.

 * I like how Linux and NuttX are seen as two distinct operating
   systems.

 * Make sure to remove trailing whitespace everywhere.

 * Add the usual comment header in nuttx.mk.

 * Don't put host-gcc-final in NUTTX_DEPENDENCIES, this is not needed.
   nuttx is a target package, so it automatically depends on the
   'toolchain' package, which depends on 'toolchain-buildroot', which
   depends on 'host-gcc-final'.

 * Remove unneeded empty lines.

 * Use $(INSTALL) -D -m 0644 to install the nuttx image.

 * Put the nuttx image installation in NUTTX_INSTALL_IMAGES_CMDS and
   not NUTTX_INSTALL_TARGET_CMDS. You will have to set
   NUTTX_INSTALL_IMAGES = YES to make this work.

 * The nuttx_install_image thing in TARGETS_POST is a bit annoying. I
   think we need to understand this a bit better to see how to
   implement this nicely.

 * Why do you need genromfs in menuconfig?

 * In package/Makefile.in, I don't think you need to have a special
   GNU_TARGET_NAME = $(ARCH)-$(TARGET_OS)-$(ABI) for newlib.
   $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI) should would
   work fine, as long as LIBC is empty, no?

 * In binutils.mk, removing the --disable-sim and --disable-gdb options
   will require some other solution. Why are you doing this in the
   first place?

 * Enabling --enable-interwork when newlib is enabled does not make
   sense, it needs to be related to some other option. Also, isn't
   interwork only to make ARM and Thumb code cohabit? So on ARMv7 which
   uses Thumb-2, this should be unnecessary. Why are you using this?

 * In gcc-final.mk, according the -mthumb -march=armv7-m flags
   definitely won't work in a generic way.

 * Why do you need --disable-libstdcxx-pch ? This also needs to be made
   conditional on something.

 * Ditto gcc.mk: some explanation about the different changes are
   needed, and they need to be reworked to be generic (i.e continue to
   work with something else than your use case).

 * newlib.mk should be using autotools-package instead of
   generic-package.

 * NEWLIB_APPLY_PATCHES is unneeded, applying patches is done
   automatically by Buildroot. See
   http://buildroot.org/downloads/manual/manual.html#patch-policy.

 * Remove commented code in newlib.mk.

 * The newlib patches should be named 0001-....patch and 0002-...patch,
   carry a description and Signed-off-by.

 * The OpenOCD bump to 0.8.0 has been merged in Buildroot, so if you
   rebase your patch on top of the latest Buildroot, you won't have to
   carry these changes.

 * How is uClibc++ used compared to libstdc++ from gcc? Does it simply
   overwrites the libstdc++ library installed by gcc? Is it only usable
   with newlib?

 * We should make sure that the user cannot enable Linux-only packages
   when NuttX is selected.

All in all, I think if we want to start merging that we should start by
merging the support for building a newlib based toolchain, that's quite
certainly the first step.

Are you interested in pushing this up to the point where it becomes
clean enough to be merged in the official Buildroot?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
