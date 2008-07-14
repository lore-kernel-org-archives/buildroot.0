From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Mon, 14 Jul 2008 16:22:51 +1200
Subject: [Buildroot] alsa unknown ioctl
Message-ID: <408540dd0807132122y2c49881dy964c9caf9732622f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I am using Buildroot to build a fs for an embedded system (at91sam9263).
The kernel version is 2.6.25 with the at91 and at91-exp patches.

I am trying to get sound working on my board using the AC97 interface
on the at91sam9263 but I am having issues with alsa-lib/alsa-utils.

(using the dummy sound driver snd_dummy)
# alsamixer
ALSA sound/core/control.c:1224: unknown ioctl = 0xc2c85512

alsamixer: function snd_mixer_load failed: Inappropriate ioctl for device.


strace leads me deeper towards the problem (see bottom of message)

Does anyone know if there is some obscure buildroot config option that
could be causing this?
Any other ideas?

Thanks,
Matt

# strace alsamixer
execve("/usr/bin/alsamixer", ["alsamixer"], [/* 16 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=9391, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 9391, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/lib/libncurses.so.5", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=272828, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\4\336\0\000"...,
4096) = 4096
mmap2(NULL, 307200, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000e000
mmap2(0x4000e000, 239488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x4000e000
mmap2(0x40050000, 34204, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x3a) = 0x40050000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libasound.so.2", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/lib/libasound.so.2", O_RDONLY)   = -1 ENOENT (No such file or directory)
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\210\306\1"...,
4096) = 4096
mmap2(NULL, 741376, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40059000
mmap2(0x40059000, 690192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x40059000
mmap2(0x4010a000, 15436, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xa9) = 0x4010a000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=45939, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270\22\0"...,
4096) = 4096
mmap2(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4010e000
mmap2(0x4010e000, 42152, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x4010e000
mmap2(0x40120000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xa) = 0x40120000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9071, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0H\10\0\000"...,
4096) = 4096
mmap2(NULL, 45056, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40122000
mmap2(0x40122000, 5928, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0x40122000
mmap2(0x4012b000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x1) = 0x4012b000
mmap2(0x4012c000, 4, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4012c000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63979, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\270:\0\000"...,
4096) = 4096
mmap2(NULL, 106496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4012d000
mmap2(0x4012d000, 40224, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x4012d000
mmap2(0x4013f000, 21732, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0xa) = 0x4013f000
mmap2(0x40145000, 5788, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40145000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0`\221\0\000"...,
4096) = 4096
mmap2(NULL, 249856, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40147000
mmap2(0x40147000, 228964, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x40147000
mmap2(0x4017f000, 5012, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x38) = 0x4017f000
mmap2(0x40181000, 8212, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40181000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=45939, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=9071, ...}) = 0
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63979, ...}) = 0
close(3)                                = 0
open("/lib/librt.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=4735, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40009000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0004\5\0\000"...,
4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40184000
mmap2(0x40184000, 2300, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3,
0) = 0x40184000
mmap2(0x4018c000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x4018c000
close(3)                                = 0
munmap(0x40009000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=236079, ...}) = 0
close(3)                                = 0
munmap(0x40006000, 9391)                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21168, ...}) = 0
mprotect(0x40120000, 4096, PROT_READ)   = 0
mprotect(0x4012b000, 4096, PROT_READ)   = 0
mprotect(0x4013f000, 4096, PROT_READ)   = 0
mprotect(0x4017f000, 4096, PROT_READ)   = 0
mprotect(0x4018c000, 4096, PROT_READ)   = 0
mprotect(0x4000c000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
echo ...}) = 0
getpid()                                = 1145
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
setrlimit(RLIMIT_STACK, {rlim_cur=2040*1024, rlim_max=RLIM_INFINITY}) = 0
rt_sigaction(SIGRTMIN, {0x40136aa0, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0x401369c8, [RTMIN], 0x4000000 /* SA_??? */},
NULL, 8) = 0
rt_sigaction(SIGRT_2, {0x40135ff8, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RT_1], NULL, 8) = 0
brk(0)                                  = 0x11000
brk(0x12000)                            = 0x12000
stat("/usr/share/alsa/alsa.conf", {st_mode=S_IFREG|0644, st_size=8617, ...}) = 0
open("/usr/share/alsa/alsa.conf", O_RDONLY) = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbed76938) = -1 ENOTTY
(Inappropriate ioctl for device)
brk(0x13000)                            = 0x13000
read(3, "#\n#  ALSA library configuration "..., 4096) = 4096
brk(0x14000)                            = 0x14000
brk(0x15000)                            = 0x15000
brk(0x16000)                            = 0x16000
read(3, " refer\n\t\t\t\tname defaults.pcm.dev"..., 4096) = 4096
brk(0x17000)                            = 0x17000
brk(0x18000)                            = 0x18000
brk(0x19000)                            = 0x19000
brk(0x1a000)                            = 0x1a000
brk(0x1b000)                            = 0x1b000
read(3, "fault {\n\t\t\t at func refer\n\t\t\tname d"..., 4096) = 425
read(3, "", 4096)                       = 0
close(3)                                = 0
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=9391, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 9391, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
access("/etc/asound.conf", R_OK)        = -1 ENOENT (No such fALSA
sound/core/control.c:1224: iunknown ioctl = 0xc2c85512
le or directory)
access("~/.asoundrc", R_OK)             = -1 ENOENT (No such file or directory)
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
open("/dev/snd/controlC0", O_RDONLY)    = 3
close(3)                                = 0
open("/dev/snd/controlC0", O_RDWR)      = 3
ioctl(3, USBDEVFS_CONTROL, 0xbed76a04)  = 0
ioctl(3, UI_DEV_CREATE, 0xbed76af8)     = 0
close(3)                                = 0
stat("/usr/share/alsa/alsa.conf", {st_mode=S_IFREG|0644, st_size=8617, ...}) = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=708928, ...}) = 0
close(3)                                = 0
open("/dev/snd/controlC0", O_RDONLY)    = 3
close(3)                                = 0
open("/dev/snd/controlC0", O_RDWR)      = 3
ioctl(3, USBDEVFS_CONTROL, 0xbed769d4)  = 0
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
fcntl(3, F_SETFL, O_RDWR|O_NONBLOCK)    = 0
ioctl(3, USBDEVFS_RELEASEINTERFACE, 0xbed76a88) = 0
ioctl(3, USBDEVFS_RELEASEINTERFACE, 0xbed76a88) = 0
ioctl(3, USBDEVFS_CONNECTINFO, 0xbed76818) = 0
ioctl(3, USBDEVFS_IOCTL, 0xbed763c0)    = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\n", 1
)                       = 1
write(2, "alsamixer: function ", 20alsamixer: function )    = 20
write(2, "snd_mixer_load", 14snd_mixer_load)          = 14
write(2, " failed: ", 9 failed: )                = 9
write(2, "Inappropriate ioctl for device", 30Inappropriate ioctl for
device) = 30
write(2, "\n", 1
)                       = 1
exit(2)                                 = ?
Process 1145 detached
