From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 25 Oct 2020 22:21:46 +0100
Subject: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
In-Reply-To: <004001d6aaba$39e116a0$ada343e0$@gmail.com>
References: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>
 <20201019211123.320af01b@gmx.net>
 <004001d6aaba$39e116a0$ada343e0$@gmail.com>
Message-ID: <20201025222146.6379eb5e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rob,

On Sun, 25 Oct 2020 11:33:05 +0100, "RR" <rob.r374@gmail.com> wrote:

> Hello,
>
> I'm enclosing my defconfig... I'm basically compiling for ARM Cortex-M7
> (stm32f769 discovery board).
>
> What I have additionally spotted is that mosquiotto_sub doesn't crash with
> same error, but it doesn't have ssl options working.
> So probably my first problem is that libopenssl doesn't compile properly...
>
> When I try to compile it separately, by using
> 	make libopenssl-reconfigure
>
> it seems that it doesn't have target architecture defined. If I add
> BR2_PACKAGE_TARGET_ARCH="arm-v4" to make call,
> I end up in error of missing file (it's also weird why win32 files are
> included in compilation at all) :
>
> /home/robi/Razvoj/Linux/Buildroot/JE_UcLinux/buildroot/../host/bin/arm-build
> root-uclinux-uclibcgnueabi-gcc  -I. -Iinclude -fPIC -pthread
> -Wa,--noexecstack -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os    -Wl,-elf2flt -static -DHAVE_FORK=0
> -DOPENSSL_NO_MADVISE -DOPENSSL_NO_ASYNC    -Wl,-elf2flt -static
> -DOPENSSL_USE_NODELETE -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ
> -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM
> -DSHA512_ASM -DKECCAK1600_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM
> -DECP_NISTZ256_ASM -DPOLY1305_ASM -DOPENSSLDIR="\"/etc/ssl\""
> -DENGINESDIR="\"/usr/lib/engines-1.1\"" -DZLIB -DNDEBUG -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MMD -MF
> crypto/dso/dso_win32.d.tmp -MT crypto/dso/dso_win32.o -c -o
> crypto/dso/dso_win32.o crypto/dso/dso_win32.c
> crypto/dso/dso_dlfcn.c:28:12: fatal error: dlfcn.h: No such file or
> directory
>  #  include <dlfcn.h>
>             ^~~~~~~~~
> compilation terminated.
>
> Any advice where I can learn or get libopenssl compiled properly?

Use buildroot and take a look at the log and/or compile output...


>  Then I can proceed to mosquitto, because it uses libopenssl.

The following defconfig compiles fine (no runtime test because
of lack of hardware):

BR2_arm=y
BR2_cortex_m7=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_ELF2FLT=y
BR2_SYSTEM_DHCP="eth0"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_TTF=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBOPENSSL_BIN=y
BR2_PACKAGE_LIBPTHREAD_STUBS=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_MOSQUITTO=y
BR2_PACKAGE_NET_TOOLS=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_OPENOCD=y


The mosquitto package compile gets the right make options, e.g.:

/usr/bin/make -j17 -C .../build/mosquitto-1.6.12 [...] WITH_WRAP=no WITH_DOCS=no WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no WITH_ADNS=no WITH_THREADING=no WITH_TLS=yes CLIENT_STATIC_LDADD="`/home/seiderer/Work/Buildroot/build_openssl_mosquitto_001/host/bin/pkg-config --libs openssl`" WITH_SRV=no WITH_WEBSOCKETS=no


> I'm probably doing something obviously wrong...
> I'm using buildroot release tag 2020.05...
>
> Thanks in advance,
> Regards,
>
> -----Original Message-----
> From: Peter Seiderer <ps.report@gmx.net>
> Sent: Monday, October 19, 2020 9:11 PM
> To: rob.r374 at gmail.com
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
>
> Hello Rob,
>
> On Mon, 19 Oct 2020 02:20:00 +0200, <rob.r374@gmail.com> wrote:
>
> > Hello,
> >
> >
> >
> > I'm trying to include Mosquitto with OpenSSL support on Buildroot.
> >
> >
> >
> > On working Buildroot basic build, I've added packages and setup static
> > libs
> > :
> >
> > BR2_PACKAGE_LIBOPENSSL=y
> >
> > BR2_PACKAGE_MOSQUITTO=y
> >
> > BR2_PACKAGE_MBEDTLS=y
> >
> > BR2_STATIC_LIBS=y
> >
> > If I try to run Mosquitto tools (and MbedTLS test), I get :
> >
> > ~ # mosquitto_pub
> >
> > binfmt_flat: reference 0xffb4d0 to shared library 127, killing
> > mosquitto_pub!
> >
> > SEGV
> >
> > ~ # mosquitto_sub
> >
> > Error: You must specify a topic to subscribe to.
> >
> > Use 'mosquitto_sub --help' to see usage.
> >
> >
> >
> > ~ # ssl_client2
> >
> > sh: can't execute 'ssl_client2': No such file or directory

ssh_client2 is from mbedtls, but BR2_PACKAGE_MBEDTLS_PROGRAMS depends on BR2_USE_MMU
which is not set for your configuration...

> >
> >
> >
> > It's weird, because mosquitto_pub complains about shared lib, but I
> > have defined static libraries only (at least I think so).
> >
> > In addition, mosquitto_sub works, but it seems it doesn't receive SSL
> > related arguments - seems like it was not compiled with OpenSSL lib.

What do your mean with 'doesn't receive SSL related arguments'?

Did your try a full re-build?

Regards,
Peter


> >
> > Also, ssl_client2 or other tools from MbedTLS cannot be found.
> >
> >
> >
> > How to solve those problems ?
> >
> >
> >
> > Also I'm not sure how to check for each package - compilation,
> > installation, errors, warnings etc.
>
> Did you do/try a full rebuild after changing your config ([1])?
>
> If the problem still exists after a full rebuild please provide your .config
> or defconfig file and the buildroot version your are using...
>
> Regards,
> Peter
>
> [1] https://buildroot.org/downloads/manual/manual.html#full-rebuild
>
> >
> >
> >
> > Regards,
> >
> > Rob.
> >
> >
> >
> >
> >
> >
> >
>
