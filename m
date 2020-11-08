From: RR <rob.r374@gmail.com>
Date: Sun, 8 Nov 2020 10:45:03 +0100
Subject: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
In-Reply-To: <20201102173734.79c181dd@gmx.net>
References: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>	<20201019211123.320af01b@gmx.net>	<004001d6aaba$39e116a0$ada343e0$@gmail.com>	<20201025222146.6379eb5e@gmx.net>	<00dd01d6ac34$9b0a51f0$d11ef5d0$@gmail.com>	<20201027230732.47eb280c@gmx.net>	<01a801d6acc9$dda6fa00$98f4ee00$@gmail.com>	<005c01d6b103$8a28db80$9e7a9280$@gmail.com>
 <20201102173734.79c181dd@gmx.net>
Message-ID: <014b01d6b5b3$d631a700$8294f500$@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Peter, thanks for help...

I've got past that step and mosquitto_pub (sub) binary has now probably proper flag. 
But segfault remains... 

> ~ # mosquitto_pub
> warn_alloc: 1 callbacks suppressed
> mosquitto_pub: page allocation failure: order:8, mode:0xcc0(GFP_KERNEL),
> nodemask=(null)
> nommu: Allocation of length 860160 from process 169 (mosquitto_pub) failed
> binfmt_flat: Unable to mmap process text, errno -12
> SEGV

But I also have checked openSSL compilation and tried to produce openssl binary and it dies with similar error.
I have also compiled Mosquitto binaries without openssl and they work... 
So I guess problems origin in openssl build...

I get segfault on start :
~ # openssl
openssl: page allocation failure: order:9, mode:0xcc0(GFP_KERNEL), nodemask=(null)
nommu: Allocation of length 1728512 from process 95 (openssl) failed
binfmt_flat: Unable to allocate RAM for process text/data, errno -12
SEGV

It seems like having huge data segment...
 
../../../host/arm-buildroot-uclinux-uclibcgnueabi/bin/flthdr ./openssl 
./openssl
    Magic:        bFLT
    Rev:          4
    Build Date:   Sat Nov  7 20:55:17 2020
    Entry:        0x45
    Data Start:   0xf9c14
    Data End:     0x18bbc8
    BSS End:      0x194540
    Stack Size:   0x1000
    Reloc Start:  0x18bbc8
    Reloc Count:  0x67fa
    Flags:        0x1 ( Load-to-Ram )

Has anyone any experience on using OpenSSL and apps that use it in nonMMU environment ?
Are those segfaults cause by wrong compilation or lack of stack space ?

It seems that if I increase stack space, I only increase the memory that it tries to allocate on start.
Shouldn't be static library part of binary ?
Can I easily check what call tries to allocate this memory ?

Thanks in advance,
Regards,
Rob.


-----Original Message-----
From: Peter Seiderer <ps.report@gmx.net> 
Sent: Monday, November 2, 2020 5:38 PM
To: RR <rob.r374@gmail.com>
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7

Hello Rob,

On Mon, 2 Nov 2020 11:33:00 +0100, "RR" <rob.r374@gmail.com> wrote:

> Hello,
> 
> I've got one step further, but still don't know how to solve it. 
> It seems that mosquitto is compiled in a bit different way as other 
> working binaries in nommu and flat file format environment (ARM Cortex 
> M7).
> 
> For example, when I check dropbear binary (which works) and mosquitto 
> which segfaults with flthdr I get output below.
> I'm not sure if this is the cause of segfault, but would like to check 
> whether it is ok or not.
> 
> What is the difference between Load-to-Ram and Has-PIC-GOT flags? 
> It seems that I can add Load-to-Ram to Has-PIC-GOT using flthdr tool, 
> but cannot get rid ot "Has-PIC-GOT" flag.

To get rid of the 'Has-PIC-GOT' see patch [1] (apply the patch to your buildroot source and re-build the mosquitto package), maybe it makes a positive difference at run-time?

For the target I get now:

	$ ./host/arm-buildroot-uclinux-uclibcgnueabi/bin/flthdr target/usr/bin/mosquitto_sub target/usr/bin/mosquitto_sub
    Magic:        bFLT
    Rev:          4
    Build Date:   Mon Nov  2 17:24:45 2020
    Entry:        0x45
    Data Start:   0xd31dc
    Data End:     0x146e60
    BSS End:      0x14e170
    Stack Size:   0x1000
    Reloc Start:  0x146e60
    Reloc Count:  0x4bbb
    Flags:        0x1 ( Load-to-Ram )


A description of the various entries/flags can be found in [2]...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201102162948.23132-1-ps.report at gmx.net/
[2] http://read.pudn.com/downloads291/doc/fileformat/1309763/uClinux%20-%20BFLT%20Binary%20Flat%20Format.doc

> 
> Thanks in advance,
> Regards,
> Rob.
> 
> 
> Flthdr output:
> 
>  ./dropbearkey
>     Magic:        bFLT
>     Rev:          4
>     Build Date:   Mon Nov  2 00:02:47 2020
>     Entry:        0x45
>     Data Start:   0x2d374
>     Data End:     0x3bd88
>     BSS End:      0x51f00
>     Stack Size:   0x1000
>     Reloc Start:  0x3bd88
>     Reloc Count:  0xa6b
>     Flags:        0x1 ( Load-to-Ram )
> 
> ./mosquitto_pub
>     Magic:        bFLT
>     Rev:          4
>     Build Date:   Mon Nov  2 01:47:54 2020
>     Entry:        0x45
>     Data Start:   0xd17b0
>     Data End:     0x144e40
>     BSS End:      0x14c0c0
>     Stack Size:   0x100000
>     Reloc Start:  0x144e40
>     Reloc Count:  0x2d68
>     Flags:        0x2 ( Has-PIC-GOT )
> 
> When I run those files :
> 
> ~ # mosquitto_pub
> warn_alloc: 1 callbacks suppressed
> mosquitto_pub: page allocation failure: order:8, mode:0xcc0(GFP_KERNEL),
> nodemask=(null)
> nommu: Allocation of length 860160 from process 169 (mosquitto_pub) failed
> binfmt_flat: Unable to mmap process text, errno -12
> SEGV
> 
> ~ # dropbearkey
> Must specify a key filename
> Usage: dropbearkey -t <type> -f <filename> [-s bits]
> -t type Type of key to generate. One of:
>                 rsa
>                 ecdsa
> -f filename    Use filename for the secret key.
>                ~/.ssh/id_dropbear is recommended for client keys.
> -s bits Key size in bits, should be a multiple of 8 (optional)
>            ECDSA has sizes 256 384 521 
> -y              Just print the publickey and fingerprint for the
>                 private key in <filename>.
> 
> 
> -----Original Message-----
> From: rob.r374 at gmail.com <rob.r374@gmail.com> 
> Sent: Wednesday, October 28, 2020 2:30 AM
> To: 'Peter Seiderer' <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Subject: RE: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
> 
> Hello,
> 
> thanks Peter... You've helped me a lot.
> 
> Compile now goes ok, but when I run on target I get :
> ~ # mosquitto_pub
> mosquitto_pub: page allocation failure: order:8, mode:0xcc0(GFP_KERNEL),
> nodemask=(null)
> nommu: Allocation of length 860160 from process 59 (mosquitto_pub) failed
> binfmt_flat: Unable to mmap process text, errno -12 SEGV
> 
> And if I try to check flat file format and stack size of binary, I cannot
> access binary from build system :
> /buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/bin$ ./flthdr -p
> ./../../../target/usr/bin/mosquitto_pub
> Cannot open ./../../../target/usr/bin/mosquitto_pub
> 
> So I cannot check stack size and I'm trapped. 
> Is there any other option to declare stack size in compilation step of
> mosquitto under buildroot ?
> Any advice? Anyone more experienced on these non-mmu and flat file format
> devices ?
> 
> Thanks in advance,
> Regards,
> Rob.
> 
> 
> 
> -----Izvirno sporo?ilo-----
> Od: Peter Seiderer <ps.report@gmx.net>
> Poslano: torek, 27. oktober 2020 23:08
> Za: RR <rob.r374@gmail.com>
> Kp: buildroot at busybox.net
> Zadeva: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
> 
> Hello Rob,
> 
> On Tue, 27 Oct 2020 08:41:38 +0100, "RR" <rob.r374@gmail.com> wrote:
> 
> > Hello Peter,
> >
> > thank you a lot. It seems that compilation now goes ok.
> > It seems that I'm closer to the solution.
> >
> > In runtime, I get error on memory allocation. Probably I need to 
> > increase related stack-size, but don't know how to.
> > Is now problem only related to add more stack size ? If yes, how can I 
> > do this ?
> > If not, please give me advice what to do next...  
> 
> Sorry, did not own a sample of your hardware (and lacking any experience on
> this type of 'small' embedded systems), so no more help from my side...
> 
> Regards,
> Peter
> 
> >
> > The only way I found was  _FLAT_STACKSIZE but I haven't found any 
> > examples on how to use it.
> > Adding MOSQUITTO_FLAT_STACKSIZE=1048576 didn't help. I was  probably 
> > doing it wrong way...
> > Also, mosquitto produces more binaries as  output...
> >
> > Thanks in advance,
> > Regards,
> > Rob.
> >
> > Command line:
> > ~ # free
> >                         total        used        free      shared
> > buff/cache   available
> > Mem:          11864        6728        3908           0        1228
> > 3460
> >
> > ~ # mosquitto_pub -d --debug -h xxxxxxxxxxxxx  -t yyyyyyyyyyyyy -m 
> > Test -i mo
> > sq_pub111 --cafile /etc/res/ca.crt -p 8883  --cert /etc/res/client.crt 
> > --key /et c/res/client.key --insecure --repeat 10000 --repeat-delay 10
> > mosquitto_pub: page allocation failure: order:8, 
> > mode:0xcc0(GFP_KERNEL),
> > nodemask=(null)
> > nommu: Allocation of length 860160 from process 67 (mosquitto_pub) 
> > failed
> > binfmt_flat: Unable to mmap process text, errno -12 SEGV
> >
> >
> > DMESG:
> > Mem-Info:
> > active_anon:0 inactive_anon:0 isolated_anon:0
> > active_file:0 inactive_file:20 isolated_file:0
> > unevictable:202 dirty:0 writeback:0 unstable:0
> > slab_reclaimable:0 slab_unreclaimable:809
> > mapped:0 shmem:0 pagetables:0 bounce:0
> > free:1140 free_pcp:0 free_cma:0
> > Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB 
> > inactive_file:80kB unevictable:808kB isolated(anon):0kB 
> > isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB 
> > writeback_tmp:0kB unstable:0kB all_unreclaimable? no Normal 
> > free:4560kB min:432kB low:540kB high:648kB reserved_highatomic:0KB 
> > active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB 
> > unevictable:808kB writepending:0kB present:15296kB managed:11864kB 
> > mlocked:0kB kernel_stack:280kB pagetables:0kB bounce:0kB free_pcp:0kB 
> > local_pcp:0kB free_cma:0kB
> > lowmem_reserve[]: 0 0
> > Normal: 30*4kB (UM) 29*8kB (UM) 11*16kB (UM) 8*32kB (UM) 11*64kB (UM) 
> > 4*128kB (M) 4*256kB (UM) 3*512kB (M) 0*1024kB 0*2048kB 0*4096kB = 
> > 4560kB
> > 222 total pagecache pages
> > 3824 pages RAM
> > 0 pages HighMem/MovableOnly
> > 858 pages reserved
> > nommu: Allocation of length 860160 from process 67 (mosquitto_pub) 
> > failed
> > active_anon:0 inactive_anon:0 isolated_anon:0
> > active_file:0 inactive_file:20 isolated_file:0
> > unevictable:202 dirty:0 writeback:0 unstable:0
> > slab_reclaimable:0 slab_unreclaimable:809
> > mapped:0 shmem:0 pagetables:0 bounce:0
> > free:1140 free_pcp:0 free_cma:0
> > Node 0 active_anon:0kB inactive_anon:0kB active_file:0kB 
> > inactive_file:80kB unevictable:808kB isolated(anon):0kB 
> > isolated(file):0kB mapped:0kB dirty:0kB writeback:0kB shmem:0kB 
> > writeback_tmp:0kB unstable:0kB all_unreclaimable? no Normal 
> > free:4560kB min:432kB low:540kB high:648kB reserved_highatomic:0KB 
> > active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB 
> > unevictable:808kB writepending:0kB present:15296kB managed:11864kB 
> > mlocked:0kB kernel_stack:280kB pagetables:0kB bounce:0kB free_pcp:0kB 
> > local_pcp:0kB free_cma:0kB
> > lowmem_reserve[]: 0 0
> > Normal: 30*4kB (UM) 29*8kB (UM) 11*16kB (UM) 8*32kB (UM) 11*64kB (UM) 
> > 4*128kB (M) 4*256kB (UM) 3*512kB (M) 0*1024kB 0*2048kB 0*4096kB = 
> > 4560kB
> > 222 total pagecache pages
> > binfmt_flat: Unable to mmap process text, errno -12
> >
> > ----------------------------------------------------------------------
> > ------
> > ----------------------------------------------------------------------
> > ------
> > ----------------------------------------------------------------------
> > ------
> > ---
> > -----Original Message-----
> > From: Peter Seiderer <ps.report@gmx.net>
> > Sent: Sunday, October 25, 2020 10:22 PM
> > To: RR <rob.r374@gmail.com>
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
> >
> > Hello Rob,
> >
> > On Sun, 25 Oct 2020 11:33:05 +0100, "RR" <rob.r374@gmail.com> wrote:
> >  
> > > Hello,
> > >
> > > I'm enclosing my defconfig... I'm basically compiling for ARM
> > > Cortex-M7
> > > (stm32f769 discovery board).
> > >
> > > What I have additionally spotted is that mosquiotto_sub doesn't 
> > > crash with same error, but it doesn't have ssl options working.
> > > So probably my first problem is that libopenssl doesn't compile  
> > properly...  
> > >
> > > When I try to compile it separately, by using
> > > 	make libopenssl-reconfigure
> > >
> > > it seems that it doesn't have target architecture defined. If I add 
> > > BR2_PACKAGE_TARGET_ARCH="arm-v4" to make call, I end up in error of 
> > > missing file (it's also weird why win32 files are included in 
> > > compilation at all) :
> > >
> > > /home/robi/Razvoj/Linux/Buildroot/JE_UcLinux/buildroot/../host/bin/a
> > > rm -build root-uclinux-uclibcgnueabi-gcc  -I. -Iinclude -fPIC 
> > > -pthread -Wa,--noexecstack -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > > -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > > -D_FILE_OFFSET_BITS=64  -Os    -Wl,-elf2flt -static -DHAVE_FORK=0
> > > -DOPENSSL_NO_MADVISE -DOPENSSL_NO_ASYNC    -Wl,-elf2flt -static
> > > -DOPENSSL_USE_NODELETE -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ 
> > > -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM 
> > > -DSHA512_ASM -DKECCAK1600_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM 
> > > -DECP_NISTZ256_ASM -DPOLY1305_ASM -DOPENSSLDIR="\"/etc/ssl\""
> > > -DENGINESDIR="\"/usr/lib/engines-1.1\"" -DZLIB -DNDEBUG 
> > > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
> > > -MMD -MF crypto/dso/dso_win32.d.tmp -MT crypto/dso/dso_win32.o -c -o 
> > > crypto/dso/dso_win32.o crypto/dso/dso_win32.c
> > > crypto/dso/dso_dlfcn.c:28:12: fatal error: dlfcn.h: No such file or 
> > > directory  #  include <dlfcn.h>
> > >             ^~~~~~~~~
> > > compilation terminated.
> > >
> > > Any advice where I can learn or get libopenssl compiled properly?  
> >
> > Use buildroot and take a look at the log and/or compile output...
> >
> >  
> > >  Then I can proceed to mosquitto, because it uses libopenssl.  
> >
> > The following defconfig compiles fine (no runtime test because of lack 
> > of
> > hardware):
> >
> > BR2_arm=y
> > BR2_cortex_m7=y
> > BR2_TOOLCHAIN_BUILDROOT_CXX=y
> > BR2_PACKAGE_HOST_ELF2FLT=y
> > BR2_SYSTEM_DHCP="eth0"
> > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> > BR2_PACKAGE_SDL=y
> > BR2_PACKAGE_SDL_TTF=y
> > BR2_PACKAGE_MBEDTLS=y
> > BR2_PACKAGE_OPENSSL=y
> > BR2_PACKAGE_LIBOPENSSL_BIN=y
> > BR2_PACKAGE_LIBPTHREAD_STUBS=y
> > BR2_PACKAGE_DROPBEAR=y
> > BR2_PACKAGE_MOSQUITTO=y
> > BR2_PACKAGE_NET_TOOLS=y
> > BR2_TARGET_ROOTFS_EXT2=y
> > # BR2_TARGET_ROOTFS_TAR is not set
> > BR2_PACKAGE_HOST_OPENOCD=y
> >
> >
> > The mosquitto package compile gets the right make options, e.g.:
> >
> > /usr/bin/make -j17 -C .../build/mosquitto-1.6.12 [...] WITH_WRAP=no 
> > WITH_DOCS=no WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no 
> > WITH_ADNS=no WITH_THREADING=no WITH_TLS=yes 
> > CLIENT_STATIC_LDADD="`/home/seiderer/Work/Buildroot/build_openssl_mosq
> > uitto_ 001/host/bin/pkg-config --libs openssl`" WITH_SRV=no 
> > WITH_WEBSOCKETS=no
> >
> >  
> > > I'm probably doing something obviously wrong...
> > > I'm using buildroot release tag 2020.05...
> > >
> > > Thanks in advance,
> > > Regards,
> > >
> > > -----Original Message-----
> > > From: Peter Seiderer <ps.report@gmx.net>
> > > Sent: Monday, October 19, 2020 9:11 PM
> > > To: rob.r374 at gmail.com
> > > Cc: buildroot at busybox.net
> > > Subject: Re: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
> > >
> > > Hello Rob,
> > >
> > > On Mon, 19 Oct 2020 02:20:00 +0200, <rob.r374@gmail.com> wrote:
> > >  
> > > > Hello,
> > > >
> > > >
> > > >
> > > > I'm trying to include Mosquitto with OpenSSL support on Buildroot.
> > > >
> > > >
> > > >
> > > > On working Buildroot basic build, I've added packages and setup 
> > > > static libs
> > > > :
> > > >
> > > > BR2_PACKAGE_LIBOPENSSL=y
> > > >
> > > > BR2_PACKAGE_MOSQUITTO=y
> > > >
> > > > BR2_PACKAGE_MBEDTLS=y
> > > >
> > > > BR2_STATIC_LIBS=y
> > > >
> > > > If I try to run Mosquitto tools (and MbedTLS test), I get :
> > > >
> > > > ~ # mosquitto_pub
> > > >
> > > > binfmt_flat: reference 0xffb4d0 to shared library 127, killing 
> > > > mosquitto_pub!
> > > >
> > > > SEGV
> > > >
> > > > ~ # mosquitto_sub
> > > >
> > > > Error: You must specify a topic to subscribe to.
> > > >
> > > > Use 'mosquitto_sub --help' to see usage.
> > > >
> > > >
> > > >
> > > > ~ # ssl_client2
> > > >
> > > > sh: can't execute 'ssl_client2': No such file or directory  
> >
> > ssh_client2 is from mbedtls, but BR2_PACKAGE_MBEDTLS_PROGRAMS depends 
> > on BR2_USE_MMU which is not set for your configuration...
> >  
> > > >
> > > >
> > > >
> > > > It's weird, because mosquitto_pub complains about shared lib, but 
> > > > I have defined static libraries only (at least I think so).
> > > >
> > > > In addition, mosquitto_sub works, but it seems it doesn't receive 
> > > > SSL related arguments - seems like it was not compiled with 
> > > > OpenSSL  
> lib.
> >
> > What do your mean with 'doesn't receive SSL related arguments'?
> >
> > Did your try a full re-build?
> >
> > Regards,
> > Peter
> >
> >  
> > > >
> > > > Also, ssl_client2 or other tools from MbedTLS cannot be found.
> > > >
> > > >
> > > >
> > > > How to solve those problems ?
> > > >
> > > >
> > > >
> > > > Also I'm not sure how to check for each package - compilation, 
> > > > installation, errors, warnings etc.  
> > >
> > > Did you do/try a full rebuild after changing your config ([1])?
> > >
> > > If the problem still exists after a full rebuild please provide your 
> > > .config or defconfig file and the buildroot version your are using...
> > >
> > > Regards,
> > > Peter
> > >
> > > [1] https://buildroot.org/downloads/manual/manual.html#full-rebuild
> > >  
> > > >
> > > >
> > > >
> > > > Regards,
> > > >
> > > > Rob.
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >  
> > >  
> >
> >  
> 
> 
> 
> --
> Ta e-po?ta je bila pregledana z Avast protivirusnim programom.
> https://www.avast.com/antivirus
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
