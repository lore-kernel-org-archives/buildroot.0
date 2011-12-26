From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Mon, 26 Dec 2011 16:45:08 +0100
Subject: [Buildroot] Buildroot 2011.11 on x86_64 - neither udev nor mdev
 loads needed modules at startup
In-Reply-To: <4EF879B6.8080902@gmail.com>
References: <4EF879B6.8080902@gmail.com>
Message-ID: <4EF89684.8070401@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've found yet another problem associated with udev's pci-db.
The database path is compiled as "/usr/local/wzab/asus_amd/buildroot-2011.11/output/target/usr/share/hwdata/pci.ids" (containing the whole path to the directory in which I compiled the buildroot) 
instead of only "/usr/share/hwdata/pci.ids".

However working around this problem by:
#mkdir -p /usr/local/wzab/asus_amd/buildroot-2011.11/output
#ln -s / /usr/local/wzab/asus_amd/buildroot-2011.11/output/target

improved operation of pci-db, but didn't help to automatically load modules for recognized hardware...

Additionally to analyze my problems with udev, I had to compile strace.
It didn't compile "out of the box" leading to error:

/usr/local/wzab/asus_amd/buildroot-2011.11/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -DHAVE_CONFIG_H -I. -I./linux/x86_64 -I./linux   -Wall -pipe -Os  -fPIC -DPIC -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT file.o -MD -MP -MF .deps/file.Tpo -c -o file.o file.c
file.c: In function 'printstat64':
file.c:1046:16: error: storage size of 'statbuf' isn't known

To compile it I had to comment out the line 1010 in file.c:
// #if !defined HAVE_STAT64 && defined LINUX && defined X86_64
and corresponding line 1040:
//#endif

Anyway the reason why the modules are not loaded automatically is still unclear :-(.
-- 
Regards,
Wojtek
