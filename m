From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 1 Feb 2016 14:47:30 +0100
Subject: [Buildroot] [PATCH v2 00/17] Rework atomic handling
In-Reply-To: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160201144730.7ca660e9@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

recently, I was doing some tests on MicroBlaze and discovered that I
am missing the atomic operations there. Then I could see this patch
series. Thanks for that, however, I have still issues with this.

The libatomic_ops claims to not support MicroBlaze in its Config.in. So
it is not possible to use either __sync_* ones nor __atomic_* ones.
Even if I change this and enable it for BR2_microblaze, I am unable to
compile the libatomic_ops properly (with the Buildroot toolchain 4.9.x).

Moreover, I've read somewhere that the new GCC connects the __sync_*
interface to the __atomic_* interface internally. Is it true? Is this
done by the libatomic_ops library? I am confused by this situation... I
made some wrappers doing the __sync_* to __atomic_* translation but
still with no success.

This is a snippet from my build log:

atomic_ops.c:97:1: error: unknown type name ?AO_TS_t?
 AO_TS_t AO_locks[AO_HASH_SIZE] = {
 ^
atomic_ops.c:98:11: error: ?AO_TS_CLEAR? undeclared here (not in a function)
   AO_TS_INITIALIZER, AO_TS_INITIALIZER, AO_TS_INITIALIZER, AO_TS_INITIALIZER,
           ^
atomic_ops.c:106:31: error: unknown type name ?AO_TS_t?
 static void lock_ool(volatile AO_TS_t *l)
                               ^
atomic_ops.c: In function ?lock_ool?:
atomic_ops.c:110:3: warning: implicit declaration of function ?AO_test_and_set_acquire? [-Wimplicit-function-declaration]
   while (AO_test_and_set_acquire(l) == AO_TS_SET)
   ^
atomic_ops.c:110:40: error: ?AO_TS_SET? undeclared (first use in this function)
   while (AO_test_and_set_acquire(l) == AO_TS_SET)
                                        ^
atomic_ops.c:110:40: note: each undeclared identifier is reported only once for each function it appears in
atomic_ops.c: At top level:
atomic_ops.c:114:36: error: unknown type name ?AO_TS_t?
 AO_INLINE void lock(volatile AO_TS_t *l)
                                    ^
atomic_ops.c: In function ?lock?:
atomic_ops.c:116:54: error: ?AO_TS_SET? undeclared (first use in this function)
   if (AO_EXPECT_FALSE(AO_test_and_set_acquire(l) == AO_TS_SET))
                                                      ^
atomic_ops.c: At top level:
atomic_ops.c:120:38: error: unknown type name ?AO_TS_t?
 AO_INLINE void unlock(volatile AO_TS_t *l)
                                      ^
atomic_ops.c: In function ?unlock?:
atomic_ops.c:122:3: warning: implicit declaration of function ?AO_CLEAR? [-Wimplicit-function-declaration]
   AO_CLEAR(l);
   ^
atomic_ops.c: At top level:
atomic_ops.c:128:19: error: unknown type name ?AO_TS_t?
   static volatile AO_TS_t init_lock = AO_TS_INITIALIZER;
                   ^
atomic_ops.c: In function ?block_all_signals?:
atomic_ops.c:132:5: warning: implicit declaration of function ?AO_load_acquire? [-Wimplicit-function-declaration]
     if (AO_EXPECT_FALSE(!AO_load_acquire(&initialized)))
     ^
atomic_ops.c:138:7: warning: implicit declaration of function ?AO_store_release? [-Wimplicit-function-declaration]
       AO_store_release(&initialized, 1);
       ^
atomic_ops.c: In function ?AO_fetch_compare_and_swap_emulation?:
atomic_ops.c:154:3: error: unknown type name ?AO_TS_t?
   AO_TS_t *my_lock = AO_locks + AO_HASH(addr);
   ^
atomic_ops.c: In function ?AO_compare_double_and_swap_double_emulation?:
atomic_ops.c:176:3: error: unknown type name ?AO_TS_t?
   AO_TS_t *my_lock = AO_locks + AO_HASH(addr);
   ^
atomic_ops.c: In function ?AO_store_full_emulation?:
atomic_ops.c:201:3: error: unknown type name ?AO_TS_t?
   AO_TS_t *my_lock = AO_locks + AO_HASH(addr);
   ^
atomic_ops.c: In function ?AO_spin?:
atomic_ops.c:223:3: warning: implicit declaration of function ?AO_load? [-Wimplicit-function-declaration]
   AO_t j = AO_load(&spin_dummy);
atomic_ops.c:229:3: warning: implicit declaration of function ?AO_store? [-Wimplicit-function-declaration]
   AO_store(&spin_dummy, j);
   ^
Makefile:597: recipe for target 'atomic_ops.lo' failed
make[3]: *** [atomic_ops.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
libtool: compile:  /home/jviki/Projects/buildroot-mb/output/host/usr/bin/microblazeel-buildroot-linux-gnu-gcc -DHAVE_CONFIG_H -I../src -I../src -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fPIC -Wall -Wextra -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -c atomic_ops_stack.c  -fPIC -DPIC -o .libs/atomic_ops_stack.o
In file included from atomic_ops_stack.h:32:0,
                 from atomic_ops_malloc.h:29,
                 from atomic_ops_malloc.c:19:
atomic_ops.h:369:4: error: #error Cannot implement AO_compare_and_swap_full on this architecture.
 #  error Cannot implement AO_compare_and_swap_full on this architecture.
    ^
atomic_ops_malloc.c: In function ?AO_malloc_enable_mmap?:
atomic_ops_malloc.c:106:5: warning: implicit declaration of function ?AO_store? [-Wimplicit-function-declaration]
     AO_store(&mmap_enabled, 1);
     ^
atomic_ops_malloc.c: In function ?get_chunk?:
atomic_ops_malloc.c:184:5: warning: implicit declaration of function ?AO_load? [-Wimplicit-function-declaration]
     char *initial_ptr = (char *)AO_load(&initial_heap_ptr);
     ^
atomic_ops_malloc.c:191:9: warning: implicit declaration of function ?AO_compare_and_swap_acquire? [-Wimplicit-function-declaration]
         (void)AO_compare_and_swap_acquire(&initial_heap_ptr,
         ^
atomic_ops_malloc.c:197:5: warning: implicit declaration of function ?AO_compare_and_swap? [-Wimplicit-function-declaration]
     if (AO_compare_and_swap(&initial_heap_ptr, (AO_t)my_chunk_ptr,
     ^
Makefile:597: recipe for target 'atomic_ops_malloc.lo' failed
make[3]: *** [atomic_ops_malloc.lo] Error 1
In file included from atomic_ops_stack.h:32:0,
                 from atomic_ops_stack.c:23:
atomic_ops.h:369:4: error: #error Cannot implement AO_compare_and_swap_full on this architecture.
 #  error Cannot implement AO_compare_and_swap_full on this architecture.
    ^
Makefile:597: recipe for target 'atomic_ops_stack.lo' failed
make[3]: *** [atomic_ops_stack.lo] Error 1
make[3]: Leaving directory '/home/jviki/Projects/buildroot-mb/output/build/libatomic_ops-libatomic_ops-7_4_2/src'
Makefile:456: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory '/home/jviki/Projects/buildroot-mb/output/build/libatomic_ops-libatomic_ops-7_4_2/src'
Makefile:470: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory '/home/jviki/Projects/buildroot-mb/output/build/libatomic_ops-libatomic_ops-7_4_2'
package/pkg-generic.mk:195: recipe for target '/home/jviki/Projects/buildroot-mb/output/build/libatomic_ops-libatomic_ops-7_4_2/.stamp_built' failed
make: *** [/home/jviki/Projects/buildroot-mb/output/build/libatomic_ops-libatomic_ops-7_4_2/.stamp_built] Error 2

Regards
Jan

On Wed, 27 Jan 2016 23:47:24 +0100
Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
wrote:

> Hello,
> 
> As many of you are aware, we have a number of build failures related
> to __sync_*() atomic operations, which we can't really solve properly
> today with our single BR2_ARCH_HAS_ATOMICS boolean option.
> 
> This patch series aims at reworking our atomic operation handling, by
> introducing four options: BR2_TOOLCHAIN_HAS_SYNC_1,
> BR2_TOOLCHAIN_HAS_SYNC_2, BR2_TOOLCHAIN_HAS_SYNC_4,
> BR2_TOOLCHAIN_HAS_SYNC_8, to indicate which variants of atomic
> operations are available, depending on the architecture/toolchain. The
> full details are explained in PATCH 1.
> 
> The overall direction of the series is:
> 
>  - PATCH 1 introduces the BR2_TOOLCHAIN_HAS_SYNC_x options, and has
>    all the explanations about why we're doing this.
> 
>  - PATCH 2 updates the manual about the BR2_TOOLCHAIN_HAS_SYNC_x
>    options.
> 
>  - PATCH 3-12 aim at replacing the BR2_ARCH_HAS_ATOMICS usage by the
>    appropriate BR2_TOOLCHAIN_HAS_SYNC_x options. Note that in some
>    cases, BR2_ARCH_HAS_ATOMICS can be removed completely.
> 
>    Along the way, we found that json-c was using some __sync_*()
>    built-ins, so we added this dependency, which fixes some build
>    failure.
> 
>  - PATCH 13 removes the BR2_ARCH_HAS_ATOMICS option, which has become
>    no longer used.
> 
>  - PATCH 14-17 use the new BR2_TOOLCHAIN_HAS_SYNC_x options to fix
>    numerous outstanding build failures related to atomic operations.
> 
> Changes compared to v1:
> 
>  - Drop patches that have been merged:
> 
>     libftdi: C++ bindings need boost
>     libftdi: remove BR2_ARCH_HAS_ATOMICS dependency
>     icu: remove BR2_ARCH_HAS_ATOMICS dependency
>     openocd: remove BR2_ARCH_HAS_ATOMICS dependency
> 
>  - Fix numerous english typos in the commit log of "toolchain: add
>    BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans" as well as in the patch
>    itself. Following the review from Yann E. Morin.
> 
>  - Introduced a BR2_TOOLCHAIN_X86_HAS_SYNC_8 in "toolchain: add
>    BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans" to simplify the
>    expression of the availability of 8-byte intrinsics on 32 bits
>    x86. Suggested by Yann E. Morin.
> 
>  - In the documentation patch, remove a stray paragraph from a
>    previous write-up documenting the new BR2_TOOLCHAIN_HAS_SYNC_x
>    options. Noticed by Yann E. Morin.
> 
>  - Fix minor typo and add Reviewed-by from Yann E. Morin on patch
>    "json-c: needs __sync_val_compare_and_swap_4".
> 
>  - Explicitly pass --disable-nonportable-atomics to the apr package
>    configure script when no appropriate atomic __sync functions are
>    available. Suggested by Yann E. Morin.
> 
>  - Added Reviewed-by: "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org> on:
> 
>     jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
>     gauche: disable on SPARC(64), remove atomics dependency
>     msgpack: rework BR2_ARCH_HAS_ATOMICS dependency
> 
>  - Added Tested-by/Acked from Yann E. Morin on:
> 
>     libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
>     thrift: remove BR2_ARCH_HAS_ATOMICS dependency
> 
>  - Added Acked-by: "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org> on
> 
>      squid: rework atomic handling
>      arch: remove BR2_ARCH_HAS_ATOMICS option
>      neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
>      freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
>      openal: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
> 
>  - Fix a few typos in the commit log of "glog: fix atomic built-in
>    problem" and added Reviewed-by from Yann E. Morin.
> 
> Those interested can also find this series in the Git branch at:
> 
>   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=atomic-rework
> 
> Thanks in advance for your review and comments!
> 
> Thomas
> 
> Thomas Petazzoni (17):
>   toolchain: add BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans
>   docs/manual: document usage of BR2_TOOLCHAIN_HAS_SYNC_x
>   json-c: needs __sync_val_compare_and_swap_4
>   pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency
>   apache, apr: fix atomic handling
>   jack2: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbol
>   libtorrent: use the proper BR2_TOOLCHAIN_HAS_SYNC_x symbols
>   gauche: disable on SPARC(64), remove atomics dependency
>   cairo, harfbuzz: rework atomic dependencies
>   squid: rework atomic handling
>   thrift: remove BR2_ARCH_HAS_ATOMICS dependency
>   msgpack: rework BR2_ARCH_HAS_ATOMICS dependency
>   arch: remove BR2_ARCH_HAS_ATOMICS option
>   glog: fix atomic built-in problem
>   openal: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
>   freerdp: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
>   neard: add missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
> 
>  arch/Config.in                                 |  4 --
>  arch/Config.in.aarch64                         |  3 --
>  arch/Config.in.arc                             |  3 --
>  arch/Config.in.arm                             |  3 --
>  arch/Config.in.bfin                            |  3 --
>  arch/Config.in.m68k                            |  3 --
>  arch/Config.in.microblaze                      |  3 --
>  arch/Config.in.mips                            |  3 --
>  arch/Config.in.nios2                           |  3 --
>  arch/Config.in.powerpc                         |  3 --
>  arch/Config.in.sh                              |  3 --
>  arch/Config.in.x86                             |  3 --
>  arch/Config.in.xtensa                          |  3 --
>  docs/manual/adding-packages-directory.txt      | 11 +++--
>  package/apache/apache.mk                       |  4 --
>  package/apr/apr.mk                             | 15 ++++++
>  package/cairo/Config.in                        |  1 -
>  package/cairo/cairo.mk                         |  6 +++
>  package/cairomm/Config.in                      |  2 -
>  package/connman/Config.in                      |  1 +
>  package/cwiid/Config.in                        |  2 +-
>  package/directfb/Config.in                     |  5 +-
>  package/efl/Config.in                          |  2 +-
>  package/enlightenment/Config.in                |  6 +--
>  package/espeak/Config.in                       |  2 +-
>  package/fastd/Config.in                        |  1 +
>  package/freerdp/Config.in                      |  2 +
>  package/gauche/Config.in                       |  5 +-
>  package/glog/glog.mk                           | 11 +++++
>  package/gstreamer/gst-plugins-bad/Config.in    |  4 +-
>  package/gstreamer/gst-plugins-base/Config.in   |  4 +-
>  package/gstreamer/gst-plugins-good/Config.in   |  5 +-
>  package/gstreamer1/gst1-plugins-bad/Config.in  |  6 ++-
>  package/gstreamer1/gst1-plugins-base/Config.in |  4 +-
>  package/gstreamer1/gst1-plugins-good/Config.in |  5 +-
>  package/gtkmm3/Config.in                       |  4 +-
>  package/harfbuzz/Config.in                     |  2 +
>  package/jack2/Config.in                        |  4 +-
>  package/json-c/Config.in                       |  2 +
>  package/libevas-generic-loaders/Config.in      |  4 +-
>  package/libfm/Config.in                        |  4 +-
>  package/libgail/Config.in                      |  4 +-
>  package/libgdiplus/Config.in                   |  2 -
>  package/libgtk2/Config.in                      |  4 +-
>  package/libgtk3/Config.in                      |  4 +-
>  package/librsvg/Config.in                      |  4 +-
>  package/libsvg-cairo/Config.in                 |  1 -
>  package/libtorrent/Config.in                   |  4 +-
>  package/mpd/Config.in                          |  6 ++-
>  package/msgpack/Config.in                      |  4 +-
>  package/neard/Config.in                        |  2 +
>  package/openal/Config.in                       |  2 +
>  package/openbox/Config.in                      |  4 +-
>  package/opencv/Config.in                       |  2 +-
>  package/opencv3/Config.in                      |  4 +-
>  package/pango/Config.in                        |  4 +-
>  package/pangomm/Config.in                      |  4 +-
>  package/pcmanfm/Config.in                      |  4 +-
>  package/pinentry/Config.in                     |  4 +-
>  package/pulseaudio/Config.in                   |  4 +-
>  package/pulseaudio/pulseaudio.mk               |  7 ++-
>  package/python-msgpack/Config.in               |  4 +-
>  package/rrdtool/Config.in                      |  2 +-
>  package/rsyslog/Config.in                      |  2 +
>  package/rtorrent/Config.in                     |  4 +-
>  package/squid/squid.mk                         | 10 ++--
>  package/thrift/Config.in                       |  2 -
>  package/ubus/Config.in                         |  1 +
>  package/webkit/Config.in                       |  4 +-
>  package/webkitgtk24/Config.in                  |  4 +-
>  package/weston/Config.in                       |  4 +-
>  package/xscreensaver/Config.in                 |  4 +-
>  toolchain/toolchain-common.in                  | 65 ++++++++++++++++++++++++++
>  73 files changed, 205 insertions(+), 139 deletions(-)
> 



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
