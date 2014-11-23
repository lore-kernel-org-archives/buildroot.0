From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 18:54:30 +0100
Subject: [Buildroot] [PATCH 1/5] toolchain-external: fix C++ build
 issues with the Blackfin toolchain
In-Reply-To: <1416764163-12826-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416764163-12826-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1416764163-12826-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141123175430.GE11143@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-11-23 18:35 +0100, Thomas Petazzoni spake thusly:
> The Blackfin toolchain install some libtool .la files, which none of
> the other toolchains seem to do,

Well, with my crostool-NG toolchains, I have some, for example:

    ./armv6-rpi-linux-gnueabihf/libexec/gcc/armv6-rpi-linux-gnueabihf/4.9.1/liblto_plugin.la
    ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libitm.la
    ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libstdc++.la
    ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libsupc++.la
    ./armv6-rpi-linux-gnueabihf/armv6-rpi-linux-gnueabihf/sysroot/lib/libatomic.la

Or:

    ./x86_64-unknown-linux-uclibc/libexec/gcc/x86_64-unknown-linux-uclibc/4.9.1/liblto_plugin.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libitm.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libvtv.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libstdc++.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libsupc++.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libcilkrts.la
    ./x86_64-unknown-linux-uclibc/x86_64-unknown-linux-uclibc/sysroot/lib/libatomic.la

So, I'm not so sure...

Regards,
Yann E. MORIN.

> and those .la files confuse libtool
> down the road, causing build failures due to incorrect library
> paths. As an example, the thrift package has been constantly failing
> to build on Blackfin due to this.
> 
> To solve this issue, we simply remove the .la files installed by the
> toolchain from the staging directory.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8ac/8ac073a4e9c3a228dd22d80ea02b9dc3fc739164/
> 
> And many similar occurences of the same problem.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index da3718c..72acb41 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -331,14 +331,17 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2012R2/2012R2-RC2/i386/
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2012R2-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2013R1/2013R1-RC1/i386/
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2013R1-RC1.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
>  TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
>  TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
> @@ -666,6 +669,12 @@ define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
>  		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
>  endef
>  
> +# Some toolchains have .la libtool files that actually confuse libtool
> +# down the road. Get rid of them.
> +define TOOLCHAIN_EXTERNAL_CLEANUP_LA_FILES
> +	find $(STAGING_DIR) -name '*.la' | xargs rm -f
> +endef
> +
>  define TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT
>  	if test -f $(TARGET_CROSS)gdb ; then \
>  		$(call gen_gdbinit_file) ; \
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
