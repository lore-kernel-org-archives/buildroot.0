From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Fri, 06 Mar 2015 13:32:56 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: add link-time-optimization
 support
In-Reply-To: <54F8CD88.1080006@mind.be>
References: <1425479715-5716-1-git-send-email-syntheticpp@gmx.net>
 <54F8CD88.1080006@mind.be>
Message-ID: <54F99E78.70303@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Arnout, I send an updated patch with your changes.

Am 05.03.2015 um 22:41 schrieb Arnout Vandecappelle:
>   Hi Peter,
>
> On 04/03/15 15:35, Peter K?mmel wrote:
>
>   I would start the commit log with mentioning that LTO is not used by default.
>
>> GCC's link-time-optimization could be enabled by the flag '-flto'.
>> With LTO enabled, ar and runlib must be called with an argument which
>
>   runlib -> ranlib
>
>> triggers the usage of a LTO plugin.
>> GCC provides wrappers for ar and ranlib which implicitly pass the LTO
>> arguments to ar/ranlib. This way existing Makefiles don't need to be
>> changed for LTO support when these wrappers around ar and ranlib are used.
>> Also the LTO and plugin support must be enabled in the host's binutils.
>
>   This part should mention explicitly that it applies to the external toolchains.
>
>   Example of an (IMHO) improved commit message:
>
>>>>
> Add a new option BR2_GCC_ENABLE_LTO that builds gcc and binutils with LTO support.
>
> Individual packages still have to enable LTO explicitly by passing '-flto' to
> GCC, which passes it on to the linker. This option does not add that flag
> globally. Some packages detect if the compiler supports LTO and enable the flag
> if it does.
>
> To support LTO, ar and ranlib must be called with an argument which triggers the
> usage of the LTO plugin. Since GCC doesn't call these tools itself, it instead
> provides wrappers for ar and ranlib that pass the LTO arguments. This way
> existing Makefiles don't need to be changed for LTO support. However, these
> wrappers are called <tuple>-gcc-ar which matches the pattern to link to the
> buildroot wrapper in the external toolchain logic. So the external toolchain
> logic is updated to provide the correct symlink.
> <<<
>
>>
>> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
>
>   Can you add a patch changelog in the future? Look at other patches on the list
> to see how it is done.
>
>   Also, put the version number of the patch in the subject. You can easily do
> this using 'git format-patch -v5' (or for older git versions 'git format-patch
> --subject-prefix="PATCH v5"')
>
>
>> ---
>>   package/binutils/binutils.mk                       | 4 ++++
>>   package/gcc/Config.in.host                         | 7 +++++++
>>   package/gcc/gcc.mk                                 | 4 ++++
>>   toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
>>   4 files changed, 23 insertions(+)
>>
>> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
>> index 9e99253..daa8c45 100644
>> --- a/package/binutils/binutils.mk
>> +++ b/package/binutils/binutils.mk
>> @@ -96,5 +96,9 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
>>   HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
>>   endif
>>
>> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
>> +HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
>> +endif
>> +
>>   $(eval $(autotools-package))
>>   $(eval $(host-autotools-package))
>> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
>> index dd61f51..3c83579 100644
>> --- a/package/gcc/Config.in.host
>> +++ b/package/gcc/Config.in.host
>> @@ -116,6 +116,13 @@ config BR2_GCC_ENABLE_TLS
>>   	  Enable the compiler to generate code for accessing
>>   	  thread local storage variables
>>
>> +config BR2_GCC_ENABLE_LTO
>> +	bool "Enable compiler link-time-optimization support"
>> +	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
>> +	help
>> +	  Since version 4.5 GCC supports lto. Build GCC with lto support enabled.
>
>   This line should be wrapped. And perhaps an improved help text would be:
>
> 	  Since version 4.5, GCC supports link-time optimization (LTO). Select
> 	  this option to turn on LTO support in GCC.
>
>> +	  Needed when -flto should be used.
>> +
>>   config BR2_GCC_ENABLE_OPENMP
>>   	bool "Enable compiler OpenMP support"
>>   	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
>> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
>> index ffac15c..b5d2ddb 100644
>> --- a/package/gcc/gcc.mk
>> +++ b/package/gcc/gcc.mk
>> @@ -132,6 +132,10 @@ else
>>   HOST_GCC_COMMON_CONF_OPTS += --disable-tls
>>   endif
>>
>> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
>> +HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
>> +endif
>> +
>>   ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
>>   HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
>>   else
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index ab73f9a..d7a8499 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -656,12 +656,20 @@ endif
>>   # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
>>   # symlinks for everything else. Skip gdb symlink when we are building our
>>   # own gdb to prevent two gdb's in output/host/usr/bin.
>> +# When the link-time-optimazation flag '-flto' is used, then the compiler
>> +# and binutils have to support lto. ar/ranlib needs to be called with the
>> +# lto plugin. The wrappers *-gcc-ar and *-gcc-ranlib provided by GCC could
>> +# be used as drop-ins for ar/runlib when Makefiles are used which do not
>> +# pass the lto arguments.
>>   define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>>   	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
>>   	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
>>   	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
>>   		base=$${i##*/}; \
>>   		case "$$base" in \
>> +		*-ar|*-ranlib|*-nm) \
>> +			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
>> +			;; \
>
>   This part could actually be a separate patch, since it fixes a problem that is
> exists even if we don't support LTO in buildroot. However, since this patch is
> already in good shape, (just some text changes), it's not really necessary for
> me to still split it.
>
>>   		*cc|*cc-*|*++|*++-*|*cpp) \
>>   			ln -sf ext-toolchain-wrapper $$base; \
>>   			;; \
>>
>
>
