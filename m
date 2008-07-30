From: J. L. Sloan <jsloan@diag.com>
Date: Wed, 30 Jul 2008 14:19:57 -0600
Subject: [Buildroot] Buildroot for AT91RM9200-EK?
In-Reply-To: <00e101c8f1d2$e4df1330$ae9d3990$@com>
References: <00c101c8f1c9$ad9f5500$08ddff00$@com>
	<00e101c8f1d2$e4df1330$ae9d3990$@com>
Message-ID: <001101c8f281$a79baec0$f6d30c40$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's a thread that sound familiar - "[Patch] Elf loader crash while
zero-filling .bss', against 2.6.22.10:

 

http://linux.derkeiler.com/Mailing-Lists/Kernel/2008-02/msg05264.html

 

 

--

 <http://www.diag.com/navigation/metadata/jsloan.html> John Sloan
Consulting Technologist

 <mailto:jsloan@diag.com> jsloan at diag.com           <http://www.diag.com/>
Digital Aggregates Corporation

+1 303 489 5178 (Mobile)
<http://www.google.com/maps?f=q&hl=en&geocode=&q=Arvada+Colorado&ie=UTF8&z=1
1&iwloc=addr&om=1> Arvada Colorado 80001-0587 USA

+1 303 940 9064 (Office)  <http://www.diag.com/> www.diag.com

 

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of J. L. Sloan
Sent: Tuesday, July 29, 2008 5:29 PM
To: buildroot at uclibc.org
Subject: Re: [Buildroot] Buildroot for AT91RM9200-EK?

 

Just rebuilt everything from scratch (starting from svn co) for EABI (and
verified with readelf -h against both vmlinux and busybox for "Version4
EABI") with exactly the same result.  The kernel is build with EABI and with
OABI compat. Padzero/clear_user goes south trying to load /init.

 

(gdb) where

#0  0xc00f920c in __clear_user ()

#1  0xc00aa9ec in padzero (elf_bss=665549) at include/asm/uaccess.h:420

#2  0xc00ab8a8 in load_elf_binary (bprm=0xc1c25b00, regs=0xc1c19f00)

    at fs/binfmt_elf.c:896

#3  0xc0082700 in search_binary_handler (bprm=0xc1c25b00, regs=0xc1c19f00)

    at fs/exec.c:1235

#4  0xc00837e4 in do_execve (filename=dwarf2_read_address: Corrupted DWARF
expression.

) at fs/exec.c:1339

#5  0xc0025928 in kernel_execve (filename=0xc022fea0 "/init",
argv=0xc039a1f4,

    envp=0xc039a168) at arch/arm/kernel/sys_arm.c:288

#6  0xc0022278 in run_init_process (

    init_filename=0xa27cd <Address 0xa27cd out of bounds>) at
init/main.c:763

#7  0xc00222e4 in init_post () at init/main.c:784

#8  0xc0008900 in kernel_init (unused=<value optimized out>) at

init/main.c:856

#9  0xc0034928 in sys_waitid (which=<value optimized out>, upid=2099,

    infop=0x0, options=0, ru=0x0) at kernel/exit.c:1613 Backtrace stopped:
previous frame inner to this frame (corrupt stack?)

(gdb)

 

Again, thanks for any pointers (so to speak).

 

--

 <http://www.diag.com/navigation/metadata/jsloan.html> John Sloan
Consulting Technologist

 <mailto:jsloan@diag.com> jsloan at diag.com           <http://www.diag.com/>
Digital Aggregates Corporation

+1 303 489 5178 (Mobile)
<http://www.google.com/maps?f=q&hl=en&geocode=&q=Arvada+Colorado&ie=UTF8&z=1
1&iwloc=addr&om=1> Arvada Colorado 80001-0587 USA

+1 303 940 9064 (Office)  <http://www.diag.com/> www.diag.com

 

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of J. L. Sloan
Sent: Tuesday, July 29, 2008 4:23 PM
To: buildroot at uclibc.org
Subject: [Buildroot] Buildroot for AT91RM9200-EK?

 

Just to make sure I'm not spinning my wheels, has anyone gotten Buildroot
(22987 is what I'm using right now) working for the Atmel AT91RM9200-EK
board (Atmel AT91 ARM9)?

 

I've got the 2.6.25.10 kernel booting okay, but as soon as it goes to run
/init (really, busybox) wackiness ensues. It traps in clear_user trying to
zero out part of the loaded ELF. GDB+BDI suggests that the address passed
from padzero to clear_user is bogus, but I'm not sure I'm trusting what it's
telling me (some of the other stuff on the stack trace looks questionable).

 

readelf-h suggests AFAIK that everything is built as OABI. (I may restart
from the beginning with EABI, but I'm not sure how U-Boot on the EK was
built, and I'm not sure if that really matters. But U-Boot does "call" the
kernel to start it.)

 

Thanks for any insight.

 

--

John Sloan <http://www.diag.com/navigation/metadata/jsloan.html>
Consulting Technologist

jsloan at diag.com          Digital Aggregates Corporation
<http://www.diag.com/> 

+1 303 489 5178 (Mobile) Arvada
<http://www.google.com/maps?f=q&hl=en&geocode=&q=Arvada+Colorado&ie=UTF8&z=1
1&iwloc=addr&om=1>  Colorado 80001-0587 USA

+1 303 940 9064 (Office) www.diag.com <http://www.diag.com/> 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080730/ddc34084/attachment.htm 
