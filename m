From: Bill Traynor <btraynor@gmail.com>
Date: Tue, 10 Apr 2007 15:43:32 -0400
Subject: [Buildroot] Buildroot Compile Errors for SH4
In-Reply-To: <e71f4bea0704101027j70b89bd2h7eec5cadd69cfc54@mail.gmail.com>
References: <e71f4bea0704101027j70b89bd2h7eec5cadd69cfc54@mail.gmail.com>
Message-ID: <e71f4bea0704101243o297755e0m7369500db3581e4d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 4/10/07, Bill Traynor <btraynor@gmail.com> wrote:
> Hi All,
>
> Trying to compile Buildroot for SH4 (from April 10th snapshot
> http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2)
> with the following config:
>
> 2.6.20 Kernel Headers
> uClibc - daily snapshot
> binutils 2.17.50.0.14
> GCC 4.2
>
> Received the following error:
>
> CC libc/sysdeps/linux/sh/syscall.os
> libc/sysdeps/linux/sh/syscall.c:11: error: conflicting types for 'syscall'
> ./include/unistd.h:1016: error: previous declaration of 'syscall' was here

So the offending code is:

syscall.c
long syscall(long sysnum,
                         long arg1, long arg2, long arg3,
                         long arg4, long arg5, long arg6)
{
register long __sc3 __asm__ ("r3") = sysnum;
register long __sc4 __asm__ ("r4") = (long) arg1;
register long __sc5 __asm__ ("r5") = (long) arg2;
register long __sc6 __asm__ ("r6") = (long) arg3;
register long __sc7 __asm__ ("r7") = (long) arg4;
register long __sc0 __asm__ ("r0") = (long) arg5;
register long __sc1 __asm__ ("r1") = (long) arg6;
__asm__ __volatile__ (
        "trapa %1"
        : "=z" (__sc0) \
        : "i" (__SH_SYSCALL_TRAP_BASE + 6),
          "0" (__sc0), "r" (__sc4), "r" (__sc5), "r" (__sc6), "r" (__sc7), \
          "r" (__sc3), "r" (__sc1) \
        : "memory" );
__syscall_return(long,__sc0);
}

and unistd.h:
extern long int syscall (long int __sysno, ...) __THROW;

The question now is how to fix this for SH.


>
> Thanks
> Bill
>
