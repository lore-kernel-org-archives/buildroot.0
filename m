From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 May 2015 23:18:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-19
In-Reply-To: <20150520063015.F3A9A10113A@stock.ovh.net>
References: <20150520063015.F3A9A10113A@stock.ovh.net>
Message-ID: <20150520231825.240a9292@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 May 2015 08:30:15 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 317
>        failures : 14 
>        timeouts : 2  
>           TOTAL : 333

So not as good as the day before, but let's have a look anyway.

> Detail of failures
> ===================
> 
>          arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/6a14124221801fcd5dbb41b450627b1785686cc3/
>       mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/4e192c4e13f91d91769274d004367cf59fb395c3/

Static linking problem, missing -lstdc++.

>          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/f77a2c9eea7973b54a22e12ab33ee8964adaddfd/
>       mipsel | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/9373d4238bc3f027e571581bd3531018c4faed91/

fatal error: gst/gst.h: No such file or directory

Would be fixed by http://patchwork.ozlabs.org/patch/474081/.

>       x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/fd1b9cc33094427c4fba1053e51fe06b57ca5b26/
>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/3f9381a410e8411c390ccf5632a06c66b1c93524/

This is really weird, there has been a number of timeouts occuring on
host-erlang-rebar, only on gcc75. See
http://autobuild.buildroot.org/?reason=host-erlang-rebar-2.5.1. I've
checked the logs, and it's really the build step of host-erlang-rebar
that gets stuck. In one example, the build started at 14h11, it started
building host-erlang-rebar at 14h59, and then nothing happened until
22h11, 8 hours after the start of the build, at which point the
autobuild script killed the build process.

>          arm |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/f42bbbf5be4594a8806d0e571586ce2bf119582d/

Even though we're doing SHARED_LIBS="$(if $(BR2_STATIC_LIBS),n,y)",
iproute2 continues to build .so files in static linking configurations,
which cannot work.

>      powerpc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/e537a500852ddb8aa0b1155ea9bc8a17636dd50d/

Needs dynamic library:

JackSystemDeps_os.h:26:19: fatal error: dlfcn.h: No such file or
directory

I'll fix that up.

>       xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/9d0e53e12626b069246b86f079c6a9f26b0f3eac/
>       xtensa |                        kmod-20 | NOK | http://autobuild.buildroot.net/results/e7490ed91237cc726ea0b0f8a4c227a8a56ca11d/

These are fixed now by a new autobuilder exception.

>          arc |                libedbus-1.7.10 | NOK | http://autobuild.buildroot.net/results/4a0b4db5fdad581e1ec3e8133bfdb1c485105a65/

uClibc bug in static linking:

multiple definition of `__GI_raise'

Alexey, can you have a look and see if it's fixed in uClibc master?

>          arm |                 nodejs-0.10.38 | NOK | http://autobuild.buildroot.net/results/824bbeeeee5e04039bf9d7645a44f3f2aeca7628/

Not sure what happened here:

sh: echo: I/O error

I think we should probably ignore?

>          arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/87d0d4f1ab5cd358df94cebcd2c33188088a85a9/

checking for poptGetContext in -lpopt... no
configure: error: popt library not found
package/pkg-generic.mk:146: recipe for target '/ssd1/thomas/autobuild/instance-2/output/build/oprofile-1.0.0/.stamp_configured' failed

Static linking issue:

/ssd1/thomas/autobuild/instance-2/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpopt.a(poptint.o): In function `POPT_dgettext':
poptint.c:(.text+0x4c0): undefined reference to `libintl_textdomain'
poptint.c:(.text+0x4d0): undefined reference to `libintl_bind_textdomain_codeset'
poptint.c:(.text+0x4e0): undefined reference to `libintl_bind_textdomain_codeset'

>         bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/e6993d66aeebbe994063a60871412b2235ce5455/

checking for SQLite 3.3.9+... checking for sqlite3_prepare_v2 in -lsqlite3... no
not found
configure: error: Please install SQLite 3.3.9 first or check libsqlite3 is present
make: *** [/home/test/autobuild/instance-1/output/build/php-5.6.8/.stamp_configured] Error 1
make: Leaving directory `/home/test/autobuild/instance-1/buildroot'

Static linking issue:

/home/test/autobuild/instance-1/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libsqlite3.a(sqlite3.o): In function `_pthreadMutexLeave':
sqlite3.c:(.text+0x38ed2): undefined reference to `_pthread_mutex_unlock'

>      powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/db7314d0ce444dfb48fe75ed61685c9fa5ea7bc9/

Would be fixed by http://patchwork.ozlabs.org/patch/473843/.

>        nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/b2a1a4ab3c83b47e73096a1e47e531dd94fe5dbd/

Yet another NIOS II compiler problem. I'll add an exception.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
