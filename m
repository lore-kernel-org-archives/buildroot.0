From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 17 Apr 2017 16:37:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170417154532.2d410eac@free-electrons.com>
References: <20170416114135.5080-1-bernd.kuhls@t-online.de>
 <20170416170537.5eee03e2@free-electrons.com>
 <XnsA759CD402B91FID313208userindividu@bernd-kuhls.de>
 <20170417154532.2d410eac@free-electrons.com>
Message-ID: <20170417143759.GE11446@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Adding Waldemar, as there are some m68k toolchain questions/issues
> below.
> 
> On Sun, 16 Apr 2017 20:10:36 +0200, Bernd Kuhls wrote:
> 
> > afaics both __atomic and __sync functions are used at the same time, for 
> > example:
> > http://git.videolan.org/?
> > p=ffmpeg.git;a=blob;f=libavcodec/mediacodecdec_common.c;h=2ec25c581d34f8f50
> > 09b84161a79589dbaf21683;hb=refs/heads/release/3.3#l145
> > 
> > calls
> > 
> > atomic_fetch_add(&s->refcount, 1);
> > 
> > which translates to __sync_fetch_and_add:
> > http://git.videolan.org/?
> > p=ffmpeg.git;a=blob;f=compat/atomics/gcc/stdatomic.h;h=e13ed0e068b8fb50c7a6
> > 9ca19a2600dae31a5a21;hb=refs/heads/release/3.3#l132
> > 
> > And http://git.videolan.org/?
> > p=ffmpeg.git;a=blob;f=libavutil/buffer.c;h=8d1aa5fa841eb934b9b1846672d9c43d
> > be23bca3;hb=refs/heads/release/3.3#l102
> > 
> > calls
> > 
> > atomic_fetch_add_explicit(&buf->buffer->refcount, 1, memory_order_relaxed);
> > 
> > which translates to atomic_fetch_add:
> > http://git.videolan.org/?
> > p=ffmpeg.git;a=blob;f=compat/atomics/gcc/stdatomic.h;h=e13ed0e068b8fb50c7a6
> > 9ca19a2600dae31a5a21;hb=refs/heads/release/3.3#l135
> 
> I really would like to see a better investigation here, rather than
> one-off fixes. Looking at the ffmpeg configure script:
> 
> if disabled stdatomic_h; then
>     if enabled atomics_gcc; then
>         add_cppflags '-I\$(SRC_PATH)/compat/atomics/gcc'
>     elif enabled atomics_win32; then
>         add_cppflags '-I\$(SRC_PATH)/compat/atomics/win32'
>     elif enabled atomics_suncc; then
>         add_cppflags '-I\$(SRC_PATH)/compat/atomics/suncc'
>     elif enabled pthreads; then
>         add_compat atomics/pthread/stdatomic.o
>         add_cppflags '-I\$(SRC_PATH)/compat/atomics/pthread'
>     else
>         enabled threads && die "Threading is enabled, but no atomics are available"
>         add_cppflags '-I\$(SRC_PATH)/compat/atomics/dummy'
>     fi
> fi
> 
> So, in our Linux case:
> 
>  - It tries to use <stdatomic.h> if available
>  - Otherwise, it uses the atomics/gcc built-ins, i.e __sync built-ins
>  - Otherwise, it uses pthread based locks
> 
> So, for the m68k case, why isn't the fallback to pthread locks not
> working? Also, if you look at the config.log for the m68k toolchain,
> you see:
> 
> check_builtin stdatomic_h stdatomic.h atomic_int foo, bar = ATOMIC_VAR_INIT(-1); atomic_store(&foo, 0)
> check_code ld stdatomic.h atomic_int foo, bar = ATOMIC_VAR_INIT(-1); atomic_store(&foo, 0) cc
> check_ld cc
> check_cc
> BEGIN /tmp/ffconf.oqKy0y9w.c
>     1   #include <stdatomic.h>
>     2   int main(void) { atomic_int foo, bar = ATOMIC_VAR_INIT(-1); atomic_store(&foo, 0); return 0; }
> END /tmp/ffconf.oqKy0y9w.c
> /home/thomas/projets/buildroot/output/host/usr/bin/m68k-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot=/home/thomas/projets/buildroot/output/host/usr/m68k-buildroot-uclinux-uclibc/sysroot -isysroot /home/thomas/projets/buildroot/output/host/usr/m68k-buildroot-uclinux-uclibc/sysroot -D_ISOC99_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_POSIX_C_SOURCE=200112 -D_XOPEN_SOURCE=600 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -Wl,-elf2flt -static -std=c11 -fomit-frame-pointer -c -o /tmp/ffconf.5kFw4oXu.o /tmp/ffconf.oqKy0y9w.c
> 
> So no error at all on <stdatomic.h>, so why does it fall back to __sync
> built-ins?
> 
> Also Waldemar, you marked __sync 4 bytes built-in as not available for
> m68k_cf (commit df00b174f6c965be52d58a7911cec74de1426f8d), but it seems
> to also fail on __atomic builtins with a gcc ICE. Has this issue been
> reported to upstream gcc? Buildroot currently assumes that the m68k
> toolchain provides __atomic built-ins. You can try to test the
> toolchain with the following C program:

I get an ICE.

The bug exist since a while:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467

There was some progress last year, but no solution.

Coldfire neither provide support for atomic nor __sync* at the moment
AFAIK.

best regards
 Waldemar
