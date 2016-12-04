From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:20:31 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-12-03
In-Reply-To: <20161204072959.746C421D18@mail.free-electrons.com>
References: <20161204072959.746C421D18@mail.free-electrons.com>
Message-ID: <20161204152031.5a7490cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

OK, there are so many failures that I will look at the classification
by reason only and not the full list.

On Sun,  4 Dec 2016 08:29:59 +0100 (CET), Thomas Petazzoni wrote:

>               host-cmake-3.7.1 | 190

Solved by:

  https://git.buildroot.org/buildroot/commit/?id=0904b80b47245cf85d414f78c381b9cf61c6ef4b

>                        unknown | 36

These are all:

make: Entering directory `/home/peko/autobuild/instance-2/buildroot'
package/qemu/qemu.mk:108: *** "Refusing to build qemu-user: target Linux version newer than host's.".  Stop.
make: Leaving directory `/home/peko/autobuild/instance-2/buildroot'

I need to have a look into this. Maybe something to adjust in the
autobuilder script itself.

>    host-lttng-babeltrace-1.5.0 | 26

Fixed by
https://git.buildroot.org/buildroot/commit/?id=7db6d46b165035a725911711e32f041fd1e6155c.

>                      efivar-30 | 18

I've asked Erico Nunes to have a look.

>         lttng-babeltrace-1.5.0 | 17

Also fixed by:
https://git.buildroot.org/buildroot/commit/?id=7db6d46b165035a725911711e32f041fd1e6155c.

>              gstreamer1-1.10.2 | 7 

Under discussion with Peter Seiderer.

>             lttng-libust-2.9.0 | 6 

Fixed by
https://git.buildroot.org/buildroot/commit/?id=715498b1ee5072fda8a8f132bb80895d817f2bad.

>      toolchain-external-custom | 6 

Fallout from the Blackfin toolchain removal, but was not yet removed in
the autobuilder list of toolchain configurations. This is not fixed.

>                    cmake-3.7.1 | 3 

/home/peko/autobuild/instance-1/output/host/usr/m68k-buildroot-linux-uclibc/sysroot/usr/lib32/libuv.so: undefined reference to `pthread_condattr_setclock'
/home/peko/autobuild/instance-1/output/host/usr/m68k-buildroot-linux-uclibc/sysroot/usr/lib32/libuv.so: undefined reference to `pthread_barrier_wait'
/home/peko/autobuild/instance-1/output/host/usr/m68k-buildroot-linux-uclibc/sysroot/usr/lib32/libuv.so: undefined reference to `pthread_barrier_destroy'
/home/peko/autobuild/instance-1/output/host/usr/m68k-buildroot-linux-uclibc/sysroot/usr/lib32/libuv.so: undefined reference to `pthread_barrier_init'

We need NPTL for target cmake.

>                     rpm-4.13.0 | 3 

tools/sepdebugcrcfix.c:31:17: fatal error: bfd.h: No such file or directory

>              berkeleydb-5.3.28 | 2 

On m68k:

   aborting at dw2gencfi.c:214 in emit_expr_encoded

Waldemar, I guess this would be fixed by
https://patchwork.ozlabs.org/patch/699474/, but this depends on Arnout
patch for the toolchain wrapper.

On Xtensa/PowerPC:

  undefined reference to `dl_iterate_phdr'

Max, Waldemar, is this fixed?

> kvmtool-bed2bd9e1fbef581909... | 2 

make[1]: *** [guest/init] Segmentation fault
make[1]: *** Deleting file `guest/init'

Hm, I think someone submitted a patch or talked about it on the list,
but can't remember.

>                trousers-0.3.13 | 2 

Toolchain issue on ARC. I've rebuilt the toolchain with the latest ARC
updates, we'll see if it improves the stuff.

>                   apitrace-7.0 | 1 
>                 bind-9.11.0-P1 | 1 
>                   cppcms-1.0.5 | 1 
>                  jack2-v1.9.10 | 1 
> kvm-unit-tests-5731572b2ac2... | 1 
>                   lcdapi-v0.10 | 1 
>               lsqlite3-0.9.4-2 | 1 
>              lttng-tools-2.9.0 | 1 
>                  mesa3d-13.0.2 | 1 
>                     mosh-1.2.6 | 1 
>                openldap-2.4.44 | 1 
>                  openssh-7.3p1 | 1 
> phidgetwebservice-2.1.8.201... | 1 
>              qt5location-5.6.2 | 1 
>                   sispmctl-3.1 | 1 
>                   squid-3.5.22 | 1 
> uhttpd-59e0c739634f46a164d9... | 1 
>                upmpdcli-1.2.10 | 1 
> ustream-ssl-ec80adaa1b47f28... | 1 
>                      vlc-2.2.4 | 1 
> x264-72d53ab2ac7af24597a824... | 1 
>                 xfsprogs-4.7.0 | 1 

And lots and lots of other build failures. Since they occurred only
once, I skipped for now. Anyone interested in doing a detailed analysis?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
