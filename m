From: D. Olsson <hi@senzilla.io>
Date: Wed, 30 Dec 2020 20:22:08 +0000
Subject: [Buildroot] [PATCH v3 04/11] boot/edk2: new package
In-Reply-To: <20201230105158.GM1680670@scaer>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-5-hi@senzilla.io> <20201230105158.GM1680670@scaer>
Message-ID: <c7rvuYJmwrINEtoBR-3OFMOH1t8pSY5at39GXmU03PUhJRM9D5xKJmu0E7x6r7CKDpQj9Gyr718px_1So76Ga3KwZKGiVZy_ve6UJhAWG6I=@senzilla.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I'll address the rest of your reviews in the coming days. But here are some initial answers.


> Please submit this patch upstream.
>
> See also: https://github.com/tianocore/edk2/pull/1234

I did submit it upstream and the discussion evolved a bit in their mailing list. I'll update the patch accordingly and reference the upstream conversation in the commit message. But for reference for the purpose of this email:

https://edk2.groups.io/g/devel/message/69235
https://edk2.groups.io/g/devel/message/69390
https://bugzilla.tianocore.org/show_bug.cgi?id=3136


> > +config BR2_TARGET_EDK2_PLATFORM_OVMF_X64
> >
> > -   bool "x86-64"
>
> Should that not depend on BR2_x86_64 ?

Yes, it should. And I'll fix the same for all the other similar comments in v4.


> Leading TAB for keyword options, and leadng TAB+2-spaces for help text.

Gotcha!


> > +# The EDK2 build system is rather special, so we're resorting to using its
> > +# own Git submodules in order to include certain build dependencies.
> > +EDK2_GIT_SUBMODULES = YES
> > +
> > +EDK2_INSTALL_IMAGES = YES
>
> Since it also does not install anything in target/, you should also add;
>
> EDK2_INSTALL_TARGET = NO

Makes sense!


> > +# Packages path.
> > +#
> > +# The EDK2 build system will, for some platforms, depend on binary outputs
> > +# from other bootloader packages. Those dependencies need to be in the path
> > +# for the EDK2 build system, so we define this special directory here.
> > +EDK2_OUTPUT_BASE = $(BINARIES_DIR)/edk2
>
> I am a bit uneasy about that one: does that mean that edk2 will store
> files there during its build step, or does that mean itr will look there
> for extra input files?

In order for EDK2 to consume images that ATF outputs they need to be arranged in specific ways, they're called a "packages" in EDK2 terms (see the PACKAGES_PATH build varaible).

For the Developerbox, we construct a "package" with a FIP from the ATF images and put into a "package" structure. And for the QEMU SBSA the ATF outputs can simply be copied into said directory structure.

So to summarise, it's a place where output files from one bootloader are repackaged as input for EDK2. I thought this was similar to how post build scripts repurpose e.g. the kernel image to build disk images.

That said, it's EDK2 itself building these packages, so keeping it under $(@D) might make the most sense. I'll play around with it to see if I come up with something cleaner.


> Also, I wonder if it would not be better to define it at the kconfig
> level:
>
> config BR2_PACKAGE_EDK2_EL2_NAME
> string
> default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
> default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
> default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
> default "ARMADA_EFI" if BR2_TARGET_EDK2_PLATFORM_SOLIDRUN_ARMADA80X0MCBIN
>
> This way, it is easier for ATF to use BR2_PACKAGE_EDK2_EL2_NAME rather
> than EDk2_EL2_NAME (this avoids using variables defined in another .mk
> file).

I hadn't thought about this pattern before, but I like it!.
I'll include it in v4.


> > +endef
> > +
> > +define EDK2_OUTPUT_QEMU_SBSA
> >
> > -   mkdir -p $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa
> > -   ln -srf $(BINARIES_DIR)/{bl1.bin,fip.bin} $(EDK2_OUTPUT_BASE)/Platform/Qemu/Sbsa/
> >     +endef
> >
>
> Those two hooks are only used in one place each, and so must be defined
> in the conditional block that uses them.
>
> Also, those two hooks are used a pre-configure hooks, but they are
> adding stuff in EDK2_OUTPUT_BASE, which is iteslef in BINARIES_DIR,
> which is not very nice.
>
> Can't we have EDK2_OUTPUT_BASE be located somewhere in $(@D) instead:
>
> EDK2_OUTPUT_BASE = $(@D)/br-output-base
>
> And then, as part of the IMAGE_INSTALL_CMDS, we copy that to the proper,
> final location in BINARIES_DIR/edk2 (or whatever), if that is needed.

Yes, might make sense and would change when/if I change the EDK2_OUTPUT_BASE stuff I commented on above. I'll see what I come up with...


> > +# Make and build options.
> > +#
> > +# Due to the uniquely scripted build system for EDK2 we need to export most
> > +# build environment variables so that they are available across edksetup.sh,
> > +# make, the build command, and other subordinate build scripts within EDK2.
> > +
> > +EDK2_MAKE_ENV += \
>
> This variable is only assigned here, so this should be a simple
> assignment, not an append-assignment. Also, this is used as make
> options, not environment, so should probably be named EDK2_MAKE_OPTS.

Will fix!



> > -   EXTRA_LDFLAGS="$(HOST_LDFLAGS)" \
> > -   EXTRA_OPTFLAGS="$(HOST_CPPFLAGS)"
>
> This naming is pretty confusing, but indeed, EXTRA_XXX are only used to
> build host tools, not target code...

Yeah, the one and only make command in the build is for base tools for the host. The actual target build is run by custom build scripts. So I thought


Cheers

D. Olsson
PGP: 8204A8CD
