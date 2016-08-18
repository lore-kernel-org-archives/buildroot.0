From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:10:53 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-17
In-Reply-To: <20160818063027.302C6102F5A@stock.ovh.net>
References: <20160818063027.302C6102F5A@stock.ovh.net>
Message-ID: <20160818231053.37c1b26b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

OK, it's been a few days since I last did an analysis of the build
failures. With 50 failures and 218 successes, we're doing pretty good,
but we can do better.

Vlad, Alexey, Waldemar, Bernd, Gustavo, Paul, VIvien, Yann, Arnout,
Rahul, Vicente, Fabrice, could you have a look below, there are some
issues for you.

Also, there are some "unassigned" issues below, some volunteers are
definitely welcome to help!

Thanks!

On Thu, 18 Aug 2016 08:30:27 +0200 (CEST), Thomas Petazzoni wrote:

>         bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c52a4fe717f96c3798bcbcb855d0ab5fe6ed9e8b/

The usual:

  undefined reference to `__emutls_get_address'

Waldemar now has a good understanding of the issue, and he proposed a
quick and dirty patch to address the problem. I worked today on a
proper solution, which Mike Frysinger said is the right approach. So
I'm hoping that we will be able to work in the next few days with
Waldemar to finally address the remaining Blackfin toolchain issues.

>          arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/7d80c66ab5d4975de7256e73592845b9f8b3a731/

musl problem. Anyone to have a look?

>          arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/863711e4d74e0233deaddc3c4b4a78b92e927317/

Conflicting CPU architectures 13/1

There's some ARMv7-A code mixed into an ARMv7-M build, similar to the
issue I fixed in ffmpeg recently. I'll try to have a look.

>          arc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/8b7767c01cf1b578d5fc14dc74cfaf9a038f7228/

/home/buildroot/autobuild/run/instance-2/output/build/clapack-3.2.1/SRC/dlasd1.c: In function 'dlasd1_':
/home/buildroot/autobuild/run/instance-2/output/build/clapack-3.2.1/SRC/dlasd1.c:288:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:8429

Vlad, Alexey ?

>          arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/18dd4bb5bdf54603b1611a21c024c56cb3fc073a/
>          arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/1e82d1bad4cf93d1bc3ccb864b37f579a79c10dd/

I've applied https://patchwork.ozlabs.org/patch/660268/ to fix these.

>       x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e653b8d12e710abf08a6de9f6ad5e2c1e4ee7a64/
>          arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/21ed3959079ba1986ff8eff15a03b5b48d8815a6/

musl build issues. Anyone to have a look at these?

>          arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/5730d7ccd6cf19bc395bdcbcb663516afa3e4d92/

src/tr.c: In function 'single_binary_main_tr':
src/tr.c:1947:1: error: insn does not satisfy its constraints:

Another ARC toolchain issue. Vlad, Alexey ?

>         i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/85f0f7c4ba0f014a2ac735bd961cf11a4986412e/

The SSP/musl/x86 issue. I think I will propose a patch to disable SSP
on x86/musl, it requires some gcc patches which are a bit annoying and
need some tweaks. I think for 2016.08 it's better to just disable SSP
support.

>         m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/cb1ec52e6f322372f4476992a4622345917c5617/
>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/831f3e32be7ab0c0978bb81cf1e40185d7bb5298/
>         m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8c09ca6b57375b114ebf88ef7f3b3f04e57ca1f8/
>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6a5da21a39a04662ed9a69263795691fae1e9922/
>          arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/f00a6c59723ee0758140fcb668144ff5db5f681a/

The m68k problem is:

 CC	libavcodec/opus_silk.o
/tmp/ccsdGWKf.s: Assembler messages:
/tmp/ccsdGWKf.s:48484: Error: value -32780 out of range

Waldemar ?

The ARC problem is:

libavcodec/vc1_pred.c: In function 'ff_vc1_pred_b_mv':
libavcodec/vc1_pred.c:882:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:8429

Vlad, Alexey ?

>         m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/69cb95852853c3c2b3d03af706a4bf35b9f1558b/

Waldemar, usual "/tmp/cccYaLaT.s: Assembler messages:
/tmp/cccYaLaT.s:13295: Error: value -40768 out of range"

issue.

>          arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3acaba128acd78a5647528e6fb3eece1846a1061/

error: 'memory_order_seq_cst' was not declared in this scope

This probably means a tighter gcc version dependency is needed. 

Bernd, you are the last person who bumped this package, could you have a look?

>          arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/afc01af153b42d13845e2f2828f642e8ccea7e06/

checking for dlopen in -ldl... no
configure: error: "cannot find libdl support"

I've just sent https://patchwork.ozlabs.org/patch/660532/ to disable
this package on static only configurations.

>         i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/4659090e34e8f25614d24a1b61ac63ef1e89cdda/

Another musl/x86/SSP issue.

>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ff0c59f682ca9b29b1ee89d0986f96d878cc45fb/

I'm still working on a proper fix for this one. Doing proper stuff with
waf is challenging :)

>          arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/88c45733b20c711fd0f5d0a917f41679ca2046b2/

This one is a gcc 6 problem. Anyone to have a look?

>          arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9eaff1dc4795c22be0e39faaacb78a0d4cbfcc18/
>         i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/97c78f4ad2a899e262484f51e614ac14d7fe8dea/

musl issue.

>          arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/21f10a5fe15b58c47a45bb5d0add04b20baba143/

Will be fixed by Yann series that adds a compatibility cdefs.h header
to musl toolchains.

>       xtensa |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/89896f71b213a2123dc9ac02828e3eaf712ea3e7/
>         bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/63da813fa7b0bc1523334289bf271cc34a8a2b4b/

The pthread_mutex_*() issue with uClibc and static linking.

>          arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/1bc47ee8622c25a67908ba525335e45dc8163c67/

Another ARC toolchain issue:

iso9660.c: In function 'strip_trail':
iso9660.c:157:1: internal compiler error: in arc_legitimize_pic_address, at config/arc/arc.c:5032

>          sh4 |                 libgtk3-3.20.6 | NOK | http://autobuild.buildroot.net/results/c253bf993584c3e3222245f8ec47ef35504f8807/

gdkdisplay-wayland.c: In function 'create_shm_pool':
gdkdisplay-wayland.c:964:18: error: '__NR_memfd_create' undeclared (first use in this function)
   ret = syscall (__NR_memfd_create, "gdk-wayland", MFD_CLOEXEC);

Gustavo, can you have a look?

>         i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/a6b713ff0ae626a90a6ac4535e2523aeb971fd23/

[100%] Linking C executable iiod
../libiio.so.0.7: undefined reference to `clock_gettime'

It should link with librt, this is necessary with older glibc versions.

Paul, could you have a look at this?

>          arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/32e375e3f254ac19bed54a9e9fd6c1e9048e2043/

This is a gcc 6.x issue. The latest release is from 2013, the project
is still using CVS on SourceForge, so upstream is dead and will never
fix this issue. I've submitted
https://patchwork.ozlabs.org/patch/660542/ as a proposal to deprecate
this package.

>         bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8c9a5fe52f762b4ff4444cf41efdf0d3cf203986/

Would be fixed by applying https://patchwork.ozlabs.org/patch/660334/.
I'll review and apply.

>         sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/28e7bfcffa67fdc5e0773fde689651b007d50bd0/

Missing link against librt.

>     mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/381bd0a21914b0a4569d134d93e3998045d51602/
>      aarch64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/da4de0e02bc3d9852482c1b868c38c400f9fa1c1/

checking for LIBEVENT... yes
checking if system libevent works as expected... configure: error: *** unusable system libevent

Yann and Arnout had analyzed the issue, Yann will resubmit a new
iteration that takes into account some comments.


>          arc |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/6dc2eb22104076920d77425b1e608ef9b9e01c94/

Rahul Bedarkar has posted some patches to address this gcc 6
compatibility issue, but I've asked whether the bump is necessary as
well. Waiting for Rahul's answer.

>       x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/505cdde704c4c4e200a47cfa357e5f4f75c3fcb0/

musl issue. Weird because I'm pretty sure I saw some patches to fix
such problems, but can't find them anymore. Anyone remembers? Vicente?

>         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a431261be66173839794b698957beb769adf7c74/

libavcodec/h264_cabac.c: In function 'decode_cabac_residual_nondc_internal.isra.5':
libavcodec/x86/h264_i386.h:144:5: error: 'asm' operand has impossible constraints

Bernd?

>          arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/f84b79a5ee4cc9501571b4e6039fa5f0fd2ffe8b/

Not sure what's going on. Gustavo, this is your package, could you have
a look?

>       x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/eb6dabccf729f96a4e06a98526eb4c716fa6bcd2/

musl build issue. Anyone?

>          arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5ff94a9b2109f341d03209c34b628f62c3b307ee/

Gaah, some more OpenBLAS failures :-/

>          sh4 |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b8d520757b087654eaeda5620141bdc37a611a4f/

Samuel, this is a static linking issue in a CMake package. Could you
have a look?

>        sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/be6cb8e2437d345b709cf76357a4420e9beadb5c/

I've just submitted https://patchwork.ozlabs.org/patch/660539/ to
disable openmpi on sparc.

>         m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/f35571d40f450bb8951787187751d630b138c1b3/

/tmp/cc0WuufD.s: Assembler messages:
/tmp/cc0WuufD.s: Fatal error: Tried to convert PC relative branch to absolute jump

Waldemar ?

>          arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9dbada9e4438586d413606505362f11f7e9d3e3f/

Grr, C++, grr. Anyone to have a look?

>          arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d6bf05ba55a93fc05eb83324f9a4970779782b37/

Static linking issue. Gustavo, could you have a look?

>         i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/ef8921f61b0ef96bb2f58e273740c593d4e117ee/

musl/cdefs.h issue, would be fixed by Yann's series on the topic.

>         i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/c2100544e09d4c1825e2ee1f2002ed95dadfe337/

musl/x86/SSP issue. Sending a patch about this.

>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/4550b8a41a671c6d6c440cf09f14503eda5840b3/
>         bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/73a701a04d2579a0195123be43f3539d4f8b6a68/

Fabrice, could you respin your tinycbor patches to take into account
the feedback from Peter? Thanks!

>          arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/11c802bcfab70a0a2593079657529c763fd82aa1/

Tries to build a shared library, in static only configurations.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
