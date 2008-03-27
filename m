From: paradoxxa <paradoxxa2001@web.de>
Date: Thu, 27 Mar 2008 04:02:39 -0700 (PDT)
Subject: [Buildroot]  NetSilicon 9360 and Xenomai/Adeos
Message-ID: <16324293.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have here a NetSilicon 9360 (ARM926EJ-Sid(wb) [41069264] revision 4
(ARMv5TEJ)) Board and a buildroot toolchain. I will porting Xenomai/Adeos to
this Board. Actual i patches the Kernel (2.6.24) with Xenaomai:

$ /usr/src/xenomai-2.4.3/scripts/prepare-kernel.sh	\ 	
		--linux=/usr/src/linux-2.6.24-gentoo/ 	\
	
--adeos=/usr/src/xenomai-2.4.3/ksrc/arch/arm/patches/adeos-ipipe-2.6.24-arm-1.9-01.patch
--arch=arm
$ cd /usr/src/linux-2.6.24-gentoo
$ build_root=/usr/src/build_root/
$ make ARCH=arm CROSS_COMPILE=arm-linux- O=$build_root ns9xxx_defconfig

Here the cross compiler from buildroot is used.
Then i started to port the I-Pipe recording to I-pipe:ArmPorting  (
http://www.xenomai.org/index.php/I-pipe:ArmPorting
http://www.xenomai.org/index.php/I-pipe:ArmPorting ). I added the variables
and functions to the following files: /arch/arm/mach-ns9xxx/time.c,
include/asm-arm/arch-ns9xx/irqs.h and /arch/arm/mach-ns9xxx/irq.c

The next step in the howto i don't understand really. I found nowhere the
pxa_timer_interrupt() function and so on. Therefore i don't know what i have
to do further.
When i try to compiling it i get this errors:

$ make ARCH=arm CROSS_COMPILE=arm-linux- O=$build_root
  CHK     include/linux/version.h
make[2]: ?include/asm-arm/mach-types.h? ist bereits aktualisiert.
  Using /usr/src/linux-2.6.24-gentoo as source for kernel
  GEN     /usr/src/build_root/Makefile
  CHK     include/linux/utsrelease.h
  CALL    /usr/src/linux-2.6.24-gentoo/scripts/checksyscalls.sh
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
  CHK     include/linux/compile.h
  CC      arch/arm/kernel/ipipe.o
/usr/src/linux-2.6.24-gentoo/arch/arm/kernel/ipipe.c: In function
'__ipipe_grab_irq':
/usr/src/linux-2.6.24-gentoo/arch/arm/kernel/ipipe.c:429: error: expected
expression before ')' token
make[2]: *** [arch/arm/kernel/ipipe.o] error 1
make[1]: *** [arch/arm/kernel] error 2
make: *** [sub-make] error 2


Do someone have an idea and could help me?
Thanks


-- 
View this message in context: http://www.nabble.com/NetSilicon-9360-and-Xenomai-Adeos-tp16324293p16324293.html
Sent from the BuildRoot mailing list archive at Nabble.com.
