From: Pascal K <pascalkrauth@gmail.com>
Date: Thu, 18 Feb 2016 09:02:25 +0000
Subject: [Buildroot] Problem with package wvdial 1.61
Message-ID: <CADj18OU-NiTPs0gk8RuQtfuepqytuaXRz7cCWL4-QmXwVSGt5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a Ubuntu running wvdial 1.61 and a buildroot 2015-05 <201505> build
for a x86 processor, the system is build against glibc with the same
version.

On Ubuntu my modem runs fine with wvdial, with the buildroot created wvdial
it doesn't.

From the user point of view it shows problems with the configuration file,
which does indeed exist. I did also have to create a symbolic link to
/dev/modem from my original modem interface /dev/ttyACM0.
Strangely the detection of that interface does work on both systems but
when i try to run my configuration I get:

--> Initializing modem.
--> Sending: ATZ
ATZ
OK
--> Modem initialized.
--> Configuration does not specify a valid phone number.
--> Configuration does not specify a valid login name.
--> Configuration does not specify a valid password.
+++ exited with 1 +++

Configuration:

[Dialer Defaults]
Init2 = ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0
Modem Type = Analog Modem
Phone = *99***1#
ISDN = 0
Username = internet
Init1 = ATZ
Password = t-d1
Modem = /dev/modem
Baud = 460800

Strace:
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libuniconf.so.4.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libwvstreams.so.4.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libwvutils.so.4.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libwvbase.so.4.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libreadline.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libssl.so.1.0.0", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/libcrypto.so.1.0.0", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libcrypt.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/tls/i686/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
open("/usr/lib/tls/i686/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
open("/usr/lib/tls/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
open("/usr/lib/tls/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/lib/i686/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
open("/usr/lib/i686/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/lib/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/lib/libncurses.so.5", O_RDONLY|O_CLOEXEC) = 3
open("/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/etc/wvdial.conf", O_RDONLY|O_NONBLOCK|O_LARGEFILE) = 4
--> WvDial: Internet dialer version 1.61
--> Warning: section [Dialer Defaults] does not exist in wvdial.conf.
open("/var/lock/LCK..modem", O_RDWR|O_CREAT|O_EXCL|O_NONBLOCK|O_LARGEFILE,
0644) = 4
open("/dev/modem", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE) = 4
--> Initializing modem.
--> Sending: ATZ
ATZ
OK
--> Modem initialized.
--> Configuration does not specify a valid phone number.
--> Configuration does not specify a valid login name.
--> Configuration does not specify a valid password.
+++ exited with 1 +++


extended strace;

execve("/usr/bin/wvdial", ["wvdial"], [/* 17 vars */]) = 0
brk(0) = 0x9480000 <09480000>
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb76e7000
access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=22316, ...}) = 0
mmap2(NULL, 22316, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb76e1000
close(3) = 0
open("/usr/lib/libuniconf.so.4.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0
\222\1\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=379224, ...}) = 0
mmap2(NULL, 382932, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7683000
mmap2(0xb76de000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5a000) = 0xb76de000
close(3) = 0
open("/usr/lib/libwvstreams.so.4.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\361\2\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=873972, ...}) = 0
mmap2(NULL, 877684, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb75ac000
mmap2(0xb767d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd0000) = 0xb767d000
close(3) = 0
open("/usr/lib/libwvutils.so.4.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\254\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=141740, ...}) = 0
mmap2(NULL, 1199820, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0xb7487000
mmap2(0xb74a9000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x21000) = 0xb74a9000
mmap2(0xb74ab000, 1052364, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb74ab000
close(3) = 0
open("/usr/lib/libwvbase.so.4.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300.\2\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=530744, ...}) = 0
mmap2(NULL, 542316, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7402000
mmap2(0xb7480000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7e000) = 0xb7480000
mmap2(0xb7484000, 9836, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7484000
close(3) = 0
open("/usr/lib/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\177\4\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=759576, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7401000
mmap2(NULL, 788736, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7340000
mprotect(0xb73f4000, 4096, PROT_NONE) = 0
mmap2(0xb73f5000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb4000) = 0xb73f5000
mmap2(0xb73fb000, 22784, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb73fb000
close(3) = 0
open("/lib/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\20E\0\0004\0\0\0"..., 512)
= 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=300408, ...}) = 0
mmap2(NULL, 303232, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb72f5000
mmap2(0xb733e000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x48000) = 0xb733e000
close(3) = 0
open("/lib/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\37\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=85696, ...}) = 0
mmap2(NULL, 88928, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb72df000
mmap2(0xb72f4000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14000) = 0xb72f4000
close(3) = 0
open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220|\1\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1578360, ...}) = 0
mmap2(NULL, 1587740, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0xb715b000
mmap2(0xb72d9000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17e000) = 0xb72d9000
mmap2(0xb72dc000, 10780, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb72dc000
close(3) = 0
open("/usr/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\240\27\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=70024, ...}) = 0
mmap2(NULL, 72876, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7149000
mmap2(0xb715a000, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x10000) = 0xb715a000
close(3) = 0
open("/usr/lib/libreadline.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0
\317\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0555, st_size=257540, ...}) = 0
mmap2(NULL, 220624, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb7113000
mmap2(0xb7144000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x31000) = 0xb7144000
mmap2(0xb7148000, 3536, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb7148000
close(3) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb7112000
open("/usr/lib/libssl.so.1.0.0", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\240\5\1\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=414260, ...}) = 0
mmap2(NULL, 417276, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb70ac000
mmap2(0xb710c000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5f000) = 0xb710c000
close(3) = 0
open("/usr/lib/libcrypto.so.1.0.0", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\346\3\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1749408, ...}) = 0
mmap2(NULL, 1760844, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0xb6efe000
mmap2(0xb7095000, 81920, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x197000) = 0xb7095000
mmap2(0xb70a9000, 11852, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb70a9000
close(3) = 0
open("/lib/libcrypt.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\10\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=38292, ...}) = 0
mmap2(NULL, 201052, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb6ecc000
mmap2(0xb6ed5000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xb6ed5000
mmap2(0xb6ed7000, 155996, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6ed7000
close(3) = 0
open("/usr/lib/tls/i686/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
stat64("/usr/lib/tls/i686/sse2", 0xbf9e9870) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/i686/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/usr/lib/tls/i686", 0xbf9e9870) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/usr/lib/tls/sse2", 0xbf9e9870) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/tls", 0xbf9e9870) = -1 ENOENT (No such file or directory)
open("/usr/lib/i686/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
stat64("/usr/lib/i686/sse2", 0xbf9e9870) = -1 ENOENT (No such file or
directory)
open("/usr/lib/i686/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/i686", 0xbf9e9870) = -1 ENOENT (No such file or directory)
open("/usr/lib/sse2/libncurses.so.5", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/sse2", 0xbf9e9870) = -1 ENOENT (No such file or directory)
open("/usr/lib/libncurses.so.5", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\227\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=200264, ...}) = 0
mmap2(NULL, 204364, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb6e9a000
mmap2(0xb6ec9000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2e000) = 0xb6ec9000
close(3) = 0
open("/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\n\0\0004\0\0\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=13752, ...}) = 0
mmap2(NULL, 16504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0xb6e95000
mmap2(0xb6e98000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xb6e98000
close(3) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb6e94000
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb6e93000
set_thread_area({entry_number:-1, base_addr:0xb6e93940, limit:1048575,
seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1,
seg_not_present:0, useable:1}) = 0 (entry_number:6)
mprotect(0xb72d9000, 8192, PROT_READ) = 0
mprotect(0xb6e98000, 4096, PROT_READ) = 0
mprotect(0xb6ed5000, 4096, PROT_READ) = 0
mprotect(0xb733e000, 4096, PROT_READ) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0xb6e92000
mprotect(0xb73f5000, 16384, PROT_READ) = 0
mprotect(0xb770c000, 4096, PROT_READ) = 0
munmap(0xb76e1000, 22316) = 0
brk(0) = 0x9480000
brk(0x94a1000) = 0x94a1000
gettimeofday({1455214698, 925774}, NULL) = 0
dup(2) = 3
rt_sigaction(SIGTERM, {0x804d920, [TERM], SA_RESTART}, {SIG_DFL, [], 0}, 8)
= 0
rt_sigaction(SIGINT, {0x804d920, [INT], SA_RESTART}, {SIG_DFL, [], 0}, 8) =
0
rt_sigaction(SIGHUP, {0x804d920, [HUP], SA_RESTART}, {SIG_DFL, [], 0}, 8) =
0
access("/etc/wvdial.conf", F_OK) = 0
open("/etc/wvdial.conf", O_RDONLY|O_NONBLOCK|O_LARGEFILE) = 4
fcntl64(4, F_SETFD, FD_CLOEXEC) = 0
fstat64(4, {st_mode=S_IFREG|0644, st_size=194, ...}) = 0
gettimeofday({1455214698, 928505}, NULL) = 0
select(5, [4], [], [], NULL) = 1 (in [4])
gettimeofday({1455214698, 928857}, NULL) = 0
read(4, "\n[Dialer Defaults]\nInit2 = ATQ0 "..., 1024) = 194
gettimeofday({1455214698, 929812}, NULL) = 0
select(5, [4], [], [], NULL) = 1 (in [4])
gettimeofday({1455214698, 930077}, NULL) = 0
read(4, "", 1024) = 0
close(4) = 0
access("/root/.wvdialrc", F_OK) = -1 ENOENT (No such file or directory)
gettimeofday({1455214698, 931868}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "WvDial: Internet dialer version "..., 36WvDial: Internet dialer
version 1.61) = 36
write(3, "\n", 1
) = 1
gettimeofday({1455214698, 932546}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Warning: section [Dialer Default"..., 65Warning: section [Dialer
Defaults] does not exist in wvdial.conf.) = 65
write(3, "\n", 1
) = 1
open("/var/lock/LCK..modem", O_RDWR|O_CREAT|O_EXCL|O_NONBLOCK|O_LARGEFILE,
0644) = 4
fcntl64(4, F_SETFD, FD_CLOEXEC) = 0
getpid() = 1391
write(4, " 1391\n", 11) = 11
close(4) = 0
open("/dev/modem", O_RDWR|O_NOCTTY|O_NONBLOCK|O_LARGEFILE) = 4
fcntl64(4, F_SETFD, FD_CLOEXEC) = 0
ioctl(4, TCGETS, {B57600 -opost -isig -icanon -echo ...}) = 0
ioctl(4, TCGETS, {B57600 -opost -isig -icanon -echo ...}) = 0
gettimeofday({1455214698, 938541}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 0 (Timeout)
gettimeofday({1455214698, 938852}, NULL) = 0
ioctl(4, TIOCGSERIAL, 0xbf9e8938) = 0
ioctl(4, TIOCSSERIAL, 0xbf9e8974) = 0
ioctl(4, SNDCTL_TMR_START or TCSETS, {B57600 -opost -isig -icanon -echo
...}) = 0
write(4, "\r", 1) = 1
nanosleep({0, 10000000}, NULL) = 0
write(4, "\r", 1) = 1
nanosleep({0, 10000000}, NULL) = 0
write(4, "\r", 1) = 1
nanosleep({0, 10000000}, NULL) = 0
write(4, "\r", 1) = 1
nanosleep({0, 10000000}, NULL) = 0
write(4, "\r", 1) = 1
nanosleep({0, 10000000}, NULL) = 0
ioctl(4, SNDCTL_TMR_START or TCSETS, {B0 -opost -isig -icanon -echo ...}) =
0
ioctl(4, TIOCMGET, [TIOCM_RTS|TIOCM_CTS|TIOCM_DSR]) = 0
ioctl(4, SNDCTL_TMR_START or TCSETS, {B57600 -opost -isig -icanon -echo
...}) = 0
ioctl(4, TCGETS, {B57600 -opost -isig -icanon -echo ...}) = 0
nanosleep({0, 10000000}, NULL) = 0
gettimeofday({1455214699, 6276}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 1 (in [4], left {0, 0})
gettimeofday({1455214699, 6560}, NULL) = 0
read(4, "\r\r\r\r\r\r", 1024) = 6
gettimeofday({1455214699, 6832}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 0 (Timeout)
gettimeofday({1455214699, 7085}, NULL) = 0
gettimeofday({1455214699, 7215}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Initializing modem.", 19Initializing modem.) = 19
write(3, "\n", 1
) = 1
write(4, "\r\r\r\r\r", 5) = 5
gettimeofday({1455214699, 7920}, NULL) = 0
select(5, [4], [], [], {0, 100000}) = 1 (in [4], left {0, 88094})
gettimeofday({1455214699, 20105}, NULL) = 0
gettimeofday({1455214699, 20231}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 1 (in [4], left {0, 0})
gettimeofday({1455214699, 20504}, NULL) = 0
read(4, "\r\r\r\r\r", 1024) = 5
gettimeofday({1455214699, 20758}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 0 (Timeout)
gettimeofday({1455214699, 21016}, NULL) = 0
gettimeofday({1455214699, 21129}, NULL) = 0
select(5, [4], [], [], {0, 100000}) = 0 (Timeout)
gettimeofday({1455214699, 121510}, NULL) = 0
write(4, "ATZ\r", 4) = 4
gettimeofday({1455214699, 121835}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Sending: ATZ", 12Sending: ATZ) = 12
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 122324}, NULL) = 0
select(5, [4], [], [], {5, 0}) = 1 (in [4], left {4, 966753})
gettimeofday({1455214699, 155866}, NULL) = 0
time(NULL) = 1455214699
read(4, "ATZ\r", 1024) = 4
gettimeofday({1455214699, 156257}, NULL) = 0
select(5, [4], [], [], {0, 100000}) = 1 (in [4], left {0, 99992})
gettimeofday({1455214699, 156516}, NULL) = 0
read(4, "\r\nOK\r\n", 1020) = 6
gettimeofday({1455214699, 156756}, NULL) = 0
select(5, [4], [], [], {0, 100000}) = 0 (Timeout)
gettimeofday({1455214699, 257124}, NULL) = 0
gettimeofday({1455214699, 257248}, NULL) = 0
write(3, "ATZ", 3ATZ) = 3
write(3, "\n", 1
) = 1
write(3, "OK", 2OK) = 2
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 257890}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Modem initialized.", 18Modem initialized.) = 18
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 258364}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Configuration does not specify a"..., 52Configuration does not
specify a valid phone number.) = 52
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 258836}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Configuration does not specify a"..., 50Configuration does not
specify a valid login name.) = 50
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 259283}, NULL) = 0
write(3, "--> ", 4--> ) = 4
write(3, "Configuration does not specify a"..., 48Configuration does not
specify a valid password.) = 48
write(3, "\n", 1
) = 1
gettimeofday({1455214699, 259823}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 0 (Timeout)
gettimeofday({1455214699, 260061}, NULL) = 0
write(4, "\r", 1) = 1
gettimeofday({1455214699, 260328}, NULL) = 0
select(5, [], [4], [], {0, 200000}) = 1 (out [4], left {0, 199993})
gettimeofday({1455214699, 260626}, NULL) = 0
gettimeofday({1455214699, 260732}, NULL) = 0
select(5, [4], [], [], {0, 0}) = 0 (Timeout)
gettimeofday({1455214699, 260964}, NULL) = 0
ioctl(4, TIOCMGET, [TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_DSR]) = 0
ioctl(4, TIOCMGET, [TIOCM_DTR|TIOCM_RTS|TIOCM_CTS|TIOCM_DSR]) = 0
ioctl(4, TCFLSH, 0x2) = 0
ioctl(4, SNDCTL_TMR_START or TCSETS, {B57600 -opost -isig -icanon -echo
...}) = 0
ioctl(4, TCFLSH, 0x2) = 0
close(4) = 0
unlink("/var/lock/LCK..modem") = 0
close(3) = 0
exit_group(1) = ?
+++ exited with 1 +++


Any suggestions what is going wrong?

Best regards,
Pascal
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160218/eb4553ce/attachment.html>
