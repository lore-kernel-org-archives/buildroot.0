From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Thu, 27 Aug 2015 23:00:45 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
In-Reply-To: <20150827203501.00528bd2@free-electrons.com>
References: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
 <20150827203501.00528bd2@free-electrons.com>
Message-ID: <5061538.Liz3OFzo4L@raillard-dv6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


> Thanks for this patch. Great to see that there is some interest in
> noMMU architecture. Which architecture are you working on?

Im actually working on the STM32F429 Cortex M4 with the
stm32f429-discovery board from STMicroelectronics.
It seems that things are also moving on the kernel side
for this arch and board.


> I'm not able to reproduce the problem: here host-elf2flt builds fine.

I did not find any failure for elf2flt on the autobuild server,
but without the patch, make complains.
I have not checked if libbfd can be configured without plugin
support, but it fails with my configuration
(sorry for untranslated french diagnostic error):
/usr/bin/gcc -Wall -O2 -I/working_dir/buildroot/output/host/usr/include -
L/working_dir/buildroot/output/host/lib -
L/working_dir/buildroot/output/host/usr/lib -Wl,-
rpath,/working_dir/buildroot/output/host/usr/lib -o elf2flt elf2flt.o 
compress.o stubs.o -lc -lz /working_dir/buildroot/output/build/host-
binutils-2.24/bfd/libbfd.a /working_dir/buildroot/output/build/host-
binutils-2.24/libiberty/libiberty.a -lz
/working_dir/buildroot/output/build/host-binutils-2.24/bfd/libbfd.a(plugin.o): 
in fonction ? try_load_plugin ?:
plugin.c:(.text+0x1db): undefined reference to ? dlopen ?
plugin.c:(.text+0x1f1): undefined reference to ? dlsym ?
plugin.c:(.text+0x270): undefined reference to ? dlerror ?
collect2: error: ld a retourn? 1 code d'?tat d'ex?cution
Makefile:75 : la recette pour la cible ? elf2flt ? a ?chou?e
make[1]: *** [elf2flt] Erreur 1
make[1] : on quitte le r?pertoire ? /working_dir/buildroot/output/build/host-
elf2flt-21c6a41885ad544763ccd19883c1353f3b0b7a47 ?


> However the build of an ARM Cortex-M3 toolchain fails during the uClibc
> build (which takes place *after* host-elf2flt is built).

There are indeed problems when some toolchain options are selected, 
so I managed to leave them out for the moment to focus on getting 
something built. Here is my buildroot configuration generated with
make savedefconfig:
BR2_arm=y
BR2_cortex_m3=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_GLOBAL_PATCH_DIR="../patch"
BR2_UCLIBC_VERSION_0_9_33=y
BR2_UCLIBC_CONFIG="package/uclibc/uClibc-ng.config"
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREADS_NONE=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_GCC_ENABLE_LTO=y
BR2_PACKAGE_HOST_ELF2FLT=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
BR2_LINUX_KERNEL_DEFCONFIG="stm32"
BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
BR2_TARGET_ROOTFS_ROMFS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f429-discovery"
BR2_PACKAGE_HOST_UBOOT_TOOLS=y


Moreover, there are some other issues with elf2flt when the toolchain is built
(one of the first target binary which get compiled after uClibc is getconf, 
part of uClibc I guess),
I am writing another email for that 


Regards,

Douglas

Le jeudi 27 ao?t 2015 20:35:01, vous avez ?crit :

> Douglas,
> 
> On Thu, 27 Aug 2015 18:47:17 +0200, Douglas RAILLARD wrote:

> > Add -ldl to fix elf2flt build, because libbfd
> > uses dlopen and friends for plugin loading
> > 
> > Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>

> 
> Thanks for this patch. Great to see that there is some interest in
> noMMU architecture. Which architecture are you working on?
> 
> I'm not able to reproduce the problem: here host-elf2flt builds fine.
> However the build of an ARM Cortex-M3 toolchain fails during the uClibc
> build (which takes place *after* host-elf2flt is built).
> 
> Thanks!
> 
> Thomas

-- 

Douglas RAILLARD
