From: =?UTF-8?Q?=C3=89ric_ALBER?= <eric.alber@gmail.com>
Date: Wed, 29 Feb 2012 14:34:38 +0100
Subject: [Buildroot] uClibc missing symbols (undefined reference to
	`__fini_array_end')
Message-ID: <CAGDZK6Ho6M+p4gpxHTqz8F7Jnwzo3b4KSWavh4DJ_XSb5Dp5fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using buildroot on an ARM9 (Marvel Kirkwood). I have configured
buildroot to generate gcc on the target. But if I want to use it (gcc on
the target), I get linker errors when I try to link a shared library like
libpython2.7.so
I guess I have something wrong with my uClibc or gcc setup but I can't
figure out what. I use buildroot 2012.02-rc3, uClibc 0.9.32.1, linux 3.2.6

# gcc -shared -lpython2.7 -o test.so test.o
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.a(__uClibc_main.os):
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x140): undefined reference to `__fini_array_end'
__uClibc_main.c:(.text+0x144): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x148): undefined reference to `__fini_array_start'
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.a(__uClibc_main.os):
In function `__uClibc_main':
__uClibc_main.c:(.text+0x3f8): undefined reference to
`__preinit_array_start'
__uClibc_main.c:(.text+0x3fc): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x400): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x404): undefined reference to `__init_array_end'
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
test.so: hidden symbol `__fini_array_end' isn't defined
/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status

I have built uClibc as a shared library.
I googled these errors but I didn't find any solution when similar problems
showed up. One person noticed that these symbols exist in libc.a but that
they are defined as HIDDEN

# readelf -s /usr/lib/libc.a | grep _array_
    22: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __fini_array_end
    23: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __fini_array_start
    40: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __preinit_array_start
    41: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __preinit_array_end
    42: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __init_array_start
    43: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __init_array_end

In
http://git.uclibc.org/uClibc/tree/libc/misc/internals/__uClibc_main.c#n291 I
can see that disabling __UCLIBC_CTOR_DTOR__ skips this code path, so I
tried to uncheck "General Library Settings" > "Support global constructors
and destructors" in uClibc configuration but than the compilation on the
host fails: the build process is looking for crt1.o and doesn't find it.

I tried several uClibc and gcc versions and nothing helped. Before each
try, I completely erased buildroot and unpacked it again, I only kept the
buildroot, kernel and uClibc config files. I attach these files to this mail

Did anyone on this list run into the same problems ? Any clue on the cause
or on how to fix this ?

Thanks

Eric
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/1e1b8d9f/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2012.02-rc3.config
Type: application/octet-stream
Size: 26704 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/1e1b8d9f/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-3.2.6.config
Type: application/octet-stream
Size: 60146 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/1e1b8d9f/attachment-0004.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc-0.9.32.1.config
Type: application/octet-stream
Size: 6539 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120229/1e1b8d9f/attachment-0005.obj>
