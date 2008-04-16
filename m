From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Wed, 16 Apr 2008 08:07:49 -0700
Subject: [Buildroot] uclibc make fails building libpthread for powerpc32
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE10958329C@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE10958329C@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1095832A0@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I see the compile error below attempting to build buildroot with POSIX
pthreads selected instead of linux pthreads.  

------

  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.os
In file included from
./libpthread/linuxthreads/sysdeps/powerpc/pt-machine.h:5,
                 from
./libpthread/linuxthreads/sysdeps/powerpc/tls.h:25,
                 from ./include/bits/uClibc_errno.h:14,
                 from ./include/errno.h:62,
                 from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:21:
./libpthread/linuxthreads/sysdeps/powerpc/powerpc32/pt-machine.h:79:
warning: C99 inline functions are not supported; using GNU89
./libpthread/linuxthreads/sysdeps/powerpc/powerpc32/pt-machine.h:79:
warning: to disable this warning use -fgnu89-inline or the gnu_inline
function attribute
./libpthread/linuxthreads/sysdeps/powerpc/powerpc32/pt-machine.h:103:
warning: C99 inline functions are not supported; using GNU89
In file included from
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:22:
./libpthread/linuxthreads/internals.h:538: warning: C99 inline functions
are not supported; using GNU89
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.os]
Error 1
make[1]: Leaving directory
`/home/darcy/workspace/tsf-buildroot/buildroot/toolchain_build_powerpc/u
Clibc-0.9.29'
make: ***
[/home/darcy/workspace/tsf-buildroot/buildroot/toolchain_build_powerpc/u
Clibc-0.9.29/lib/libc.a] Error 2

----------

The patches below allowed me to compile for powerpc (PPC405EP).  You
will notice that they are hacks and likely will not work for other
architectures.  I think that the cause is missing/bad '-I' paths in the
build files for building uClibc (either the buildroot files or the
makefiles in uClibc itself).

----------

diff -pruN
uClibc-0.9.29/libpthread/linuxthreads/sysdeps/pthread/errno-loc.c
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/pthread/errno-loc.c
--- uClibc-0.9.29/libpthread/linuxthreads/sysdeps/pthread/errno-loc.c
2006-01-30 21:05:15.000000000 -0800
+++
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/pthread/errno-loc.c
2008-04-16 06:27:41.000000000 -0700
@@ -20,7 +20,7 @@

 #include <errno.h>
 #include <linuxthreads/internals.h>
-#include <sysdep-cancel.h>
+//#include <sysdep-cancel.h>

 #if ! USE___THREAD && !RTLD_PRIVATE_ERRNO
 #undef errno
diff -pruN
uClibc-0.9.29/libpthread/linuxthreads/sysdeps/pthread/herrno-loc.c
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/pthread/herrno-loc.c
--- uClibc-0.9.29/libpthread/linuxthreads/sysdeps/pthread/herrno-loc.c
2006-01-30 21:05:15.000000000 -0800
+++
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/pthread/herrno-loc.c
2008-04-16 07:01:16.000000000 -0700
@@ -19,7 +19,7 @@
 #include <netdb.h>
 #include <tls.h>
 #include <linuxthreads/internals.h>
-#include <sysdep-cancel.h>
+#include <powerpc/powerpc32/sysdep-cancel.h>

 #if ! USE___THREAD
 # undef h_errno
diff -pruN
uClibc-0.9.29/libpthread/linuxthreads/sysdeps/unix/sysv/linux/powerpc/po
werpc32/sysdep-cancel.h
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/unix/sysv/linux/powerp
c/powerpc32/sysdep-cancel.h
---
uClibc-0.9.29/libpthread/linuxthreads/sysdeps/unix/sysv/linux/powerpc/po
werpc32/sysdep-cancel.h     2006-01-30 21:05:15.000000000 -0800
+++
uClibc-0.9.29.mod/libpthread/linuxthreads/sysdeps/unix/sysv/linux/powerp
c/powerpc32/sysdep-cancel.h 2008-04-16 07:04:14.000000000 -0700
@@ -17,7 +17,7 @@
    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
    02111-1307 USA.  */

-#include <sysdep.h>
+//#include <sysdep.h>
 #include <tls.h>
 #ifndef __ASSEMBLER__
 # include <linuxthreads/internals.h>




Regards,

Darcy
