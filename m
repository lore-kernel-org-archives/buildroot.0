From: Alex Potapenko <opotapenko@gmail.com>
Date: Mon, 7 Sep 2015 16:24:29 +0300
Subject: [Buildroot] EOVERFLOW fstat() error on cortex-A9 android when
 trying to load shared library
Message-ID: <CAF5aO=Ko183BGatMakjXot=EsnXbaodOHZPRmnMa8nqH=vZkEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I'm experiencing a very odd issue on which neither my knowledge, nor
googling don't shed any light. I am Optware-ng developer (Optware fork),
and I use toolchains built using Buildroot to cross-compile packages for
three archs. One of them, armeabi (cortex-A9), was stated to work on
AmLogic s812 android box (cortex-A9 cpu) (
https://github.com/alllexx88/Optware-ng/issues/6). However, when I tried to
reproduce a similar setup on my android phone Samsung Galaxy SII I9100
(cortex-A9 as well), I encountered the issue of all dynamically linked
programs failing:

root at GT-I9100:/opt # /opt/bin/nano
> /opt/bin/nano: can't load library 'libz.so.1'
> root at GT-I9100:/opt # /opt/bin/file
> /opt/bin/file: can't load library 'libmagic.so.1'
>

Static binaries work fine:

root at GT-I9100:/opt # /opt/bin/ipkg -h
> /opt/bin/ipkg: unrecognized option `-h'
> ipkg: ipkg must have one sub-command argument
> ipkg version 0.99.163
> usage: ipkg [options...] sub-command [arguments...]
> where sub-command is one of:
>
> ...
>

I then compiled static strace to try to debug this, and this is what I got:

root at GT-I9100:/opt # /opt/bin/strace /opt/bin/file
> execve("/opt/bin/file", ["/opt/bin/file"], [/* 18 vars */]) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x400cb000
> open("/opt/lib/libmagic.so.1", O_RDONLY) = 3
> fstat(3, 0xbe845054)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/system/lib/libmagic.so.1", O_RDONLY) = -1 ENOENT (No such file or
> directory)
> open("/opt/lib/libmagic.so.1", O_RDONLY) = 3
> fstat(3, 0xbe845054)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/opt/lib/libmagic.so.1", O_RDONLY) = 3
> fstat(3, 0xbe845044)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/opt/X11R6/lib/libmagic.so.1", O_RDONLY) = 3
> fstat(3, 0xbe845044)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
> = 0x4017a000
> write(2, "", 0)                         = 0
> write(2, "/opt/bin/file", 13/opt/bin/file)           = 13
> write(2, ": can't load library '", 22: can't load library ')  = 22
> write(2, "libmagic.so.1", 13libmagic.so.1)           = 13
> write(2, "'\n", 2'
> )                      = 2
> munmap(0x4017a000, 4096)                = 0
> exit(16)                                = ?
> root at GT-I9100:/opt # /opt/bin/strace /opt/bin/nano
> execve("/opt/bin/nano", ["/opt/bin/nano"], [/* 18 vars */]) = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x400f0000
> open("/opt/lib/libz.so.1", O_RDONLY)    = 3
> fstat(3, 0xbe8ed054)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/system/lib/libz.so.1", O_RDONLY) = -1 ENOENT (No such file or
> directory)
> open("/opt/lib/libz.so.1", O_RDONLY)    = 3
> fstat(3, 0xbe8ed054)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/opt/lib/libz.so.1", O_RDONLY)    = 3
> fstat(3, 0xbe8ed044)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> open("/opt/X11R6/lib/libz.so.1", O_RDONLY) = 3
> fstat(3, 0xbe8ed044)                    = -1 EOVERFLOW (Value too large
> for defined data type)
> close(3)                                = 0
> mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
> = 0x4014d000
> write(2, "", 0)                         = 0
> write(2, "/opt/bin/nano", 13/opt/bin/nano)           = 13
> write(2, ": can't load library '", 22: can't load library ')  = 22
> write(2, "libz.so.1", 9libz.so.1)                = 9
> write(2, "'\n", 2'
> )                      = 2
> munmap(0x4014d000, 4096)                = 0
> exit(16)                                = ?
>

Unfortunately, this is as far as I got, googling this kind of error
(EOVERFLOW) lead no nothing. I was wondering If maybe some Buildroot
(Target?) options could lead to this kind of issue? See attached two
configs: Buildroot-2015.02 (was used to build most of the feed) and
Buildroot-2015.08 (recently upgraded to).

Some system info:

root at GT-I9100:/opt # uname -a
> Linux localhost 3.0.64-CM-g987cf93 #1 SMP PREEMPT Sat Jun 20 04:51:08 CEST
> 2015 armv7l GNU/Linux
> root at GT-I9100:/opt # cat /proc/cpuinfo
> Processor       : ARMv7 Processor rev 1 (v7l)
> processor       : 0
> BogoMIPS        : 1592.52
>
> Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls
> CPU implementer : 0x41
> CPU architecture: 7
> CPU variant     : 0x2
> CPU part        : 0xc09
> CPU revision    : 1
>
> Hardware        : SMDK4210
> Revision        : 000e
> Serial          : 304d199de663701f
>
root at GT-I9100:/opt # env
> _=/system/xbin/env
> ANDROID_DATA=/data
> HOSTNAME=GT-I9100
>
> BOOTCLASSPATH=/system/framework/core.jar:/system/framework/ext.jar:/system/framework/framework.jar:/system/framework/android.policy.jar:/system/framework/services.jar
> PATH=/sbin:/system/sbin:/system/bin:/system/xbin:/opt/bin:/opt/sbin
> ANDROID_ROOT=/system
> SHELL=/system/bin/sh
> MKSH=/system/bin/sh
> USER=root
> LOGNAME=root
> ANDROID_PROPERTY_WORKSPACE=10,32768
> EXTERNAL_STORAGE=/sdcard
> ANDROID_ASSETS=/system/app
> TERM=xterm
> RANDOM=20786
> LD_LIBRARY_PATH=/system/lib
> HOME=/sdcard
> ANDROID_BOOTLOGO=1


And here's an ARM router with which everything works fine

[root at unknown root]$ uname -a
> Linux unknown 2.6.36.4brcmarm #26 SMP PREEMPT Mon Feb 9 14:40:52 CET 2015
> armv7l GNU/Linux
> [root at unknown root]$ cat /proc/cpuinfo
> Processor       : ARMv7 Processor rev 0 (v7l)
> processor       : 0
> BogoMIPS        : 1599.07
>
> processor       : 1
> BogoMIPS        : 1595.80
>
> Features        : swp half thumb fastmult edsp
> CPU implementer : 0x41
> CPU architecture: 7
> CPU variant     : 0x3
> CPU part        : 0xc09
> CPU revision    : 0
>
> Hardware        : Northstar Prototype
> Revision        : 0000
> Serial          : 0000000000000000


I'd be very thankful if someone could help me solve this mystery, since
this goes beyond my knowledge and experience.

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150907/d740960b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 55941 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150907/d740960b/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.old
Type: application/x-trash
Size: 50658 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150907/d740960b/attachment.old>
