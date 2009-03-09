From: Michael Unterkalmsteiner <miciu@gmx.de>
Date: Mon, 9 Mar 2009 20:09:25 +0100
Subject: [Buildroot] uClibc compilation problem
Message-ID: <200903092009.25554.miciu@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
I'd like to build a toolchain for mips with nommu (using buildroot-2009.02). I 
get the following error: 

[...]  
  CC libc/stdio/tmpnam.o
  CC libc/stdio/tmpnam_r.o
  CC libc/stdio/popen.o
libc/stdio/popen.c:45: error: 'fork' undeclared here (not in a function)
libc/stdio/popen.c:45: warning: type defaults to 'int' in declaration of 
'fork'
libc/stdio/popen.c: In function 'popen':
libc/stdio/popen.c:100: error: called object 'fork' is not a function
[...]

The problematic part in popen.c is:

[...]
/* uClinux-2.0 has vfork, but Linux 2.0 doesn't */
#include <sys/syscall.h>
#if ! defined __NR_vfork
# define vfork fork
# define VFORK_LOCK             ((void) 0)
# define VFORK_UNLOCK           ((void) 0)
libc_hidden_proto(fork)
#endif
[...]

I'm wondering why __NR_vfork is not defined...
Can someone give me a punch into the right direction?

Thanks,
Michael
