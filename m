From: Andreas Kuehn <kuehn@gin.de>
Date: Wed, 17 Dec 2008 17:32:18 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
	800k !?
In-Reply-To: <49426AAD.7030308@cetrtapot.si>
References: <4940C961.7080602@gin.de>
	<87ljunkojx.fsf@macbook.be.48ers.dk>	<4940EDF4.7040400@gin.de>
	<49410D22.1010206@cetrtapot.si>	<49411ED2.1060601@gin.de>
	<49426AAD.7030308@cetrtapot.si>
Message-ID: <49492992.8030707@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there...

it took a while but I did a complete rebuild of my buildroot 
environment. And for sure, I tried both versions of the uClibc. Finally 
I did an strace on dropbear and got these news:

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
   7676     0011853          72       164         1 read
   1256     0001940        1940         1           execve
   1068     0001649          14       118           write
    000     0000000           0         1           fork
    000     0000000           0        12         2 open
    000     0000000           0        13           close
    000     0000000           0         3           time
    000     0000000           0         1           alarm
    000     0000000           0         3           pipe
    000     0000000           0         4           brk
    000     0000000           0         8         2 ioctl
    000     0000000           0         2           umask
    000     0000000           0         2           getpgrp
    000     0000000           0         4           munmap
    000     0000000           0         1           stat
    000     0000000           0         7           fstat
    000     0000000           0         4           mprotect
    000     0000000           0         6           rt_sigaction
    000     0000000           0        19           mmap2
    000     0000000           0         2           stat64
    000     0000000           0         1           getuid32
------ ----------- ----------- --------- --------- ----------------
100.00     0015442                   376         5 total


To me it looks like uClibc calls are not to happy?!
To keep this posting as short as possible I added some *interesting* 
sniplets from a normal strace run. Does that give somebody a clue about 
the problem? Is that a configuration issue?

    ...

brk(0x3e000)                           = 0x3e000
getuid32()                              = 0
open("/etc/passwd", O_RDONLY)           = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbedec990) = -1 ENOTTY 
(Inappropriate ioctl for device)
read(3, "root:x:0:0:root:/root:/bin/sh\ndae"..., 4096) = 562
close(3)                                = 0
ioctl(2, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo 
...}) = 0
rt_sigaction(SIGPIPE, {0x16c9c, [PIPE], SA_RESTART|0x4000000}, {SIG_DFL, 
[], 0}, 8) = 0
pipe([3, 4])                            = 0
pipe([5, 6])                            = 0

   ... and finally

write(3, 
"W\260\23\341\246\330\v\tU\34\202\302b at JH\275CY`ywt\264\r\213D\264\331\31\267}m"..., 
4096) = 4096
read(7, 
"\3V\226\226\340\337R\261\270\214\317\253+\370,\336,\225\227K\213\177)\225J\345\322\352\322\352R\251\370"..1
read(7, 0x3d1af, 25)                    = ? ERESTARTSYSTo be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
getpgrp()                               = 826
ioctl(1, TIOCGPGRP, [826])              = 0
time(NULL)                              = 2444
write(1, "\rbigPayLoad                      "..., 80) = 80
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++





Hinko Kocevar wrote:
> Andreas Kuehn wrote:
>> First, scp (sftp) segfaults in both directions.
>>
>>  - getting a file from the host to the box ends at 880KB
>>  - putting a file from the box to the host ends at 992KB
>>
>>
>>  1. Here is the debug output of "scp user at host:gimp.ps ."
>> Right in the middle you see a "segmentation fault"
>>
> 
> I would suggest to run the segfaulting process under
> gdb(server) and backtrace when segfault occurs. You'll
> probably need to rebuild uClibc and busybox with
> debugging symbols.
> 
> ...
>> read(7, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
>> write(3, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
>> read(7, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
>> write(3, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
>> read(7, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
>> write(3, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
>> --- SIGALRM (Alarm clock) @ 0 (0) ---
>> getpgrp()                               = 884
>> ioctl(1, TIOCGPGRP, [884])              = 0
>> time(NULL)                              = 6388
>> gimp.ps                                         8%  324KB 324.0KB/s
>> 00:01    ) = 80
>> --- SIGSEGV (Segmentation fault) @ 0 (0) ---
>> +++ killed by SIGSEGV +++
>>
> 
> Segfault at 0, hmm, and in first second. Maybe time(NULL)
> is the culprit here. Another thing - can you verify that
> segfault occurs at the first second (eg. when time(NULL)
> is first called), or does it happen on random elapsed time?
> 
> IIRC, latest buildroot uses uclibc-0.9.30, do early
> versions work, try uClibc-0.9.29 perhaps?
> 
> HTH,
> Hinko
> 


-- 
  aKuehn

--------------> Never trust a computer you can't lift. -- Stan Masor
