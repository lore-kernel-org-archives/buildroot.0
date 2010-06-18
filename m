From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jun 2010 21:30:06 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
	infrastructure for building the Linux kernel
In-Reply-To: <851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 13 Jun 2010 20:50:05 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87bpb8b0ld.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi, some comments:

 Thomas> This patch introduces a single, simple, infrastructure to build the
 Thomas> Linux kernel. The configuration is limited to :

 Thomas>  * Kernel version: a fixed recent stable version, custom stable
 Thomas>    version, or custom tarball URL

 Thomas>  * Kernel patch: either a local file, directory or an URL

 Thomas>  * Kernel configuration: either the name of a defconfig or the
 Thomas>    location of a custom configuration file

 Thomas>  * Kernel image: either uImage, bzImage, zImage or vmlinux.

 Thomas> +choice
 Thomas> +	prompt "Kernel version"
 Thomas> +	default BR2_LINUX_KERNEL_2_6_34
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_2_6_34
 Thomas> +	bool "2.6.34"
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_STABLE
 Thomas> +	bool "Custom stable version"

I would drop "stable" here.

 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 Thomas> +	bool "Custom tarball"
 Thomas> +

What about the same-as-kernel-headers choice? Or perhaps the fixed
version should used that?

 Thomas> +if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 Thomas> +	string "URL of custom kernel tarball"
 Thomas> +
 Thomas> +endif # BR2_LINUX_KERNEL_CUSTOM_TARBALL

For single options, just adding the 'depends on
BR2_LINUX_KERNEL_CUSTOM_TARBALL' is shorter/easier to read than all
those endif's - IMHO.

 Thomas> +config BR2_LINUX_KERNEL_PATCH
 Thomas> +       bool "Custom patch for the Linux kernel"
 Thomas> +
 Thomas> +if BR2_LINUX_KERNEL_PATCH
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_PATCH_LOCATION
 Thomas> +       string "Location of custom kernel patch"
 Thomas> +       help
 Thomas> +         The location can be an URL, a file path, or a directory. In
 Thomas> +         the case of a directory, all files matching linux-*.patch
 Thomas> +         will be applied.
 Thomas> +
 Thomas> +endif # BR2_LINUX_KERNEL_PATCH

Why not just keep this a single option and only make it do something if
it's different than ""?

 Thomas> +choice
 Thomas> +	prompt "Kernel configuration"
 Thomas> +	default BR2_LINUX_KERNEL_USE_DEFCONFIG
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_USE_DEFCONFIG
 Thomas> +       bool "Using a defconfig"
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_USE_CUSTOM
 Thomas> +       bool "Using a custom config file"
 Thomas> +
 Thomas> +endchoice
 Thomas> +
 Thomas> +if BR2_LINUX_KERNEL_USE_DEFCONFIG
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_DEFCONFIG
 Thomas> +       string "Defconfig name"
 Thomas> +       help
 Thomas> +	 Name of the defconfig file to use, without the leading
 Thomas> +	 _defconfig.

Trailing.

 Thomas> +
 Thomas> +endif # BR2_LINUX_KERNEL_USE_DEFCONFIG
 Thomas> +
 Thomas> +if BR2_LINUX_KERNEL_USE_CUSTOM
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_FILE
 Thomas> +       string "Configuration file path"
 Thomas> +       help
 Thomas> +         Path to the kernel configuration file.
 Thomas> +
 Thomas> +endif # BR2_LINUX_KERNEL_USE_CUSTOM

I think it would be nicer to do something like what you're doing with
BR2_LINUX_KERNEL_PATCH_LOCATION - E.G. make it autodetect if it's a
defconfig in the kernel tree or an external file. You can either do this
using $(wildcard ..) (to check if the file exists), or simply check for
slashes in the string $(findstring /,..).

If we do this, then I would prefer to give the complete make target for
defconfigs - E.G. 'blah_defconfig', no just 'blah'.

 Thomas> +choice
 Thomas> +	prompt "Kernel binary format"
 Thomas> +	default BR2_LINUX_KERNEL_UIMAGE if !BR2_386
 Thomas> +	default BR2_LINUX_KERNEL_BZIMAGE if BR2_386

The symbol is BR2_i386. I guess we also want it on BR2_x86_64 as well.

I would have expected to see a hidden BR2_LINUX_KERNEL_FORMAT with the
text strings "zImage", "bzImage", "uImage", .. - That can then be used
as the make target.

 Thomas> +# Get the real Linux version, which tells us where kernel modules are
 Thomas> +# going to be installed in the target filesystem.
 Thomas> +LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease`

We typically use $(shell ..)

 Thomas> +# Download
 Thomas> +$(LINUX26_DIR)/.stamp_downloaded:
 Thomas> +	@$(call MESSAGE,"Downloading kernel")
 Thomas> +	$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
 Thomas> +ifeq ($(BR2_LINUX_KERNEL_PATCH),y)
 Thomas> +ifneq ($(findstring http://,$(LINUX26_PATCH)),)
 Thomas> +	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))
 Thomas> +else ifneq ($(findstring ftp://,$(LINUX26_PATCH)),)
 Thomas> +	$(call DOWNLOAD,$(dir $(LINUX26_PATCH)),$(notdir $(LINUX26_PATCH)))

You can combine these using $(filter) - E.G.:
ifneq ($(filter http:// ftp://,$(LINUX26_PATCH)),)

 Thomas> +# Patch
 Thomas> +$(LINUX26_DIR)/.stamp_patched: $(LINUX26_DIR)/.stamp_extracted
 Thomas> +	@$(call MESSAGE,"Patching kernel")
 Thomas> +ifeq ($(BR2_LINUX_KERNEL_PATCH),y)
 Thomas> +ifneq ($(findstring http://,$(LINUX26_PATCH)),)
 Thomas> +	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))
 Thomas> +else ifneq ($(findstring ftp://,$(LINUX26_PATCH)),)
 Thomas> +	toolchain/patch-kernel.sh $(@D) $(DL_DIR) $(notdir $(LINUX26_PATCH))

Same as above.

 Thomas> +else ifeq ($(shell test -d $(LINUX26_PATCH) && echo "dir"),dir)
 Thomas> +	toolchain/patch-kernel.sh $(@D) $(LINUX26_PATCH) linux-*.patch

You have to escape the * - E.G. linux-\*.patch

 Thomas> +else
 Thomas> +	toolchain/patch-kernel.sh $(@D) $(dir $(LINUX26_PATCH)) $(notdir $(LINUX26_PATCH))
 Thomas> +endif
 Thomas> +endif
 Thomas> +	$(Q)touch $@
 Thomas> +
 Thomas> +
 Thomas> +# Configuration
 Thomas> +$(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
 Thomas> +	@$(call MESSAGE,"Configuring kernel")
 Thomas> +ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 Thomas> +	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 Thomas> +else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM),y)
 Thomas> +	cp $(BR2_LINUX_KERNEL_CUSTOM_FILE) $(@D)/.config
 Thomas> +	yes "" | $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig

Hmm, why the yes '' here and not for defconfig? I would prefer to get
rid of it, so the user is in control (they can always use the yes
''|make stuff on the BR commandline if they want unattended builds, like
I do for buildbot).

 Thomas> +endif
 Thomas> +	$(Q)touch $@
 Thomas> +
 Thomas> +# Compilation
 Thomas> +$(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured
 Thomas> +	@$(call MESSAGE,"Compiling kernel")
 Thomas> +	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D)
 Thomas> +ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 Thomas> +	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) uImage

Why not simply $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) $(LINUX26_FORMAT)
where LINUX26_FORMAT is uImage/zImage/bzImage? That's afaik how it used
to be done.

 Thomas> +# Installation
 Thomas> +$(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
 Thomas> +	@$(call MESSAGE,"Installing kernel")
 Thomas> +	cp $(LINUX26_IMAGE_PATH) $(BINARIES_DIR)
 Thomas> +	$(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) \
 Thomas> +		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

Does that do something sane with a nonmodular kernel?

 Thomas> +	# Remove symbolic links pointing to build directories, not
 Thomas> +	# relevant on the target
 Thomas> +	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build
 Thomas> +	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
 Thomas> +	$(Q)touch $@
 Thomas> +
 Thomas> +linux26: $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
 Thomas> +
 Thomas> +ifeq ($(BR2_LINUX_KERNEL),y)
 Thomas> +TARGETS+=linux26
 Thomas> +endif
 Thomas> \ No newline at end of file

You're good at this one ;)

-- 
Bye, Peter Korsgaard
