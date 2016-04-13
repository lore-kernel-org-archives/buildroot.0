From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 13 Apr 2016 10:38:01 -0400
Subject: [Buildroot] Cannot build Custom Kernel Module
In-Reply-To: <570D638B.2040500@mind.be>
References: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
 <570D638B.2040500@mind.be>
Message-ID: <CAN34foxCgoP_i21MRzXiF2DWuT+R9XL9LvKR+NpDYjh1Mga7xw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,
   THANK YOU very much!  The problem wasn't so much an issue with the
$eval, which for the life of me I don't remember where I copied that from
but it was the "missing from external.mk" that solved it!!  Thanks for the
pointer! (sometimes we forget these little steps. . .)
So external.mk now has:
# Does the Kernel Modules first:
include $(sort $(wildcard $(BR2_EXTERNAL)/netapp/kmod*/*.mk))
and the directory is now:  kmod_gpio - along with the associated "ripple
effect" -
The good news is:  Does the Rsync and starts off the build.
I've reduced the kmod_gpio.mk to:
KMOD_GPIO_VERSION = 0.1.0
KMOD_GPIO_LICENSE = Public Domain
KMOD_GPIO_SITE = $(BR2_EXTERNAL)/netapp/kmod_gpio
KMOD_GPIO_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))

And I have a Makefile in the directory that is:

#inform the kernel that a module needs to be build
obj-m :=gpio_module.o

# Global Includes here
GBL_INCLUDES = $(BR2_EXTERNAL)/netapp/include
KNL_INCLUDES = $(BR2_EXTERNAL)/netapp/include/kernel

#Add here the CFLAGS to pass in to get the Defined Symbol
CFLAGS_gpio_module.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES)
-I$(KNL_INCLUDES)

{fixed the bad,bad CFLAGS issue :) }

However, I get a failure to build, due to missing headers, which are
located in the GBL_INCLUDES path.  It seems for kernel modules, the
$(BR2_EXTERNAL) is not being honored, as shown below.  Does this get passed
through?  Is it OK to "reach back" to the source directory for the
includes?

Doing a make V=1 - the output is:  {highlighted the includes}
[sbeckwith at sdb-mbp-vm output]$ make V=1 kmod_gpio-build
umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
O=/home/sbeckwith/HBE-1/hwdd/output/. kmod_gpio-build
>>> kmod_gpio 0.1.0 Syncing from source dir
/home/sbeckwith/HBE-1/hwdd/netapp/kmod_gpio
rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS /home/sbeckwith/HBE-1/hwdd/netapp/kmod_gpio/
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0
touch /home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.stamp_rsynced
>>> kmod_gpio 0.1.0 Configuring
touch
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.stamp_configured
>>> kmod_gpio 0.1.0 Building
>>> kmod_gpio 0.1.0 Building kernel module(s)
PATH="/home/sbeckwith/HBE-1/hwdd/output/host/bin:/home/sbeckwith/HBE-1/hwdd/output/host/sbin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/sbin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/sbeckwith/.local/bin:/home/sbeckwith/bin"
BR_BINARIES_DIR=/home/sbeckwith/HBE-1/hwdd/output/images /bin/make -j5 -C
/home/sbeckwith/HBE-1/hwdd/output/build/linux-4.1.4 HOSTCC="/bin/gcc"
HOSTCFLAGS="" ARCH=x86_64
INSTALL_MOD_PATH=/home/sbeckwith/HBE-1/hwdd/output/target CROSS_COMPILE="
/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-"
DEPMOD=/home/sbeckwith/HBE-1/hwdd/output/host/sbin/depmod
 PWD=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.
M=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/. modules
test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \
echo >&2; \
echo >&2 "  ERROR: Kernel configuration is invalid."; \
echo >&2 "         include/generated/autoconf.h or include/config/auto.conf
are missing.";\
echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to
fix it."; \
echo >&2 ; \
/bin/false)
mkdir -p
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./.tmp_versions ;
rm -f
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./.tmp_versions/*
/bin/make -f ./scripts/Makefile.build
obj=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.
(cat /dev/null;   echo
kernel//home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.ko;)
> /home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./modules.order

/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-Wp,-MD,/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./.gpio_module.o.d
 -nostdinc -isystem
/home/sbeckwith/HBE-1/hwdd/output/host/usr/lib/gcc/x86_64-buildroot-linux-uclibc/5.2.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi
-include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64
-mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer
-fno-optimize-sibling-calls -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time -DCC_HAVE_ASM_GOTO -DCONFIG_NETAPP_HWDD *-I/netapp/include
-I/netapp/include/kernel*  -DMODULE  -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(gpio_module)"
 -D"KBUILD_MODNAME=KBUILD_STR(gpio_module)" -c -o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.c
In file included from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.c:106:0:
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio.h:121:64:
fatal error: linux_ioctls.h: No such file or directory
compilation terminated.
scripts/Makefile.build:264: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.o'
failed
make[3]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/./gpio_module.o]
Error 1
Makefile:1383: recipe for target
'_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.' failed
make[2]: ***
[_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.] Error 2
package/pkg-generic.mk:156: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.stamp_built'
failed
make[1]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_gpio-0.1.0/.stamp_built]
Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2
[sbeckwith at sdb-mbp-vm output]$

And example of a "module" (really an app) build (w/o the V=1) shows the
$(BR2_EXTERNAL) being honored (highlighted)

[sbeckwith at sdb-mbp-vm hwdd]$ ./makeit.sh mod_led-build
umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
O=/home/sbeckwith/HBE-1/hwdd/output/. mod_led-build
>>> mod_led 0.1.0 Syncing from source dir
/home/sbeckwith/HBE-1/hwdd/netapp/mod_led
rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS /home/sbeckwith/HBE-1/hwdd/netapp/mod_led/
/home/sbeckwith/HBE-1/hwdd/output/build/mod_led-0.1.0
>>> mod_led 0.1.0 Configuring
>>> mod_led 0.1.0 Building
(cd /home/sbeckwith/HBE-1/hwdd/output/build/mod_led-0.1.0;
/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
*-I/home/sbeckwith/HBE-1/hwdd/netapp/include
-I/home/sbeckwith/HBE-1/hwdd/netapp/include/kernel* -L
/home/sbeckwith/HBE-1/hwdd/output/target/usr/lib -lui -lsighandler
-lplatform -llogger -lrt -lpthread -Wall -Os -s hwdd_led_app.c -o led)
[sbeckwith at sdb-mbp-vm hwdd]$

Is there a bug here??

Thanks again for the pointers, this gets me moving down the line.  I have
other modules I'm going to port over, they may have less dependency on
includes.

Regards,
Stephen




On Tue, Apr 12, 2016 at 5:07 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 04/12/16 20:25, Stephen Beckwith wrote:
>
>> Greetings,
>>    After 2 days, I'm still stuck trying to build a kernel module in
>> Buildroot.
>> I have an "out of tree" setup, that builds applications and libraries just
>> fine.  I get a bootable image.  I even added another "test" module
>> yesterday and
>> verified the steps I'm using worked, and that built just fine.  But I'm
>> unable
>> to build a kernel module.  I've searched the mailing lists and googled
>> the web
>> to no avail.  I've not seen any example that is similar.
>>     Buildroot version is 2015.08.01 - and yes, I verified it has the
>> patch for
>> the pkg-kernel-module.mk <http://pkg-kernel-module.mk> in the packages
>> directory.
>>
>>     My kernel module is "local" - in that it's a custom module I'm adding
>> to the
>> system to handle specific HW on the board.  So the setup is:
>> GPIO_MODULE_VERSION = 0.1.0
>> GPIO_MODULE_LICENSE = Public Domain
>> GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
>> GPIO_MODULE_SITE_METHOD = local
>>
>> The directory exists and there is a very simple Config.in to select the
>> module
>> (from the top level .config file)
>> #
>> # HWDD Required Kernel Modules
>> #
>> BR2_PACKAGE_GPIO_MODULE=y
>>
>> Some questions:
>> 1)  Can the module be setup like this?  Locally (to be rsync'd)??
>>
>
>  Sure, shouldn't be a problem.
>
> 2)  The gpio_module.mk file:  this still contains BUILD_CMDS ??
>>
>
>  It doesn't need to. In that case, the actual build will happen in a
> post-build hook instead of in build_cmds, but that's OK.
>
> 3)   Do I also need to have a "makefile" present in the directory as well?
>>   (some examples seem to indicate yes)
>>
>
>  I think you do need a Kbuild-type Makefile that specifies the objs-m,
> otherwise there is nothing to build.
>
> 4)   Can I do the same <pkg> - build commands to build this?  (like I
>> would for
>> the apps/libraries)
>>
>
>  Yep, the kernel module is built/installed as post-build/install hooks.
>
>
>> My gpio_modules.mk file:
>>
>
>  I hope you mean gpio_module.mk, without s? And the directory is
> gpio_module?
>
>
>> ################################################################################
>> #
>> # gpio_module
>> #
>>
>> ################################################################################
>> GPIO_MODULE_VERSION = 0.1.0
>> GPIO_MODULE_LICENSE = Public Domain
>> GPIO_MODULE_SITE = $(BR2_EXTERNAL)/modules/gpio_module
>> GPIO_MODULE_SITE_METHOD = local
>>
>> # Global Includes here
>> GBL_INCLUDES = $(BR2_EXTERNAL)/incs/include
>> KNL_INCLUDES = $(BR2_EXTERNAL)/incs/include/kernel
>>
>> GPIO_MODULE_OPTS += -C$(LINUX_DIR)
>> GPIO_MODULE_OPTS += M=$(@D) <http://gpio_module.mk>
>> CFLAGS += -Wall -Os -DCONFIG_HWDD -I$(GBL_INCLUDES) -I$(KNL_INCLUDES)
>>
>
>  Bad bad bad, this GLOBALLY defines CFLAGS. All variables should always be
> prefixed with your package name.
>
>  But all of this shouldn't be needed, it's already handled by the
> generic-kernel-module infra.
>
>
>> define GPIO_MODULE_BUILD_CMDS
>> $(MAKE) $(GPIO_MODULE_OPTS) $(CFLAGS)
>> endef
>>
>> $(eval $(generic-kernel))
>>
>
>  This should be kernel-module, not generic-kernel
>
> $(eval $(generic-package))
>>
>
>  This _is_ needed.
>
>
>> When I try to do a "-build" on the module (like I do for the apps), I get
>> this
>> (from the output directory)
>> [sbeckwith at sdb-mbp-vm output]$ make gpio_module-build
>> umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
>> O=/home/sbeckwith/HBE-1/hwdd/output/. gpio_module-build
>> make[1]: *** No rule to make target 'gpio_module-build'.  Stop.
>> Makefile:16: recipe for target '_all' failed
>> make: *** [_all] Error 2
>> [sbeckwith at sdb-mbp-vm output]$
>>
>> Which tells me somewhere it can't find the makefile or somehow bolt this
>> up to
>> the Buildroot build system. . .
>>
>
>  Indeed. Is the .mk file included in $(BR2_EXTERNAL)/external.mk? You put
> it into the modules directory instead of the usual packages directory, so
> it may not be included in your external.mk.
>
>  You can do 'make printvars | grep GPIO_MODULE' to check if it was
> properly included to begin with.
>
>  Regards,
>  Arnout
>
>
> I suspect it's because of the SITE_METHOD=local
>> that maybe causing this issue, am I correct?
>> The "rsync" I would normally see is not done, so there's nothing in the
>> output/build directory (no gpio_modules directory).
>>
>> Some pointers/assistance would be greatly appreciated.
>>
>> Regards,
>> Stephen
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160413/bbefdc07/attachment.html>
