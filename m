From: ross beazley <rossbeazley@lycos.co.uk>
Date: Fri, 25 May 2007 08:05:14 +0000
Subject: [Buildroot] mmap segfaults and samba - take 2!  (plain text mail)
Message-ID: <104683658812099@lycos-europe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

First of all---   sorry for the total garbage i sent in my first email... this should be plain text now.... sorry!


ive recently got myhands on a hp thin client with a 32meg flash disk and transmeta crusoecpu. Ive been trying to get a uclibc system built with samba and dropbear ssh server on it so i can use it as a san style device. Samba however is causing my problems, everything builds ok but when the samba deamons are starting up they segfault.

I did a bit of a strace on the binary and it looks like the call to mmap is causing the problem.

galactica:/usr/sbin$ strace smbd
execve("/usr/sbin/smbd", ["smbd"], [/* 21 vars */]) = 0
mmap2(NULL, 20, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7ff4000
mprotect(0x80000000, 2528548, PROT_READ|PROT_WRITE|PROT_EXEC) = 0
stat("/etc/ld.so.cache", {st_mode=S_IFREG|0644, st_size=1393, ...}) = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
mmap2(NULL, 1393, PROT_READ, MAP_SHARED, 3, 0) = 0xb7ff3000
close(3)                                = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Process 14335 detached

On my local full fat debian box the value looks like 4096, which seams correct from what i have read else where, something to do with kernel page sizes? im still very new at this im afraid.

Ive tried this with the snapshot from the 24th of may, latest snapshot of uclibc and the 0.9.29 version. Im using the 2.6.20.4 kernel and I think the version of samba is 3.0.23d, anyway its the one in the package selection.

So really im seeking advice on where to go from here?? Should i be speaking to kernel people, ive had a look through most of the kernel stuff and I cant find anything obvious to configure.

any help would be gratefully recieved...

cheers

Ross

ps hope this works this time....

Lycos email has 300 Megabytes of free storage... Get it now at mail.lycos.co.uk
