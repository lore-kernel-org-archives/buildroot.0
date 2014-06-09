From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Mon, 9 Jun 2014 16:43:26 +0100 (BST)
Subject: [Buildroot] ICU 51.2 bus error
Message-ID: <1402328606.59886.YahooMailNeo@web172305.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot guys,
I'm having a serious issue with ICU 51.2 on a MIPS platform.
Everything builds fine but anyone using ICU at runtime gets a misterious "bus error" fault.
At first I thought it was my Qt 5.3.0 build, but then I realized even the simple "icuinfo" tool fails with the same error.
The root filesystem is mounted on NFS but I hope that's not the cause.


I enclose a strace run of the icuinfo command at the end of this email.
From the trace it seems the lookup of file "/usr/lib/icu/icuplugins51.txt" is the cause of all the evil, but I tried to manually create it and nothing changes.
I double checked on my PC and it doesn't even exist, even though the icuinfo command works properly.

I'm afraid this is a cross-compilation thing, but I can't figure out myself what it might be.
Does anyone have any idea or is able to find the issue from the trace below ?

Thanks in advance !
Massimo


# /mnt/nfs/strace ./icuinfo?
execve("./icuinfo", ["./icuinfo"], [/* 17 vars */]) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d4000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=64, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY|0x80000) = 3
old_mmap(NULL, 64, PROT_READ, MAP_SHARED, 3, 0) = 0x770d0000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicutu.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libicutu.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libicutu.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=170948, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770cf000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0pp\0\000"..., 4096) = 4096
old_mmap(NULL, 430080, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x77053000
old_mmap(0x77053000, 150272, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x77053000
old_mmap(0x77087000, 12552, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x24000) = 0x77087000
old_mmap(0x7708b000, 200384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7708b000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770cf000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libicui18n.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicui18n.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicui18n.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=2214936, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0`k\10\000"..., 4096) = 4096
old_mmap(NULL, 2105344, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x76e51000
old_mmap(0x76e51000, 1833948, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x76e51000
old_mmap(0x77020000, 204668, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1bf000) = 0x77020000
old_mmap(0x77052000, 3776, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x77052000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libicuuc.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=1531336, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\20\f\4"..., 4096) = 4096
old_mmap(NULL, 1495040, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x76ce4000
old_mmap(0x76ce4000, 1293152, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x76ce4000
old_mmap(0x76e30000, 121228, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x76e30000
old_mmap(0x76e4e000, 10576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x76e4e000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicudata.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=22323120, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\340\2"..., 4096) = 4096
old_mmap(NULL, 22388736, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7578a000
old_mmap(0x7578a000, 22322688, PROT_READ, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x7578a000
old_mmap(0x76ce3000, 3592, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1549000) = 0x76ce3000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libpthread.so.0", O_RDONLY) ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=101968, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\20?\0"..., 4096) = 4096
old_mmap(NULL, 151552, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75765000
old_mmap(0x75765000, 71740, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75765000
old_mmap(0x75786000, 4916, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x11000) = 0x75786000
old_mmap(0x75788000, 5184, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x75788000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libdl.so.0", O_RDONLY) ? ? ? = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13800, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0P\n\0\000"..., 4096) = 4096
old_mmap(NULL, 81920, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75751000
old_mmap(0x75751000, 8592, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75751000
old_mmap(0x75763000, 4304, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x75763000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=809488, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\2007\4"..., 4096) = 4096
old_mmap(NULL, 835584, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75685000
old_mmap(0x75685000, 720752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75685000
old_mmap(0x75735000, 87148, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xb0000) = 0x75735000
old_mmap(0x7574b000, 22660, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7574b000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libm.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=50360, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0@\22\0"..., 4096) = 4096
old_mmap(NULL, 114688, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75669000
old_mmap(0x75669000, 44728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75669000
old_mmap(0x75684000, 344, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xb000) = 0x75684000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libgcc_s.so.1", O_RDONLY) ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=201840, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\200\306"..., 4096) = 4096
old_mmap(NULL, 225280, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75632000
old_mmap(0x75632000, 155748, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75632000
old_mmap(0x75668000, 2404, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x26000) = 0x75668000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\220\260"..., 4096) = 4096
old_mmap(NULL, 761856, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x75578000
old_mmap(0x75578000, 665468, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x75578000
old_mmap(0x7562a000, 7944, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xa2000) = 0x7562a000
old_mmap(0x7562c000, 23100, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7562c000
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d1000, 4096) ? ? ? ? ? ? ? ?= 0
open("/lib/libicui18n.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicui18n.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicui18n.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=2214936, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libicuuc.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=1531336, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicudata.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=22323120, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libpthread.so.0", O_RDONLY) ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=101968, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libdl.so.0", O_RDONLY) ? ? ? = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13800, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=809488, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libm.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=50360, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libgcc_s.so.1", O_RDONLY) ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=201840, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libicuuc.so.51", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libicuuc.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=1531336, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicudata.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=22323120, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libpthread.so.0", O_RDONLY) ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=101968, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libdl.so.0", O_RDONLY) ? ? ? = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13800, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=809488, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libm.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=50360, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libgcc_s.so.1", O_RDONLY) ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=201840, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libicudata.so.51", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/lib/libicudata.so.51", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=22323120, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libpthread.so.0", O_RDONLY) ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=101968, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libdl.so.0", O_RDONLY) ? ? ? = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13800, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/lib/libstdc++.so.6", O_RDONLY) ? = -1 ENOENT (No such file or directory)
open("/usr/lib/libstdc++.so.6", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=809488, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libm.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=50360, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libgcc_s.so.1", O_RDONLY) ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=201840, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libdl.so.0", O_RDONLY) ? ? ? = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=13800, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libm.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=50360, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libgcc_s.so.1", O_RDONLY) ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=201840, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
open("/lib/libc.so.0", O_RDONLY) ? ? ? ?= 3
fstat(3, {st_mode=S_IFREG|0755, st_size=721052, ...}) = 0
close(3) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
munmap(0x770d0000, 64) ? ? ? ? ? ? ? ? ?= 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=31672, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x770d1000
SYS_4283() ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
mprotect(0x75786000, 4096, PROT_READ) ? = 0
mprotect(0x75763000, 4096, PROT_READ) ? = 0
mprotect(0x75735000, 77824, PROT_READ) ?= 0
mprotect(0x7562a000, 4096, PROT_READ) ? = 0
mprotect(0x770d2000, 4096, PROT_READ) ? = 0
SYS_4252() ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 569
SYS_4309() ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0
rt_sigaction(SIGRT_0, {0x8, [], SA_RESTART|SA_INTERRUPT|SA_NOMASK|0x576de94}, NULL, 16) = 0
rt_sigaction(SIGRT_1, {0x10000008, [], SA_RESTART|SA_INTERRUPT|SA_NOMASK|0x576dd70}, NULL, 16) = 0
rt_sigprocmask(SIG_UNBLOCK, [RT_0 RT_1], NULL, 16) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0
ioctl(0, TIOCNXCL, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, TIOCNXCL, {B115200 opost isig icanon echo ...}) = 0
brk(0) ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?= 0x412000
brk(0x413000) ? ? ? ? ? ? ? ? ? ? ? ? ? = 0x413000
open("/usr/lib/icu/icuplugins51.txt", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
--- SIGBUS (Bus error) @ 0 (0) ---
+++ killed by SIGBUS +++
#
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140609/20e382e0/attachment-0001.html>
