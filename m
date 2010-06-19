From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jun 2010 16:13:27 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
 infrastructure for building the Linux kernel
In-Reply-To: <87bpb8b0ld.fsf@macbook.be.48ers.dk>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk>
Message-ID: <20100619161327.3748f49c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for reviewing my changes! My answer to your comments below.

On Fri, 18 Jun 2010 21:30:06 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> +choice
>  Thomas> +	prompt "Kernel version"
>  Thomas> +	default BR2_LINUX_KERNEL_2_6_34
>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_2_6_34
>  Thomas> +	bool "2.6.34"
>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_CUSTOM_STABLE
>  Thomas> +	bool "Custom stable version"
> 
> I would drop "stable" here.

Why ? Only stable releases, i.e releases available in
http://kernel.org/pub/linux/kernel/v2.6/ are supported. And in this
directory, only stable releases are available.

>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_CUSTOM_TARBALL
>  Thomas> +	bool "Custom tarball"
>  Thomas> +
> 
> What about the same-as-kernel-headers choice? Or perhaps the fixed
> version should used that?

I could add another option to say ? same version as kernel headers ?.
However, I'd prefer to keep the "BR2_LINUX_KERNEL_2_6_34" option as it
is: remember that in the external toolchain case, ? same version as
kernel headers ? doesn't make sense.

> 
>  Thomas> +if BR2_LINUX_KERNEL_CUSTOM_TARBALL
>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
>  Thomas> +	string "URL of custom kernel tarball"
>  Thomas> +
>  Thomas> +endif # BR2_LINUX_KERNEL_CUSTOM_TARBALL
> 
> For single options, just adding the 'depends on
> BR2_LINUX_KERNEL_CUSTOM_TARBALL' is shorter/easier to read than all
> those endif's - IMHO.

Good idea, will do.

>  Thomas> +config BR2_LINUX_KERNEL_PATCH
>  Thomas> +       bool "Custom patch for the Linux kernel"
>  Thomas> +
>  Thomas> +if BR2_LINUX_KERNEL_PATCH
>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_PATCH_LOCATION
>  Thomas> +       string "Location of custom kernel patch"
>  Thomas> +       help
>  Thomas> +         The location can be an URL, a file path, or a directory. In
>  Thomas> +         the case of a directory, all files matching linux-*.patch
>  Thomas> +         will be applied.
>  Thomas> +
>  Thomas> +endif # BR2_LINUX_KERNEL_PATCH
> 
> Why not just keep this a single option and only make it do something if
> it's different than ""?

Good idea, will also do.

>  Thomas> +	 Name of the defconfig file to use, without the leading
>  Thomas> +	 _defconfig.
> 
> Trailing.

Will fix.

>  Thomas> +endif # BR2_LINUX_KERNEL_USE_DEFCONFIG
>  Thomas> +
>  Thomas> +if BR2_LINUX_KERNEL_USE_CUSTOM
>  Thomas> +
>  Thomas> +config BR2_LINUX_KERNEL_CUSTOM_FILE
>  Thomas> +       string "Configuration file path"
>  Thomas> +       help
>  Thomas> +         Path to the kernel configuration file.
>  Thomas> +
>  Thomas> +endif # BR2_LINUX_KERNEL_USE_CUSTOM
> 
> I think it would be nicer to do something like what you're doing with
> BR2_LINUX_KERNEL_PATCH_LOCATION - E.G. make it autodetect if it's a
> defconfig in the kernel tree or an external file. You can either do this
> using $(wildcard ..) (to check if the file exists), or simply check for
> slashes in the string $(findstring /,..).

Why not, but I would find the semantic of the option rather strange,
and there might be corner cases where deciding whether it is a
defconfig name or the patch to a configuration file would be difficult.
From an user perspective, I think it's clearer to have two separate
options for this, rather than a single option with a strange semantic
which requires looking at the help text to understand what it actually
does.

But of course, if you insist on having this, I'll implement it, no big
deal.

> If we do this, then I would prefer to give the complete make target for
> defconfigs - E.G. 'blah_defconfig', no just 'blah'.

Why not, but this would not be consistent with what we do with U-Boot
configuration (in which we also ask only for the board name, and we
automatically suffix "_config" to it to configure U-Boot). Of course,
if you think the way we do things in U-Boot now is incorrect, we can
also fix it, but I'd prefer to have one option or the other, but not an
inconsistent mix of both.

>  Thomas> +choice
>  Thomas> +	prompt "Kernel binary format"
>  Thomas> +	default BR2_LINUX_KERNEL_UIMAGE if !BR2_386
>  Thomas> +	default BR2_LINUX_KERNEL_BZIMAGE if BR2_386
> 
> The symbol is BR2_i386. I guess we also want it on BR2_x86_64 as well.

Right, will fix.

> I would have expected to see a hidden BR2_LINUX_KERNEL_FORMAT with the
> text strings "zImage", "bzImage", "uImage", .. - That can then be used
> as the make target.

Why not. But I must confess that I find this computation of values
inside Config.in files a bit ugly: some values are computed in
Config.in files, some in the makefile rules directly. But here too, if
you insist on having this, I'll go ahead and implement it, as I don't
have a very strong opinion on this.

>  Thomas> +# Get the real Linux version, which tells us where kernel modules are
>  Thomas> +# going to be installed in the target filesystem.
>  Thomas> +LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease`
> 
> We typically use $(shell ..)

Will do.

>  Thomas> +# Download
>  Thomas> +$(LINUX26_DIR)/.stamp_downloaded:
>  Thomas> +	@$(call MESSAGE,"Downloading kernel")
>  Thomas> +	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
>  Thomas> +ifeq ($(BR2_LINUX_KERNEL_PATCH),y)
>  Thomas> +ifneq ($(findstring http://,$(LINUX26_PATCH)),)
>  Thomas> +	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
>  Thomas> +else ifneq ($(findstring ftp://,$(LINUX26_PATCH)),)
>  Thomas> +	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
> 
> You can combine these using $(filter) - E.G.:
> ifneq ($(filter http:// ftp://,$(LINUX26_PATCH)),)

Will do.

>  Thomas> +else ifeq ($(shell test -d $(LINUX26_PATCH) && echo "dir"),dir)
>  Thomas> +	toolchain/patch-kernel.sh $(@D) $(LINUX26_PATCH) linux-*.patch
> 
> You have to escape the * - E.G. linux-\*.patch

Will do again :-)

> 
>  Thomas> +else
>  Thomas> +	toolchain/patch-kernel.sh $(@D) $(dir $(LINUX26_PATCH)) $(notdir $(LINUX26_PATCH))
>  Thomas> +endif
>  Thomas> +endif
>  Thomas> +	$(Q)touch $@
>  Thomas> +
>  Thomas> +
>  Thomas> +# Configuration
>  Thomas> +$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
>  Thomas> +	@$(call MESSAGE,"Configuring kernel")
>  Thomas> +ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  Thomas> +	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  Thomas> +else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
>  Thomas> +	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
>  Thomas> +	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
> 
> Hmm, why the yes '' here and not for defconfig? I would prefer to get
> rid of it, so the user is in control (they can always use the yes
> ''|make stuff on the BR commandline if they want unattended builds, like
> I do for buildbot).

So as by default not to have questions that could stop the build. In
general, I don't see doing "yes '' | make oldconfig" as a way of hiding
errors, as by default, oldconfig uses the default choice for every
configuration item, and this default choice usually makes sense.

> Why not simply $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_FORMAT)
> where LINUX26_FORMAT is uImage/zImage/bzImage? That's afaik how it used
> to be done.

make uImage only builds the uImage kernel image. make with no arguments
builds the default kernel image (zImage in the ARM case) and also
builds the modules.

So we could also do :

 make uImage
 make modules

but in any case, we have two make targets to call.

>  Thomas> +# Installation
>  Thomas> +$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
>  Thomas> +	@$(call MESSAGE,"Installing kernel")
>  Thomas> +	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
>  Thomas> +	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) \
>  Thomas> +		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
> 
> Does that do something sane with a nonmodular kernel?

No, will fix.

> You're good at this one ;)

Will fix too :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
