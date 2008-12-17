From: Andreas Kuehn <kuehn@gin.de>
Date: Wed, 17 Dec 2008 09:26:10 +0100
Subject: [Buildroot] fopen fails due to subsequent ioctl call
Message-ID: <giad33$gp7$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good Morning!   (to whome it may concern)

Anyway, I try to integrate openocd (svn:1248) into buildroot (svn:24436) 
with uClibc-0.9.30 for an at91sam9263 box. strace outputs this and 
finally hangs:

ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbee45080) = -1 ENOTTY 
(Inappropriate ioctl for device)
brk(0xe7000)                            = 0xe7000
close(3)                                = 0
open("jtagA9263.cfg", O_RDONLY)         = 3
ioctl(3, SNDCTL_TMR_TIMEBASE or TCGETS, 0xbee45774) = -1 ENOTTY 
(Inappropriate ioctl for device)
brk(0xe8000)                            = 0xe8000
read(3, "#################################"..., 1024) = 1024
read(3, "t_delay 20\njtag_ntrst_delay 20\n\n\n"..., 1024) = 1024
read(3, "\tmww 0xFFFFFC28 0x2018BF02   # CK"..., 1024) = 1024
read(3, "size> \n##             <chip_width"..., 1024) = 251
read(3, ""..., 773)                     = 0
close(3)                                = 0
brk(0xe9000)                            = 0xe9000
brk(0xea000)                            = 0xea000
brk(0xeb000)                            = 0xeb000
brk(0xec000)                            = 0xec000
gettimeofday({369, 711757}, NULL)       = 0
gettimeofday({369, 713052}, NULL)       = 0
brk(0xed000)                            = 0xed000
gettimeofday({369, 716880}, NULL)       = 0
gettimeofday({369, 718178}, NULL)       = 0
gettimeofday({369, 720760}, NULL)       = 0
gettimeofday({369, 722058}, NULL)       = 0
brk(0xee000)                            = 0xee000
gettimeofday({369, 726532}, NULL)       = 0
gettimeofday({369, 727832}, NULL)       = 0
gettimeofday({369, 730426}, NULL)       = 0
gettimeofday({369, 731726}, NULL)       = 0
brk(0xef000)                            = 0xef000
gettimeofday({369, 735429}, NULL)       = 0
gettimeofday({369, 736726}, NULL)       = 0
brk(0xf0000)                            = 0xf0000
gettimeofday({369, 740553}, NULL)       = 0
gettimeofday({369, 741850}, NULL)       = 0
brk(0xf1000)                            = 0xf1000
brk(0xf2000)                            = 0xf2000
brk(0xf3000)                            = 0xf3000
brk(0xf4000)                            = 0xf4000
gettimeofday({369, 764755}, NULL)       = 0
brk(0xf5000)                            = 0xf5000
brk(0xf6000)                            = 0xf6000
brk(0xf7000)                            = 0xf7000
gettimeofday({369, 773820}, NULL)       = 0
gettimeofday({369, 775114}, NULL)       = 0
gettimeofday({369, 777958}, NULL)       = 0
gettimeofday({369, 779421}, NULL)       = 0
brk(0xf8000)                            = 0xf8000
brk(0xf9000)                            = 0xf9000
brk(0xfa000)                            = 0xfa000
brk(0xfb000)                            = 0xfb000
brk(0xfc000)                            = 0xfc000
gettimeofday({369, 803867}, NULL)       = 0
open("/dev/mem", O_RDWR|O_SYNC)         = 3
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 3, 0xfffff) = 0x40005000
mmap2(NULL, 1052672, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 
0) = 0x400ba000



A look through the code showed that the failing ioctl calls belong to an 
fopen call that opens and reads a given file. Why does that fail? Is 
there a known solution to the problem or is it of topic and uClibc news 
is the right place?

Regards
-- 
  aKuehn

----------------> MIPS: Meaningless Indicator of Processor Speed.
