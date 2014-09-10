From: Andreas Zeiler <zeiler@fs-net.de>
Date: Wed, 10 Sep 2014 11:22:03 +0200
Subject: [Buildroot]  Problem with building Divine; wrong Path
Message-ID: <5B70540BA10E7D49BEC1ACD5D4148853540BB0C614@FS-SBS2008.fs-net.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I merged our Buildroot 2013.02 to the version 2013.05. Everything was ok. As default config we configure with directfb which includes the divine lib. When the divine package gets build, there is a failure. Seems that the lib path for the toolchain gets set wrong. So the libtool says it cannot find the archive/directory.
When I'm building without directfb, the build process ends without any failures.
Here is a failure output: (I hope this is enough of Output)

libtool: compile:  /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I../include -D_GNU_SOURCE -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb-internal -D_REENTRANT -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -Werror-implicit-function-declaration -MT idivine.lo -MD -MP -MF .deps/idivine.Tpo -c idivine.c  -fPIC -DPIC -o .libs/idivine.o
libtool: compile:  /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I../include -D_GNU_SOURCE -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb-internal -D_REENTRANT -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -Werror-implicit-function-declaration -MT idivine.lo -MD -MP -MF .deps/idivine.Tpo -c idivine.c -o idivine.o >/dev/null 2>&1
libtool: compile:  /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/bin/arm-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I../include -D_GNU_SOURCE -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb-internal -D_REENTRANT -I/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/directfb -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -Werror-implicit-function-declaration -MT divine.lo -MD -MP -MF .deps/divine.Tpo -c divine.c -o divine.o >/dev/null 2>&1
mv -f .deps/idivine.Tpo .deps/idivine.Plo
mv -f .deps/divine.Tpo .deps/divine.Plo
/bin/sh ../libtool --tag=CC   --mode=link /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/bin/arm-linux-gcc  -Wall -O3 -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -Werror-implicit-function-declaration -version-info 0:3:0 -release 1.6  -o libdivine.la -rpath /usr/lib divine.lo idivine.lo -ldirectfb -lfusion -L/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib -ldirect -lpthread
/bin/grep: /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/lib/libstdc++.la: No such file or directory
/bin/sed: can't read /home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/lib/libstdc++.la: No such file or directory
libtool: link: `/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/lib/libstdc++.la' is not a valid libtool archive
make[3]: *** [libdivine.la] Fehler 1
make[3]: Leaving directory `/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704/lib'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory `/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory `/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704'
make: *** [/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/build/divine-83cafc257a42b9465cd9d6185bf66b8c1b7ed704/.stamp_built] Fehler 2


The thing is that the directory "/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/lib/libstdc++.la"
Cannot been found.

But the File is under ""/home/zeiler/data_zeiler/Workspace/sandbox/buildroot/buildroot-2013.05/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/ lib/libstdc++.la". So somewhere something adds the wrong path.

?  "local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/lib/gcc/arm-fs-linux-gnueabi/4.7.2/../../../../arm-fs-linux-gnueabi/"
This is the path from my toolchain on my hostpc under the directory "/usr/local/......"

This is my $PATH Variable: "/usr/lib/qt-3.3/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin/bin:/home/zeiler/bin:/usr/local/arm/fs-toolchain-4.7.2-cortexa5-neonvfpv4/bin:/opt/freescale/usr/local/gcc-4.4.4-glibc-2.11.1-multilib-1.0/arm-fsl-linux-gnueabi/bin"

Can someone help me with this?

Mit freundlichen Gr??en / With kind regards

Andreas Zeiler
(zeiler at fs-net.de<mailto:zeiler@fs-net.de>)

________________________________
armStone: Pico-ITX ARM based Single Board Computer
________________________________
F&S Elektronik Systeme GmbH, Stuttgart, Germany
Geschaeftsfuehrer: Holger Froelich, Guenther Scholz
Handelsregister Stuttgart HRB 18493, VAT DE178964418
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140910/922d4d82/attachment.html>
