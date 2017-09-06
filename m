From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Sep 2017 20:23:24 +0200
Subject: [Buildroot] [PATCH 1/1] fixes build crash when building systemd
 with linux-pam, described in more detail here <http://narkive.com/0RdHHA6A>
In-Reply-To: <20170906145409.1085-1-charles@ccxtechnologies.com>
References: <20170906145409.1085-1-charles@ccxtechnologies.com>
Message-ID: <20170906182324.GB2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

Thanks for this patch.

However, I have a few comments about it.

First, the commit log should something like:

    package/systemd: fix build against libpam

    When built against libpam on Gentoo, systemd fails because it tries
    to link against the system's libpam:

    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
    error: /lib/libpam.so: incompatible target
    /home/ymorin/dev/buildroot/O/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
    error: /lib/libpam_misc.so: incompatible target
    collect2: error: ld returned 1 exit status

    We fix that by telling configure weherfe the sysroot is.

    Signed-off-by: Your Name <your@email>


However, this fix is a bit fishy to me, I don't like it. We should not
have to specify the sysroot as the compiler already knows it. And
indeed, on a Debian or Ubuntu, as wel as on Fedora, this is not needed.

But as you can see above, I was also able to reproduce this build
failure on a (minimalist) Gentoo system as well, so the issue does
exist, indeed. That is utterly weird... :-(

So, here is the full build command that fails:

    >>> systemd 234 Building
    PATH="/home/ymorin/dev/buildroot/O/host/bin:/home/ymorin/dev/buildroot/O/host/sbin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/5.4.0"
        /usr/bin/make -j1  -C /home/ymorin/dev/buildroot/O/build/systemd-234/
    /usr/bin/make --no-print-directory all-recursive
    Making all in .
    /bin/sh ./libtool  --tag=CC   --mode=link
        /home/ymorin/dev/buildroot/O/host/bin/arm-linux-gnueabihf-gcc
        -D__SANE_USERSPACE_TYPES__  -pipe -Wall -Wextra -Wundef -Wlogical-op
        -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith
        -Winit-self -Wdeclaration-after-statement -Wfloat-equal
        -Wsuggest-attribute=noreturn -Werror=missing-prototypes
        -Werror=implicit-function-declaration -Werror=missing-declarations
        -Werror=return-type -Werror=incompatible-pointer-types -Werror=format=2
        -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn -Wshadow
        -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter
        -Wno-missing-field-initializers -Wno-unused-result -Wno-format-signedness
        -Werror=overflow -Wdate-time -Wnested-externs -ffast-math -fno-common
        -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden
        -fstack-protector -fstack-protector-strong -fPIE
        --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections
        -fdata-sections
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2
        -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z,relro
        -Wl,-z,now -pie -Wl,-fuse-ld=gold
        -o systemd-analyze src/analyze/systemd_analyze-analyze.o
        src/analyze/systemd_analyze-analyze-verify.o libcore.la

    libtool: link: /home/ymorin/dev/buildroot/O/host/bin/arm-linux-gnueabihf-gcc
        -D__SANE_USERSPACE_TYPES__ -pipe -Wall -Wextra -Wundef -Wlogical-op
        -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith
        -Winit-self -Wdeclaration-after-statement -Wfloat-equal
        -Wsuggest-attribute=noreturn -Werror=missing-prototypes
        -Werror=implicit-function-declaration -Werror=missing-declarations
        -Werror=return-type -Werror=incompatible-pointer-types
        -Werror=format=2 -Wstrict-prototypes -Wredundant-decls -Wmissing-noreturn
        -Wshadow -Wendif-labels -Wstrict-aliasing=2 -Wwrite-strings
        -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result
        -Wno-format-signedness -Werror=overflow -Wdate-time -Wnested-externs
        -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing
        -fvisibility=hidden -fstack-protector -fstack-protector-strong -fPIE
        --param=ssp-buffer-size=4 -Werror=shadow -flto -ffunction-sections
        -fdata-sections
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/blkid
        -I/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/uuid
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2
        -fno-lto -Wl,--gc-sections -Wl,--as-needed -Wl,--no-undefined -Wl,-z
        -Wl,relro -Wl,-z -Wl,now -pie -Wl,-fuse-ld=gold -o systemd-analyze
        src/analyze/systemd_analyze-analyze.o
        src/analyze/systemd_analyze-analyze-verify.o
        ./.libs/libcore.a
        /home/ymorin/dev/buildroot/O/build/systemd-234/.libs/libsystemd-shared.so
        -L/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lcap
        -lresolv/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblkid.so
        /lib/libpam.so
        /lib/libpam_misc.so
        /home/ymorin/dev/buildroot/O/build/linux-pam-1.3.0/libpam/.libs/libpam.so
        -ldl
        /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libkmod.so
        /home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libmount.so
        /home/ymorin/dev/buildroot/O/build/util-linux-2.30.1/.libs/libblkid.so
        /home/ymorin/dev/buildroot/O/build/util-linux-2.30.1/.libs/libuuid.so-lrt
        -pthread
        -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/build/systemd-234/.libs
        -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
        -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/build/linux-pam-1.3.0/libpam/.libs
        -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/build/util-linux-2.30.1/.libs
        -Wl,-rpath -Wl,/lib/systemd
        -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib

OK, so we see that it is using /lib/libpam.so. This should not happen,
indeed. Sigh... I'll try to sse if Gentoo is doing something weird
somewhere...

But the patch is definitely no-good (or we would have to add it to all
autotols packages, which we don't).

Regards,
Yann E. MORIN.

On 2017-09-06 10:54 -0400, Charles Eidsness spake thusly:
> Signed-off-by: Charles Eidsness <charles@ccxtechnologies.com>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 9f286fd54..f15946e8a 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -26,6 +26,7 @@ SYSTEMD_DEPENDENCIES += busybox
>  endif
>  
>  SYSTEMD_CONF_OPTS += \
> +	--with-sysroot=$(STAGING_DIR) \
>  	--with-rootprefix= \
>  	--enable-blkid \
>  	--enable-static=no \
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
