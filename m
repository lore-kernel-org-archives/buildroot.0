From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Feb 2017 21:34:14 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <6vehndx4lc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Tue, 14 Feb 2017 14:27:25 +0100 schrieb Thomas Petazzoni:

>>         i586 |                   libcec-4.0.2 | NOK | http://
autobuild.buildroot.net/results/95bbcebc8768d1be026a83d9437a9b206b94df20
> 
> /usr/lib32/libstdc++.so.6: undefined reference to 
`__towlower_l at GLIBC_2.1'
> /usr/lib32/libstdc++.so.6: undefined reference to `wmemchr at GLIBC_2.0'
> /usr/lib32/libstdc++.so.6: undefined reference to `fputs at GLIBC_2.0'
> 
> It's incorrectly picking some host libraries, which is wrong. Bernd,
> you did the bump of libcec, could you fix this?

I think I found the reason but I have no idea to fix it, sorry.

libcec-4.0.2/CMakeCache.txt contains these lines:

p8-platform_DIR:PATH=/home/bernd/buildroot/buildroot/output/host/usr/i586-
buildroot-linux-musl/sysroot/usr/lib32/p8-platform

This CMake build step

[ 97%] Linking C executable cecc-client

is done by using these commands:

/home/buildroot/buildroot/output/host/usr/bin/i586-linux-gcc  --sysroot=/
home/buildroot/buildroot/output/host/usr/i586-buildroot-linux-musl/
sysroot -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -
Os  -DNDEBUG   CMakeFiles/cecc-client.dir/cecc-client.c.o  -o cecc-
client-4.0.2 -Wl,-rpath,/usr/lib32: -rdynamic /home/bernd/buildroot/
buildroot/output/host/usr/i586-buildroot-linux-musl/sysroot/usr/lib32/
libp8-platform.so -ldl 

"-Wl,-rpath,/usr/lib32" is the reason for the linking error, imho.

Now the interesting solution:

$ cd /home/buildroot/buildroot/output/host/usr/i586-buildroot-linux-musl/
sysroot/usr/

$ LC_ALL=C ls -la
total 24
drwxr-xr-x  6 buildroot buildroot 4096 Feb 16 21:27 .
drwxr-xr-x  6 buildroot buildroot 4096 Feb 16 21:24 ..
drwxr-xr-x  2 buildroot buildroot 4096 Dec  3 16:55 bin
drwxr-xr-x 20 buildroot buildroot 4096 Feb 16 21:24 include
drwxr-xr-x  4 buildroot buildroot 4096 Feb 16 21:24 lib
lrwxrwxrwx  1 buildroot buildroot    3 Dec  3 16:55 lib32 -> lib
drwxr-xr-x  2 buildroot buildroot 4096 Dec  3 16:55 sbin

$ rm lib32

Now building libcec will work, most likely because the value of p8-
platform_DIR changed:

p8-platform_DIR:PATH=/home/bernd/buildroot/buildroot/output/host/usr/i586-
buildroot-linux-musl/sysroot/usr/lib/p8-platform

Regards, Bernd
