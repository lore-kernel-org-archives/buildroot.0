From: Luca Ceresoli <list@lucaceresoli.net>
Date: Tue, 20 Apr 2010 10:56:24 +0200
Subject: [Buildroot] ARM build fails on 64-bit host (tries linking with host
	libs?)
Message-ID: <L163I0$91EE4FE6D33E4ACEA13C654C3E2F6E7E@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a buildroot setup for ARM that works fine on x86-32bit Ubuntu
hosts, but hits an error on x86-64bit while linking directfb.

My buildroot is based on commit d5b0bb4b (2 weeks ago), plus the
addition of a custom board config.
I'm using an external toolchain, created by crosstool-NG (recompiled
on each host).

The first notable difference between the 32- and the 64-bit runs is as
follows (I just wrapped lines for readability).

32-bit:
/opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os
 --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/
 -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o
 .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o
 .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o
 -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -lz
 -L/home/murray/devel/keyser/package/buildroot/output/target/usr/lib
 -L/usr/lib -ldirect -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0
 -o .libs/libfusion-1.4.so.0.2.0
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libdl.so when searching for -ldl
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libdl.a when searching for -ldl
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libpthread.so when searching for -lpthread
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libpthread.a when searching for -lpthread
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libc.so when searching for -lc
/opt/xtools/arm-cortex_a8-linux-gnueabi/lib/gcc/arm-cortex_a8-linux-gnueabi
 /4.4.0/../../../../arm-cortex_a8-linux-gnueabi/bin/ld:
 skipping incompatible /usr/lib/libc.a when searching for -lc
/usr/bin/install -c .libs/libfusion-1.4.so.0.2.0T
 /home/murray/devel/keyser/package/buildroot/output/target/usr/lib
 /libfusion-1.4.so.0.2.0

64-bit:
/opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os
 --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/
 -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o
 .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o
 .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o
 -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -lz
 -L/home/murray/devel/keyser/package/buildroot/output/target/usr/lib
 -L/usr/lib -ldirect -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0
 -o .libs/libfusion-1.4.so.0.2.0
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status

I'll save you from staring at the lines above: the first line of the two
cases is absolutely identical. The result is different, though.

Looks like on the 32-bit host arm-linux-gcc finds some of the host libs
(/usr/lib/libdl.so and others) but decides they're incompatible:
reasonable, since they're x86, not ARM code.

OTOH, on the 64-bit host the lib cannot be opened. Perhaps my
ct-NG-generated toolchain cannot handle 64-bit files, not even to recognize
they are incompatible.

But my point in this ml is: why does the compilation of directfb have
-L/usr/lib in its commandline?

With spirit of adventure, and not with a real knowledge of buildroot's
internale, I tried to fix the issue adding
--libdir='$(STAGING_DIR)' to DIRECTFB_CONF_OPT in
package/directfb/directfb.mk. The error disappeared, but later on the
compilation of qmake broke (both on 32- and on 64-bit hosts!)
complaining that
> The DirectFB screen driver functionality test failed!

Any clues?
Anybody else working on 64-bit machines?

Thanks in advance,
Luca
