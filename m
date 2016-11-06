From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 6 Nov 2016 20:06:22 +0100
Subject: [Buildroot] [PATCH v3 24/24] toolchain-external: introduce and
 use external toolchain infra
In-Reply-To: <938bd7e7-4b05-b59d-2c47-a1bfaf1e766c@mind.be>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
 <1477925833-27204-25-git-send-email-romain.naour@gmail.com>
 <938bd7e7-4b05-b59d-2c47-a1bfaf1e766c@mind.be>
Message-ID: <b08eb3ae-c434-f49a-9c2a-110a94fe4409@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the review and comments :)

Le 06/11/2016 ? 16:20, Arnout Vandecappelle a ?crit :
> 
> 
> On 31-10-16 15:57, Romain Naour wrote:
>> This fairly large commit is needed to switch in one atomic change from
>> the old single package based external toolchain handling, to a
>> mechanism based on a common external toolchain package infrastructure
>> and separate packages for each toolchain family. The purpose is to
>> clearly separate the common external toolchain logic from the
>> toolchain-specific details and generally make the external toolchain
>> code hopefully easier to maintain.
>>
>> To achieve this, this commit:
>>
>>  - Introduce in pkg-toolchain-external.mk the
> 
>  Indentation is not right here.
> 
>>      'toolchain-external-package' macro, which is the core of the
>>      external toolchain package infrastructure. Like any other package
>>      infrastructure, it defines a number of variables and provides a
>>      behavior for the configure, build and install steps.
>>
>>    - Turn the toolchain-external.mk file in a simple virtual package,
>>      which automatically depends on the selected external
>>      toolchain. Like any other virtual package, the Kconfig variable
>>      BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL indicates which package is
>>      providing the currently selected toolchain.
>>
>>    - Removes all the toolchain-specific definitions from
>>      toolchain/toolchain-external/Config.in as well as the hash file,
>>      and instead use the per-toolchain packages in the subdirectories
>>      toolchain/toolchain-external/*/.
> 
>  This commit message is too short :-P It is missing an explanation of
> Config.in.options. I wasn't sure whether a comment in the Config.in was called
> for, but this is a design decision so it fits better in the commit message:
> 
>   - The toolchain-specific Config.in files are used in a choice, so can only
>     specify a choice option. Therefore, an additional Config.in.options file
>     is created for each toolchain to specify additional options.

ok.

> 
>>
>>    - Wine: Use $(TOOLCHAIN_EXTERNAL_PREFIX) instead of
>>      $(BR2_TOOLCHAIN_EXTERNAL_PREFIX) which was removed.
>>
>>    - Keep the current default choice for external toolchains:
>>       BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
>>       BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>>       BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
>>       BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
>>       BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>>       BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
>>       BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
>>       BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>>       BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>>       BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>>       BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
>>       BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>>
>>     For Aarch64, use Linaro as default over Codesourcery toolchains
>>     For ARM, use Linaro as default over Codesourcery and Arago toolchains
>>     For MIPS, use Codesourcery over Codescape toolchains
>>
>> Notes:
>>    - The hack for setting TOOLCHAIN_EXTERNAL_BIN for the ADI bfin
>>      toolchain is no longer needed.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
>  I have a bunch more remarks, but they're mostly about how to organise the patch
> series (which is less important) and how to make things nicer. So I would say
> this patch series can go in.
> 
>  *However*, there is one improvement that has major impact: I don't think there
> is a need to define per-package _CC and _CFLAGS variables, which means that
> patches 1-4 are also not needed. That *is* a major rewrite of the series, and a
> bit more difficult to do in follow-up patches.

I guess it should be possible to set TOOLCHAIN_EXTERNAL_CC with $$($(2)_CC) in
the new toolchain-external infra.

> 
>  So I propose that I take over this series today, hopefully I can submit a new
> version in the evening.

Ok thank you Arnout :)

> 
>> ---
>> v3: Keep current default choice for toolchains (i.e do not sort toolchains by
>>     alphabetical order)
>> v2: - merge all pkg-toolchain-external* into pkg-toolchain-external.mk (Arnout)
>>     - rebase on master
>>
>>     fix two big issue:
>>     1) TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS were not included in the
>>        toolchain wrapper.
>>     2) TOOLCHAIN_EXTERNAL_CFLAGS wasn't included in $(2)_CFLAGS, same
>>        for TOOLCHAIN_EXTERNAL_LIBS and $(2)_LIBS. So no libraries were
>>        intalled in target.
>> ---
> 
> [snip]
>> @@ -608,50 +85,48 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
>>  	help
>>  	  Path to where the external toolchain is installed.
>>  
>> -config BR2_TOOLCHAIN_EXTERNAL_URL
>> -	string "Toolchain URL"
>> -	depends on BR2_TOOLCHAIN_EXTERNAL_CUSTOM && BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
>> -	help
>> -	  URL of the custom toolchain tarball to download and install.
>> +# Kept toolchains sorted by architecture in order to use some toolchain
>> +# as default choice
> 
>  This remarks isn't really correct here because we're not in a choice. It should
> rather be
> 
> # Kept toolchains in the same order as above.

Well, the copy past was easy here :p
Thanks for noticing it.

> 
> [snip]
> 
>>  #  2. For all external toolchains, perform some checks on the
>>  #  conformity between the toolchain configuration described in the
>>  #  Buildroot menuconfig system, and the real configuration of the
>>  #  external toolchain. This is for example important to make sure that
>>  #  the Buildroot configuration system knows whether the toolchain
>> -#  supports RPC, IPv6, locales, large files, etc. Unfortunately, these
>> +#  supports RPC, locales, large files, etc. Unfortunately, these
> 
>  Ha, you slipped in an unrelated correction here! :-)

you're right

> 
>>  #  things cannot be detected automatically, since the value of these
>>  #  options (such as BR2_TOOLCHAIN_HAS_NATIVE_RPC) are needed at
>>  #  configuration time because these options are used as dependencies
>> @@ -63,6 +56,15 @@
>>  #  $(HOST_DIR)/usr/bin like for the internal toolchains, and the rest
>>  #  of Buildroot is handled identical for the 2 toolchain types.
>>  
>> +#  - Definitions of the list of libraries that should be copied to the
>> +#    target.
>> +#  - Definition of the CFLAGS to use with the external toolchain, as
>> +#    well as the common toolchain wrapper build arguments
> 
>  What is this doing here? It is just a reformulation of the comments you have
> below, and for the second one it's quite far away.
> 
>> +#
>> +
>> +#
>> +# Define the list of libraries to copy
>> +#
>>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
>>  TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
>> @@ -100,94 +102,16 @@ endif
>>  
>>  TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
>>  
>> -# Details about sysroot directory selection.
> 
>  It's a pity you moved this bit around in the same commit because it needlessly
> makes the diff quite a bit larger.

I guess I failed to put back in place some hunk after I squashed all
pkg-toolchain-external-*.mk files.

> 
> [snip]
>> @@ -198,46 +122,46 @@ CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
>>  # to select the right multilib variant
>>  ifeq ($(BR2_x86_64),y)
>>  TOOLCHAIN_EXTERNAL_CFLAGS += -m64
>> -TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
>> +TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS += -DBR_64
> 
>  There was no strict need to change the name of this variable, or it could have
> been done in a separate commit, but OK.
> 
>>  endif
> [snip]
>> @@ -245,235 +169,96 @@ TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
>>  
>>  ifeq ($(BR2_SOFT_FLOAT),y)
>>  TOOLCHAIN_EXTERNAL_CFLAGS += -msoft-float
>> -TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_SOFTFLOAT=1
>> -endif
>> -
>> -# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
>> -# So, add the musl-compat-headers package that will install those files,
>> -# into the staging directory:
>> -#   sys/queue.h:  header from NetBSD
>> -#   sys/cdefs.h:  minimalist header bundled in Buildroot
>> -ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>> -TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
>> -endif
> 
>  Again, moving around code making the patch needlessly large.
> 
> [snip]
> 
>>  # Integration of the toolchain into Buildroot: find the main sysroot
>> @@ -629,10 +331,6 @@ endef
>>  #                       our sysroot, and the directory will also be
>>  #                       considered when searching libraries for copy
>>  #                       to the target filesystem.
>> -#
>> -# Please be very careful to check the major toolchain sources:
>> -# Buildroot, Crosstool-NG, CodeSourcery and Linaro
>> -# before doing any modification on the below logic.
> 
>  Why is this comment no longer valid?

It has been lost...

> 
> [snip]
>> +# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
>> +# So, add the musl-compat-headers package that will install those files,
>> +# into the staging directory:
>> +#   sys/queue.h:  header from NetBSD
>> +#   sys/cdefs.h:  minimalist header bundled in Buildroot
>> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> 
>  Hm, now you put the two together, it becomes obvious that this should be
> BR2_TOOLCHAIN_EXTERNAL_MUSL like below. But that should be in a separate patch,
> obviously.
> 
>  Or actually, why do we do this separately for internal and external toolchains?
> We could just steer the dependency from the toolchain virtual patckage...

Humm, yes maybe

> 
>> +TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
>> +endif
>> +
>> +# With the musl C library, the libc.so library directly plays the role
>> +# of the dynamic library loader. We just need to create a symbolic
>> +# link to libc.so with the appropriate name.
>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
>> +ifeq ($(BR2_i386),y)
>> +MUSL_ARCH = i386
>> +else ifeq ($(BR2_ARM_EABIHF),y)
>> +MUSL_ARCH = armhf
>> +else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
>> +MUSL_ARCH = mipsel-sf
>> +else ifeq ($(BR2_sh),y)
>> +MUSL_ARCH = sh
>> +else
>> +MUSL_ARCH = $(ARCH)
>> +endif
>> +define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
>> +	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
>> +endef
>> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> 
>  For this part, I wonder if it shouldn't move to the
> toolchain-external-musl-cross package. It's the only musl external toolchain we
> have at the moment, and other musl external toolchains may not need this. In
> particular, the buildroot-generated toolchains already have this symlink so it's
> not necessary to recreate it.
> 
>  But that can be done in a follow-up patch (it changes behaviour).

But we can use a toolchain-external-custom with a (prebuild) musl toolchain. so
if there is not this symlink the toolchain will not work.

> 
>> +endif
>> +
> [snip]
>> @@ -813,28 +550,155 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
>>  	fi
>>  endef
>>  
>> -TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
>> +define inner-toolchain-external-package
>> +
>> +$(2)_INSTALL_STAGING = YES
>> +$(2)_ADD_TOOLCHAIN_DEPENDENCY = NO
>>  
>> -define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
>> -	$(call TOOLCHAIN_WRAPPER_INSTALL)
>> -	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>> -	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>> -	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
>> -	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
>> -	$(call TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
>> +$(2)_DOWNLOAD_INSTALL_DIR = $(HOST_DIR)/opt/ext-toolchain
> 
>  I don't like it at all when a package infra defines internal variables in its
> template macro. I think that as much as possible, it should only define
> variables that are meant to be overridden by the individual packages. My reasons
> for this:
> 
> - Each additional variable increases the hash table size and slows down make.
> Variables defined in a template macro are in fact defined many times, so are
> much more expensive. This is less the case for the toolchain infra because we
> just have a few toolchains.
> 
> - It is easy to get confused with the early/late expansion and double dollars.
> We therefore already have the rule that everything should be double-dollared
> unless there is a reason not to. So here it should be $$(HOST_DIR).
> 
> - The $(2)... stuff is in my opinion more difficult to read and understand than
> $($(PKG)_...)
> 
>  One of my plans is to some day go through all the package infras and remove
> variable definitions that aren't needed per-package.
> 
>  For this particular variable, however, it could have been kept as
> TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.

Ok that's something I wasn't aware of. Thanks for the explanation.

> 
>> +
>> +# In fact, we don't need to download the toolchain, since it is already
>> +# available on the system, so force the site and source to be empty so
>> +# that nothing will be downloaded/extracted.
>> +ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
>> +$(2)_SITE =
>> +$(2)_SOURCE =
>> +endif
>> +
>> +ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>> +$(2)_INSTALL_DIR = $$($(2)_DOWNLOAD_INSTALL_DIR)
>> +else
>> +$(2)_INSTALL_DIR = $$(call qstrip,$$(BR2_TOOLCHAIN_EXTERNAL_PATH))
>> +endif
> 
>  Again, this could stay TOOLCHAIN_EXTERNAL_INSTALL_DIR like it was before
> because it doesn't depend on $(2).
> 
>> +
>> +ifeq ($$($(2)_INSTALL_DIR),)
>> +ifneq ($$($(2)_PREFIX),)
>> +$(2)_BIN = $$(shell dirname $$(shell which $$($(2)_PREFIX)-gcc))
>> +endif
>> +else
>> +$(2)_BIN = $$($(2)_INSTALL_DIR)/$$($(2)_SUBDIR)/bin
>> +endif
> 
>  This is an example where moving it out would just make things more complicated.
> It could be done as:
> 
> TOOLCHAIN_EXTERNAL_BIN = \
> 	$(if $($(PKG)_INSTALL_DIR),\
> 		$(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/$($(PKG)_SUBDIR)/bin,\
> 		$(if $($(PKG)_PREFIX),,\
> 			$(dirname $(shell which $($(PKG)_PREFIX)-gcc))))
> 
> but that is absolutely a lot less readable so not a good idea.
> 
> 
>> +
>> +$(2)_TOOLCHAIN_WRAPPER_ARGS = $$(TOOLCHAIN_EXTERNAL_COMMON_WRAPPER_ARGS)
>> +
>> +ifeq ($$(filter $$(HOST_DIR)/%,$$($(2)_BIN)),)
>> +# $(2)_BIN points outside HOST_DIR => absolute path
>> +$(2)_TOOLCHAIN_WRAPPER_ARGS += \
>> +	-DBR_CROSS_PATH_ABS='"$$($(2)_BIN)"'
>> +else
>> +# $(2)_BIN points inside HOST_DIR => relative path
>> +$(2)_TOOLCHAIN_WRAPPER_ARGS += \
>> +	-DBR_CROSS_PATH_REL='"$$($(2)_BIN:$$(HOST_DIR)/%=%)"'
>> +endif
> 
>  This one is good as well.
> 
>> +
>> +# If this is a buildroot toolchain, it already has a wrapper which we want to
>> +# bypass. Since this is only evaluated after it has been extracted, we can use
>> +# $(wildcard ...) here.
>> +$(2)_SUFFIX = $$(if $$(wildcard $$($(2)_BIN)/*.br_real),.br_real)
>> +$(2)_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='"$$($(2)_SUFFIX)"'
>> +
>> +$(2)_CROSS = $$($(2)_BIN)/$$($(2)_PREFIX)-
>> +$(2)_CC = $$($(2)_CROSS)gcc$$($(2)_SUFFIX)
>> +$(2)_CXX = $$($(2)_CROSS)g++$$($(2)_SUFFIX)
>> +$(2)_FC = $$($(2)_CROSS)gfortran$$($(2)_SUFFIX)
>> +$(2)_READELF = $$($(2)_CROSS)readelf$$($(2)_SUFFIX)
> 
>  These ones could easily be done generically.
> 
>> +
>> +$(2)_CFLAGS += $$(TOOLCHAIN_EXTERNAL_CFLAGS)
>> +$(2)_LIBS += $$(TOOLCHAIN_EXTERNAL_LIBS)
> 
>  Here, I wonder why they even exist? It would be useful if there were a
> toolchain package that used them, but none of them do...
> 
>  And anyway, that specific situation would still be supported with
> 
> TOOLCHAIN_EXTERNAL_CFLAGS += $($(PKG)_CFLAGS)
> 
>  In fact, if you move the TOOLCHAIN_EXTERNAL_CC and TOOLCHAIN_EXTERNAL_CFLAGS
> parts out of the infra, then patches 1-4 become redundant...

Ok I see.

> 
>> +
>> +# Normal handling of downloaded toolchain tarball extraction.
>> +ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>> +$(2)_EXCLUDES = usr/lib/locale/*
>> +
>> +# As a regular package, the toolchain gets extracted in $(@D), but
>> +# since it's actually a fairly special package, we need it to be moved
>> +# into $(2)_DOWNLOAD_INSTALL_DIR.
>> +define $(2)_MOVE
>> +	rm -rf $$($(2)_DOWNLOAD_INSTALL_DIR)
>> +	mkdir -p $$($(2)_DOWNLOAD_INSTALL_DIR)
>> +	mv $$(@D)/* $$($(2)_DOWNLOAD_INSTALL_DIR)/
>>  endef
>> +$(2)_POST_EXTRACT_HOOKS += $(2)_MOVE
>> +endif
>>  
>> +ifndef $(2)_CONFIGURE_CMDS
>> +# Checks for an already installed toolchain: check the toolchain
>> +# location, check that it supports sysroot, and then verify that it
>> +# matches the configuration provided in Buildroot: ABI, C++ support,
>> +# kernel headers version, type of C library and all C library features.
>> +define $(2)_CONFIGURE_CMDS
>> +	$(Q)$$(call check_cross_compiler_exists,$$($(2)_CC))
>> +	$(Q)$$(call check_unusable_toolchain,$$($(2)_CC))
>> +	$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$($(2)_CC))" ; \
>> +	$$(call check_kernel_headers_version,\
>> +		$$(call toolchain_find_sysroot,$$($(2)_CC)),\
>> +		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
>> +	$$(call check_gcc_version,$$($(2)_CC),\
>> +		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
>> +	if test "$(BR2_arm)" = "y" ; then \
>> +		$$(call check_arm_abi,\
>> +			"$$($(2)_CC) $$($(2)_CFLAGS)",\
>> +			$$($(2)_READELF)) ; \
>> +	fi ; \
>> +	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
>> +		$$(call check_cplusplus,$$($(2)_CXX)) ; \
>> +	fi ; \
>> +	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
>> +		$$(call check_fortran,$$($(2)_FC)) ; \
>> +	fi ; \
>> +	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
>> +		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
> 
>  Ah, the joys of double-double-dollars...
> 
>  The rest looks OK :-)

Thanks for the review and the respin :)

Best regards,
Romain

> 
> 
>  Regards,
>  Arnout
> 
>> +	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
>> +		$$(call check_musl,$$$${SYSROOT_DIR}) ; \
>> +	else \
>> +		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
>> +	fi
>> +	$(Q)$$(call check_toolchain_ssp,$$($(2)_CC))
>> +endef
>> +endif
>> +
>> +ifndef $(2)_BUILD_CMDS
>> +define $(2)_BUILD_CMDS
>> +	$$(TOOLCHAIN_WRAPPER_BUILD)
>> +endef
>> +endif
> 
> [snip]
> 
