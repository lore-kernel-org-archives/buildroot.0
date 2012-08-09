From: Sonic Zhang <sonic.adi@gmail.com>
Date: Thu, 9 Aug 2012 18:26:54 +0800
Subject: [Buildroot] [PATCH] buildroot: Makefile: Allow target board
 makefile fill in default target_skeleton path.
In-Reply-To: <20120809104155.563af2a2@skate>
References: <1344409039-32071-1-git-send-email-sonic.adi@gmail.com>
 <20120809104155.563af2a2@skate>
Message-ID: <CAJxxZ0N4JFf5U34pw=LQOa6hR7XL7scyp5dckHc9fTgZvg2e1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 9, 2012 at 4:41 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 8 Aug 2012 14:57:19 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> If the target skeleton path is empty in config, don't change variable
>> TARGET_SKELETON in buildroot Makefile. Allow the target board makefile
>> fill in a default path.
>
> The concept of "target board makefile" does not exist. It used to exist
> in earlier versions of Buildroot, but it no longer exists in newer
> versions. Thus, I have the feeling that rather than fixing this, it is
> the way your boards are supported that should be modified according to
> the newer Buildroot good practices.

If "target board makefile" doesn't exit, where should we add arch
specific makefile targets and compile/link flags? Where should arch
specific Config options be put? Take blackfin specific makefile as an
example bellow.

Makefile.in
----------------
TARGET_CFLAGS += -D__NOMMU__ -D__uClinux__ -D_GNU_SOURCE
ifeq ($(BR2_ABI_FLAT),y)
TARGET_LDFLAGS += -Wl,-elf2flt
endif
ifeq ($(BR2_BFIN_SHARED_FLAT), y)
TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
TARGET_CXXFLAGS += -mid-shared-library -mshared-library-id=0
endif

CROSS_COMPILE_SHARED_ELF ?= bfin-linux-uclibc-
romfs.shared.libs.elf:
        set -e; \
        t=`$(CROSS_COMPILE_SHARED_ELF)gcc $(CPUFLAGS)
-print-file-name=libc.a`; \
        t=`dirname $$t`/../..; \
        for i in $$t/lib/*so*; do \
                i=`readlink -f "$$i"`; \
                soname=`$(CROSS_COMPILE_SHARED_ELF)readelf -d "$$i" |
sed -n '/(SONAME)/s:.*[[]\(.*\)[]].*:\1:p'`; \
                $(INSTALL) -D $$i $(TARGET_DIR)/lib/$$soname; \
        done

CROSS_COMPILE_SHARED_FLAT ?= bfin-uclinux-
romfs.shared.libs.flat:
        set -e; \
        t=`$(CROSS_COMPILE_SHARED_FLAT)gcc $(CPUFLAGS)
-mid-shared-library -print-file-name=libc`; \
        if [ -f $$t -a ! -h $$t ] ; then \
                $(INSTALL) -D $$t $(TARGET_DIR)/lib/lib1.so; \
        fi


Config.in
----------------------------------------------------
config BR2_TARGET_ANALOGDEVICES_INSTALL_ELF_SHARED
        bool "Install ELF shared libraries" if !BR2_BFIN_FDPIC
        default y

config BR2_TARGET_ANALOGDEVICES_INSTALL_FLAT_SHARED
        bool "Install FLAT shared libraries" if !BR2_BFIN_SHARED_FLAT
        default y


>
> The practices in terms of board support are:
>
>  * One defconfig file per board in configs/, generally named
>    <vendor>_<boardname>_defconfig. Those files must be generated with
>    'make savedefconfig'
>
>  * Utility files (kernel patches, kernel configuration files and other
>    stuff), should be stored in board/<vendor>/<boardname>/. Kernel
>    configuration files must be generated with 'make savedefconfig' as
>    well.
>
>  * Using a different skeleton from the default one provided by
>    Buildroot is really *not* recommended. Instead, if anything needs to
>    be tweaked in the filesystem, use the post-build script for that
>    effect. This allows to avoid duplicating the skeleton for each and
>    every board, causing a maintenance nightmare when we want to change
>    something in this skeleton.
>

Blackfin Linux distribution has a different file system layout from
current default one in buildroot. And we have no plan to deviate from
current one used for years. Anyway without this patch, we can still
set a custom skeleton for blackfin.

Regards,

Sonic
