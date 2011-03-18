From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Mar 2011 14:19:39 +0000
Subject: [Buildroot] ntpdate takes a long time
Message-ID: <AANLkTi=PdnH5wLpD+F1pmWwf0jNc_baRBGbr70RAtVXT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I was wondering if any other people have noticed ntpdate takes a long time?

My embedded board connects to the internet via ethernet through my home adsl
and can ping the internet at the same speed my linux desktop can.

Linux desktop pc running 2.6.32.26-175 (Fedora 12) :
[root at core ~]# time ntpdate ntp2c.mcc.ac.uk
18 Mar 13:56:01 ntpdate[1792]: adjust time server 130.88.200.6 offset
-0.000064 sec

real    0m0.213s
user    0m0.001s
sys     0m0.001s



Embedded OS running 2.6.38-rc5 kernel:
[root at vx-200 ~]# time ntpdate ntp.exnet.com
18 Mar 14:01:40 ntpdate[983]: adjust time server 79.135.97.79 offset
-0.001003 sec

real    0m8.227s
user    0m0.020s
sys     0m0.030s


As you can see, there is a massive difference. I used strace to try and see
what "ntpdate" is doing....this is the part that concerns me. When it starts
looping through a series of:
"ERESTART_RESTARTBLOCK (To be restarted)"
.... basically it does this for 8 seconds and then finally updates the time.
Also, my desktop pc does not go into the same loop, nor does it deal with
"ERESTART_RESTARTBLOCK "


setpriority(PRIO_PROCESS, 0, -12)       = 0
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
clock_gettime(CLOCK_REALTIME, {1300457105, 692751159}) = 0
sendto(3,
"\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
48, 0, {sa_family=AF_INET, sin_port=htons(123),
sin_addr=inet_addr("130.88.200.6")}, 16) = 48
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
clock_gettime(CLOCK_REALTIME, {1300457105, 721746679}) = 0
recvfrom(3,
"$\2\3\354\0\0\0\260\0\0\2\346\301>\26b\321-\343\340z\221\304\377\321-\345\21\261X#\324"...,
76, 0, {sa_family=AF_INET, sin_port=htons(123),
sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
restarted



The embedded board is connecting via 100Mbit ethernet and can ping the ntp
server with a reponse time of 22ms and zero packet loss.

I'm guessing this has nothing to do with "buildroot" and is a kernel/ntpdate
issue but I wanted to add these findings to the list history.


Bruce







I
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/a4b66700/attachment-0001.html>
-------------- next part --------------
[root at vx-200 ~]# strace ntpdate ntp2c.mcc.ac.uk
execve("/usr/bin/ntpdate", ["ntpdate", "ntp2c.mcc.ac.uk"], [/* 22 vars */]) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x400ba000
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=41396, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4014a000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\260'\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 73728, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40162000
mmap2(0x40162000, 39612, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x40162000
mmap2(0x40173000, 3284, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x9) = 0x40173000
close(3)                                = 0
munmap(0x4014a000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=404692, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x40086000
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\360\300\0\0004\0\0\0"..., 4096) = 4096
mmap2(NULL, 458752, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x400bb000
mmap2(0x400bb000, 399420, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x400bb000
mmap2(0x40124000, 4892, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x61) = 0x40124000
mmap2(0x40126000, 19232, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40126000
close(3)                                = 0
munmap(0x40086000, 4096)                = 0
open("/lib/libc.so.0", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=404692, ...}) = 0
close(3)                                = 0
stat("/lib/ld-uClibc.so.0", {st_mode=S_IFREG|0755, st_size=25352, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|0x4000000, -1, 0) = 0x4012b000
set_tls(0x4012b490, 0x4012bb38, 0x4001908c, 0x4012b490, 0x40018f6c) = 0
open("/dev/urandom", O_RDONLY)          = 3
read(3, "\245\324\251}", 4)             = 4
close(3)                                = 0
mprotect(0x40124000, 4096, PROT_READ)   = 0
mprotect(0x40018000, 4096, PROT_READ)   = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0
socket(PF_INET, SOCK_STREAM, IPPROTO_IP) = 3
close(3)                                = 0
socket(PF_INET6, SOCK_STREAM, IPPROTO_IP) = -1 EAFNOSUPPORT (Address family not supported by protocol)
brk(0)                                  = 0x27000
brk(0x28000)                            = 0x28000
open("/etc/services", O_RDONLY)         = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9141b4) = -1 ENOTTY (Inappropriate ioctl for device)
brk(0x29000)                            = 0x29000
read(3, "# /etc/services:\n# $Id: services"..., 4096) = 4096
close(3)                                = 0
open("/etc/hosts", O_RDONLY)            = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9140d4) = -1 ENOTTY (Inappropriate ioctl for device)
read(3, "127.0.0.1\tlocalhost\n", 4096) = 20
read(3, "", 4096)                       = 0
close(3)                                = 0
stat("/etc/resolv.conf", {st_mode=S_IFREG|0644, st_size=19, ...}) = 0
open("/etc/resolv.conf", O_RDONLY)      = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe913d64) = -1 ENOTTY (Inappropriate ioctl for device)
read(3, "nameserver 8.8.4.4\n", 4096)   = 19
read(3, "", 4096)                       = 0
close(3)                                = 0
uname({sys="Linux", node="vx-200", ...}) = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 3
connect(3, {sa_family=AF_INET, sin_port=htons(53), sin_addr=inet_addr("8.8.4.4")}, 28) = 0
send(3, "\0\2\1\0\0\1\0\0\0\0\0\0\5ntp2c\3mcc\2ac\2uk\0\0\1\0"..., 33, 0) = 33
poll([{fd=3, events=POLLIN}], 1, 5000)  = 1 ([{fd=3, revents=POLLIN}])
recv(3, "\0\2\201\200\0\1\0\2\0\0\0\0\5ntp2c\3mcc\2ac\2uk\0\0\1\0"..., 512, MSG_DONTWAIT) = 70
close(3)                                = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 3
connect(3, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, 16) = 0
close(3)                                = 0
open("/etc/services", O_RDONLY)         = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbe9141b4) = -1 ENOTTY (Inappropriate ioctl for device)
brk(0x2a000)                            = 0x2a000
read(3, "# /etc/services:\n# $Id: services"..., 4096) = 4096
close(3)                                = 0
socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP) = 3
setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
bind(3, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("0.0.0.0")}, 16) = 0
fcntl64(3, F_SETFL, O_RDONLY|O_NONBLOCK) = 0
rt_sigaction(SIGALRM, {0x9a38, [], 0x4000000 /* SA_??? */}, {SIG_DFL, [], 0}, 8) = 0
setitimer(ITIMER_REAL, {it_interval={0, 200000}, it_value={0, 100000}}, NULL) = 0
setpriority(PRIO_PROCESS, 0, -12)       = 0
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
clock_gettime(CLOCK_REALTIME, {1300457105, 692751159}) = 0
sendto(3, "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 48, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, 16) = 48
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
clock_gettime(CLOCK_REALTIME, {1300457105, 721746679}) = 0
recvfrom(3, "$\2\3\354\0\0\0\260\0\0\2\346\301>\26b\321-\343\340z\221\304\377\321-\345\21\261X#\324"..., 76, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
clock_gettime(CLOCK_REALTIME, {1300457107, 692693239}) = 0
sendto(3, "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 48, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, 16) = 48
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
clock_gettime(CLOCK_REALTIME, {1300457107, 722087799}) = 0
recvfrom(3, "$\2\3\354\0\0\0\260\0\0\2\350\301>\26b\321-\343\340z\221\304\377\321-\345\23\261TX\27"..., 76, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
clock_gettime(CLOCK_REALTIME, {1300457109, 692695479}) = 0
sendto(3, "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 48, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, 16) = 48
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
clock_gettime(CLOCK_REALTIME, {1300457109, 721065559}) = 0
recvfrom(3, "$\2\3\354\0\0\0\260\0\0\2\352\301>\26b\321-\343\340z\221\304\377\321-\345\25\261T}\254"..., 76, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
clock_gettime(CLOCK_REALTIME, {1300457111, 692697719}) = 0
sendto(3, "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 48, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, 16) = 48
poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
clock_gettime(CLOCK_REALTIME, {1300457111, 722121719}) = 0
recvfrom(3, "$\2\3\354\0\0\0\260\0\0\2\354\301>\26b\321-\343\340z\221\304\377\321-\345\27\261T\243A"..., 76, 0, {sa_family=AF_INET, sin_port=htons(123), sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
sigreturn()                             = ? (mask now [])
adjtimex({modes=ADJ_OFFSET|0x8000, offset=0, freq=0, maxerror=16000000, esterror=16000000, status=STA_UNSYNC, constant=2, precision=1, tolerance=32768000, time={1300457113, 692890}, tick=10000, ppsfreq=0, jitter=0, shift=0, stabil=0, jitcnt=0, calcnt=0, errcnt=0, stbcnt=0}) = 5 (TIME_ERROR)
gettimeofday({1300457113, 696790}, NULL) = 0
open("/etc/TZ", O_RDONLY)               = 4
read(4, "UTC\n", 68)                    = 4
close(4)                                = 0
getpid()                                = 1001
write(1, "18 Mar 14:05:13 ntpdate[1001]: a"..., 8318 Mar 14:05:13 ntpdate[1001]: adjust time server 130.88.200.6 offset 0.000583 sec
) = 83
exit_group(0)                           = ?
[root at vx-200 ~]#
