From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 22 Feb 2016 22:55:20 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
References: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
Message-ID: <56CB83C8.3090500@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier, All,

Le 22/02/2016 20:05, Olivier Schonken a ?crit :
> Hi Thomas, All
> 
> 
> arm |                     cups-2.1.2 | NOK
> | http://autobuild.buildroot.net/results/07ccca8f80c56ab0ff48bfee876885b1c8c3916e/
> arc |                     cups-2.1.2 | NOK
> | http://autobuild.buildroot.net/results/b169b939e38cb761319a92d2871f4f59ddb5c4ac/
> 
> Both error cases looks like it has to do with uclibc not behaving as expected at
> link time for the ippserver build (Both builds link statically with position
> independent execution also set).  For the arm platform it can't find the Scrt1.o
> file, and for the ARC compiler, __init_array_end is undefined.

Thanks for the investigation!

I don't think it's related to uClibc library but static build only
(BR2_STATIC_LIBS=y).

> 
> I haven't considered all the options yet, but two that come to mind are
> disabling cups support for uclibc type compilers, or else to disable the cups
> test-framework.
> 
> The missing Scrt1.o has to do with the compiler.  In the Configure step,
> autotools checks whether the compiler is capable of generating position
> independent executables.
> 
> "checking whether compiler supports -fPIE... yes"

Can you try with LSB_BUILD=y in CUPS_CONF_OPTS ?
This allow to remove -fPIE -pie from CFLAGS.

Maybe something like:

# Remove -fPIE -pie from CFLAGS
ifeq ($(BR2_STATIC_LIBS),y)
CUPS_CONF_OPTS += LSB_BUILD=y
endif

Best regards,
Romain

> 
> In the linking stage it then looks for Scrt1.o, which it can't find.  This
> breaks the build.
> 
> From http://dev.gentoo.org/~vapier/crt.txt
> crt1.o
>   Newer style of the initial runtime code.  Contains the _start symbol which
>   sets up the env with argc/argv/libc _init/libc _fini before jumping to the
>   libc main.  glibc calls this file 'start.S'.
> Scrt1.o
>   Used in place of crt1.o when generating PIEs.
> 
> Regards
> 
> Olivier Schonken
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
