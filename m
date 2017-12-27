From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 27 Dec 2017 15:55:48 +0200
Subject: [Buildroot] build failure against libintl on alpine
In-Reply-To: <871sjgg4mk.fsf@paral.in>
References: <871sjgg4mk.fsf@paral.in>
Message-ID: <d0640059-1525-2c82-def1-a961e5340d9e@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Try adding the "--disable-nls" to HOST_BINUTILS_CONF_OPTS in the
package/binutils/binutils.mk file
Might be also needed for ??? HOST_GCC_COMMON_CONF_OPTS in
package/gcc/gcc.mk as also for
all other buildroot host packages because NLS support is really useless
there ...

musl has it's own dgettext stuff in libc.so* (or libc.a) so it should
not need the libintl version of gettext.

-S-


Christian Stewart kirjoitti 27.12.2017 klo 06:46:
> Hi all,
>
> Here with another build error today, this time against Alpine linux.
>
> Building under an Alpine container with the following world set:
>
>   alpine-baselayout
>   alpine-keys
>   alpine-sdk
>   apk-tools
>   bash
>   bc
>   busybox
>   curl
>   file
>   gettext
>   libc-utils
>   libintl
>   libtool
>   make
>   musl-dev
>   ncurses
>   patch
>   perl
>   python
>   rsync
>   wget
>
> I get the following error attempting to build:
>
>   libtool: link: /usr/bin/gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wstack-usage=26214
>   4 -I./../zlib -O2 -I/home/buildroot/output/host/include -static-libstdc++ -static-libgcc -
>   Wl,-rpath -Wl,/home/buildroot/output/host/lib -o bfdtest2 bfdtest2.o /home/buildroot/skiff
>   /buildroot/output/host/lib/libintl.so -Wl,-rpath -Wl,/home/buildroot/output/host/lib  -L/h
>   ome/buildroot/skiff/buildroot/output/host/lib ../bfd/.libs/libbfd.a -L/home/buildroot/outp
>   ut/build/host-binutils-2.27/zlib -lz ../libiberty/libiberty.a                                            
>   ../bfd/.libs/libbfd.a(elflink.o): In function `undefined_reference':
>   elflink.c:(.text+0x450): undefined reference to `libintl_dgettext'
>   ../bfd/.libs/libbfd.a(elflink.o): In function `init_reloc_cookie':
>   elflink.c:(.text+0x580): undefined reference to `libintl_dgettext'
>   ../bfd/.libs/libbfd.a(elflink.o): In function `elf_link_read_relocs_from_section.part.17':
>   elflink.c:(.text+0x18ca): undefined reference to `libintl_dgettext'
>   elflink.c:(.text+0x197e): undefined reference to `libintl_dgettext'
>   ../bfd/.libs/libbfd.a(elflink.o): In function `check_dynsym.isra.18.part.19':
>   elflink.c:(.text+0x19d4): undefined reference to `libintl_dgettext'
>   ../bfd/.libs/libbfd.a(elflink.o):elflink.c:(.text+0x1ca5): more undefined references to `libintl_dgettext'
>   follow                                                                                                  
>
> A reproduction in Docker is possible with the following Dockerfile:
>
> FROM alpine:edge
> RUN apk --update upgrade
> RUN apk add make git bash ncurses gcc wget curl \
>     musl-dev file g++ perl python rsync bc patch \
>     libintl libtool alpine-sdk gettext
> RUN adduser -D -u 1000 -g 1001 buildroot && \
>     mkdir -p /home/buildroot && chown buildroot:buildroot /home/buildroot
> USER buildroot
> WORKDIR /home/buildroot
>
> Then:
>
> cd buildroot/
> docker build -t "buildroot:latest" .
> docker run -v $(pwd):/home/buildroot/ --rm -it buildroot:latest sh
> $ make clean
> $ make defconfig BR2_DEFCONFIG=configs/raspberrypi3_defconfig
> $ make
>
> I would assume this is some incompatibility when trying to link against
> the latest versions of libintl or gettext or so.
>
> In addition to my own config, I attempted the uclibc-based pi 3
> defconfig:
>
> $ make clean
> $ make defconfig BR2_DEFCONFIG=configs/raspberrypi3_defconfig
> $ make
>
> Result:
>
> make[1]: Entering directory '/home/buildroot/output/build/uclibc-1.0.26/utils'
>   HOSTCC utils/getconf.host
>   HOSTCC utils/ldconfig.host
>   HOSTCC utils/ldd.host
> ../utils/getconf.c:439:29: error: '_SC_CHARCLASS_NAME_MAX' undeclared here (not in a function)
>      { "CHARCLASS_NAME_MAX", _SC_CHARCLASS_NAME_MAX, SYSCONF },
>                              ^~~~~~~~~~~~~~~~~~~~~~
> ../utils/getconf.c: In function 'print_all':
> ../utils/getconf.c:1092:24: error: '_SC_UINT_MAX' undeclared (first use in this function)
>     if (c->call_name == _SC_UINT_MAX
>                         ^~~~~~~~~~~~
> ../utils/getconf.c:1092:24: note: each undeclared identifier is reported only once for each function it appears in
> ../utils/getconf.c:1092:21: warning: comparison between pointer and integer
>     if (c->call_name == _SC_UINT_MAX
>                      ^~
> ../utils/getconf.c:1093:25: error: '_SC_ULONG_MAX' undeclared (first use in this function)
>       || c->call_name == _SC_ULONG_MAX)
>                          ^~~~~~~~~~~~~
> ../utils/getconf.c:1093:22: warning: comparison between pointer and integer
>       || c->call_name == _SC_ULONG_MAX)
>                       ^~
> ../utils/getconf.c: In function 'main':
> ../utils/getconf.c:1306:23: error: '_SC_UINT_MAX' undeclared (first use in this function)
>    if (c->call_name == _SC_UINT_MAX
>                        ^~~~~~~~~~~~
> ../utils/getconf.c:1306:20: warning: comparison between pointer and integer
>    if (c->call_name == _SC_UINT_MAX
>                     ^~
> ../utils/getconf.c:1307:26: error: '_SC_ULONG_MAX' undeclared (first use in this function)
>        || c->call_name == _SC_ULONG_MAX)
>                           ^~~~~~~~~~~~~
> ../utils/getconf.c:1307:23: warning: comparison between pointer and integer
>        || c->call_name == _SC_ULONG_MAX)
>                        ^~
> ../utils/ldd.c: In function 'elf_find_dynamic':
> ../utils/ldd.c:233:12: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>      return (void *)byteswap_to_host(dynp->d_un.d_val);
>             ^
> make[1]: *** [Makefile.in:114: ../utils/getconf.host] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/home/buildroot/output/build/uclibc-1.0.26/utils'
>
> Best,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
