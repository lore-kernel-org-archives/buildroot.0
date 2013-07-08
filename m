From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Mon, 08 Jul 2013 16:11:24 +0200
Subject: [Buildroot] Can not login when using Microblaze toolchain 14.3
Message-ID: <51DAC88C.2030404@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello community,

I'd like to use the 14.3 toolchain. When the system boots it is not 
possible to login. It behaves like in this case:

* http://old.nabble.com/Can%27t-Login-to-New-System-td21224645.html

but it seems to be a different problem.

I injected strace to the inittab
  (ttyS0::respawn:/bin/strace /sbin/getty -L ttyS0 115200 vt100)
and got this (note the SIGILL at the end):


read(0, "d", 1)                         = 1
write(1, "d", 1d)                        = 1
read(0, "e", 1)                         = 1
write(1, "e", 1e)                        = 1
read(0, "f", 1)                         = 1
write(1, "f", 1f)                        = 1
read(0, "a", 1)                         = 1
write(1, "a", 1a)                        = 1
read(0, "u", 1)                         = 1
write(1, "u", 1u)                        = 1
read(0, "l", 1)                         = 1
write(1, "l", 1l)                        = 1
read(0, "t", 1)                         = 1
write(1, "t", 1t)                        = 1
read(0, "\r", 1)                        = 1
alarm(0)                                = 0
ioctl(0, SNDCTL_TMR_START or SNDRV_TIMER_IOCTL_TREAD or TCSETS, {B115200 
opost isig icanon echo ...}) = 0
write(1, "\n", 1
)                       = 1
execve("/bin/login", ["/bin/login", "--", "default"], [/* 5 vars */]) = 0
uname({sys="Linux", node="testing", ...}) = 0
brk(0)                                  = 0x101ab000
brk(0x101abcd0)                         = 0x101abcd0
brk(0x101cccd0)                         = 0x101cccd0
brk(0x101cd000)                         = 0x101cd000
getuid32()                              = 0
getuid32()                              = 0
geteuid32()                             = 0
open("/dev/null", O_RDWR|O_LARGEFILE)   = 3
close(3)                                = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
{B115200 opost isig icanon echo ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
{B115200 opost isig icanon echo ...}) = 0
rt_sigaction(SIGALRM, {0x100097a4, [ALRM], SA_RESTART}, {SIG_DFL, [], 
0}, 8) = 0
alarm(60)                               = 0
ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, 
{B115200 opost isig icanon echo ...}) = 0
fstat64(0, {st_mode=S_IFCHR|0620, st_rdev=makedev(5, 1), ...}) = 0
readlink("/proc/self/fd/0", "/dev/console", 126) = 12
stat64("/dev/console", {st_mode=S_IFCHR|0620, st_rdev=makedev(5, 1), 
...}) = 0
ioctl(0, TCFLSH, 0)                     = 0
socketcall(0x1, 0xbfe5a9ac)             = 3
socketcall(0x3, 0xb+++ killed by SIGILL +++
execve("/sbin/getty", ["/sbin/getty", "-L", "console", "115200", 
"vt100"], [/* 5 vars */]) = 0


The problem occurs with 14.3 toolchain only. The older one works as 
expected. I use the xilinx-v14.4 kernel.

Any idea?

Thanks
Jan Viktorin
