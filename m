From: Anoop Krishnan <anoop.krishnan@einfochips.com>
Date: Fri, 4 May 2007 07:31:27 +0530
Subject: [Buildroot] U-boot 1.1.4 build error
Message-ID: <001401c78df0$202a9ec0$b101660a@eInfochips>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 


I have used crosstool-0.42 to build tool chain and it builds the toolchain without any problems

and I can even compile the kernel Image with the same cross-compiler perfectly

The probelm I am facing is that when I use the same toolchain to compile U-boot 1.1.4, I get
the following error

/opt/crosstool/gcc-4.1.0-glibc-2.4/arm-926ejs-linux-gnueabi/lib/gcc/arm-926ejs-linux-gnueabi/4.1.0/libgcc.a(_dvmd_lnx.o): In function `__div0':
/home/anoop/Tool_chain/crosstool-0.42/build/arm-926ejs-linux-gnueabi/gcc-4.1.0-glibc-2.4/gcc-4.1.0/gcc/config/arm/lib1funcs.asm:1000: undefined reference to `raise'
make: *** [u-boot] Error 1

I found that raise is defined in raise.c which is under the following path
/home/anoop/Tool_chain/crosstool-0.42/build/arm-926ejs-linux-gnueabi/gcc-4.1.0-glibc-2.4/glibc-2.4/signal/raise.c
 
and its contents are as follows

#include <signal.h>
#include <errno.h>

/* Raise the signal SIG.  */
int
raise (sig)
     int sig;
{
  __set_errno (ENOSYS);
  return -1;
}
weak_alias (raise, gsignal)

stub_warning (raise)
stub_warning (gsignal)
#include <stub-tag.h>


How can I solve this issue? Is there any patch for glibc-2.4 , applying which the issue can be solved?

Thanks in advance
Anoop 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070504/95dead11/attachment.htm 
