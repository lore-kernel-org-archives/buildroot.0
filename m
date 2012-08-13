From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 13:04:05 +0800
Subject: [Buildroot] [PATCH] buildroot: Makefile: Allow target board
 makefile fill in default target_skeleton path.
In-Reply-To: <20120809224401.32f625ee@skate>
References: <1344409039-32071-1-git-send-email-sonic.adi@gmail.com>
 <20120809104155.563af2a2@skate>
 <CAJxxZ0N4JFf5U34pw=LQOa6hR7XL7scyp5dckHc9fTgZvg2e1g@mail.gmail.com>
 <20120809224401.32f625ee@skate>
Message-ID: <CAJxxZ0Ng=UGtv+-sHvpbifkfEuRbLE4kVgo7trYTwG=rhyfHnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 10, 2012 at 4:44 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Thu, 9 Aug 2012 18:26:54 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> If "target board makefile" doesn't exit, where should we add arch
>> specific makefile targets and compile/link flags? Where should arch
>> specific Config options be put? Take blackfin specific makefile as an
>> example bellow.
>
> There is no general rule for this, it depends on each thing you want to
> add. For things that must be added globally, package/Makefile.in is
> usually the current place (though this file would probably need some
> cleanup, but this is a different topic).
>
>> Makefile.in
>> ----------------
>> TARGET_CFLAGS += -D__NOMMU__ -D__uClinux__ -D_GNU_SOURCE
>
> I don't think the -D_GNU_SOURCE should be passed globally to all
> packages. Each package should define it if it is needed to build this
> package.
>

Yes, it is better to put flag GNU_SOURCE to packages.

> Also, before globally defining __NOMMU__ and __uClinux__, I'd like to
> understand why they are needed. I think __NOMMU__ is generally used to
> test whether fork() or vfork() should be used, but this should probably
> be tested using autoconf tests when possible.
>
> That said, if such flags are indeed necessary, package/Makefile.in is a
> good place for that.

Yes, this NOMMU flag is necessary to make application built for NOMMU
architecture. It is not only for fork system call, but also some
memory management logic. I will move it to package/Makefile.in.

>
>> ifeq ($(BR2_ABI_FLAT),y)
>> TARGET_LDFLAGS += -Wl,-elf2flt
>> endif
>> ifeq ($(BR2_BFIN_SHARED_FLAT), y)
>> TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>> TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
>> TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
>> endif
>
> Same thing for these flags, package/Makefile.in.
>

OK.

>> CROSS_COMPILE_SHARED_ELF ?= bfin-linux-uclibc-
>
> No, this should use the existing variables to get the cross-compiler
> location.

CROSS_COMPILE_SHARED_ELF is not  the existing variables of current
cross-compiler location.
Blackfin has different cross-compiler for different ABI format.
bfin-linux-uclibc- compiler here is used to install the shared elf
libraries only when current cross-compiler is bfin-uclinux- and
current ABI is FLAT.
I prefer to move it to target/Config.arch.in

>
>> romfs.shared.libs.elf:
>>         set -e; \
>>         t=`$(CROSS_COMPILE_SHARED_ELF)gcc $(CPUFLAGS)
>> -print-file-name=libc.a`; \
>>         t=`dirname $$t`/../..; \
>>         for i in $$t/lib/*so*; do \
>>                 i=`readlink -f "$$i"`; \
>>                 soname=`$(CROSS_COMPILE_SHARED_ELF)readelf -d "$$i" |
>> sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
>>                 $(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
>>         done
>
> Why is this needed? How is this romfs.shared.libs.elf target being used?

The Blackfin Linux kernel supports to load both shared FLAT and shared
ELF libraries by applications from the same rootfs. Customers are
allowed to install ELF shared libraries into the rootfs which is built
with FLAT ABI flags. Vice versa.

I prefer to move the makefile targets to target/Makefile.in and move
the config options to target/Config.in.

>
>> CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
>> romfs.shared.libs.flat:
>>         set -e; \
>>         t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS)
>> -mid-shared-library -print-file-name=libc`; \
>>         if [ -f $$t -a ! -h $$t ] ; then \
>>                 $(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
>>         fi
>
> Ditto.

Ditto.

>
>> Config.in
>> ----------------------------------------------------
>> config BR2_TARGET_ANALOGDEVICES_INSTALL_ELF_SHARED
>>         bool "Install ELF shared libraries" if !BR2_BFIN_FDPIC
>>         default y
>>
>> config BR2_TARGET_ANALOGDEVICES_INSTALL_FLAT_SHARED
>>         bool "Install FLAT shared libraries" if !BR2_BFIN_SHARED_FLAT
>>         default y
>
> Any reason to have these in addition to the existing selection of ABI?
> What are the use cases for these?
>

Ditto

>> Blackfin Linux distribution has a different file system layout from
>> current default one in buildroot. And we have no plan to deviate from
>> current one used for years. Anyway without this patch, we can still
>> set a custom skeleton for blackfin.
>
> How does the filesystem layout differs? Depending on how it differs,
> having a separate skeleton may or may not be the right solution.
>

We want to have the roofs in buildroot for BF60x consist with the
rootfs in uClinux-dist for BF5xx used by customers for years. So, the
default skeleton is not a smart choice for us by now.


Regards,

Sonic Zhang
