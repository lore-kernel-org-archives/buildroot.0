From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 05 Dec 2011 11:10:25 +0000
Subject: [Buildroot] [PATCH] Improved uClibc support with crosstool-ng
 generated toolchain
In-Reply-To: <201112022254.51498.yann.morin.1998@anciens.enib.fr>
References: <1322841206-2247-1-git-send-email-will_wagner@carallon.com>
 <201112022254.51498.yann.morin.1998@anciens.enib.fr>
Message-ID: <4EDCA6A1.6040406@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/2011 21:54, Yann E. MORIN wrote:
> Will, All,
>
> Please CC: me next time! ;-)
>
> On Friday 02 December 2011 16:53:26 Will Wagner wrote:
>> Currently there is a hard coded uClibc config file when building
>> with crosstools-ng. This patch:
>> - Allows user to pick uClibc version when using ct-ng
>> - Allows user to select nptl when using 0.9.32
>> - Supplys better default uClibc config files (Using same config files as for internal buildroot config)
>> - Allows user to specify a custom uClibc config file
>
> Globally, nothing really wrong IMHO.
>
> The only comment is: make separate patches for each changes. I would suggest
> this ordering:
>   1/4 Allows user to pick uClibc version when using ct-ng
>   2/4 Supplys better default uClibc config files
>   3/4 Allows user to specify a custom uClibc config file
>   4/4 Allows user to select nptl when using 0.9.32

Will split it up, not sure how easy I can split 2 and 3 but will see.

>
> See some other comments below...
>
>> Signed-off-by: Will Wagner<will_wagner@carallon.com>
>> ---
>>   toolchain/toolchain-crosstool-ng/Config.in       |   28 +++-
>>   toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   14 ++-
>>   toolchain/toolchain-crosstool-ng/uClibc.config   |  246 ----------------------
>>   3 files changed, 40 insertions(+), 248 deletions(-)
>>   delete mode 100644 toolchain/toolchain-crosstool-ng/uClibc.config
>>
>> diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
>> index 2d1e801..7e21ce9 100644
>> --- a/toolchain/toolchain-crosstool-ng/Config.in
>> +++ b/toolchain/toolchain-crosstool-ng/Config.in
>> @@ -50,6 +50,30 @@ if BR2_TOOLCHAIN_CTNG_uClibc
>>
>>   comment "Toolchain Options"
>>
>> +choice
>> +	prompt "uClibc C library Version"
>> +	default BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
>> +	help
>> +	  Select the version of uClibc you wish to use.
>> +
>> +	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
>> +		bool "uClibc 0.9.30.x"
>> +
>> +	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
>> +		bool "uClibc 0.9.32.x"
>> +
>> +endchoice
>> +
>> +config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
>> +	string "uClibc configuration file to use?"
>> +	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
>> +	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
>> +	help
>> +	  Some people may wish to use their own modified uClibc configuration
>> +	  file and will specify their config file location with this option.
>> +	  See also docs/README in this package.
>> +	  If unsure, use the default.
>> +
>>   config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
>>   	bool "Enable large file (files>  2 GB) support"
>>   	select BR2_LARGEFILE
>> @@ -130,7 +154,9 @@ choice
>>   		bool "Native POSIX Threading (NPTL)"
>>   		select BR2_TOOLCHAIN_HAS_THREADS
>>   		depends on BR2_TOOLCHAIN_CTNG_eglibc || \
>> -			   BR2_TOOLCHAIN_CTNG_glibc
>> +		           BR2_TOOLCHAIN_CTNG_glibc || \
>> +		           BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
>> +
>
> This means that, when newer uClibc version come out, we'll have to maintain
> this 'depends on'. I'd suggest:
>
> config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
>      bool "0.9.32"
>      select BR2_TOOLCHAIN_CTNG_uClibc_NPTL_OK
>
> config BR2_TOOLCHAIN_CTNG_uClibc_NPTL_OK
>      bool
>
> config BR2_TOOLCHAIN_CTNG_THREADS_NPTL
>      bool "NPTL"
>      depends on glibc || eglibc || BR2_TOOLCHAIN_CTNG_uClibc_NPTL_OK
>
> (Note: I used shortened names for readability only, this should not be
> used as-is, of course!)

For ease of maintainability we could use the negative (ie 
BR2_TOOLCHAIN_CTNG_uClibc_NO_NPTL) as then people won't have to remember 
to add 'select BR2_TOOLCHAIN_CTNG_uClibc_NPTL_OK' when they add a new 
uClibc version.

>
>>   endchoice
>>
>>   endif # BR2_TOOLCHAIN_CTNG
>> diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
>> index 3a205dd..4311097 100644
>> --- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
>> +++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
>> @@ -10,7 +10,7 @@
>>
>>   CTNG_DIR := $(BUILD_DIR)/build-toolchain
>>
>> -CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
>> +CTNG_UCLIBC_CONFIG_FILE := $(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_CONFIG))
>>   CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
>>
>>   # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
>> @@ -267,6 +267,18 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
>>   # uClibc specific options
>>   ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
>>
>> +# Set version
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_32).*:\# \2 is not set:;
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_3).*:\# \2 is not set:;
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_2).*:\# \2 is not set:;
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_1).*:\# \2 is not set:;
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30).*:\# \2 is not set:;
>> +ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),)
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_32).*:\2=y:;
>> +else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),)
>> +CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_3).*:\2=y:;
>> +endif
>
> You'll get the same issue as the LT_NEW vs. LT_OLD you mentioned earlier.
> Also, I do not like negative tests:
>    ifneq ($(blabla),)
>    do blabla stuff
> would be better written thus:
>    ifeq ($(blabla),y)
>    do blabla stuff
>
> The following should be OK (untested, may need some tweaking)
>
> # Set version
> ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),y)
> CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:# \1\2 is not set\n\1_0_9_32=y:;
> else ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),y)
> CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_V)(.+)=y$$:# \1\2 is not set\n\1_0_9_30=y:;
> endif

I'd prefer not to do this as I copied exactly how buildroot does it for 
internal uClibc build. The reason it works fine there is those default 
config files have entries for all three threading options but the one in 
crosstool-ng doesn't. I'm not sure how Peter generates them, but as the 
entries are there already I would rather keep the mechanism exactly the 
same as for internal toolchain.

>
> Otherwise, pretty OK for me. Care to address the above, so I can test
> and apply my tag-lines?

Will respin with your comments and repost.

>
> Regards,
> Yann E. MORIN.
>


-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
