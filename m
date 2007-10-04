From: Shuhao Chang <shuhao_chang@yahoo.com>
Date: Thu, 4 Oct 2007 11:30:18 +0800 (CST)
Subject: [Buildroot] Using pre-built BUILDROOT toolchain as external
	toolchain.
Message-ID: <409442.97539.qm@web72413.mail.tp2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

You should have arm-linux-uclibc/target_utils/ldd
Reference buildroot/toolchain/uClibc/uclibc.mk, and find BR2_CROSS_TOOLCHAIN_TARGET_UTILS
ldconfig is not installed, try modify uclibc.mk by yourself

---------
From? Leonid <Leonid@a-k-a.net>
To? Shuhao Chang <shuhao_chang@yahoo.com>
Cc? buildroot at uclibc.org
Sent? 2007/10/4 3:08:34
Subject? RE: Using pre-built BUILDROOT toolchain as external toolchain.

Thank you very much, it worked for me.

However in resulting filesystem ldconfig and ldd are not present. Do you know where they are copied from toolchain?

Also GDB I added to my filesystem is complaining for not having particular library:

dlopen failed on 'libthread_db.so.1' - File not found
GDB will not be able to debug pthreads.

GNU gdb 6.3
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "arm-linux".
(gdb)

Which is not in my toolchain. What is the easiest way to get it there?

Thanks,

Leonid.

________________________________

From: Shuhao Chang [mailto:shuhao_chang at yahoo.com] 
Sent: Wednesday, October 03, 2007 1:03 AM
To: Leonid
Subject: Re: Using pre-built BUILDROOT toolchain as external toolchain.


Hi,

My toolchain is i386-linux-uclibc. All toolchain binaries are located at usr/bin.
Reference TARGET_CROSS at package/Makefile.in
When using external toolchain, it invokes $(BR2_TOOLCHAIN_EXTERNAL_PATH)/bin/*
So I need this little trick.
You don't need it.


--------


Hi:

Thank you very much for your advice, I'll try. Could you please explain this little trick of yours? You replace bin by usr/bin (bin becomes soft link, pointing to usr/bin). However (at least in my build) usr/bin is almost empty all binaries being in bin:

[leonid at jaipur buildroot]$ ls ../../../arm-gcc-uclibc/usr/bin/
faked  fakeroot
[leonid at jaipur buildroot]$ ls ../../../arm-gcc-uclibc/bin/
arm-linux-addr2line  arm-linux-ldconfig          arm-linux-uclibc-ar         arm-linux-uclibc-ldd
arm-linux-ar         arm-linux-ldd               arm-linux-uclibc-as         arm-linux-uclibc-nm
arm-linux-as         arm-linux-nm                arm-linux-uclibc-cc         arm-linux-uclibc-objcopy
arm-linux-cc         arm-linux-objcopy           arm-linux-uclibc-c++filt    arm-linux-uclibc-objdump
arm-linux-c++filt    arm-linux-objdump           arm-linux-uclibc-cpp        arm-linux-uclibc-ranlib
arm-linux-cpp        arm-linux-ranlib            arm-linux-uclibc-gcc        arm-linux-uclibc-readelf
arm-linux-gcc        arm-linux-readelf           arm-linux-uclibc-gcc-4.1.2  arm-linux-uclibc-size
arm-linux-gcc-4.1.2  arm-linux-size              arm-linux-uclibc-gccbug     arm-linux-uclibc-strings
arm-linux-gccbug     arm-linux-strings           arm-linux-uclibc-gcov       arm-linux-uclibc-strip
arm-linux-gcov       arm-linux-strip             arm-linux-uclibc-ld         makedevs
arm-linux-ld         arm-linux-uclibc-addr2line  arm-linux-uclibc-ldconfig

How this is supposed to work?

Thanks,

Leonid.

________________________________________
From: Shuhao Chang [mailto:shuhao_chang at yahoo.com] 
Sent: Wednesday, October 03, 2007 12:31 AM
To: buildroot at uclibc.org
Cc: Leonid
Subject: Re: Using pre-built BUILDROOT toolchain as external toolchain.

The following steps works for me.

Assume your buildroot toolchain is located in /opt/toolchain

Set External Toolchain Options
BR2_TOOLCHAIN_EXTERNAL_LIB_C="libc.so.0"
BR2_TOOLCHAIN_EXTERNAL_LIBS="ld-uClibc.so.0 libcrypt.so.0 libdl.so.0 libm.so.0 libnsl.so.0 libpthread.so.0 libresolv.so.0 librt.so.0 libutil.so.0"

Set External Toolchain Path to /opt/toolchain
And do a little trick
# cd /opt/toolchain
# rm -f /opt/toolchain/bin
# ln -sf usr/bin bin


> Hi:
> 
> I want to build toolchain only once and then use it as external
> toolchain (well, last is not important, I just don't want make re-build
> all toolchain binaries again every time). I have compiled buildroot and
> have got both toolchain
and working filesystem (I'm using ext2
> filesystem, running in ramdisk).
> 
> Then I have copied created toolchain to another directory and using
> "make menuconfig" switched to external toolchain and specified the
> toolchain path/prefix and have rebuilt buildroot. It builds all right
> but resulting file system lacks certain libraries which is to be
> expected since I didn't define what libraries shall be copied from
> external toolchain. Where I can get list of libraries, buildroot
> toolchain copies? What else should be defined to make whole scheme work?
> 
> Thanks,
> 
> Leonid.








      ____________________________________________________________________________________
??????????? Yahoo!???????????
http://tw.info.yahoo.com/seal/index.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071004/d7b4aaa4/attachment-0001.htm 
