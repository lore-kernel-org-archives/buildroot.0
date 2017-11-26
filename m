From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Nov 2017 15:21:40 +0100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <20171126070006.676FA209DE@mail.free-electrons.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
Message-ID: <20171126152140.0fd3902b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yann, Sam, Joel, Johan, Waldemar, Ismael, Ga?l, Fabrice, please see
below, there are some questions/topics for you :-)

On Sun, 26 Nov 2017 08:00:06 +0100 (CET), Thomas Petazzoni wrote:

> Build statistics for 2017-11-25
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2017.08.x |  13 |   0 |   0 |  13 |
>       master | 224 |  12 |   0 | 236 |
>         next |  54 |  10 |   1 |  65 |

These results are pretty good, especially for the "master" branch,
we're down to ~5% of failures!

> Results for branch 'master'
> ===========================
> 
> Detail of failures
> ------------------
> 
>          arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/7c9892b9425aff6e54b8c8942dbdcb0b26e58572 | ORPH

/usr/bin/install: cannot create regular file `/home/peko/autobuild/instance-1/output/target/usr/lib/asterisk/modules': No such file or directory

Why is Asterisk orphan? Yann, you introduced this package recently, so
it shouldn't be orphan. Is there anybody else interested in the
Asterisk package ?

>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/407af9800313d4540643d7625e85acc0c2366892 |     
>          arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/2aca54ad48ecfd72242d97499e21a46c1b384b10 |     

It fails to build on powerpc64le host machines. Johan, could you have a
look into this? Looking at the build failure, it looks like the Erlang
build system is forcing some powerpc64 big-endian flags, while we're
building on powerpc64 little-endian.

Johan: you can request an access to a power64le machine using
https://cfarm.tetaneutral.net/users/new/. Say you're working on the
Buildroot project when creating your account. Once your account is
created, you can log it to gcc112.fsffrance.org, and do a build that
includes Erlang. Something as simple as:

BR2_arm=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ERLANG=y

reproduces the problem.

Also, perhaps this is something our PowerPC64 friends from IBM could
help fixing? Sam? Joel?

>          arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/88dcf7c898c21935b44f9216dfde86c4be8c990e |     

In fact, Google Breakpad doesn't have support for PowerPC64. We handle
this properly for the target Google Breakpad:

config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
	bool
	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || \
		BR2_mips || BR2_mipsel

But we don't ensure that it is excluded on PowerPC64 machine. The
specific curl issue reported in this build failure is easy to fix, but
it also fails later on with:

#if defined(__i386__)
typedef MDRawContextX86 RawContextCPU;
#elif defined(__x86_64)
typedef MDRawContextAMD64 RawContextCPU;
#elif defined(__ARM_EABI__)
typedef MDRawContextARM RawContextCPU;
#elif defined(__aarch64__)
typedef MDRawContextARM64 RawContextCPU;
#elif defined(__mips__)
typedef MDRawContextMIPS RawContextCPU;
#else
#error "This code has not been ported to your platform yet."
#endif

So we should exclude it from PowerPC64 build machines.

>         bfin | pdbg-527fe54e1c95e031efd3db... | NOK | http://autobuild.buildroot.net/results/d367d9a6367e5da10d9f53f52c5e685c5c0cb8a7 |     

Joel: gaah, it still doesn't work entirely on Blackfin, because on
Blackfin, the C symbol reference "foo", if the symbol is implemented in
assembler, must be called "_foo". I'll have a look into this.

>      powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4ee0bde32f4f1be7b9e3d060b84a7b0054a44f33 | ORPH

Compiler failure:

tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in validate_condition_mode, at config/rs6000/rs6000.c:18074

Who volunteers to reproduce with gcc 7.x, report the bug upstream, and
see if we can work-around in the mean time ?

>       mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/cc064f4de95e34b397794c1486e1c09bb67916f5 |     

{standard input}:708: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movz $v0,$t8,$t7'

So, we should exclude it on mips32r6 (and probably mips64r6 as well).
I'm must say I'm not sure if it's a dependency that should be added to
BR2_PACKAGE_QT5_JSCORE_AVAILABLE or to BR2_PACKAGE_QT5WEBKIT directly.

>  powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/1d069b73dfaff53f5bd1a7c0677353ce8b06eec1 |     
>          arc |                        unknown | NOK | http://autobuild.buildroot.net/results/5edd57619d2448bdb8c1e23463eecee4798d7000 |     
>         i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/1a461a774e6bb01ffa7b4460085455a1e5858627 |     
>       x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/6f389115b2195a5aa06ba1ceae7fdfe1b4522151 |     

All those fixed by https://git.buildroot.org/buildroot/commit/?id=f79cc7dc157e885b879637d428971ce89777f85c.

>         or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d7c6370dcd9c13c56189d55c920841db03d5ab6c |     

src/client/options.cpp: In function 'client_options process_command_line(int, const char**)':
src/client/options.cpp:139:1: internal compiler error: in merge_overlapping_regs, at regrename.c:304

Gaah, a compiler failure :-/ Waldemar, could you look into this one ?

> Results for branch 'next'
> =========================
>
>          arm |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/0471bc87bddbff42d7016d78080613c4fae117bf | ORPH

checking for library containing SSL_new... no
configure: error: libssl not found
make: *** [/home/test/autobuild/run/instance-3/output/build/axel-2.16/.stamp_configured] Error 1

Ismael, you bumped this package recently, could you look into this
build failure? Also, this package is currently orphan, could you send a
patch to add yourself for this package in the DEVELOPERS file?

>     mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/3852ceb48b26a94042a1610801c8edb0ea694072 |     

This will be fixed once 17299cd0182df1b4202429a9c567765b3d2510bc is
merged into next.

>       mipsel | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/f6dfc780f878003faccf3542ff5532b05c05d644 |     

This will be fixed once ca4009fc24e3a283fc44327dbd20579bde6cc323 is
merged into next.

>          arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/68a701efaca4f7ffc02ed91fcd8118298f916e7d | ORPH

checking the archiver (/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/bin/arc-linux-ar) interface... unknown
configure: error: could not determine /usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/bin/arc-linux-ar interface

My fault, the ARC toolchain is broken due to the RPATH issue again.
I'll fix.

> microblazeel |                 libxslt-1.1.29 | TIM | http://autobuild.buildroot.net/results/2000c1282f66303a0e4ced19307b91ff931868a7 |     

I don't see anything wrong there, perhaps just the build really was too
long.

>       xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/473c686f9bc5335d25b720cf1b0c45389138a7b4 | ORPH

upnp/upnp_igd.c: In function 'upnp_igd_add_device':
upnp/upnp_igd.c:422:51: error: dereferencing pointer to incomplete type 'struct Upnp_Discovery'
  ret = UpnpResolveURL((baseURL ? baseURL : d_event->Location), relURL, presURL);

Fabrice: this is a first build failure that occurs due to the libupnp18
package. linphone confuses libupnp with libupnp18, and tries to use
libupnp18. I believe we need something like:

ifeq ($(BR2_PACKAGE_LIBUPNP),y)
LINPHONE_DEPENDENCIES += libupnp
LINPHONE_CONF_OPTS += --enable-upnp
else
LINPHONE_CONF_OPTS += --disable-upnp
endif

should do the trick. Could you test that and submit a patch if it
works? Thanks!

>       x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/3c42c1eadcbfc084a1e55bf1df0450aaf1f2139c |     
>     mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/de0dd8983243ee5d1fb189add8ce445177fb87c2 |     

/home/buildroot/build/instance-0/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr'
 struct in6_addr {

Ga?l, you recently bumped this package, could you have a look?

>          arm |    python-jaraco-classes-1.4.3 | NOK | http://autobuild.buildroot.net/results/3a7000002b86663a56c0341d192f131a4a8f4936 |     
>       xtensa |    python-jaraco-classes-1.4.3 | NOK | http://autobuild.buildroot.net/results/553d6fdeb6ea5359b1c7d4eeb844da7a588f02e7 |     

Yegor already said he would have a look.

>       xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/2ea51b2c0781cf043b4ce6a568788da748ae5a3e |     

This will be fixed once f79cc7dc157e885b879637d428971ce89777f85c is
merged into next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
