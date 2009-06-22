From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 22 Jun 2009 16:31:06 +0000 (UTC)
Subject: [Buildroot] Can't debug threaded app on ARM920 (SIG32)
Message-ID: <h1obk9$cnn$2@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to debug a threaded application using gdbserver on
an ARM920T platform (Atmel AT91RM9200 eval board), and I'm not
having much luck.  Whenver a new thread is started, I see a
SIG32:

Here's a typical session:

   GNU gdb 6.8
   [...]
   This GDB was configured as "--host=i386-pc-linux-gnu --target=arm-linux-uclibc".
   [New Thread 797]
   0x40000930 in _start ()
      from /home/grante/processors/atmel/RM9200/buildroot-2009.05/project_build_arm/uclibc/root/lib/ld-uClibc.so.0
   (gdb) break 62
   Breakpoint 1 at 0x8dc8: file hello.c, line 62.
   (gdb) c
   Continuing.
   
   Breakpoint 1, main () at hello.c:62
   62            s = pthread_create(tid+i, attrp, thread, (void*)i);  abort_if_error(s);
   (gdb) next
   
   Program received signal SIG32, Real-time event 32.
   0x400445d4 in ?? ()
   (gdb) info thread
   [New Thread 798]
   [New Thread 799]
     3 Thread 799  0x40065700 in ?? ()
     2 Thread 798  0x40043918 in ?? ()
   * 1 Thread 797  0x400445d4 in ?? ()
   warning: Couldn't restore frame in current thread, at frame 0
   0x400445d4 in ?? ()

I've tried both NPTL and Linuxthreads, both act the same.

I've verifed using strace that target gdbserver is finding
libthread_db.so and that the dev-host gdb is finding the
target-arch .so files. I've verified that the target-arch
libpthread .so files aren't stripped.

Here are config items contains the string "thread" in my
.config files (using NPTL):

   $ find . -name .config | xargs grep -i thread
   ./toolchain_build_arm/uClibc-0.9.30.1/.config:# HAS_NO_THREADS is not set
   ./toolchain_build_arm/uClibc-0.9.30.1/.config:UCLIBC_HAS_THREADS=y
   ./toolchain_build_arm/uClibc-0.9.30.1/.config:PTHREADS_DEBUG_SUPPORT=y
   ./toolchain_build_arm/uClibc-0.9.30.1/.config:LINUXTHREADS_OLD=y
   ./.config:BR2_PTHREAD_DEBUG=y
   ./.config:# BR2_PTHREADS_NONE is not set
   ./.config:# BR2_PTHREADS is not set
   ./.config:# BR2_PTHREADS_OLD is not set
   ./.config:BR2_PTHREADS_NATIVE=y

I've spent hours reading mailing-list postings and can't find
_any_ real information on how multi-threaded debugging is
supposed to work or what causes the SIG32.  All I found is
people complaining about it as early as 2002 and as recently as
a couple weeks ago.  Some of them eventually get it to work,
some don't.

So far, I haven't even been able to narrow down which gdb
(server or client) is broken.  I've posted questions to the gdb
mailing list, and haven't gotten any response there.

[I've also tried the same exercise on a PPC platform (using
LTIB/glibc instead of buildroot), and those results were even
worse: gdb seemed to be completely unaware of threads.]

Can somebody point me to _any_ hard information on how to get
thread debugging working using gdbserver?

-- 
Grant Edwards                   grante             Yow! Do you have exactly
                                  at               what I want in a plaid
                               visi.com            poindexter bar bat??
