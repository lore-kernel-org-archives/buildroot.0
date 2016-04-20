From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 20 Apr 2016 10:04:17 -0400
Subject: [Buildroot] Kernel Module - Multi-file build issue
Message-ID: <CAN34foxV-BxtNELQVHmOrJzZNqct2Hz14OqPyFYz3AqzMOYCWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
   I was successful in integrating 6 kernel modules into my Buildroot Setup
(thanks to Arnout!).  Of the 6, 4 will "build" - at least to the point
where I now need to figure out what to change due to migrating from a
2.6.32 kernel to a 4.2.21 kernel.
  However, 2 of the 6 have issues not finding the header files required.
Arnout provided me with the way to export the $BR2_EXTERNAL to allow me to
point to custom, shared headers.  This works fine when the kernel module is
a single file.   My problem is when the kernel module has multiple sources.

A "working" makefile:

#inform the kernel that a module needs to be build

obj-m :=hwdd_support_fpga.o


# Global Includes here

GBL_INCLUDES = $(NETAPP_DIR)/include

KNL_INCLUDES = $(NETAPP_DIR)/include/kernel


#Add here the CFLAGS to pass in to get the Defined Symbol

CFLAGS_hwdd_support_fpga.o := -I$(GBL_INCLUDES) -I$(KNL_INCLUDES)


A "failing" makefile:

#inform the kernel that a module needs to be build

obj-m := hwdd_memory.o

hwdd_memory-y := hwdd_mem.o hwdd_memalgo.o hwdd_cache_algos.o


# Global Includes here

GBL_INCLUDES = $(NETAPP_DIR)/include

KNL_INCLUDES = $(NETAPP_DIR)/include/kernel


#Add here the CFLAGS to pass in to get the Defined Symbol

CFLAGS_hwdd_memory.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES)
-I$(KNL_INCLUDES)

I've read the kernel documentation on building kernel modules (the Kbuild
stuff) - I don't see where my problem is here in the make file.  Am I
missing something obvious??

Running:  make V=1 - for the good one produces the following, with the
failing one below.  Look for the -DCC_HAVE_ASM_GOTO symbol - in the working
one, the -I's from above show up here. In the failing one, the -I's don't
show up in the output. . .
Can Buildroot handle multi-file Kernel Modules - built in this fashion???

Thanks!
Stephen

*Working Output:*

[sbeckwith at sdb-mbp-vm output]$ make V=1 kmod_sfpga-build

umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
O=/home/sbeckwith/HBE-1/hwdd/output/. kmod_sfpga-build

>>> kmod_sfpga 0.1.0 Syncing from source dir
/home/sbeckwith/HBE-1/hwdd/netapp/kmod_sfpga

rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS /home/sbeckwith/HBE-1/hwdd/netapp/kmod_sfpga/
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0

touch
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.stamp_rsynced

>>> kmod_sfpga 0.1.0 Configuring

touch
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.stamp_configured

>>> kmod_sfpga 0.1.0 Building

>>> kmod_sfpga 0.1.0 Building kernel module(s)

PATH="/home/sbeckwith/HBE-1/hwdd/output/host/bin:/home/sbeckwith/HBE-1/hwdd/output/host/sbin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/sbin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/sbeckwith/.local/bin:/home/sbeckwith/bin"
BR_BINARIES_DIR=/home/sbeckwith/HBE-1/hwdd/output/images /bin/make -j5 -C
/home/sbeckwith/HBE-1/hwdd/output/build/linux-4.1.21 HOSTCC="/bin/gcc"
HOSTCFLAGS="" ARCH=x86_64
INSTALL_MOD_PATH=/home/sbeckwith/HBE-1/hwdd/output/target CROSS_COMPILE="
/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-"
DEPMOD=/home/sbeckwith/HBE-1/hwdd/output/host/sbin/depmod
NETAPP_DIR=/home/sbeckwith/HBE-1/hwdd/netapp
PWD=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.
M=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/. modules

test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \

echo >&2; \

echo >&2 "  ERROR: Kernel configuration is invalid."; \

echo >&2 "         include/generated/autoconf.h or include/config/auto.conf
are missing.";\

echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to
fix it."; \

echo >&2 ; \

/bin/false)

mkdir -p
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./.tmp_versions ;
rm -f
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./.tmp_versions/*

/bin/make -f ./scripts/Makefile.build
obj=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.

(cat /dev/null;   echo
kernel//home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.ko;)
> /home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./modules.order


/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-Wp,-MD,/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./.hwdd_support_fpga.o.d
-nostdinc -isystem
/home/sbeckwith/HBE-1/hwdd/output/host/usr/lib/gcc/x86_64-buildroot-linux-uclibc/5.2.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi
-include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64
-mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer
-fno-optimize-sibling-calls -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time *-DCC_HAVE_ASM_GOTO**
-I/home/sbeckwith/HBE-1/hwdd/netapp/include
-I/home/sbeckwith/HBE-1/hwdd/netapp/include/kernel * -DMODULE
-D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(hwdd_support_fpga)"
-D"KBUILD_MODNAME=KBUILD_STR(hwdd_support_fpga)" -c -o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c

In file included from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.h:12:0,

                 from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:25:

/home/sbeckwith/HBE-1/hwdd/netapp/include/hwdd_logger.h:58:1: error:
function declaration isn?t a prototype [-Werror=strict-prototypes]

 extern int hwdd_logger_initialize();

 ^

/home/sbeckwith/HBE-1/hwdd/netapp/include/hwdd_logger.h:61:1: error:
function declaration isn?t a prototype [-Werror=strict-prototypes]

 void hwdd_logger_cleanup();

 ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:
In function ?hwdd_support_fpga_ioctl?:

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:366:26:
error: implicit declaration of function ?kmalloc?
[-Werror=implicit-function-declaration]

    tmp_values = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                          ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:366:17:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

    tmp_values = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                 ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:376:5:
error: implicit declaration of function ?kfree?
[-Werror=implicit-function-declaration]

     kfree(tmp_values);

     ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:415:16:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

    tmp_value = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:472:16:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

    tmp_value = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:533:16:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

    tmp_value = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:618:17:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

    tmp_values = (__u32 *)kmalloc(cmd_val_info.size * sizeof(__u32),
GFP_KERNEL);

                 ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:721:26:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

             tmp_values = (__u8 *)kmalloc(cmd_byteval_info.size *
sizeof(__u8), GFP_KERNEL);

                          ^

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.c:760:26:
warning: cast to pointer from integer of different size
[-Wint-to-pointer-cast]

             tmp_values = (__u8 *)kmalloc(cmd_byteval_info.size *
sizeof(__u8), GFP_KERNEL);

                          ^

cc1: some warnings being treated as errors

scripts/Makefile.build:264: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.o'
failed

make[3]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/./hwdd_support_fpga.o]
Error 1

Makefile:1384: recipe for target
'_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.' failed

make[2]: ***
[_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.] Error 2

package/pkg-generic.mk:156: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.stamp_built'
failed

make[1]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_sfpga-0.1.0/.stamp_built]
Error 2

Makefile:16: recipe for target '_all' failed

make: *** [_all] Error 2

[sbeckwith at sdb-mbp-vm output]$

*Failed Output:*

[sbeckwith at sdb-mbp-vm output]$ make V=1 kmod_mem-build

umask 0022 && make -C /home/sbeckwith/HBE-1/buildroot-2015.08.1
O=/home/sbeckwith/HBE-1/hwdd/output/. kmod_mem-build

>>> kmod_mem 0.1.0 Syncing from source dir
/home/sbeckwith/HBE-1/hwdd/netapp/kmod_mem

rsync -au --chmod=u=rwX,go=rX --exclude .svn --exclude .git --exclude .hg
--exclude .bzr --exclude CVS /home/sbeckwith/HBE-1/hwdd/netapp/kmod_mem/
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0

touch /home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.stamp_rsynced

>>> kmod_mem 0.1.0 Configuring

touch
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.stamp_configured

>>> kmod_mem 0.1.0 Building

>>> kmod_mem 0.1.0 Building kernel module(s)

PATH="/home/sbeckwith/HBE-1/hwdd/output/host/bin:/home/sbeckwith/HBE-1/hwdd/output/host/sbin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin:/home/sbeckwith/HBE-1/hwdd/output/host/usr/sbin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/sbeckwith/.local/bin:/home/sbeckwith/bin"
BR_BINARIES_DIR=/home/sbeckwith/HBE-1/hwdd/output/images /bin/make -j5 -C
/home/sbeckwith/HBE-1/hwdd/output/build/linux-4.1.21 HOSTCC="/bin/gcc"
HOSTCFLAGS="" ARCH=x86_64
INSTALL_MOD_PATH=/home/sbeckwith/HBE-1/hwdd/output/target CROSS_COMPILE="
/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-"
DEPMOD=/home/sbeckwith/HBE-1/hwdd/output/host/sbin/depmod
NETAPP_DIR=/home/sbeckwith/HBE-1/hwdd/netapp
PWD=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.
M=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/. modules

test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \

echo >&2; \

echo >&2 "  ERROR: Kernel configuration is invalid."; \

echo >&2 "         include/generated/autoconf.h or include/config/auto.conf
are missing.";\

echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to
fix it."; \

echo >&2 ; \

/bin/false)

mkdir -p
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./.tmp_versions ; rm
-f /home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./.tmp_versions/*

/bin/make -f ./scripts/Makefile.build
obj=/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.

(cat /dev/null;   echo
kernel//home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memory.ko;)
> /home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./modules.order


/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-Wp,-MD,/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./.hwdd_mem.o.d
-nostdinc -isystem
/home/sbeckwith/HBE-1/hwdd/output/host/usr/lib/gcc/x86_64-buildroot-linux-uclibc/5.2.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi
-include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64
-mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer
-fno-optimize-sibling-calls -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE  -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(hwdd_mem)"
-D"KBUILD_MODNAME=KBUILD_STR(hwdd_memory)" -c -o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.c


/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-Wp,-MD,/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./.hwdd_memalgo.o.d
-nostdinc -isystem
/home/sbeckwith/HBE-1/hwdd/output/host/usr/lib/gcc/x86_64-buildroot-linux-uclibc/5.2.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi
-include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64
-mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer
-fno-optimize-sibling-calls -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time -DCC_HAVE_ASM_GOTO  -DMODULE  -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(hwdd_memalgo)"
-D"KBUILD_MODNAME=KBUILD_STR(hwdd_memory)" -c -o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.c


/home/sbeckwith/HBE-1/hwdd/output/host/usr/bin/x86_64-buildroot-linux-uclibc-gcc
-Wp,-MD,/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./.hwdd_cache_algos.o.d
-nostdinc -isystem
/home/sbeckwith/HBE-1/hwdd/output/host/usr/lib/gcc/x86_64-buildroot-linux-uclibc/5.2.0/include
-I./arch/x86/include -Iarch/x86/include/generated/uapi
-Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi
-Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi
-include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -m64
-mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel
-funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1
-DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
-DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
-DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
-mno-avx -fno-delete-null-pointer-checks -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer
-fno-optimize-sibling-calls -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-Werror=date-time *-DCC_HAVE_ASM_GOTO*  -DMODULE  -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(hwdd_cache_algos)"
-D"KBUILD_MODNAME=KBUILD_STR(hwdd_memory)" -c -o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_cache_algos.o
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_cache_algos.c

In file included from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_cache_algos.c:8:0:

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.h:12:25:
fatal error: hwdd_logger.h: No such file or directory

compilation terminated.

scripts/Makefile.build:258: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_cache_algos.o'
failed

make[3]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_cache_algos.o]
Error 1

make[3]: *** Waiting for unfinished jobs....

In file included from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.c:11:0:

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.h:12:25:
fatal error: hwdd_logger.h: No such file or directory

compilation terminated.

scripts/Makefile.build:258: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.o'
failed

make[3]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.o]
Error 1

/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.c:20:56:
fatal error: hwdd_memioctl.h: No such file or directory

compilation terminated.

scripts/Makefile.build:258: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.o' failed

make[3]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.o] Error
1

Makefile:1384: recipe for target
'_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.' failed

make[2]: ***
[_module_/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.] Error 2

package/pkg-generic.mk:156: recipe for target
'/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.stamp_built' failed

make[1]: ***
[/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/.stamp_built] Error
2

Makefile:16: recipe for target '_all' failed

make: *** [_all] Error 2

[sbeckwith at sdb-mbp-vm output]$
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160420/62082487/attachment.html>
