From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 11:23:21 +0200
Subject: [Buildroot] [PATCH v2] ltp-testsuite: build kernel modules when
	appropriate
In-Reply-To: <57026754.50205@free.fr>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com> <56F92840.9090206@free.fr>
 <56FAD38B.8040201@mind.be> <57026754.50205@free.fr>
Message-ID: <57038409.20600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/16 15:08, Mason wrote:
> From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
>
> If we're building a kernel, we can also build LTP's test modules.
>
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>   package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 8adfdef68d69..1c1c2a0d4f6b 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -13,6 +13,14 @@ LTP_TESTSUITE_CONF_OPTS += \
>   	--with-power-management-testsuite \
>   	--with-realtime-testsuite
>
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +LTP_TESTSUITE_DEPENDENCIES += linux
> +LTP_TESTSUITE_MAKE_ENV = ARCH=$(KERNEL_ARCH)

  Have you actually tested the defconfig that Thomas suggested? This still 
doesn't work, because it tries to build with host gcc instead of cross-gcc:

Building modules: ltp_block_dev.c
/usr/bin/make -C 
/home/arnout/src/buildroot/out/wandboard/build/linux-86429847b5152f040f190015faedcac49b243328 
M=output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel
make[7]: Entering directory 
'output/build/linux-86429847b5152f040f190015faedcac49b243328'
test -e include/generated/autoconf.h -a -e include/config/auto.conf || ( \
echo; \
echo " ERROR: Kernel configuration is invalid."; \
echo " include/generated/autoconf.h or include/config/auto.conf are missing.";\
echo " Run 'make oldconfig && make prepare' on kernel src to fix it."; \
echo; \
/bin/false)
mkdir -p 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/.tmp_versions 
; rm -f 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/.tmp_versions/*
/usr/bin/make -f scripts/Makefile.build 
obj=output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel
(cat /dev/null; echo 
kernel/output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.ko;) 
 > 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/modules.order
gcc 
-Wp,-MD,output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/.ltp_block_dev.o.d 
-nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/5/include 
-Ioutput/build/linux-86429847b5152f040f190015faedcac49b243328/arch/arm/include 
-Iarch/arm/include/generated -Iinclude -include include/generated/autoconf.h 
-D__KERNEL__ -mlittle-endian -Iarch/arm/mach-mx6/include 
-Iarch/arm/plat-mxc/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs 
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration 
-Wno-format-security -fno-delete-null-pointer-checks -Os -fno-dwarf2-cfi-asm 
-fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux 
-mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv5t -Wa,-march=armv7-a 
-msoft-float -Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls 
-DCC_HAVE_ASM_GOTO -DMODULE -D"KBUILD_STR(s)=#s" 
-D"KBUILD_BASENAME=KBUILD_STR(ltp_block_dev)" 
-D"KBUILD_MODNAME=KBUILD_STR(ltp_block_dev)" -c -o 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/.tmp_ltp_block_dev.o 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.c
rm -f 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/built-in.o; 
ar rcsD 
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/built-in.o
gcc: error: unrecognized argument in option '-mabi=aapcs-linux'
gcc: note: valid arguments to '-mabi=' are: ms sysv
gcc: error: unrecognized command line option '-mlittle-endian'
gcc: error: unrecognized command line option '-mapcs'
gcc: error: unrecognized command line option '-mno-sched-prolog'
gcc: error: unrecognized command line option '-mno-thumb-interwork'
scripts/Makefile.build:311: recipe for target 
'output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.o' 
failed
make[8]: *** 
[output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.o] 
Error 1
make[8]: *** Waiting for unfinished jobs....
Makefile:1360: recipe for target 
'_module_output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel' 
failed
make[7]: *** 
[_module_output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel] 
Error 2
make[7]: Leaving directory 
'output/build/linux-86429847b5152f040f190015faedcac49b243328'
../../../../../include/mk/module.mk:59: recipe for target '.dep_modules' failed
make[6]: [.dep_modules] Error 2 (ignored)


  Can you try instead to set

LTP_TESTSUITE_MAKE_ENV = $(LINUX_MAKE_FLAGS)

  The problem is that autotools sets CC and CROSS_COMPILE correctly for its own 
Makefiles, but doesn't export them so they are not used for the kernel build system.


  Regards,
  Arnout

> +LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
> +else
> +LTP_TESTSUITE_CONF_OPTS += --without-modules
> +endif
> +
>   # Needs libcap with file attrs which needs attr, so both required
>   ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
>   LTP_TESTSUITE_DEPENDENCIES += libcap
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
