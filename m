From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 05 Sep 2007 13:23:33 +0100
Subject: [Buildroot] [PATCH] libusb compile error
In-Reply-To: <46DDAD40.1090602@carallon.com>
References: <46DD88A5.5070708@carallon.com> <46DDAD40.1090602@carallon.com>
Message-ID: <46DE9FC5.9070305@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I continue to try to get libusb to compile. If I apply the attached 
patch then I can get it to compile if buildroot is configured without 
c++ support. However once I add c++ support it fails to compile again. 
It seems that there is an error in the link path so it finds the 
libusb.so that I have in /lib on my host machine. Below is the output 
from the link, it seems like it is failing to setup the library search 
paths correctly.

/home/willw/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-g++
-Os -pipe -I/home/willw/buildroot/build_i386/staging_dir/usr/include
-I/home/willw/buildroot/build_i386/staging_dir/include
--sysroot=/home/willw/buildroot/build_i386/staging_dir/ -isysroot
/home/willw/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -g
-O2 -o .libs/descriptor_test descriptor_test.o  ../.libs/libusbpp.so
-L/home/willw/buildroot/toolchain_build_i386/gcc-4.2.1-final/i386-linux-uclibc/libstdc++-v3/src 

-L/home/willw/buildroot/toolchain_build_i386/gcc-4.2.1-final/i386-linux-uclibc/libstdc++-v3/src/.libs 

-L/home/willw/buildroot/toolchain_build_i386/gcc-4.2.1-final/./gcc
-L/home/willw/buildroot/build_i386/staging_dir/lib
-L/home/willw/buildroot/build_i386/staging_dir/usr/lib -Wl,--rpath
-Wl,//lib -Wl,--rpath
-Wl,/home/willw/buildroot/build_i386/staging_dir/usr/bin/../lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/lib
/home/willw/buildroot/build_i386/staging_dir/usr/bin/../lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld: 

warning: libusb-0.1.so.4, needed by ../.libs/libusbpp.so, not found (try
using -rpath or -rpath-link)
../.libs/libusbpp.so: undefined reference to `usb_find_busses'
../.libs/libusbpp.so: undefined reference to `usb_init'
../.libs/libusbpp.so: undefined reference to `usb_find_devices'
../.libs/libusbpp.so: undefined reference to `usb_open'
../.libs/libusbpp.so: undefined reference to `usb_get_busses'
../.libs/libusbpp.so: undefined reference to `usb_control_msg'
../.libs/libusbpp.so: undefined reference to `usb_get_driver_np'
../.libs/libusbpp.so: undefined reference to `usb_get_string'
../.libs/libusbpp.so: undefined reference to `usb_close'
collect2: ld returned 1 exit status

Anyone an expert on libtool and tell me where the linker options get 
passed in from, just can't understand from the makefile where they are 
coming from.

Can anyone else get libusb to compile? What do I need to do to get this 
patch included into buildroot by default?

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libusb_patch
Url: http://busybox.net/lists/buildroot/attachments/20070905/baa45d9e/attachment-0001.diff 
