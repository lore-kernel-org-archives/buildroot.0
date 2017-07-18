From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 10:01:26 +0200
Subject: [Buildroot] [RFC] best way to fix a valgrind gcc 5 compile
 error on MIPS Octeon2
In-Reply-To: <CAAnoztGZF5pH9jfxt4TN9--HwdvzVus1L+5QNPcQ76H-cbfGqw@mail.gmail.com>
References: <CAAnoztGZF5pH9jfxt4TN9--HwdvzVus1L+5QNPcQ76H-cbfGqw@mail.gmail.com>
Message-ID: <20170718100126.3315e58f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 20:00:56 -0700, Charles Hardin wrote:
> So compiling for a Cavium Octeon 2 processor with 2017.02.x yields the
> following error.
> 
> 
> /home/vagrant/onebloxv1_rootfs.build/host/usr/bin/mips64-linux-gcc
> -DHAVE_CONFIG_H -I. -I..  -I.. -I../include -I../VEX/pub -I../VEX/pub
> -DVGA_mips64=1 -DVGO_linux=1 -DVGP_mips64_linux=1
> -DVGPV_mips64_linux_vanilla=1 -Ipriv -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g -std=gnu99 -Wall
> -Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes
> -Wmissing-declarations -Wcast-align -Wcast-qual -Wwrite-strings
> -Wempty-body -Wformat -Wformat-security -Wignored-qualifiers
> -Wmissing-parameter-type -Wold-style-declaration -fno-stack-protector
> -fno-strict-aliasing -fno-builtin  -march=mips64 -Wbad-function-cast
> -fstrict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -O2 -g2 -fno-stack-protector -march=octeon2 -c -o
> priv/libvex_mips64_linux_a-main_globals.o `test -f 'priv/main_globals.c' ||
> echo './'`priv/main_globals.c
> 
> *priv/main_globals.c:1:0:* *error: *'*-mips64*' conflicts with the other
> architecture options, which specify a mips64r2 processor
> 
> * ^*
> 
> Makefile:1309: recipe for target
> 'priv/libvex_mips64_linux_a-main_globals.o' failed
> 
> make[6]: *** [priv/libvex_mips64_linux_a-main_globals.o] Error 1
> 
> make[6]: *** Waiting for unfinished jobs....

Can you give more details on how to reproduce this build failure? I.e
your Buildroot .config and toolchain (if you're using an external
toolchain) ?

> *--- a/package/valgrind/valgrind.mk <http://valgrind.mk>*
> 
> *+++ b/package/valgrind/valgrind.mk <http://valgrind.mk>*
> 
> @@ -34,7 +34,7 @@ VALGRIND_CFLAGS = \
> 
>  # and pass the right -march option, so they take precedence over
> 
>  # Valgrind's wrongfully detected value.
> 
>  ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> 
> -VALGRIND_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH)
> 
> +VALGRIND_CFLAGS += -mtune=$(BR2_GCC_TARGET_ARCH)

This looks wrong, because BR2_GCC_TARGET_ARCH is what is already passed
to gcc as -march through the toolchain wrapper, so I don't see why we
get this issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
