From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 29 Dec 2010 15:54:34 -0600
Subject: [Buildroot] oprofile "requires" gmp???
In-Reply-To: <878vz8jnf7.fsf@macbook.be.48ers.dk>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com><20101224090517.0c935c19@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com><4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar><9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com><4D19E079.9030704@zacarias.com.ar><9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBB45@EXV1.corp.adtran.com>
	<878vz8jnf7.fsf@macbook.be.48ers.dk>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEBBAB@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Does it break in libc/inet/netlinkaccess.h? Then it might be the same
> issue as I recently reported on the uclibc list:
> 
> http://lists.uclibc.org/pipermail/uclibc/2010-December/044558.html

I've got two issues with the build, neither appears to be the above.
One is that I'm hanging on a 'make oldconfig' on for uClibC:

Enable ... LD_PRELOAD... -- I accept the default of Y
use /etc/localtime ... -- I accept the default of Y
utmpx ... based ... -- I accept the default of N

I don't know whether this is only when selecting the option Native Posix
threads, but I believe it to be without regard of this choice.

The other almost looks like the same bfd problem as with oprofile, but
I'm not familiar with the errors I'm reading. - Time to talk to my ole
buddy Google.  Below is the a snippet of the output so that maybe you
can spot it.


In file included from libpthread/nptl/pthreadP.h:23:0,
                 from libpthread/nptl/pthread_testcancel.c:21:
./include/pthread.h:585:1: warning: no previous prototype for
'__pthread_cleanup_routine'
  CC libpthread/nptl/pthread_timedjoin.oS
In file included from libpthread/nptl/pthreadP.h:23:0,
                 from libpthread/nptl/pthread_timedjoin.c:23:
./include/pthread.h:585:1: warning: no previous prototype for
'__pthread_cleanup_routine'
libpthread/nptl/pthread_timedjoin.c: In function 'pthread_timedjoin_np':
libpthread/nptl/pthread_timedjoin.c:67:1: warning: assignment makes
pointer from integer without a cast
libpthread/nptl/pthread_timedjoin.c:67:1: warning: assignment makes
pointer from integer without a cast
libpthread/nptl/pthread_timedjoin.c:67:1: warning: assignment makes
pointer from integer without a cast
  CC libpthread/nptl/pthread_tryjoin.oS
libpthread/nptl/pthread_tryjoin.c: In function 'pthread_tryjoin_np':
libpthread/nptl/pthread_tryjoin.c:62:1: warning: assignment makes
pointer from integer without a cast
libpthread/nptl/pthread_tryjoin.c:62:1: warning: assignment makes
pointer from integer without a cast
libpthread/nptl/pthread_tryjoin.c:62:1: warning: assignment makes
pointer from integer without a cast
  CC libpthread/nptl/res.oS
  CC libpthread/nptl/sem_close.oS
  CC libpthread/nptl/sem_destroy.oS
  CC libpthread/nptl/sem_getvalue.oS
  CC libpthread/nptl/sem_init.oS
  CC libpthread/nptl/sem_open.oS
  CC libpthread/nptl/sem_unlink.oS
  CC libpthread/nptl/unwind.oS
In file included from libpthread/nptl/pthreadP.h:23:0,
                 from libpthread/nptl/unwind.c:25:
./include/pthread.h:585:1: warning: no previous prototype for
'__pthread_cleanup_routine'
libpthread/nptl/unwind.c:33:7: warning: "_STACK_GROWS_UP" is not defined
libpthread/nptl/unwind.c:120:1: warning: redeclaration of
'__pthread_unwind' with different visibility (old visibility preserved)
libpthread/nptl/pthreadP.h:244:1: note: previous declaration of
'__pthread_unwind' was here
libpthread/nptl/unwind.c: In function 'unwind_cleanup':
libpthread/nptl/unwind.c:103:1: warning: function might be possible
candidate for attribute 'noreturn'
  CC libpthread/nptl/vars.oS
  AR cr libpthread/nptl/libpthread_so.a
  STRIP -X --strip-debug -R .note -R .comment
libpthread/nptl/libpthread_so.a
  CC libpthread/nptl/pthread_atfork.oS
  AR cr lib/libpthread_nonshared.a
  STRIP -x -R .note -R .comment lib/libpthread_nonshared.a
  LD libpthread-0.9.32-rc1.so
/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3157
/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3161
libpthread/nptl/libpthread_so.a(sem_open.oS): In function `sem_open':
(.text+0x544): relocation truncated to fit: R_MIPS_CALL16 against
`__pthread_once'
/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3157
/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/host/usr/lib/gcc/mi
ps-unknown-linux-uclibc/4.5.2/../../../../mips-unknown-linux-uclibc/bin/
ld: BFD (GNU Binutils) 2.21 assertion fail elfxx-mips.c:3161
libpthread/nptl/libpthread_so.a(sem_unlink.oS): In function
`sem_unlink':
(.text+0x10): relocation truncated to fit: R_MIPS_CALL16 against
`__pthread_once'
collect2: ld returned 1 exit status
make[1]: *** [lib/libpthread.so] Error 1
make[1]: Leaving directory
`/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/toolchain/uClibc-0
.9.32-rc1'
make: ***
[/root/src/PRODUCTION/newbuildroo/buildroot-gz/output/toolchain/uClibc-0
.9.32-rc1/lib/libc.a] Error 2
