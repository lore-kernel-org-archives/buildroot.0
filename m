From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Jun 2010 21:48:20 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
	infrastructure for building the Linux kernel
In-Reply-To: <20100619161327.3748f49c@surf> (Thomas Petazzoni's message of
	"Sat, 19 Jun 2010 16:13:27 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk> <20100619161327.3748f49c@surf>
Message-ID: <87hbkyajnf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_STABLE
 Thomas> +	bool "Custom stable version"
 >> 
 >> I would drop "stable" here.

 Thomas> Why ? Only stable releases, i.e releases available in
 Thomas> http://kernel.org/pub/linux/kernel/v2.6/ are supported. And in this
 Thomas> directory, only stable releases are available.

Well, "stable" has different meanings to different people. When I think
of stable in regard to kernels, I think of the stable at kernel.org
releases (E.G. 2.6.x.y).

For the kernel headers we simply call it

"Linux 2.6 (manually specified version)"


 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 Thomas> +	bool "Custom tarball"
 Thomas> +
 >> 
 >> What about the same-as-kernel-headers choice? Or perhaps the fixed
 >> version should used that?

 Thomas> I could add another option to say ? same version as kernel headers ?.
 Thomas> However, I'd prefer to keep the "BR2_LINUX_KERNEL_2_6_34" option as it
 Thomas> is: remember that in the external toolchain case, ? same version as
 Thomas> kernel headers ? doesn't make sense.

Ok. You could hide the option if !internal toolchain.

 >> I think it would be nicer to do something like what you're doing with
 >> BR2_LINUX_KERNEL_PATCH_LOCATION - E.G. make it autodetect if it's a
 >> defconfig in the kernel tree or an external file. You can either do this
 >> using $(wildcard ..) (to check if the file exists), or simply check for
 >> slashes in the string $(findstring /,..).

 Thomas> Why not, but I would find the semantic of the option rather strange,
 Thomas> and there might be corner cases where deciding whether it is a
 Thomas> defconfig name or the patch to a configuration file would be difficult.
 >> From an user perspective, I think it's clearer to have two separate
 Thomas> options for this, rather than a single option with a strange semantic
 Thomas> which requires looking at the help text to understand what it actually
 Thomas> does.

 Thomas> But of course, if you insist on having this, I'll implement it, no big
 Thomas> deal.

No, just leave it, I don't feel strongly about it.

 >> I would have expected to see a hidden BR2_LINUX_KERNEL_FORMAT with the
 >> text strings "zImage", "bzImage", "uImage", .. - That can then be used
 >> as the make target.

 Thomas> Why not. But I must confess that I find this computation of values
 Thomas> inside Config.in files a bit ugly: some values are computed in
 Thomas> Config.in files, some in the makefile rules directly. But here too, if
 Thomas> you insist on having this, I'll go ahead and implement it, as I don't
 Thomas> have a very strong opinion on this.

Well, only add it if you need the text string for something (E.G. the
make target). If you prefer doing it in make, then that's fine as well -
It's not something that needs to change often.

In general I think it makes sense to keep these things in Kconfig when
you need to keep several lines in sync, and otherwise don't need to
change anything in .mk files (E.G. when adding new kernel headers,
busybox versions, ..).

 Thomas> +# Configuration
 Thomas> +$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
 Thomas> +	@$(call MESSAGE,"Configuring kernel")
 Thomas> +ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 Thomas> +	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 Thomas> +else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
 Thomas> +	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
 Thomas> +	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
 >> 
 >> Hmm, why the yes '' here and not for defconfig? I would prefer to get
 >> rid of it, so the user is in control (they can always use the yes
 >> ''|make stuff on the BR commandline if they want unattended builds, like
 >> I do for buildbot).

 Thomas> So as by default not to have questions that could stop the build. In
 Thomas> general, I don't see doing "yes '' | make oldconfig" as a way of hiding
 Thomas> errors, as by default, oldconfig uses the default choice for every
 Thomas> configuration item, and this default choice usually makes sense.

The point is that it isn't consistent. We don't do this for
uclibc/busybox, and you don't do it for defconfigs in the kernel tree
(which often are also slightly outdated).


 >> Why not simply $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_FORMAT)
 >> where LINUX26_FORMAT is uImage/zImage/bzImage? That's afaik how it used
 >> to be done.

 Thomas> make uImage only builds the uImage kernel image. make with no arguments
 Thomas> builds the default kernel image (zImage in the ARM case) and also
 Thomas> builds the modules.

This seems platform/arch specific. On PPC, the default image is
typically uImage, so make with no arguments builds uImage and modules.

Does this mean that the existing advanced linux support is broken on
ARM/uImage when using a modular kernel? - There it looks like it just
calls 'make uImage'. I always use a nonmodular kernel, so I never
noticed.

 Thomas> So we could also do :

 Thomas>  make uImage
 Thomas>  make modules

Probably better to do make; make <format> (where format is uImage/zImage/bzImage/..)

As make modules errors out with something like:

The present kernel configuration has modules disabled.
Type 'make config' and enable loadable module support.
Then build a kernel with module support enabled.

make: *** [modules] Error 1

 Thomas> but in any case, we have two make targets to call.

Yes.

-- 
Bye, Peter Korsgaard
