From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Mar 2008 09:03:31 +0100
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <20080312090846.2cfecec8@crazy>
References: <20080312090846.2cfecec8@crazy>
Message-ID: <20080314090331.11f1bddc@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any comments on that ? Are you interested in merging such a patch ?

Thanks,

Thomas

Le Wed, 12 Mar 2008 09:08:46 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Hi,
> 
> You'll find enclosed in this mail a patch that adds Thumb support for
> buildroot. It allows to generate an interworking-enabled toolchain,
> with an uClibc compiled in ARM mode, and then to compile userspace
> applications in Thumb mode.
> 
> More details are available in the patch description.
> 
> Of course, your comments, reviews and suggestions are welcome!
> 
> Thanks for developing such a great tool,
> 
> Sincerly,
> 
> Thomas
> 
> ---
> Add thumb support to buildroot for the ARM architecture
> 
> The Thumb instruction set is encoded on 16 bits opcode instead of 32
> bits opcode for the regular ARM instruction set. It generally allows
> for greater code density, leading to reduced code size, which is nice
> on memory-constrained embedded systems.
> 
> Currently, uClibc cannot be fully compiled using the Thumb instruction
> set. Therefore, this patch still compile uClibc in regular ARM mode,
> but allows to enable interworking support for the
> toolchain. Interworking allows Thumb code to call ARM code and
> vice-versa, allowing a mixed Thumb/ARM userspace.
> 
> Enabling interworking at the toolchain level is done using the
> BR2_INTERWORKING_SUPPORT option, added by the patch. When enabled, it
> adds --enable-interwork to the binutils and gcc configure options,
> adds -mthumb-interwork to the CFLAGS during uClibc compilation, and
> enables the USE_BX config option of uClibc (bx is an ARM instruction
> that allows to switch between ARM and Thumb mode).
> 
> Once interworking is enabled, it is then possible to compile the
> userspace applications in Thumb mode. This is what the new
> BR2_THUMB_BINARIES option allows, by adding -mthumb to the CFLAGS used
> during the compilation of userspace applications.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
>  Config.in                      |    8 ++++++++
>  package/Makefile.in            |    4 ++++
>  toolchain/Config.in.2          |   12 ++++++++++++
>  toolchain/binutils/binutils.mk |    5 +++++
>  toolchain/gcc/Makefile.in      |    4 ++++
>  toolchain/uClibc/uclibc.mk     |    7 +++++++
>  6 files changed, 40 insertions(+)
> 
> Index: buildroot.new/Config.in
> ===================================================================
> --- buildroot.new.orig/Config.in
> +++ buildroot.new/Config.in
> @@ -223,6 +223,14 @@
>  
>  	  WARNING: This is highly experimental at the moment.
>  
> +config BR2_THUMB_BINARIES
> +	bool "generate Thumb binaries"
> +	default n
> +	depends on BR2_INTERWORKING_SUPPORT
> +	help
> +	  Compile binaries in Thumb mode. Only valid for ARM
> +	  architecture.
> +
>  config BR2_HAVE_MANPAGES
>  	bool "manpages on the target"
>  	default n
> Index: buildroot.new/package/Makefile.in
> ===================================================================
> --- buildroot.new.orig/package/Makefile.in
> +++ buildroot.new/package/Makefile.in
> @@ -46,6 +46,10 @@
>  TARGET_CFLAGS+=-msoft-float
>  endif
>  
> +ifeq ($(BR2_THUMB_BINARIES),y)
> +TARGET_CFLAGS+=-mthumb
> +endif
> +
>  # enable VIS for v9a and v9b
>  ifeq ($(findstring
> y,$(BR2_sparc_v9a)$(BR2_sparc64_v9a)$(BR2_sparc_v9b)$(BR2_sparc64_v9b)),y)
> TARGET_CFLAGS+=-mvis Index: buildroot.new/toolchain/Config.in.2
> ===================================================================
> --- buildroot.new.orig/toolchain/Config.in.2
> +++ buildroot.new/toolchain/Config.in.2
> @@ -61,6 +61,18 @@
>  #	bool "Use softfp"
>  #	default n
>  
> +config BR2_INTERWORKING_SUPPORT
> +	bool "Enable interworking support"
> +	default n
> +	depends on BR2_arm || BR2_armeb
> +	depends on !BR2_generic_arm && !BR2_arm610 && !BR2_arm710
> +	help
> +	  Interworking allows Thumb userspace binaries to be linked
> +	  against the C standard library compiled in ARM mode.
> +
> +	  This is only possible on Thumb-aware architectures, i.e not
> +	  Generic ARM, ARM610 or ARM710.
> +
>  config BR2_TARGET_OPTIMIZATION
>  	string "Target Optimizations"
>  	default "-Os -pipe"
> Index: buildroot.new/toolchain/binutils/binutils.mk
> ===================================================================
> --- buildroot.new.orig/toolchain/binutils/binutils.mk
> +++ buildroot.new/toolchain/binutils/binutils.mk
> @@ -65,6 +65,10 @@
>  BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
>  endif
>  
> +ifeq ($(BR2_INTERWORKING_SUPPORT),y)
> +INTERWORKING_CONFIG_OPTION=--enable-interwork
> +endif
> +
>  BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
> @@ -112,6 +116,7 @@
>  		--disable-werror \
>  		$(SOFT_FLOAT_CONFIG_OPTION) \
>  		$(EXTRA_BINUTILS_CONFIG_OPTIONS) \
> +		$(INTERWORKING_CONFIG_OPTION) \
>  	)
>  	touch $@
>  
> Index: buildroot.new/toolchain/gcc/Makefile.in
> ===================================================================
> --- buildroot.new.orig/toolchain/gcc/Makefile.in
> +++ buildroot.new/toolchain/gcc/Makefile.in
> @@ -65,6 +65,10 @@
>  endif
>  endif
>  
> +ifeq ($(BR2_INTERWORKING_SUPPORT),y)
> +EXTRA_GCC_CONFIG_OPTIONS+=--enable-interwork
> +endif
> +
>  # AVR32 GCC configuration
>  ifeq ($(strip $(BR2_avr32)),y)
>  EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
> Index: buildroot.new/toolchain/uClibc/uclibc.mk
> ===================================================================
> --- buildroot.new.orig/toolchain/uClibc/uclibc.mk
> +++ buildroot.new/toolchain/uClibc/uclibc.mk
> @@ -322,6 +322,13 @@
>  else
>  	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g'
> $(UCLIBC_DIR)/.oldconfig endif
> +ifeq ($(BR2_INTERWORKING_SUPPORT),y)
> +	$(SED) 's,^.*USE_BX.*,USE_BX=y,g' $(UCLIBC_DIR)/.oldconfig
> +	$(SED)
> 's,^.*UCLIBC_EXTRA_CFLAGS.*,UCLIBC_EXTRA_CFLAGS="-mthumb-interwork",g'
> $(UCLIBC_DIR)/.oldconfig +else +
> +	$(SED) 's,^.*USE_BX.*,USE_BX=n,g' $(UCLIBC_DIR)/.oldconfig
> +endif
>  ifeq ($(BR2_UCLIBC_PROGRAM_INVOCATION),y)
>  	$(SED)
> 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g'
> $(UCLIBC_DIR)/.oldconfig else
> 
> 


-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080314/20868ae7/attachment.pgp 
