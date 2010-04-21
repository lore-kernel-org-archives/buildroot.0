From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed, 21 Apr 2010 12:24:19 +0200
Subject: [Buildroot] ARM build fails on 64-bit host (tries linking with
	host libs?)
Message-ID: <L1828L$2474A60D4CD633DC0D6284F50931465F@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>  Luca> But my point in this ml is: why does the compilation of directfb have
>  Luca> -L/usr/lib in its commandline?
> 
> That seems wrong indeed.

I've been analyzing the log of a whole buildroot rebuild (i.e. after
a make distclean). Here are a few things I noticed.

First, the string '-L/usr/lib' appears only in directfb.
Other packages don't seem to be affected.

Second, '-L/usr/lib' is not there in the "building" phase, but appears
when "Installing to (staging directory|target)":

 $ egrep '(>>> directfb|libfusion-1)'  full-rebuild-32bit-host.log
 >>> directfb 1.4.2 Extracting
 >>> directfb 1.4.2 Patching package/directfb
 >>> directfb 1.4.2 Configuring
 >>> directfb 1.4.2 Building
 /opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -Wl,--rpath -Wl,/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/direct/.libs -lz ../direct/.libs/libdirect.so -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0 -o .libs/libfusion-1.4.so.0.2.0
 (cd .libs && rm -f libfusion-1.4.so.0 && ln -s libfusion-1.4.so.0.2.0 libfusion-1.4.so.0)
 (cd .libs && rm -f libfusion.so && ln -s libfusion-1.4.so.0.2.0 libfusion.so)
 >>> directfb 1.4.2 'Installing to staging directory'
 /opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -lz -L/home/murray/devel/keyser/package/buildroot/output/staging/usr/lib -L/usr/lib -ldirect -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0 -o .libs/libfusion-1.4.so.0.2.0
 /usr/bin/install -c .libs/libfusion-1.4.so.0.2.0T /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion-1.4.so.0.2.0
 (cd /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion-1.4.so.0 || { rm -f libfusion-1.4.so.0 && ln -s libfusion-1.4.so.0.2.0 libfusion-1.4.so.0; }; })
 (cd /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion.so || { rm -f libfusion.so && ln -s libfusion-1.4.so.0.2.0 libfusion.so; }; })
 >>> directfb 1.4.2 Installing to target
 /opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -lz -L/home/murray/devel/keyser/package/buildroot/output/target/usr/lib -L/usr/lib -ldirect -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0 -o .libs/libfusion-1.4.so.0.2.0
 /usr/bin/install -c .libs/libfusion-1.4.so.0.2.0T /home/murray/devel/keyser/package/buildroot/output/target/usr/lib/libfusion-1.4.so.0.2.0
 /opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-strip --strip-unneeded /home/murray/devel/keyser/package/buildroot/output/target/usr/lib/libfusion-1.4.so.0.2.0
 (cd /home/murray/devel/keyser/package/buildroot/output/target/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion-1.4.so.0 || { rm -f libfusion-1.4.so.0 && ln -s libfusion-1.4.so.0.2.0 libfusion-1.4.so.0; }; })
 (cd /home/murray/devel/keyser/package/buildroot/output/target/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion.so || { rm -f libfusion.so && ln -s libfusion-1.4.so.0.2.0 libfusion.so; }; })


Last, the first appearance of -L/usr/lib is preceded of a few lines by
"libtool: install: warning: relinking `libfusion.la'",
as you can see in the following excerpt.
Lines starting with '###' are my notes.

make[6]: Leaving directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion/shm'
make[5]: Leaving directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion/shm'
make[5]: Entering directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion'
make[6]: Entering directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion'
### skip...
 /usr/bin/install -c -m 644 'protocol.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/protocol.h'
 /usr/bin/install -c -m 644 'reactor.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/reactor.h'
 /usr/bin/install -c -m 644 'ref.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/ref.h'
### note the following line
libtool: install: warning: relinking `libfusion.la'
 /usr/bin/install -c -m 644 'shmalloc.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/shmalloc.h'
(cd /home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion; /bin/bash ../../libtool  --tag=CC --mode=relink /opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -O3 -ffast-math -pipe -Os -pipe -Os --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -D_GNU_SOURCE -Werror-implicit-function-declaration -version-info 2:0:2 -release 1.4 --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -lz --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -o libfusion.la -rpath /usr/lib arena.lo call.lo conf.lo fusion.lo hash.lo lock.lo object.lo property.lo reactor.lo ref.lo shmalloc.lo vector.lo shm/libfusion_shm.la ../direct/libdirect.la -ldl -lpthread -inst-prefix-dir /home/murray/devel/keyser/package/buildroot/output/staging)  
 /usr/bin/install -c -m 644 'types.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/types.h'
 /usr/bin/install -c -m 644 'vector.h' '/home/murray/devel/keyser/package/buildroot/output/staging/usr/include/directfb/fusion/vector.h'
### Here comes -L/usr/lib
/opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/murray/devel/keyser/package/buildroot/output/staging/ -shared  .libs/arena.o .libs/call.o .libs/conf.o .libs/fusion.o .libs/hash.o .libs/lock.o .libs/object.o .libs/property.o .libs/reactor.o .libs/ref.o .libs/shmalloc.o .libs/vector.o -Wl,--whole-archive shm/.libs/libfusion_shm.a -Wl,--no-whole-archive  -lz -L/home/murray/devel/keyser/package/buildroot/output/staging/usr/lib -L/usr/lib -ldirect -ldl -lpthread  -Wl,-soname -Wl,libfusion-1.4.so.0 -o .libs/libfusion-1.4.so.0.2.0
/usr/bin/install -c .libs/libfusion-1.4.so.0.2.0T /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion-1.4.so.0.2.0
(cd /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion-1.4.so.0 || { rm -f libfusion-1.4.so.0 && ln -s libfusion-1.4.so.0.2.0 libfusion-1.4.so.0; }; })
(cd /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib && { ln -s -f libfusion-1.4.so.0.2.0 libfusion.so || { rm -f libfusion.so && ln -s libfusion-1.4.so.0.2.0 libfusion.so; }; })
/usr/bin/install -c .libs/libfusion.lai /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion.la
/usr/bin/install -c .libs/libfusion.a /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion.a
chmod 644 /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion.a
/opt/xtools/arm-cortex_a8-linux-gnueabi/bin/arm-linux-ranlib /home/murray/devel/keyser/package/buildroot/output/staging/usr/lib/libfusion.a
### how about this opther line?
libtool: install: warning: remember to run `libtool --finish /usr/lib'
make[6]: Leaving directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion'
make[5]: Leaving directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion'
make[4]: Leaving directory `/home/murray/devel/keyser/package/buildroot/output/build/directfb-1.4.2/lib/fusion'


Why does libfusion.la need to be rebuilt?


Luca
