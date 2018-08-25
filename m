From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sat, 25 Aug 2018 22:21:34 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
References: <20180812170138.0b51be07@windsurf>
 <87600bbg68.fsf@dell.be.48ers.dk>
 <20180815213421.08e0a3b6@windsurf> <87ftzf9v7u.fsf@dell.be.48ers.dk>
 <20180816001829.3f7a1436@windsurf>
 <CAAXf6LVNs8470+VwKJCM68cHdp+ZgD-JxEpCbUpMXte4JYm68Q@mail.gmail.com>
 <20180816220655.37fbff34@windsurf>
 <CAAXf6LX52KbkJ3AHfvG4ZMZvRHtpcqUHfo98JeTjFnuWWfMWNg@mail.gmail.com>
Message-ID: <CAAXf6LW1V3FLD8B=BQ=nGO3guTfR6Xsk2JtRFc5aei-ZP=hbcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Small update:

El jue., 23 ago. 2018 a las 21:49, Thomas De Schampheleire
(<patrickdepinguin+buildroot@gmail.com>) escribi?:
>
> Hi,
> El jue., 16 ago. 2018 a las 22:06, Thomas Petazzoni
> (<thomas.petazzoni@bootlin.com>) escribi?:
> >
> > Hello,
> >
> > On Thu, 16 Aug 2018 21:52:25 +0200, Thomas De Schampheleire wrote:
> >
> > > > I don't think it's related to building with new compilers. It's just
> > > > some U-Boot versions that are broken if libfdt headers are already
> > > > available in the include path.
> > >
> > > I can try to have a look somewhere next week.
> >
> > OK, thanks.
> >
> > > From the previous solution, I have a feeling that we can only go so
> > > far in trying to solve the issue from Buildroot. We did already one
> > > thing, and it seems insufficient for some u-boot versions.
> > > There is a risk that what we do to fix these new failures, may break
> > > some of those that work today.
> > > We could implement some kind of detection to see how we need to solve
> > > the issue depending on the u-boot at hand, but it could be cumbersome.
> >
> > Indeed.
> >
> > > An alternative solution is to document the known solution to this
> > > problem (the patches). We can apply these patches to the defconfigs
> > > inside buildroot, and let users with custom u-boots apply the patches
> > > themselves (i.e. make them aware from release notes or documentation
> > > but don't solve it automatically).
> >
> > That would be an option yes, but not the nicest one. But still better
> > than having all the defconfigs failing like they are today :/
> >
>
>
> I did an analysis of the first defconfig () and came to following
> patch that fixes the problem:
>
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index bddafe234d..4d34c55827 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -197,6 +197,9 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
>  define UBOOT_FIXUP_LIBFDT_INCLUDE
>      if [ -d $(@D)/scripts/dtc/libfdt ]; then \
>          $(SED)
> 's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%'
> $(@D)/tools/Makefile; \
> +    elif [ -f $(@D)/include/libfdt_env.h ]; then \
> +        $(SED) '\%#define _LIBFDT_ENV_H%a\
> +        #define LIBFDT_ENV_H' $(@D)/include/libfdt_env.h; \
>      fi
>  endef
>  UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE
>

Above patch works for engicam_imx6qdl_icore_qt5_defconfig.
I extended the patch to apply the same fixup to libfdt.h to fix the
second defconfig, at91sam9x5ek_mmc_dev_defconfig.

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bddafe234d..af977a99a5 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -197,6 +197,11 @@ UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_LOCAL_PATCHES
 define UBOOT_FIXUP_LIBFDT_INCLUDE
        if [ -d $(@D)/scripts/dtc/libfdt ]; then \
                $(SED)
's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%'
$(@D)/tools/Makefile; \
+       elif [ -f $(@D)/include/libfdt_env.h ]; then \
+               $(SED) '\%#define _LIBFDT_ENV_H%a\
+               #define LIBFDT_ENV_H' $(@D)/include/libfdt_env.h; \
+               $(SED) '\%#define _LIBFDT_H%a\
+               #define LIBFDT_H' $(@D)/include/libfdt.h; \
        fi
 endef
 UBOOT_POST_PATCH_HOOKS += UBOOT_FIXUP_LIBFDT_INCLUDE


Sadly, for the third defconfig, a problem arises:
atmel_sama5d4_xplained_mmc_dev_defconfig
Error now is:

dtc  -O dtb -o arch/arm/dts/at91-sama5d4_xplained.dtb -b 0 -i
arch/arm/dts/ -Wno-unit_address_vs_reg -d
arch/arm/dts/.at91-sama5d4_xplained.dtb.d.dtc.tmp
arch/arm/dts/.at91-sama5d4_xplained.dtb.dts.tmp

arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unit_address_format):
/sram at 00210000: unit name should not have leading 0s
arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unit_address_format):
/ahb/gadget at 00400000: unit name should not have leading 0s
arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unit_address_format):
/ahb/ohci at 00500000: unit name should not have leading 0s
arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unit_address_format):
/ahb/ehci at 00600000: unit name should not have leading 0s
arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unit_address_format):
/ahb/cache-controller at 00a00000: unit name should not have leading 0s
arch/arm/dts/at91-sama5d4_xplained.dtb: Warning (unique_unit_address):
/ahb/apb/gpio at fc06a000: duplicate unit-address (also used in node
/ahb/apb/pinctrl at fc06a000)
dtc: livetree.c:438: propval_cell: Assertion `prop->val.len ==
sizeof(cell_t)' failed.
fish: '../../host/bin/dtc  -O dtb -o a?' terminated by signal SIGABRT (Abort)


The 'dtc' in question is the one from output/host/bin/dtc.
If I change the command to use 'dtc' from my host, there is no error.
There must be an issue in using the header files from one thing but
then executing a dtc that was compiled against other header files.
Bweeuh.

So (this) uboot has some local fdt header files, but expects dtc to be
available externally. And when we force the usage of the local header
files, we get errors.

Not sure how to proceed yet... Either try to force usage of the
include files from output/host/  but they may not always be available,
plus I think that in some cases exactly this caused troubles.

/Thomas
