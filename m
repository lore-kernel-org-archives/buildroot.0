From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Mon, 6 Nov 2006 11:54:35 +0100
Subject: [Buildroot] echo cat, segfault with char device
In-Reply-To: <20061106095917.GB5528@synertronixx3>
References: <20061106095917.GB5528@synertronixx3>
Message-ID: <20061106105434.GB8759@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2006-11-06 10:59 +0100 schrieb Konstantin Kletschke:
> If I do "echo "12" > 12" echo from busybox works fine, but if I try to
> cat or echo something into a char device sometimes I get a segfault, and
> sometimes the whole system hangs.
> Sometimes the System hangs first time and I can C-c out, but never on
> the second time.

Now I have strace functional:

# strace echo -en "\033[J\033[HBitte warten ..." >/dev/lcd
execve("/bin/echo", ["echo", "-en", "\\033[J\\033[HBitte warten ..."], [/* 15 vars */]) = 0
old_mmap(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40005000
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=1122, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
old_mmap(NULL, 1122, PROT_READ, MAP_SHARED, 3, 0) = 0x40006000
close(3)                                = 0
open("/lib/libcrypt.so.0", O_RDONLY)    = 3
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\244\6\0\000"..., 4096) = 4096
old_mmap(NULL, 114688, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000d000
old_mmap(0x4000d000, 9904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x4000d000
old_mmap(0x40017000, 2112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x40017000
old_mmap(0x40018000, 68880, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40018000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libm.so.0", O_RDONLY)        = 3
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\244\"\0\000"..., 4096) = 4096
old_mmap(NULL, 114688, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40029000
old_mmap(0x40029000, 80428, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40029000
old_mmap(0x40044000, 3388, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x13000) = 0x40044000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\374\31\0"..., 4096) = 4096
old_mmap(NULL, 69632, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40045000
old_mmap(0x40045000, 33024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40045000
old_mmap(0x40055000, 796, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x8000) = 0x40055000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40007000
read(3, "\177ELF\1\1\1a\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0 \4\1\000"..., 4096) = 4096
old_mmap(NULL, 618496, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40056000
old_mmap(0x40056000, 586972, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40056000
old_mmap(0x400e6000, 5716, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x90000) = 0x400e6000
old_mmap(0x400e8000, 19672, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x400e8000
close(3)                                = 0
munmap(0x40007000, 4096)                = 0
munmap(0x40006000, 1122)                = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe811a34) = -1 ENOTTY (Inappropriate ioctl for device)
getuid()                                = 0
getgid()                                = 0
setgid(0)                               = 0
setuid(0)                               = 0
write(1, "\33[J\33[HBitte warten ...", 22 <unfinished ...>
+++ killed by SIGSEGV +++
# echo -en "\033[J\033[HBitte warten ..." >/dev/lcd       
Segmentation fault
$

Actually I realize the weird echo behaviour is triggered by the char
device driver behind /dev/lcd. Okay... Sorry for the inconvenience.

But is it okay that it is possible to make echo not respecting C-c
anymore?

Regards, Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
