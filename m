From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Apr 2016 23:07:23 +0200
Subject: [Buildroot] Cannot build Custom Kernel Module
In-Reply-To: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
References: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
Message-ID: <570D638B.2040500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 20:25, Stephen Beckwith wrote:
> Greetings,
>    After 2 days, I'm still stuck trying to build a kernel module in Buildroot.
> I have an "out of tree" setup, that builds applications and libraries just
> fine.  I get a bootable image.  I even added another "test" module yesterday and
> verified the steps I'm using worked, and that built just fine.  But I'm unable
> to build a kernel module.  I've searched the mailing lists and googled the web
> to no avail.  I've not seen any example that is similar.
>     Buildroot version is 2015.08.01 - and yes, I verified it has the patch for
> the pkg-kernel-module.mk <http://pkg-kernel-module.mk> in the packages directory.
>
>     My kernel module is "local" - in that it's a custom module I'm adding to the
> system to handle specific HW on the board.  So the setup is:
> GPIO_MODULE_VERSION = 0.1.0
> GPIO_MODULE_LICENSE = Public Domain
> GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
> GPIO_MODULE_SITE_METHOD = local
>
> The directory exists and there is a very simple Config.in to select the module
> (from the top level .config file)
> #
> # HWDD Required Kernel Modules
> #
> BR2_PACKAGE_GPIO_MODULE=y
>
> Some questions:
> 1)  Can the module be setup like this?  Locally (to be rsync'd)??

  Sure, shouldn't be a problem.

> 2)  The gpio_module.mk file:  this still contains BUILD_CMDS ??

  It doesn't need to. In that case, the actual build will happen in a post-build 
hook instead of in build_cmds, but that's OK.

> 3)   Do I also need to have a "makefile" present in the directory as well?
>   (some examples seem to indicate yes)

  I think you do need a Kbuild-type Makefile that specifies the objs-m, 
otherwise there is nothing to build.

> 4)   Can I do the same <pkg> - build commands to build this?  (like I would for
> the apps/libraries)

  Yep, the kernel module is built/installed as post-build/install hooks.

>
> My gpio_modules.mk file:

  I hope you mean gpio_module.mk, without s? And the directory is gpio_module?

> ################################################################################
> #
> # gpio_module
> #
> ################################################################################
> GPIO_MODULE_VERSION = 0.1.0
> GPIO_MODULE_LICENSE = Public Domain
> GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
> GPIO_MODULE_SITE_METHOD = local
>
> # Global Includes here
> GBL_INCLUDES = $(BR2_EXTERNAL)/incs/include
> KNL_INCLUDES = $(BR2_EXTERNAL)/incs/include/kernel
>
> GPIO_MODULE_OPTS += -C$(LINUX_DIR)
> GPIO_MODULE_OPTS += M=$(@D) <http://gpio_module.mk>
> CFLAGS += -Wall -Os -DCONFIG_HWDD -I$(GBL_INCLUDES) -I$(KNL_INCLUDES)

  Bad bad bad, this GLOBALLY defines CFLAGS. All variables should always be 
prefixed with your package name.

  But all of this shouldn't be needed, it's already handled by the 
generic-kernel-module infra.

>
> define GPIO_MODULE_BUILD_CMDS
> $(MAKE) $(GPIO_MODULE_OPTS) $(CFLAGS)
> endef
>
> $(eval $(generic-kernel))

  This should be kernel-module, not generic-kernel

> $(eval $(generic-package))

  This _is_ needed.

>
> When I try to do a "-build" on the module (like I do for the apps), I get this
> (from the output directory)
> [sbeckwith at sdb-mbp-vm output]$ make gpio_module-build
> umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
> O=/home/sbeckwith/HBE-1/hwdd/output/. gpio_module-build
> make[1]: *** No rule to make target 'gpio_module-build'.  Stop.
> Makefile:16: recipe for target '_all' failed
> make: *** [_all] Error 2
> [sbeckwith at sdb-mbp-vm output]$
>
> Which tells me somewhere it can't find the makefile or somehow bolt this up to
> the Buildroot build system. . .

  Indeed. Is the .mk file included in $(BR2_EXTERNAL)/external.mk? You put it 
into the modules directory instead of the usual packages directory, so it may 
not be included in your external.mk.

  You can do 'make printvars | grep GPIO_MODULE' to check if it was properly 
included to begin with.

  Regards,
  Arnout


> I suspect it's because of the SITE_METHOD=local
> that maybe causing this issue, am I correct?
> The "rsync" I would normally see is not done, so there's nothing in the
> output/build directory (no gpio_modules directory).
>
> Some pointers/assistance would be greatly appreciated.
>
> Regards,
> Stephen
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
