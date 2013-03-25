From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 25 Mar 2013 19:33:32 +0800
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
 architecture support.
In-Reply-To: <20130322155400.410ec78e@skate>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
 <20130322155400.410ec78e@skate>
Message-ID: <CAJxxZ0NLV==GLHFP627kk_BiaDst+a8qp71k_gnv0y=Sqj5=qA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Mar 22, 2013 at 10:54 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> Please add a commit log explaining all what you're doing. Your changes
> are quite architecture-specific and touch the core of Buildroot, but
> there are also not comments and no commit log.
>
> Also your changelog should be below the --- and not before, otherwise
> it ends up in the commit log forever.
>
> On Fri, 22 Mar 2013 17:01:42 +0800, Sonic Zhang wrote:
>
>> diff --git a/Makefile b/Makefile
>> index 7f0822f..c2f43a4 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -329,6 +329,8 @@ ifneq ($(PACKAGE_OVERRIDE_FILE),)
>>  -include $(PACKAGE_OVERRIDE_FILE)
>>  endif
>>
>> +include arch/Makefile.in
>
> I must admit I am not entirely happy with having Blackfin-specific
> Makefiles, but it's true that we already have some
> architecture-specific crap in package/Makefile.in that we could more
> cleanly spread in arch/Makefile.in.<arch>.
>
>> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
>> index 0b137ae..0750b86 100644
>> --- a/arch/Config.in.bfin
>> +++ b/arch/Config.in.bfin
>> @@ -7,10 +7,127 @@ config BR2_BFIN_FDPIC
>>  config BR2_BFIN_FLAT
>>       bool "FLAT"
>>       select BR2_PREFER_STATIC_LIB
>> +config BR2_BFIN_FLAT_SEP_DATA
>> +     bool "FLAT (Separate data)"
>> +     select BR2_PREFER_STATIC_LIB
>> +config BR2_BFIN_SHARED_FLAT
>> +     bool "Shared FLAT"
>> +     select BR2_PREFER_STATIC_LIB
>> +endchoice
>
> I don't think we should have Blackfin-specific options. As I suggested
> in the review of PATCH 1/2, we should probably have global
> BR2_BINFMT_<foo> options.
>

OK. I will move these macro to arch/Config.in

>> +config BR2_TARGET_CPU_REVISION
>> +     string "Target CPU revision"
>
> Help text needed.
>

OK.

>> +config BR2_BFIN_INSTALL_ELF_SHARED
>> +     depends on BR2_bfin && !BR2_BFIN_FDPIC
>
> Confused: why in the FDPIC case you would not install the ELF shared
> libraries?
>

Blackfin Linux kernel supports running both FDPIC and FLAT
applications concurrently if the binary format specific libraries
installed properly. This option allow developer to install FDPIC
libraries into a buildroot rootfs image built with binary format macro
other than BR2_BINFMT_FDPIC. It doesn't take effect if
BR2_BINMAT_FDPIC is configured.

>> +     bool "Install ELF shared libraries"
>> +     default y
>
> Help text needed.
>

OK.

>> +config BR2_BFIN_INSTALL_FLAT_SHARED
>> +     depends on BR2_bfin
>> +     bool "Install FLAT shared libraries" if !BR2_BFIN_SHARED_FLAT
>> +     default y
>
> Help text needed.
>
>> +
>>  config BR2_ARCH
>>       default "bfin"
>>
>>  config BR2_ENDIAN
>>          default "LITTLE"
>> +
>> +config BR2_GCC_TARGET_CPU
>> +     default bf606           if BR2_bf606
>> +     default bf607           if BR2_bf607
>> +     default bf608           if BR2_bf608
>> +     default bf609           if BR2_bf609
>> +     default bf512           if BR2_bf512
>> +     default bf514           if BR2_bf514
>> +     default bf516           if BR2_bf516
>> +     default bf518           if BR2_bf518
>> +     default bf522           if BR2_bf522
>> +     default bf523           if BR2_bf523
>> +     default bf524           if BR2_bf524
>> +     default bf525           if BR2_bf525
>> +     default bf526           if BR2_bf526
>> +     default bf527           if BR2_bf527
>> +     default bf531           if BR2_bf531
>> +     default bf532           if BR2_bf532
>> +     default bf533           if BR2_bf533
>> +     default bf534           if BR2_bf534
>> +     default bf536           if BR2_bf536
>> +     default bf537           if BR2_bf537
>> +     default bf538           if BR2_bf538
>> +     default bf539           if BR2_bf539
>> +     default bf542           if BR2_bf542
>> +     default bf544           if BR2_bf544
>> +     default bf547           if BR2_bf547
>> +     default bf548           if BR2_bf548
>> +     default bf549           if BR2_bf549
>> +     default bf561           if BR2_bf561
>> +
>> +config BR2_TARGET_ABI_FLAT
>> +     default n               if BR2_BFIN_FDPIC
>> +     default y
>
> To be refactored with the BR2_BINFMT_<foo> stuff.
>

OK.

>> diff --git a/arch/Makefile.in b/arch/Makefile.in
>> new file mode 100644
>> index 0000000..d791118
>> --- /dev/null
>> +++ b/arch/Makefile.in
>> @@ -0,0 +1,5 @@
>> +# The architecture specific Makefile.in.$ARCH should be included only
>> +# when the arch macro is selected.
>> +ifeq ($(BR2_bfin),y)
>> +include arch/Makefile.in.bfin
>> +endif
>
> Ok.
>
>> diff --git a/arch/Makefile.in.bfin b/arch/Makefile.in.bfin
>> new file mode 100644
>> index 0000000..e16532a
>> --- /dev/null
>> +++ b/arch/Makefile.in.bfin
>> @@ -0,0 +1,50 @@
>> +TARGETS-y =
>
> Isn't that dangerous if someone else is using TARGETS-y ?

Yes, this line can be removed.

>
>> +TARGETS-$(BR2_BFIN_INSTALL_ELF_SHARED) += romfs.shared.libs.elf
>> +TARGETS-$(BR2_BFIN_INSTALL_FLAT_SHARED) += romfs.shared.libs.flat
>
> What's the relation with "romfs" ?
>
> Also, we more or less name all our targets target-<something>, so it
> would be good to follow this convention. Also remember to update
> the TARGET_EXCEPTIONS variable in support/scripts/graph-depends when
> you add more of such custom targets.
>

OK.

>> +TARGETS += $(TARGETS-y)
>> +
>> +ifeq ($(BR2_BFIN_FDPIC),y)
>> +USR_LIB_EXTERNAL_LIBS += libgfortran.so libgomp.so libmudflap.so libmudflapth.so libobjc.so
>> +endif
>
> This is totally unrelated to Blackfin, and therefore has no reason to
> be here and to depend on BR2_BFIN_FDPIC.
>

Where should I put these library names to ?

>> +CROSS_COMPILE_SHARED_ELF ?= bfin-linux-uclibc-
>
> No reason to be here. Please use $(TARGET_CC) and $(TARGET_READELF)
> below.

There are 2 individual Blackfin toolchain binaries for FDPIC and FLAT
format. The prefix names are different. And as I explained ahead, the
target is to install libraries of a different binary format with
different toolchain prefix name in current $(TARGET_CC) and
$(TARGET_READELF). So, this macro can not be removed.

>> +romfs.shared.libs.elf:
>> +     set -e; \
>> +     t=`$(CROSS_COMPILE_SHARED_ELF)gcc $(CPUFLAGS) -print-file-name=libc.a`; \
>> +     t=`dirname $$t`/../..; \
>> +     for i in $$t/lib/*so*; do \
>> +             i=`readlink -f "$$i"`; \
>> +             soname=`$(CROSS_COMPILE_SHARED_ELF)readelf -d "$$i" | sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
>> +             $(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
>> +     done
>
> Isn't this done already by the external toolchain logic? Some
> documentation/comments on what you're doing here would be good. I'm
> trying to understand if it's really Blackfin-specific, if it's specific
> to the usage of external toolchains or would apply to the internal
> toolchain backend as well, etc.
>

No. Refer to my explanation ahead.

>> +CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
>
> TARGET_CC to be used below.
>

Ditto.

>> +romfs.shared.libs.flat:
>> +     set -e; \
>> +     t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS) -mid-shared-library -print-file-name=libc`; \
>> +     if [ -f $$t -a ! -h $$t ] ; then \
>> +             $(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
>> +     fi
>> +
>> +ifeq ($(BR2_TARGET_CPU_REVISION),)
>> +TARGET_CPU = -mcpu=$(BR2_GCC_TARGET_CPU)
>> +else
>> +TARGET_CPU = -mcpu=$(BR2_GCC_TARGET_CPU)-$(BR2_TARGET_CPU_REVISION)
>> +endif
>> +TARGET_CFLAGS += $(call qstrip,$(TARGET_CPU))
>
> This will not work for the external toolchain wrapper logic. The
> external toolchain wrapper logic (in
> toolchain/toolchain-external/ext-tool.mk) takes the value of
> BR2_GCC_TARGET_CPU and encodes it as a -mcpu in the external toolchain
> wrapper. We want this to be part of the external toolchain wrapper
> instead of TARGET_CFLAGS so that people directly using the external
> toolchain from host/usr/bin/ go through the wrapper, and end up having
> the same mcpu/march/mtune options as the Buildroot build.
>

OK


>> +ifneq ($(BR2_USE_MMU), y)
>> +TARGET_CFLAGS += -D__uClinux__
>> +endif
>
> Why do you have this one here in a Blackfin-specific area, and the
> -D__NOMMU__ in PATCH 1/2 in an architecture-generic area?

This is a blackfin specific hack for old applications. Can be removed
in patch for upstream.

>
>> +ifeq ($(BR2_BFIN_FLAT_SEP_DATA),y)
>> +TARGET_LDFLAGS += -msep-data
>> +TARGET_CFLAGS += -msep-data
>> +TARGET_CXXFLAGS += -msep-data
>> +endif
>> +
>> +ifeq ($(BR2_BFIN_SHARED_FLAT), y)
>> +TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>> +TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>> +TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>> +endif
>
> I think those options are used to select which multilib variant to use
> in the toolchain. Therefore, they should be encoded into the external
> toolchain wrapper and not just passed in TARGET_LDFLAGS, TARGET_CFLAGS
> and TARGET_CXXFLAGS.
>

OK.

Regards,

Sonic
