From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 10:57:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-27
In-Reply-To: <20150728063018.ECCE8101BC0@stock.ovh.net>
References: <20150728063018.ECCE8101BC0@stock.ovh.net>
Message-ID: <20150728105715.22962d48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Brendan, Guillaume, J?rg, Waldemar, Samuel, Johan, Maxime, Alexey, Max,
Gustavo, Julien, Vicente, Clayton, see below. Thanks!

On Tue, 28 Jul 2015 08:30:18 +0200 (CEST), Thomas Petazzoni wrote:
> Build statistics for 2015-07-27
> ===============================
> 
>         success : 124
>        failures : 68 

This is getting a bit better, so let's have a look at the build
failures. Here are some quick stats I gathered on the failure reasons:

	misc issues:			19
	ARC toolchain problems:		12
	musl:				 8
	too old gcc:			 8
	sourceforge download problem:	 6
	static linking issues:		 4
	atomic issues:			 3
	issues already fixed:		 3
	host-erlang-rebar timeout:	 2
	xtensa toolchain problems:	 2
	gcc 5.x problems:		 2


>       x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/7e60af535dd4177afdc4cb7b92e9abf27c3fba07/
>       x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/90ca6a8d6947a320996376a453dfb1aa34b543ac/

musl build problems. Brendan, you worked on this issue, do you have an
update from upstream? Can you submit a patch to fix this?

>       x86_64 |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/6394b7e939f6353f0553dca111f0d395f391c999/

Musl build problem. The infamous "fatal error: sys/cdefs.h: No such file
or directory". Should be quite issue to fix.

>          arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/1acd3d2c2ff1afc2ddcddfa4aea11ad42e32f293/
>          arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/dcc6a4d892d13d6ee7755bc1449e34bdf21363bd/

libstdc++/.tbss issue on ARC, problem known.

>          arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6c818b2d3d33cdbe5378edbea4ff438666164c4a/

Same.

>          arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/

Musl build issue. Any taker?

>        sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/317c4f3766690fbb43e42a02ebac1001ba822dee/

libtirpc uses atomics, we need to link with -latomic. Maybe should be
addressed by a libtirpc patch that adds -latomic to its .pc file?

>          arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/a0c5582ff4071101dbf4b4b82b53c4179f274ec8/

Looks like a gcc 5.x build issue

bwm-ng.c:(.text.startup+0x1c8): undefined reference to `get_iface_stats'
bwm-ng.c:(.text.startup+0x2bc): undefined reference to `get_iface_stats'

Any taker?

>          arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/bf8cd49cb78dafd4809739bc8616ce20f13afe69/

Not sure what's going on. Happens when using static linking.

c_icap-service.o: In function `load_c_service':
service.c:(.text+0x710): undefined reference to `ci_module_load'
service.c:(.text+0x720): undefined reference to `ci_module_sym'
service.c:(.text+0x774): undefined reference to `ci_module_unload'

Guillaume, can you have a look?

>          arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a4c057e0b1ab6a2ffd69b27f6f5a79f98eb040f6/

checking for Boost's header version... 
configure: error: invalid value: boost_major_version=
package/pkg-generic.mk:146: recipe for target '/home/buildroot/build/instance-0/output/build/cc-tool-0.26/.stamp_configured' failed

J?rg, you have touched Boost/cc-tool recently, can you have a look?

>          sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7559993edf68cc697832d65ab3bd925724861e5e/

uClibc bug when static linking. Waldemar fixed it for x86/x86-64, I'll
report it to him for SuperH.

>          arc |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/5b7238e4bf40e9fb114b6b9f937b8ec5a4aafe52/

ARC libstdc++/.tbss issue.

>          arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/658ec1b4817b5f0d83a07992a5e49b98c3be0043/

/home/peko/autobuild/instance-1/output/build/clapack-3.2.1/F2CLIBS/libf2c/uninit.c:236:25: fatal error: fpu_control.h: No such file or directory
 #include "fpu_control.h"
                         ^
compilation terminated.

Samuel, can you have a look ?

>          arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/2c9ef771d146ce5b9df82735fdeb62926c84bd9f/

compat.c: In function 'strnstr':
compat.c:70:3: error: unknown type name 'ssize_t'
   ssize_t plen;
   ^
compat.c:71:3: error: unknown type name 'ssize_t'
   ssize_t len = strlen(needle);

Smells like an easy to fix musl problem. Any taker ?

>       x86_64 |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/001774459724e57b5df6cccd85ec9584ef9cc31a/

dhcpdump.c:166:58: error: 'struct udphdr' has no member named 'len'
  if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
                                                          ^
dhcpdump.c:169:46: error: 'struct udphdr' has no member named 'len'
  printdata((u_char *)(sp + offset), ntohs(udp->len));

musl problem again. Any taker ?

>          arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/48298e5b487cffbdef53347165d8dcc4f6840bb0/

system.c: In function 'direct_trap':
system.c:110:6: error: unknown type name 'sigval_t'
      sigval_t val;
      ^
system.c:114:9: error: request for member 'sival_int' in something not a structure or union
      val.sival_int = direct_gettid();
         ^
system.c:117:6: error: incompatible type for argument 3 of 'sigqueue'
      sigqueue( direct_gettid(), sig, val );

musl problem again.

>         i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/3b4056010a8dddf67341f63414507b2e28b85824/
>      aarch64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/42778c07e7afb0a59a763ee7c6abd1ef0a57f3c0/
>          arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/92c9b9adab15fc048da96ea478402b3719f85535/
>      powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/32c51bdfc8ca1bb5f67e45c04bc79975890c2d35/
>          arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/02b5aabb42d1d86b941670a366b55e14daff5332/
>      powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/4e976a4f739494003c788644f1858a9aeed47681/

Download issue with SourceForge being broken, and sources.b.o not
having the backup tarball. Will be fixed once Peter uploads the backup
tarball, or when SourceForge goes back to life.

>       mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/89ffd2a03f295c810399680621440b08f7c7762f/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.
make: *** [/home/peko/autobuild/instance-2/output/build/filemq-482797b8aa30fcc9ea1377aabdf2b0769f9f698e/.stamp_configured] Error 1

Static linking issue. This problem has been around since a long time.
Could anyone have a look ?

> microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/c83fa909467e5cc668c42fe769b35844648417a1/

Toolchain issue:

/home/peko/autobuild/instance-2/output/host/usr/bin/microblazeel-buildroot-linux-gnu-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os -g2  main.c -o main.o
/tmp/ccpjoDpf.s: Assembler messages:
/tmp/ccpjoDpf.s: Error: PC relative branch to label logerror which is not in the instruction space
/tmp/ccpjoDpf.s: Error: PC relative branch to label logerror which is not in the instruction space

Happening with the internal toolchain. Anyone to report this bug to
binutils or gcc (whichever is appropriate) ?

>      powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/03ca879a65b1fc3449b8f30b1f1e354082fe4b7f/
>          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/64ba4c9786719788e923262cde8b6bf004a79e8e/

The infamous timeout caused by host-erlang-rebar, still unsolved.
Johan, can you have a look ?

>      aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/ceb0e5ae8222bc8c9638b13ceb7b444d8a83870b/

Bernd, can you have a look?

fatal error: EGL/eglplatform.h: No such file or directory

>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/b3cb6515496cf09d305a1077d01f87d75ece8a8d/
>        sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/9db61963bdcf8bdd6784e00af4945292cd2d816e/

Atomic problem on SPARC. Brendan, you started working on this, and I
think you found a solution. Can you send a patch?

>     mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/138fa7fec380380f1340268017ef4d687b2653e6/
>     mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/0a96f3654983ed2efc851522352dec43c1df0077/
>     mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/c600ebf636b4c2214bce0ce13132ea62303d1559/

Regression introduced by the bump to libiscsi. Maxime, can you work on
it since you did the bump?

>      aarch64 |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/62a32a2ad6693afd67df88807595e45b549f942c/

Package gudev-1.0 was not found in the pkg-config search path.
Perhaps you should add the directory containing `gudev-1.0.pc'

We probably need to merge the new gudev package to fix this.

>          arc |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/cf9e762a7d00b8a872b557186a56ba5816b89978/

load_abc.cpp: In function 'void setenv(const char*, const char*, int)':
load_abc.cpp:271:70: error: new declaration 'void setenv(const char*, const char*, int)'
 static void setenv(const char *name, const char *value, int overwrite)

Weird. Not sure what's happening here.

>       x86_64 |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/805a81bdafe604bc0b03dedb292d52ca268f8a90/

error: unknown type name 'u_int16_t'

Musl issue. Should be easy to fix. Any taker?

>          arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a3d7fd8c672f6e5165b4406f65f5e8dac94d953c/

Fixed by http://git.buildroot.net/buildroot/commit/?id=cac3cf8f9c36140eb0f5cd76665c1fdb0b47676c.

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5b78dbf815a396a5f1790494c015ad4275a8bb17/

/tmp/ccR6VgNC.s: Assembler messages:
/tmp/ccR6VgNC.s:475: Error: internal error: fixup not contained within frag

Toolchain issue. I think Alexey you already know this one.

>       x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7a0f3494d47b29b1fc51c511db60152c185abbc0/

Fixed by http://git.buildroot.net/buildroot/commit/?id=cac3cf8f9c36140eb0f5cd76665c1fdb0b47676c.

>          arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b996a2e801ff7d23f3012cf3b21480f1922c0b62/

Same ARC toolchain issue.

>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/3606b2d7d83f03ec9618730c0bad277558879f7b/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/5d7762fd586fe06cf8db050b778d66a4790eee58/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/91345c214ed156ef6ce3d84e0f9314a4064e5fb0/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/4635bd84592c0f20bf69e42b14b94424e4243fff/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/ac3852757f287cb8d858f642450ac1ea66a0ca3d/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/c7062902ce539bb6fb5d08d1215c65ed5bb911de/
>      powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/83c683bd7de6858d822aaa5823aa582dde9fccba/

Too old gcc.

>      powerpc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/ba6b014d1f4cd98fa0a1af51a3c4d978dbc17586/

/home/peko/autobuild/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(error.os): In function `error':
error.c:(.text+0x0): multiple definition of `error'

Easy to fix static linking issue: just rename the functions. Any taker ?

>          arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/55f413667c2c7eb295a3879b575d7b140f51da5a/

menu.o: In function `menu_update':
menu.c:(.text+0x4b4): undefined reference to `strequal'
menu.c:(.text+0x4f4): undefined reference to `strequal'

Not sure what's going on. Maybe related to gcc 5.x ?

>         i686 | make: *** [qextserialport-l... | NOK | http://autobuild.buildroot.net/results/3e0f954df9196e89043f4aaad154dfdece08480a/

Fixed by http://git.buildroot.net/buildroot/commit/?id=6c8d93c88d722143b785034439c61358a9481c68

>          arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/475b0dd48edb095deb188c369c5864431c0bd7ea/
>          arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/aad30630e139f14dd97945bc3a0fbddcaef2bc21/

libstdc++ / .tbss issue.

>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/af1eee92375cd59004603dacad732c80afe56898/
>       xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/54ad39189123f03fa2333ffb03539ea6b39d9e54/

Xtensa toolchain issue. Max, any update on this one ?

>         bfin |                     php-5.6.11 | NOK | http://autobuild.buildroot.net/results/a39d4911864bea5da760af9fabc682ba148383de/

checking for curl_easy_perform in -lcurl... no
configure: error: There is something wrong. Please check config.log for more information.
package/pkg-generic.mk:146: recipe for target '/ssd1/thomas/autobuild/instance-0/output/build/php-5.6.11/.stamp_configured' failed

Gustavo, maybe ?

>          arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/30acea45fb497942129ca57c143bab6174e14609/

painting/qbrush.cpp
painting/qbrush.cpp:38:29: fatal error: qplatformpixmap.h: No such file or directory
compilation terminated.

Julien, do you know what's going on ? It might be fixed by one of the
patch you submitted, can you point to it if that's the case ?

>     mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f91de4a596817997b2f35c24b07aec43916c9e1b/

/home/peko/autobuild/instance-0/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/gnu/lib-names.h:34:37: fatal error: gnu/lib-names-n64_soft.h: No such file or directory
 # include <gnu/lib-names-n64_soft.h>

Vicente ?

>       mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f0891474fe2cd3e47b1489f147e31f698dbd013f/

painting/qbrush.cpp:38:29: fatal error: qplatformpixmap.h: No such file or directory
 #include "qplatformpixmap.h"

>      powerpc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d108d303a13f6acc941457acac3e70de9093b2ee/

make: Entering an unknown directory
make: *** empty string invalid as file name.  Stop.
make: Leaving an unknown directory

>     mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d96c6f29cd636ca1e6a58824032cacd068d6e2b6/

Same.

>      aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bf7f0bb9c3d94c87e90aa0bbfb438e1cfe1a808a/

make[1]: Entering directory `/home/test/autobuild/instance-2/output/build/quota-4.01'
make[1]: *** No rule to make target ` -D_GNU_SOURCE'.  Stop.
make[1]: Leaving directory `/home/test/autobuild/instance-2/output/build/quota-4.01'

>     mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8308dc4443650ec1b2b47dafcf28516cb7f9a820/

make: Entering an unknown directory
make: *** empty string invalid as file name.  Stop.
make: Leaving an unknown directory

>         mips |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9b58ba955e286dfadaa90b521c19aac6dbc0a2e2/

Same.

Something weird going on with quota. Anyone to look into this?

>      powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a9f61063c86f58f4e1b23d8a40859182764e5bbb/

checking for /home/peko/autobuild/instance-0/output/host/usr/bin/powerpc-linux-gcc option to accept ISO C99... unsupported
configure: error: SETools requires a C99-compliant C compiler to build.

Too old gcc. We need a way to make conditionals on gcc versions.

>          arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/dfcbe1af751548b4d6966e0b4de6d0704eb9a737/

stdc++ / .tbss ARC issue.

>          arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/15b0d93c63c442f194a666ab68e79b1b83f59e15/

Another (new?) ARC toolchain issue:

BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3018

Alexey ?

>         bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/c1b80d94352258d9d0bca3d26c0aecd4e0f00707/

/ssd1/thomas/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libc.a(abort.o): In function `*___GI_abort':
/usr/src/packages/BUILD/blackfin-toolchain-uclibc-full-2014R1/uClibc/libc/stdlib/abort.c:61: multiple definition of `_abort'
/tmp/cck79BjD.o:usb_modeswitch.c:(.text+0x72c): first defined here

Gustavo, can you have a look ?

>          arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8dbaa5e83c62cbad70d20d63d4059227ba578a9d/

Gcc 5.x doesn't like ustr.

Clayton, you originally submitted ustr for the SELinux support. Can you have a look ?

>          arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/6deddedb2175363be89396daf690ba3e94b013d5/

ARC toolchain issue:

  more undefined references to `.tdata' follow

But it was using the old ARC toolchain before I rebuilt yesterday.

>          arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e87ed0843800c8fa9948c55902b97bb162a87b14/

ARC toolchain issue:

  error: Internal consistency failure: cfi row mismatch [-Werror]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
