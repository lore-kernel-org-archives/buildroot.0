From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 22:48:34 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-23
In-Reply-To: <20160524063023.4C8B610173F@stock.ovh.net>
References: <20160524063023.4C8B610173F@stock.ovh.net>
Message-ID: <20160524224834.4fb29814@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The release is approaching, the build results are getting better, so
let's try to make some additional work to make results even better.

On a total of 31 failures, we have:

 - 8 issues that are already resolved
 - 4 that have patches, some of which not completely ready
 - all the rest that remains to be investigated/fixed

>      powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/47dc536f613f958c52f3879411ba6fb3b861d6b4/

This is a toolchain/compiler issue, Gustavo is investigating.

>          arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/24a35b63921cb9d747052f3bbfc3549ed20e18d7/
>     mips64el |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/af1eec00e472349c7dca76dcc8dd5cd37d82f5c3/

Those issues are resolved for the non-musl builds, thanks to the
rebuild of the toolchains with 4.5.5 kernel headers. The ARM/musl case
(first one here) still fails to build, though.

>        nios2 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/af3743bc0840cecf13664c081d6d205e5a8c9eca/
>     mips64el |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/6593e1ca94f98e3c2a5fd90401f709cf2f7b1743/
>          arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5937a416c1f320a581b54a7bc61cbb69075e9e43/
>       mipsel |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/5ff215f7c91411fef335890d8a86a3482dfdac3b/

Fixed by the toolchain rebuild with 4.5.5 kernel headers.

>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/fd8989978723d1046c01021d22d57d6d6ed3b84f/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/b71dc90217e52a99e187d38106b666d7088373cc/
>     mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/4676f1a966d305d5f7af5125e02b83ce2fe9c75b/

I've investigated this one, and it's due to the fact that ffmpeg's
configure script adds both -mips64 and -mips64r6 to the command line.
It can be trivially reproduced by doing:

thomas at skate:~/projets/buildroot (next)$ ./output/host/usr/bin/mips-img-linux-gnu-gcc -c pouet.c -mips64 -mips64r6
pouet.c:1:20: fatal error: limits.h: No such file or directory
 #include <limits.h>
                    ^
compilation terminated.
thomas at skate:~/projets/buildroot (next)$ cat pouet.c 
#include <limits.h>

Vincent, can you look into this one?

>       x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/75e3b6b2a9b72965787d6a731893a5de75e448db/

Would be solved by http://patchwork.ozlabs.org/patch/624244/, but I
still have some concerns about this patch.

>         i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/9f3a493e1863c90bf317f0cdb1d5828d58f8b855/

Parallel build issue it seems. 

>      powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/c5277c42344d194e004dcd0a5af71bc6110da97e/

Fixed by 012e10bf6215cbfc8006003e42dee8167d6cd1ef.

>       x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/01ce94baec5fd6202795fa9089e874bd8ce22cd6/

Would be fixed by http://patchwork.ozlabs.org/patch/624086/.

>       x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/4cedd4dbaafca76e839f45cc0a4bb8c2c181920d/

Fixed by 00680faa00f56c16686b1671f6fbf3c1a1530f63.

>       xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1ee48356d8da5e0ebf3e5b61b02fed81704a01dd/

Bernd proposed some patches, to which I replied with I believe a
better/more general solution.

>     mips64el |                 libcurl-7.49.0 | NOK | http://autobuild.buildroot.net/results/ee89393b87333e12ae001a5c69dd92532112f5b5/

Download problem, ignore.

>        sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/311c4c56b82a8d65a2f8e6621363bf60e46f6252/

We need a better variant of: http://patchwork.ozlabs.org/patch/569818/.

>     mips64el |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/8820f2cdbf2ac4bc926cb3072639b74c2f756ae2/

Not sure:

libtool: link: /home/test/autobuild/instance-2/output/host/usr/bin/mips64el-ctng_n32-linux-gnu-gcc -shared  -fPIC -DPIC  .libs/irrecord.o   -llirc  -Os   -Wl,-soname -Wl,libirrecord.so.0 -o .libs/libirrecord.so.0.0.0
libtool: link: ( cd ".libs" && rm -f "liblirc.la" && ln -s "../liblirc.la" "liblirc.la" )
/home/test/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-ctng_n32-linux-gnu/4.8.2/../../../../mips64el-ctng_n32-linux-gnu/bin/ld: cannot find -llirc
collect2: error: ld returned 1 exit status
make[4]: *** [libirrecord.la] Error 1

It's happening on all architectures it seems:
http://autobuild.buildroot.org/?reason=lirc-tools-0.9.3a.


>       x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/b4e021b3c4fa02589b236d3b7290f7df2df92801/

musl build issue for LVM2.

>        nios2 |                    lzlib-0.4.3 | TIM | http://autobuild.buildroot.net/results/6dfb133b3ba59e8ee094493afc13e94a2bf6a3a2/

Seems to be like a real timeout.

>          arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/d16ef6abf2adeb55c67fc62d7f1473d5ce2bddb0/

Alexey, this is a compiler issue on ARC, can you have a look?

> microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/72494289e1ed8c5ce867444968331e63a00026d3/

I sent a patch to disable oprofile on Microblaze, but it didn't make it
through the list :-/

>      aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/5195b934dd2ec8f2c76b188133c358dc38edca24/

Seems like passing std=c++11 is needed.

>        sparc |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/1e3101261252d5f30fdf842cc99604e4f4c25eef/

I've investigated this one, and reported back to the developer who
originally contributed this package.

>          sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0dc6e3e76040cf18a19f66ea7b32352b19a4a9a5/

Linker bug. We should blacklist this toolchain and/or report the bug to
the binutils developers.

>       x86_64 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a416001516d98d58849f1d1f8f49f49d3d28f3a2/

Bernd proposes to disable ustr/libsemanage on musl (which is fine for
me).

>     mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/79916f095e1b371e5fd6694e8f74416b6bbd5d33/

Fixed by 7baf8e45e413a411fdb3adf0175025e3e5685690.

>       x86_64 |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/7fe7208df551cb39355835a61fd663e912c0190b/
>          arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/e45769f078c30901c769b3ac54cdc39a4e5b6a48/
>          arm |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/967f032a509c4e3cf059a1ac5ceb53269fd8419f/

  CCLD     libgl_plugin.la
/home/peko/autobuild/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.9.3/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lGL
collect2: error: ld returned 1 exit status

Bernd, Gustavo, do we have patches for this one?

>       x86_64 |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/82014874f5b97de8504d8409b286889b582a7454/

Fixed by ea3264fad0687186d30cb9fd8ab9832e79529d7b.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
