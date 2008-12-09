From: Rowan Woodhouse <rwoodhouse@wirelessmeasurement.com>
Date: Tue, 09 Dec 2008 13:56:52 +0000
Subject: [Buildroot] OpenSSL compile problems
Message-ID: <493E7924.5020000@wirelessmeasurement.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm relatively new to Buildroot and uClibc and I'm having trouble 
building OpenSSL. I'm accepting the default build options but enabling 
large file support and adding in OpenSSL to the package build list. I'm 
building this on Ubuntu Hardy on a VMWare Fusion VM.

When I try to compile I get the following error:

/mnt/buildroot/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc 
-DMONOLITH -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB_SHARED -DZLIB 
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DTERMIO -O3 
-fomit-frame-pointer -Wall   -c -o speed.o speed.c
speed.c:147:23: sys/timeb.h: No such file or directory
speed.c: In function `Time_F':
speed.c:445: error: storage size of 'tstart' isn't known
speed.c:445: error: storage size of 'tend' isn't known
speed.c:451: warning: implicit declaration of function `ftime'
speed.c:445: warning: unused variable `tstart'
speed.c:445: warning: unused variable `tend'
make[2]: *** [speed.o] Error 1
make[2]: Leaving directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/apps'
make[1]: *** [build_apps] Error 1
make[1]: Leaving directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g'
make: *** 
[/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/.stamp_built] Error 2

I see that timeb.h is in:

./toolchain_build_i686/uClibc-0.9.30/include/sys/

but if I copy the sys directory as follows:

cp -r toolchain_build_i686/uClibc-0.9.30/include/sys 
build_i686/openssl-0.9.8g/include/

and build again I get this error:

make[3]: Entering directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/apps'
speed.o: In function `Time_F':
speed.c:(.text+0x395): undefined reference to `ftime'
speed.c:(.text+0x3e7): undefined reference to `ftime'
collect2: ld returned 1 exit status
make[3]: *** [link_app.gnu] Error 1
make[3]: Leaving directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/apps'
make[2]: *** [openssl] Error 2
make[2]: Leaving directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/apps'
make[1]: *** [build_apps] Error 1
make[1]: Leaving directory 
`/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g'
make: *** 
[/mnt/buildroot/buildroot/build_i686/openssl-0.9.8g/.stamp_built] Error 2

It looks to me like the uClibc paths are not being set up correctly. 
Could someone point me in the right direction to get this fixed? I'm 
using the latest trunk version of Buildroot.

Thanks,
Rowan
