From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 18 Oct 2006 22:35:12 +0200
Subject: [Buildroot] nice() seems to have stopped working?
In-Reply-To: <45366DDA.9050504@lambsys.com>
References: <45366DDA.9050504@lambsys.com>
Message-ID: <20061018203512.GE5119@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 18, 2006 at 01:09:30PM -0500, David Lambert wrote:
>Since moving to this distribution, I notice that some of my programs 
>that use nice() give errors when attempting to raise their priorities. 
>In order to try and nail this down I wrote the following trivial program:
>
>#include <stdio.h>
>#include <stdlib.h>
>#include <string.h>
>#include <unistd.h>
>
>int	main(int ac, char *av[])
>{
>  int n = atoi(av[1]);
>  printf("Trying nice(%d)\n", n);
>  if (nice(n) < 0) {		/* Attempt to change priority */
>    perror("Nice failed to change priority");
>  }
>  else {
>    printf("Success\n");
>  }
>  return 0;
>}
>
>
>Running this program as root provides the following output:
>
>/ # whoami
>root
>/ # niceTest 0
>Trying nice(0)
>Success
>/ # niceTest 1
>Trying nice(1)
>Success
>/ # niceTest -1
>Trying nice(-1)
>Nice failed to change priority: Success
>/ #
>
>Has anyone else experience this behavior?
>
>Best regards,
>
>Dave.

hm?

See man 2 nice
[snip]
NOTES
       SUSv2 and POSIX.1-2001 specify that nice() should return the  new nice
       value.  However, the Linux syscall and the nice() library function pro-
       vided in older versions of (g)libc (earlier than glibc 2.2.4) return  0
       on success.  The new nice value can be found using getpriority(2).

       Since  glibc  2.2.4,  nice()  is implemented as a library function that
       calls getpriority(2) to obtain the new nice value to be returned to the
       caller.   With  this implementation, a successful call can legitimately
       return -1.  To reliably detect an error, set  errno  to  0 before  the
       call, and check its value when nice() returns -1.


PS: See uClibc/libc/sysdeps/linux/common/nice.c for the gory details.
HTH,
