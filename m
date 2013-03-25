From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 25 Mar 2013 15:50:49 +0800
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <20130322152920.59b74891@skate>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
Message-ID: <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Mar 22, 2013 at 10:29 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 22 Mar 2013 17:01:41 +0800, Sonic Zhang wrote:
>> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Thanks for getting back to us with Blackfin-related changes!
>
>> +config BR2_TARGET_ABI_FLAT
>> +     bool
>
> I don't think FLAT is an ABI, it's a binary format.
>
> For example, on ARM, you can have ELF or FLAT binaries, that follow
> either the OABI or EABI. True, OABI is deprecated, but it still clearly
> points the fact that FLAT is *not* an ABI, but a binary format.
>
> Therefore, I think we should introduce config options like:
>
> config BR2_BINFMT_ELF
>         bool
>
> config BR2_BINFMT_FDPIC
>         bool
>
> config BR2_BINFMT_FLAT
>         bool
>
> probably with a choice list or something.
>

OK.

>>  if BR2_arm || BR2_armeb
>>  source "arch/Config.in.arm"
>>  endif
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index a8bf36b..acfd9c8 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -103,6 +103,14 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
>>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>>
>> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
>> +TARGET_LDFLAGS += -Wl,-elf2flt
>> +endif
>
> This will have to use some BR2_BINFMT_FLAT config option, as per the
> discussion above.
>

OK.

>> +ifneq ($(BR2_USE_MMU), y)
>> +TARGET_CFLAGS += -D__NOMMU__
>> +endif
>
> I'm still not entirely happy with that. This define is completely
> non-standard, I am not sure we want to have this at the global level.
> autotools-based packages should be fixed to check if fork() is
> available or not. For other packages, this special flag can be
> introduced on a per-package basis. But it's true that maybe a good
> number of packages will need that. Not sure here. What do others think?
>

Macro __NOMMU__ is not used only for fork/vfork. There are some
difference between MMU and NOMMU application. For example:
- exit(n) should be replaced by _exit(n) in child process.
- Large buffer or array shouldn't be defined on stack.
- calloc() should be replaced by malloc().

All these changes to MMU application should be protected by macro __NOMMU__


>> +
>>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
>>  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
>>  else
>> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
>> index 890506b..09bdc7b 100644
>> --- a/package/pkg-autotools.mk
>> +++ b/package/pkg-autotools.mk
>> @@ -82,6 +82,11 @@ $(2)_CLEAN_OPT                     ?= clean
>>  $(2)_UNINSTALL_STAGING_OPT   ?= DESTDIR=$$(STAGING_DIR) uninstall
>>  $(2)_UNINSTALL_TARGET_OPT    ?= DESTDIR=$$(TARGET_DIR)  uninstall
>>
>> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
>> + ifneq ($$($(2)_FLAT_STACKSIZE),)
>> +  $(2)_CONF_ENV                      += LDFLAGS="$(TARGET_LDFLAGS) -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)"
>> + endif
>> +endif
>
> Ok. This needs an update in the documentation, detailing the new
> <pkg>_FLAT_STACKSIZE option.
>
>>  #
>>  # Configure step. Only define it if not already defined by the package
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 57b0fd0..5ce32f9 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -303,6 +303,11 @@ endif
>>
>>  $(2)_REDISTRIBUTE            ?= YES
>>
>> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
>> + ifneq ($$($(2)_FLAT_STACKSIZE),)
>> +  $(2)_FLAT_LDFLAGS = -Wl,-elf2flt=-s$$($(2)_FLAT_STACKSIZE)
>> + endif
>> +endif
>
> How is this one supposed to work? Who will use <pkg>_FLAT_LDFLAGS?

If the generic package wants to be built into FLAT binary, it should
append this package specific link flag <pkg>_FLAT_LDFLAGS to the build
command line in its makefile. This flag can't be added to
TARGET_LDFLAGS, because it is package specific.

Regards,

Sonic
