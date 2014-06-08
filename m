From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 11:51:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-07
In-Reply-To: <20140608063008.43578101511@stock.ovh.net>
References: <20140608063008.43578101511@stock.ovh.net>
Message-ID: <20140608095111.GA3526@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-08 08:30 +0200, Thomas Petazzoni spake thusly:
> Detail of failures
>     x86_64 |                   libbsd-0.6.0 | NOK | http://autobuild.buildroot.net/results/b19d24dbf9d05d86d839349695da45d548705b25/

libbsd checks whether the toolchain has support for .init_array, which
it checks as thus:

    /* Look for a known libc that supports .init_array with the GNU extension
     * to pass main() arguments to the init functions. */
    #include <stdlib.h>
    #if defined __GLIBC_PREREQ
    #  if __GLIBC_PREREQ(2, 4)
    /* glibc supports GNU .init_array since 2.4. */
    #  else
    #    error glibc does not support GNU .init_array
    #  endif
    #else
    /*
     * Basic SysV ABI .init_array support, init functions do not get arguments:
     * - Bionic since its inception.
     * - uClibc since 0.9.29.
     */
    #  error unknown whether libc supports GNU .init_array
    #endif

So, it is only happy with a glibc >= 2.4. Unfortunately, uClibc only
impersonates a glibc-2.2, in include/features.h:

      395 #define __GLIBC__   2
      396 #define __GLIBC_MINOR__ 2

I suggest we just disable libbsd (and its reverse dependencies) on
uClibc. Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
