From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 30 Oct 2012 11:08:50 +0100
Subject: [Buildroot] mpg123 segfaults on A8 (imx53)
Message-ID: <1A05C4080C29496381D223141719DD30@JohanW7>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi
 
On my imx53:
 
# mpg123
Segmentation fault
#
 
So i had a look at the configuration options and i think it might have something to do the the option  --with-cpu not being
correct..
 
I tried : 
 
MPG123_CPU = neon
 
But the build fails:
 
....
dct64_neon_float.S:125: Error: selected processor does not support ARM mode `vmul.f32 q7,q11,q14'
dct64_neon_float.S:127: Error: selected processor does not support ARM mode `vdup.32 q12,d31[0]'
dct64_neon_float.S:128: Error: selected processor does not support ARM mode `vmov d31,d30'
dct64_neon_float.S:130: Error: selected processor does not support ARM mode `vsw
....
 
 
So i reverted back to the default option used in the makefile and ran a stack trace ::
 

# strace mpg123
execve("/usr/bin/mpg123", ["mpg123"], [/* 18 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f3e000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=16267, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
mmap2(NULL, 16267, PROT_READ, MAP_SHARED, 3, 0) = 0xb6f3a000
close(3)                                = 0
stat("/etc/ld.so.preload", 0xbee1eb5c)  = -1 ENOENT (No such file or directory)
open("/home/buildroot12git/output/build/mpg123-1.14.4/src/libmpg123/.libs/libmpg123.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/usr/lib/libmpg123.so.0", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=163160, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0P%\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 262144, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6ef3000
mmap2(0xb6ef3000, 158520, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6ef3000
mmap2(0xb6f22000, 2164, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x27) = 0xb6f22000
mmap2(0xb6f23000, 63320, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6f23000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/home/buildroot12git/output/build/mpg123-1.14.4/src/libmpg123/.libs/libasound.so.2", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/usr/lib/libasound.so.2", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=733988, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\24\21\2\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 765952, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6e38000
mmap2(0xb6e38000, 717504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6e38000
mmap2(0xb6eef000, 15936, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xaf) = 0xb6eef000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/home/buildroot12git/output/build/mpg123-1.14.4/src/libmpg123/.libs/libm.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62248, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0<\23\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 98304, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6e20000
mmap2(0xb6e20000, 57556, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6e20000
mmap2(0xb6e36000, 4100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xe) = 0xb6e36000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/home/buildroot12git/output/build/mpg123-1.14.4/src/libmpg123/.libs/libc.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0p\277\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 434176, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6db6000
mmap2(0xb6db6000, 374948, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6db6000
mmap2(0xb6e19000, 4988, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x5b) = 0xb6e19000
mmap2(0xb6e1b000, 17872, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6e1b000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62248, ...}) = 0
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40744, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\260'\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 73728, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6da4000
mmap2(0xb6da4000, 38956, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6da4000
mmap2(0xb6db5000, 2628, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x9) = 0xb6db5000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=62248, ...}) = 0
close(3)                                = 0
open("/lib/libdl.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=9120, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0t\t\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 45056, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6d99000
mmap2(0xb6d99000, 7196, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6d99000
mmap2(0xb6da2000, 4120, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0xb6da2000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=48488, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0LB\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 106496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6d7f000
mmap2(0xb6d7f000, 42536, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6d7f000
mmap2(0xb6d91000, 6440, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xa) = 0xb6d91000
mmap2(0xb6d93000, 23048, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6d93000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/lib/librt.so.0", O_RDONLY)       = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=4756, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0xb6f39000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\320\5\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 36864, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb6d76000
mmap2(0xb6d76000, 2728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6d76000
mmap2(0xb6d7e000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0xb6d7e000
close(3)                                = 0
munmap(0xb6f39000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40744, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=21204, ...}) = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=378680, ...}) = 0
close(3)                                = 0
munmap(0xb6f3a000, 16267)               = 0
mprotect(0xb6e36000, 4096, PROT_READ)   = 0
mprotect(0xb6e19000, 4096, PROT_READ)   = 0
mprotect(0xb6da2000, 4096, PROT_READ)   = 0
mprotect(0xb6d91000, 4096, PROT_READ)   = 0
mprotect(0xb6d7e000, 4096, PROT_READ)   = 0
mprotect(0xb6f3f000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
setrlimit(RLIMIT_STACK, {rlim_cur=2044*1024, rlim_max=RLIM_INFINITY}) = 0
getpid()                                = 853
rt_sigaction(SIGRTMIN, {0xb6d854d4, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0xb6d853fc, [RTMIN], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigaction(SIGRT_2, {0xb6d8509c, [], 0x4000000 /* SA_??? */}, NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RT_1], NULL, 8) = 0
--- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0xbec1fff8} ---
+++ killed by SIGSEGV +++
Segmentation fault
# 

 

 

Johan

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121030/b5f73727/attachment-0001.html>
