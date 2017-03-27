From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 27 Mar 2017 14:59:45 +0200
Subject: [Buildroot] Issue performing switch_root to a UBIFS partition
In-Reply-To: <efffdb66-2095-29cc-05ee-db25625c8371@mind.be>
References: <CAGm1_kuAPosDi1Wc89_oKYr3J=t5py3nFL9F4bO3dZM+N54Ncw@mail.gmail.com>
 <efffdb66-2095-29cc-05ee-db25625c8371@mind.be>
Message-ID: <CAGm1_ksp-PGMVE69feTDgSMdZDsyzMuYCPkwc75UWy-PhWasvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 27, 2017 at 2:03 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 27-03-17 10:05, Yegor Yefremov wrote:
>> I'm trying to boot from initramfs and then switch_root to UBIFS
>> partition. Both rootfs were created with the same toolchain. And when
>> I mount UBIFS from initramfs I can execute its busybox etc. So at
>> least the architecture it the same.
>>
>> I'm performing the same actions as described here [1]
>>
>> mkdir /newroot
>> mount -t ubifs ubi0:rootfs /newroot
>>
>> mount --move /sys /newroot/sys
>> mount --move /proc /newroot/proc
>> mount --move /dev /newroot/dev
>
>  Can you add some error logging here to check that the mount commands actually
> succeed?

I can at least see, that /newroot/dev has devices copied from /dev/.

>> exec switch_root /newroot /sbin/init
>
>  I've done this once with pivot_root, not switch_root. That was a bit more
> intricate. I did mount --rbind instead of mount --move, and I had to unmount
> stuff after the pivot.
>
>
>> As soon as I execute switch_root, the system complains, that it cannot
>> find /dev/ttyO0.
>
>  Have you tried the -c option of switch_root? Any idea who it is that complains?

I've also tried -c option.

>>
>> can't open /dev/ttyO0: No such file or directory
>>
>> If I omit moving /sys, /proc and /dev, the /sbin/init from initramfs
>> rootfs will be executed.
>
>  How do you know which one is executed?

This is just my suspicion. Because new root has al needed devices, but
after mount --move the old root doesn't have these devices anymore.

>> I.e. in both cases it seems like /sbin/init
>> from initramfs rootfs will be executed and switch_root produces no
>> error/warnig messages.
>
>  You can add strace to your initramfs and execute switch_root under strace -f to
> see what is happening. Well, looking at busybox source, basically it does
>
> cd /newroot
> mount --move . /
> chroot .
> exec /sbin/init
>
> so somehow it seems that the mount --move didn't do the expected thing...

I've also tried the switch_root from util-linux, but with the same result.

The strace output:

# exec strace -f switch_root /newroot /sbin/init
execve("/sbin/switch_root", ["switch_root", "/newroot", "/sbin/init"],
[/* 11 vars */]) = 0
brk(NULL)                               = 0xb9000
uname({sysname="Linux", nodename="buildroot", ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb6f77000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file
or directory)
open("/lib/tls/v7l/neon/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
stat64("/lib/tls/v7l/neon/vfp", 0xbefbf758) = -1 ENOENT (No such file
or directory)
open("/lib/tls/v7l/neon/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/lib/tls/v7l/neon", 0xbefbf758) = -1 ENOENT (No such file or directory)
open("/lib/tls/v7l/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/tls/v7l/vfp", 0xbefbf758)  = -1 ENOENT (No such file or directory)
open("/lib/tls/v7l/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/tls/v7l", 0xbefbf758)      = -1 ENOENT (No such file or directory)
open("/lib/tls/neon/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/lib/tls/neon/vfp", 0xbefbf758) = -1 ENOENT (No such file or directory)
open("/lib/tls/neon/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/tls/neon", 0xbefbf758)     = -1 ENOENT (No such file or directory)
open("/lib/tls/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/tls/vfp", 0xbefbf758)      = -1 ENOENT (No such file or directory)
open("/lib/tls/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
stat64("/lib/tls", 0xbefbf758)          = -1 ENOENT (No such file or directory)
open("/lib/v7l/neon/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/lib/v7l/neon/vfp", 0xbefbf758) = -1 ENOENT (No such file or directory)
open("/lib/v7l/neon/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/v7l/neon", 0xbefbf758)     = -1 ENOENT (No such file or directory)
open("/lib/v7l/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/v7l/vfp", 0xbefbf758)      = -1 ENOENT (No such file or directory)
open("/lib/v7l/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
stat64("/lib/v7l", 0xbefbf758)          = -1 ENOENT (No such file or directory)
open("/lib/neon/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/lib/neon/vfp", 0xbefbf758)     = -1 ENOENT (No such file or directory)
open("/lib/neon/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
stat64("/lib/neon", 0xbefbf758)         = -1 ENOENT (No such file or directory)
open("/lib/vfp/libc.so.6", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
stat64("/lib/vfp", 0xbefbf758)          = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\231i\1\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=894568, ...}) = 0
mmap2(NULL, 963912, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0xb6e65000
mprotect(0xb6f3c000, 61440, PROT_NONE)  = 0
mmap2(0xb6f4b000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd6000)       f4b000
mmap2(0xb6f4e000, 9544, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0xb6f76000
set_tls(0xb6f764c0, 0xb6f76b98, 0xb6f79050, 0xb6f764c0, 0xb6f79050) = 0
mprotect(0xb6f4b000, 8192, PROT_READ)   = 0
mprotect(0xb6f78000, 4096, PROT_READ)   = 0
getuid32()                              = 0
chdir("/newroot")                       = 0
stat64("/", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
stat64(".", {st_mode=S_IFDIR|0755, st_size=1384, ...}) = 0
getpid()                                = 915
write(2, "BusyBox v1.26.2 (2017-03-24 16:3"..., 41BusyBox v1.26.2
(2017-03-24 16:39:44 CET)) =
write(2, " multi-call binary.\n", 20 multi-call binary.
)   = 20
write(2, "\nUsage: ", 8
Usage: )                = 8
can't open /dev/ttyO0: No such file or directory
