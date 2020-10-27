From: RR <rob.r374@gmail.com>
Date: Tue, 27 Oct 2020 08:41:38 +0100
Subject: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
In-Reply-To: <20201025222146.6379eb5e@gmx.net>
References: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>	<20201019211123.320af01b@gmx.net>	<004001d6aaba$39e116a0$ada343e0$@gmail.com>
 <20201025222146.6379eb5e@gmx.net>
Message-ID: <00dd01d6ac34$9b0a51f0$d11ef5d0$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

thank you a lot. It seems that compilation now goes ok.
It seems that I'm closer to the solution.

In runtime, I get error on memory allocation. Probably I need to increase
related stack-size, but don't know how to.
Is now problem only related to add more stack size ? If yes, how can I do
this ?
If not, please give me advice what to do next...

The only way I found was  _FLAT_STACKSIZE but I haven't found any examples
on how to use it.
Adding MOSQUITTO_FLAT_STACKSIZE=1048576 didn't help. I was  probably doing
it wrong way...
Also, mosquitto produces more binaries as  output...

Thanks in advance,
Regards,
Rob.

Command line:
~ # free
                        total        used        free      shared
buff/cache   available
Mem:          11864        6728        3908           0        1228
3460

~ # mosquitto_pub -d --debug -h xxxxxxxxxxxxx  -t yyyyyyyyyyyyy -m Test -i
mo
sq_pub111 --cafile /etc/res/ca.crt -p 8883  --cert /etc/res/client.crt --key
/et
c/res/client.key --insecure --repeat 10000 --repeat-delay 10
mosquitto_pub: page allocation failure: order:8, mode:0xcc0(GFP_KERNEL),
nodemask=(null)
nommu: Allocation of length 860160 from process 67 (mosquitto_pub) failed
binfmt_flat: Unable to mmap process text, errno -12
SEGV


DMESG:
Mem-Info:
active_anon:0 inactive_anon:0 isolated_anon:0
active_file:0 inactive_file:20 isolated_file:0
unevictable:202 dirty:0 writeback:0 unstable:0
slab_reclaimable:0 slab_unreclaimable:809
mapped:0 shmem:0 pagetables:0 bounce:0
free:1140 free_pcp:0 free_cma:0
Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB
unevictable:808kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB
writeback:0kB shmem:0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? no
Normal free:4560kB min:432kB low:540kB high:648kB reserved_highatomic:0KB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB
unevictable:808kB writepending:0kB present:15296kB managed:11864kB
mlocked:0kB kernel_stack:280kB pagetables:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 0
Normal: 30*4kB (UM) 29*8kB (UM) 11*16kB (UM) 8*32kB (UM) 11*64kB (UM)
4*128kB (M) 4*256kB (UM) 3*512kB (M) 0*1024kB 0*2048kB 0*4096kB = 4560kB
222 total pagecache pages
3824 pages RAM
0 pages HighMem/MovableOnly
858 pages reserved
nommu: Allocation of length 860160 from process 67 (mosquitto_pub) failed
active_anon:0 inactive_anon:0 isolated_anon:0
active_file:0 inactive_file:20 isolated_file:0
unevictable:202 dirty:0 writeback:0 unstable:0
slab_reclaimable:0 slab_unreclaimable:809
mapped:0 shmem:0 pagetables:0 bounce:0
free:1140 free_pcp:0 free_cma:0
Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB
unevictable:808kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:0kB
writeback:0kB shmem:0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? no
Normal free:4560kB min:432kB low:540kB high:648kB reserved_highatomic:0KB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB
unevictable:808kB writepending:0kB present:15296kB managed:11864kB
mlocked:0kB kernel_stack:280kB pagetables:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 0
Normal: 30*4kB (UM) 29*8kB (UM) 11*16kB (UM) 8*32kB (UM) 11*64kB (UM)
4*128kB (M) 4*256kB (UM) 3*512kB (M) 0*1024kB 0*2048kB 0*4096kB = 4560kB
222 total pagecache pages
binfmt_flat: Unable to mmap process text, errno -12

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
---
-----Original Message-----
From: Peter Seiderer <ps.report@gmx.net> 
Sent: Sunday, October 25, 2020 10:22 PM
To: RR <rob.r374@gmail.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7

Hello Rob,

On Sun, 25 Oct 2020 11:33:05 +0100, "RR" <rob.r374@gmail.com> wrote:

> Hello,
>
> I'm enclosing my defconfig... I'm basically compiling for ARM 
> Cortex-M7
> (stm32f769 discovery board).
>
> What I have additionally spotted is that mosquiotto_sub doesn't crash 
> with same error, but it doesn't have ssl options working.
> So probably my first problem is that libopenssl doesn't compile
properly...
>
> When I try to compile it separately, by using
> 	make libopenssl-reconfigure
>
> it seems that it doesn't have target architecture defined. If I add 
> BR2_PACKAGE_TARGET_ARCH="arm-v4" to make call, I end up in error of 
> missing file (it's also weird why win32 files are included in 
> compilation at all) :
>
> /home/robi/Razvoj/Linux/Buildroot/JE_UcLinux/buildroot/../host/bin/arm
> -build root-uclinux-uclibcgnueabi-gcc  -I. -Iinclude -fPIC -pthread 
> -Wa,--noexecstack -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -Os    -Wl,-elf2flt -static -DHAVE_FORK=0
> -DOPENSSL_NO_MADVISE -DOPENSSL_NO_ASYNC    -Wl,-elf2flt -static
> -DOPENSSL_USE_NODELETE -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ 
> -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM 
> -DSHA512_ASM -DKECCAK1600_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM 
> -DECP_NISTZ256_ASM -DPOLY1305_ASM -DOPENSSLDIR="\"/etc/ssl\""
> -DENGINESDIR="\"/usr/lib/engines-1.1\"" -DZLIB -DNDEBUG 
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MMD 
> -MF crypto/dso/dso_win32.d.tmp -MT crypto/dso/dso_win32.o -c -o 
> crypto/dso/dso_win32.o crypto/dso/dso_win32.c
> crypto/dso/dso_dlfcn.c:28:12: fatal error: dlfcn.h: No such file or 
> directory  #  include <dlfcn.h>
>             ^~~~~~~~~
> compilation terminated.
>
> Any advice where I can learn or get libopenssl compiled properly?

Use buildroot and take a look at the log and/or compile output...


>  Then I can proceed to mosquitto, because it uses libopenssl.

The following defconfig compiles fine (no runtime test because of lack of
hardware):

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

/usr/bin/make -j17 -C .../build/mosquitto-1.6.12 [...] WITH_WRAP=no
WITH_DOCS=no WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no WITH_ADNS=no
WITH_THREADING=no WITH_TLS=yes
CLIENT_STATIC_LDADD="`/home/seiderer/Work/Buildroot/build_openssl_mosquitto_
001/host/bin/pkg-config --libs openssl`" WITH_SRV=no WITH_WEBSOCKETS=no


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
> > On working Buildroot basic build, I've added packages and setup 
> > static libs
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

ssh_client2 is from mbedtls, but BR2_PACKAGE_MBEDTLS_PROGRAMS depends on
BR2_USE_MMU which is not set for your configuration...

> >
> >
> >
> > It's weird, because mosquitto_pub complains about shared lib, but I 
> > have defined static libraries only (at least I think so).
> >
> > In addition, mosquitto_sub works, but it seems it doesn't receive 
> > SSL related arguments - seems like it was not compiled with OpenSSL lib.

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
> If the problem still exists after a full rebuild please provide your 
> .config or defconfig file and the buildroot version your are using...
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
