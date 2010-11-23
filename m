From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 22:45:05 +0100
Subject: [Buildroot] OF FDT compilation support
In-Reply-To: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
References: <AANLkTikeJ-mbrieukd24z7zZi=hCRMNPhMZWP+Okm2oX@mail.gmail.com>
Message-ID: <20101123224505.1a26aeca@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Nov 2010 14:49:06 +0300
Stanislav Bogatyrev <realloc@gmail.com> wrote:

>  #
> +# Device tree
> +#
> +
> +config BR2_LINUX_BUILD_DT

I think I'd prefer BR2_LINUX_DEVICE_TREE (ditto for all other options)

> +  bool "Compile OpenFirmware Flattened Device Tree"

Indentation before bool, depends on, help, etc. is one tab. Could you
fix everywhere ?

> +  depends on BR2_powerpc
> +  help
> +    Compile OpenFirmware Flattened Device Tree

And for help text it's one tab and two spaces. Could you fix
everywhere ?

A slightly better help text would be useful as well.

> +config BR2_LINUX_BUILD_DT_FORCE
> +  bool "Force - try to produce output even if the input tree has errors"
> +  depends on BR2_LINUX_BUILD_DT

We don't really have many "force" options anywhere else in Buildroot.
Is this really needed ?

Replace all BR2_LINUX_BUILD_DT by an enclosing if BR2_LINUX_DEVICE_TREE

> +config BR2_LINUX_BUILD_DT_LIST
> +  string "List of .dts files to compile"
> +  depends on BR2_LINUX_BUILD_DT
> +
> +choice
> +	prompt "DTC output format"
> +  depends on BR2_LINUX_BUILD_DT
> +  default BR2_LINUX_BUILD_DT_DTB
> +
> +config BR2_LINUX_BUILD_DT_DTB
> +  bool "dtb"
> +
> +config BR2_LINUX_BUILD_DT_DTS
> +  bool "dts"
> +
> +config BR2_LINUX_BUILD_DT_ASM
> +  bool "asm"
> +endchoice

What are all those formats for ?

> +config BR2_LINUX_BUILD_DT_BOOT_CPU
> +  string "CPU number to boot"
> +  default 0
> +  depends on BR2_LINUX_BUILD_DT
> +
> +config BR2_LINUX_BUILD_DT_EXTRA_SPACE
> +  string "Make the blob at least <bytes> long (extra space)"
> +  default 0
> +  depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )
> +
> +config BR2_LINUX_BUILD_DT_RESERVED_SPACE
> +  string "Make space for <number> reserve map entries"
> +  default 0
> +  depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )
> +
> +config BR2_LINUX_BUILD_DT_PADDING_SPACE
> +  string "Add padding to the blob of <bytes> long (extra space)"
> +  default 0
> +  depends on BR2_LINUX_BUILD_DT && ( BR2_LINUX_BUILD_DT_DTB || BR2_LINUX_BUILD_DT_ASM )

I am not very familiar with the device tree, are those options really
useful in general ?

> +# prepare command-line arguments for dtc
> +LINUX26_DTS_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/dts
> +LINUX26_DTC=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/dtc
> +
> +ifeq ($(BR2_LINUX_BUILD_DT_FORCE),y)
> +LINUX26_DTC_ARG+= -f
> +endif
> +
> +ifeq ($(BR2_LINUX_BUILD_DT_DTB),y)
> +LINUX26_DTC_OUTF+=dtb
> +else ifeq ($(BR2_LINUX_BUILD_DT_ASM),y)
> +LINUX26_DTC_OUTF+=asm
> +else ifeq ($(BR2_LINUX_BUILD_DT_DTS),y)
> +LINUX26_DTC_OUTF+=dts
> +endif

Those lines should probably be LINUX26_DTC_OUTF= and not += since they
are mutually exclusive.

> +LINUX26_DTC_ARG+= -b $(call qstrip,$(BR2_LINUX_BUILD_DT_BOOT_CPU)) \
> +-R $(call qstrip,$(BR2_LINUX_BUILD_DT_RESERVED_SPACE)) \
> +-S $(call qstrip,$(BR2_LINUX_BUILD_DT_EXTRA_SPACE)) \
> +-p $(call qstrip,$(BR2_LINUX_BUILD_DT_PADDING_SPACE)) \
> +-o $(BINARIES_DIR)/$(file).$(LINUX26_DTC_OUTF) \
> +-O $(LINUX26_DTC_OUTF)

One tab here before each continuing line.

> +# Flattened Device Tree compilation
> +$(LINUX26_DIR)/.stamp_dt_compiled: $(LINUX26_DIR)/.stamp_compiled	
> +ifeq ($(BR2_LINUX_BUILD_DT),y)
> +	@$(call MESSAGE,"Compiling Flattened Device Tree")	
> +	$(foreach file, $(call qstrip,$(BR2_LINUX_BUILD_DT_LIST)), \
> +	$(LINUX26_DTC) $(LINUX26_DTC_ARG) $(LINUX26_DTS_PATH)/$(file).dts;)
> +endif
> +	$(Q)touch $@
> +
>  # Installation
>  $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
>  	@$(call MESSAGE,"Installing kernel")
> @@ -143,7 +176,7 @@ $(LINUX26_DIR)/.stamp_installed: $(LINUX26_DIR)/.stamp_compiled
>  	fi
>  	$(Q)touch $@
>  
> -linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
> +linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed $(LINUX26_DIR)/.stamp_dt_compiled

I think I'd prefer something such as:

+$(LINUX26_DIR)/.stamp_dt_compiled: $(LINUX26_DIR)/.stamp_compiled	
+	@$(call MESSAGE,"Compiling Flattened Device Tree")	
+	$(foreach file, $(call qstrip,$(BR2_LINUX_BUILD_DT_LIST)), \
+	$(LINUX26_DTC) $(LINUX26_DTC_ARG) $(LINUX26_DTS_PATH)/$(file).dts;)
+	$(Q)touch $@
+
+ifeq ($(BR2_LINUX_BUILD_DT),y)
+LINUX26_DEVICE_TREE_DEP=$(LINUX26_DIR)/.stamp_dt_compiled
+endif
[...]
-linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed
+linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_installed $(LINUX26_DEVICE_TREE_DEP)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
