From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:25:55 +0100
Subject: [Buildroot] [PATCH] ltp-testsuite: build kernel modules when
 appropriate
In-Reply-To: <56F3F393.6020407@free.fr>
References: <56F3F393.6020407@free.fr>
Message-ID: <20160324222555.21f04320@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 15:02:59 +0100, Mason wrote:
> From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> 
> When building a kernel, build LTP's test kernel modules also.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 8adfdef68d69..a435a60a2441 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -13,6 +13,13 @@ LTP_TESTSUITE_CONF_OPTS += \
>  	--with-power-management-testsuite \
>  	--with-realtime-testsuite
>  
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +LTP_TESTSUITE_DEPENDENCIES += linux
> +LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
> +else
> +LTP_TESTSUITE_CONF_OPTS += --without-modules
> +endif

It looks good in principle, but unfortunately in practice it doesn't
work. Try to build the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-glibc-2016.02-3-g762b7c9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
BR2_LINUX_KERNEL_ZIMAGE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LTP_TESTSUITE=y
# BR2_TARGET_ROOTFS_TAR is not set

And you will see that the LTP kernel modules are not built. And the
reason is that it tries to build them without passing the appropriate
ARCH= variable, so it falls back to x86, and therefore fails to build
them. Here is what I see:

  LD      /home/thomas/projets/buildroot/output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/built-in.o
  CC [M]  /home/thomas/projets/buildroot/output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod.o
  CC [M]  /home/thomas/projets/buildroot/output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod_dep.o
In file included from ./arch/x86/include/asm/atomic.h:6:0,
                 from /home/thomas/projets/buildroot/output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod.c:32:
./arch/x86/include/asm/arch_hweight.h: In function ?__arch_hweight64?:
In file included from ./arch/x86/include/asm/atomic.h:6:0,
                 from /home/thomas/projets/buildroot/output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod_dep.c:32:
./arch/x86/include/asm/arch_hweight.h: In function ?__arch_hweight64?:
./arch/x86/include/asm/arch_hweight.h:56:42: error: expected ?:? or ?)? before ?POPCNT64?
  asm (ALTERNATIVE("call __sw_hweight64", POPCNT64, X86_FEATURE_POPCNT)
                                          ^
./arch/x86/include/asm/alternative.h:131:28: note: in definition of macro ?ALTINSTR_REPLACEMENT?
  b_replacement(num)":\n\t" newinstr "\n" e_replacement(num) ":\n\t"
                            ^
And then lots and lots of errors about arch/x86 related headers. And
indeed, my kernel is configured/built for ARM.

So maybe it worked if you tested for a x86 target, but I'm a bit
confused since I know you're working on ARM stuff. Maybe you have
ARCH=arm defined globally in your environment and therefore it makes
things work?

Could you look into this and send an updated patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
