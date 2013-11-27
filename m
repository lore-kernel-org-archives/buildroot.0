From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 27 Nov 2013 02:00:43 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-26
In-Reply-To: <20131127073003.45D031014F0@stock.ovh.net>
References: <20131127073003.45D031014F0@stock.ovh.net>
Message-ID: <OFA084B538.6F584679-ON86257C30.002AF8B8-86257C30.002C00AC@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

A few comments below.

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 11/27/2013 
01:30:03 AM:
 
>        arm |           host-protobuf-c-0.15 | NOK | 
http://autobuild.buildroot.net/results/506f8b778b62e1397b91592289c3dfb8195240dd/

Should go away with when autobuilder uses latest mainline since my patch 
to disable parallel build was not part of the this build.

>      avr32 |                 log4cxx-0.10.0 | NOK | 
http://autobuild.buildroot.net/results/035a00de0a56be00559767ba822a396ddc18a9fb/


From initially looking at the build-end.log it appears that that this 
library needs threads. All the output indicates that it is unable to find 
-pthread to link against.

/home/test/test/3/output/host/usr/bin/avr32-linux-g++ -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -o console 
console.o 
-L/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib 
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so 
-lrt -lm -lcrypt -ldl 
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libaprutil-1.so 
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libexpat.so 
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libiconv.so 
../../../src/main/cpp/.libs/liblog4cxx.so -Wl,--rpath 
-Wl,/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib 
-Wl,--rpath 
-Wl,/home/test/test/3/output/build/log4cxx-0.10.0/src/main/cpp/.libs 
-Wl,--rpath 
-Wl,/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib
/home/test/test/3/output/host/opt/ext-toolchain/bin/../lib/gcc/avr32-buildroot-linux-uclibc/4.2.2/../../../../avr32-buildroot-linux-uclibc/bin/ld: 
warning: libexpat.so.0, needed by 
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libaprutil-1.so, 
may conflict with libexpat.so.1
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_mutexattr_settype'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_key_create'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_attr_setstacksize'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_sigmask'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_once'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_getspecific'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_mutexattr_destroy'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_create'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_mutexattr_init'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_detach'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_setspecific'
/home/test/test/3/output/host/usr/avr32-buildroot-linux-uclibc/sysroot/usr/lib/libapr-1.so: 
undefined reference to `pthread_join'

I don't know if this is caused by '-lpthread' not being present or that 
the toolchain has accidentally marked the external chain as having thread 
support. I do not have time to investigate further so if somebody could 
fix this I would appreciate it.

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131127/8e652e4f/attachment-0001.html>
