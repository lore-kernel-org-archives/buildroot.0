From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 22 Jun 2009 23:50:20 +0000 (UTC)
Subject: [Buildroot] How to get symbolic debugging to work?
Message-ID: <h1p5br$11r$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've given up temporarily on getting thread support to work in
gdbserver.  Now I'm just trying (and failing) to get basic
symbolic debugging to work.

The first problem is how to get enable debug/symbol info in the
libraries (particularly uclibc) on the development host while
still putting stripped ones on the target.  If you enable debug
symbols for uclibc, then I get .so files that are too big for
my target.  I'm working around that problem with a shell script
that strips libuClibc-*.so and libm-*.so and re-builds the
target filesystem images before copying them to the tftpserver.
It works but it's a PITA.

The second problem is that even when I point gdb to uClibc
with debug symbols, gdb acts clueless.  For example, I have a
small C program:

   #include <stdio.h>
   
   char buffer[1024];
   int main(void)
   {
     while (1)
       {
         gets(buffer);
         puts(buffer);
       }
     return 0;
   }

I can debug the program find as long as it's executing in
user-application code.  I can "next" through the code, set
breakpoints, etc.  

However, if I let it run and hit ctrl-C to stop it, it's
blocked in a read() call inside uclibc and gdb acts completely
clueless:

   GNU gdb 6.8
   [...]
   This GDB was configured as "--host=i386-pc-linux-gnu --target=arm-linux-uclibc".
   [New Thread 815]
   0x40001350 in _start () at ldso/ldso/arm/elfinterp.c:332
   332     }
   (gdb) c
   Continuing.
   ^C
   Program received signal SIGINT, Interrupt.
   0x40031914 in ?? ()
   (gdb) bt
   #0  0x40031914 in ?? ()

If I look at the smaps file for the process, it's clearly in
uclibc.so:

   40025000-4008a000 r-xp 00000000 01:00 637         /lib/libuClibc-0.9.30.1.so
   Size:                404 kB
   Rss:                  84 kB
   Pss:                  10 kB
   Shared_Clean:         84 kB
   Shared_Dirty:          0 kB
   Private_Clean:         0 kB
   Private_Dirty:         0 kB
   Referenced:           84 kB
   Swap:                  0 kB

40031914 is offset 0xc914 in /lib/libuClibc-0.9.30.1.so, and
looking at the symbols in that file shows that's in __libc_read()

   0000c5e8 T __libc_pselect
   0000c6d8 T ptrace
   0000c858 T quotactl
   0000c8e0 T __libc_read
==>  0xc914
   0000c968 T readlink
   0000c9f4 T __libc_readv
   0000ca78 T reboot

Why can't gdb figure out that the process is blocked in
__libc_read() and print a proper backtrace?


-- 
Grant Edwards                   grante             Yow! INSIDE, I have the
                                  at               same personality disorder
                               visi.com            as LUCY RICARDO!!
