From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Aug 2014 11:07:14 +0200
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20140830063010.D10AE101874@stock.ovh.net>
References: <20140830063010.D10AE101874@stock.ovh.net>
Message-ID: <20140830110714.5c52c062@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Aug 2014 08:30:10 +0200 (CEST), Thomas Petazzoni wrote:

>        sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a810c2f27dee1978808461c05cbdcbf51a214e09/

The usual vfork() uClibc issue. I've now reported the problem to the
uClibc developers. They ask me to see if the problem still occurs on
uClibc master, so I'm currently building a toolchain with the latest
uClibc version.

>        arm |             btrfs-progs-3.14.2 | NOK | http://autobuild.buildroot.net/results/ddcc70143ce2c2882894184e4ce195a11407e027/

[LD]     libbtrfs.so.0.1

Trying to build a shared library in a pure static context. I'll have a
look.

>        arm |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/404c80e23bbeb21e7c44cd28a187f2bdfa1d82c5/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.
make: *** [/home/test/autobuild/instance-3/output/build/czmq-v2.2.0/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-3/buildroot'

I guess it's the -ldl issue investigated by J?rg?

>    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/d0adacc2961e1aee919f366d1c2982c142c8631e/

e_start_main.c:478:42: error: 'PT_GETSIGINFO' undeclared (first use in this function)
                               r = ptrace(PT_GETSIGINFO, child, NULL, &sig);

I think we had a similar issue for a different package, but I don't
remember the details. Gustavo, maybe?

>     x86_64 |                 expedite-1.7.7 | NOK | http://autobuild.buildroot.net/results/5d0ec95e9a65ce342757b2af53762bd9d3950d14/

  CXXLD  expedite
/home/test/autobuild/instance-2/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib64/libgcrypt.so.20: undefined reference to `gpg_err_set_errno'

(It's with BR2_PREFER_STATIC_LIB disabled).

> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/b849c8cd01acc86ca0507237e9b72ab7cf2cb563/

This looks like either a gcc or binutils bug. I've reported the issue
upstream as a binutils bug, see
https://sourceware.org/bugzilla/show_bug.cgi?id=17329. It's the
combination of an optimization flag, and the -g flag that causes the
issue.

>       i486 |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/bbc8f65035ab31f30d90e8979e3d6e855a2d3957/

Static lib issue, forgets to link with -lpthread.

>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/8842ad68bc3ec820a6ffb849770983957f35009d/
>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/a43fdda52628afb2127fa915f8dc0fe5f271d1df/

I really don't know what to do about this one...

>        arm |                  host-icu-51.2 | NOK | http://autobuild.buildroot.net/results/9e1dfe72d6dcfeaa1c9f6415936e3957d55d06cd/

Memory allocation problem, ignore. I've modified the autobuild
infrastructure to automatically reject such build failures in the
future.

>     x86_64 |                     lftp-4.5.2 | NOK | http://autobuild.buildroot.net/results/b16d964f275d4d8703665236b969cc19f7ef20be/

Fixed by http://git.buildroot.net/buildroot/commit/?id=c9ad5ddfb1544a61c271354a1070edfec730bda4.

>       bfin |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/8b9dc2848cc001d1f88cbf0ad93c9276d12af8d3/

dlfcn.h usage on Blackfin FLAT. I need to finish my patch that bumps
libiscsi.

>       bfin |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/9a364e3d91634a2da2bc481da1dee0ad0e870941/

CMake package trying to build a shared library even when it's told not
to do so. Samuel?

>        arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/3009327a72705f97501a9c997d56683a57d3881f/

Compiler affected by a well-known issue causing a build failure of
lttng-tools. Exception added to the autobuilder script.

>     x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/89641bf6251eb605c807e0092f5280d0274911c9/

Ignore.

>    powerpc |                   opencv-2.4.8 | NOK | http://autobuild.buildroot.net/results/3dc3e10e412d87937adae4d20a67cc4557bb328b/

Samuel, this is for you.

>   mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f6088f98372199bdf4fc02ea4e82818c68e30a54/
>   mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/940015d84ee574e785ef8aa7d4502f157399524f/

Caused by SYS_getdents64 being not provided by the C library, because
the glibc used by the toolchain is too old. Exception added to the
autobuilder script.

Yann, maybe it would be good to see how Crosstool-NG could take into
account the various build issues that we have found, and then provide
an updated version of the toolchains.

>       bfin |                   taglib-1.9.1 | NOK | http://autobuild.buildroot.net/results/a9cfe66c57bffc5a4560b2e4dcb41994da59e294/

Another stupid CMake based package building a shared library when told
not to do so. Samuel? :-)

>       bfin |                 upmpdcli-0.7.1 | NOK | http://autobuild.buildroot.net/results/d453d4dba313970f7440701f747b7b50d51120d7/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=f4905d7a3e1945d79084ca860ac88fbfedc01eaa.

> microblazeel | xapp_xfs-1c8459eafc04997751... | NOK | http://autobuild.buildroot.net/results/540b42436f6248adf131d2940b9528ed2f0fd5d6/

/home/buildroot/instance-1/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libXfont.so: undefined reference to `dlopen'
/home/buildroot/instance-1/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libXfont.so: undefined reference to `dlsym'

>       bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/6e7afb29f3af0b4782d2a71be326133a3d3c474d/

source.c:(.text+0x1a2): undefined reference to `___sync_fetch_and_add_2'

Maybe Blackfin doesn't provide the atomic compiler intrinsics?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
