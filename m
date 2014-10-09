From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Oct 2014 15:07:27 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
Message-ID: <20141009150727.441ae173@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 9 Oct 2014 14:58:55 +0200, Angelo Compagnucci wrote:

> > If something depends on libc.so.6, it means it was built against glibc,
> > and cannot work against uClibc. So either it's something built from
> > source, and you should rebuilt it with the uClibc toolchain. Or it's
> > something available as a pre-built binary for which you don't have the
> > source, in which case you have no other choice than using glibc.
> 
> I just rebuilt everything from scratch using the latest buildroot git
> and the problem persists.
> The package I'm using is more or less this one:
> 
> http://patchwork.ozlabs.org/patch/392957/, I've only added a small
> patch to make compile cleanly with uClibc.
> 
> diff -purN mono-native-3.8.0.orig/libgc/include/gc.h
> mono-native-3.8.0/libgc/include/gc.h
> --- mono-native-3.8.0.orig/libgc/include/gc.h 2014-10-07
> 15:00:21.259466731 +0200
> +++ mono-native-3.8.0/libgc/include/gc.h 2014-10-07 15:05:25.560975681 +0200
> @@ -500,7 +500,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_of
>  #ifdef __linux__
>  # include <features.h>
>  # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
> -     && !defined(__ia64__)
> +     && !defined(__ia64__) && !defined(__UCLIBC__)
>  #   ifndef GC_HAVE_BUILTIN_BACKTRACE
>  #     define GC_HAVE_BUILTIN_BACKTRACE
>  #   endif
> 
> This package is based on my previous work that I used regularly on
> older buildroot versions. The only thing that changed is the bump to
> mono version 3.8.0.
> 
> > I am a bit surprised that it works. It is in any case completely wrong,
> > and there is absolutely no guarantee that uClibc and glibc are ABI
> > compatible.
> 
> Based on my limited knowledge of Buildroot internals, it should work
> because the only toolchain I selected is the one built by buildroot
> with uClibc 0.9.33.x. Honestly I think that something in between mono
> cross compilation links erroneously to libc instead to uClibc so the
> error is explained.
> 
> I can disable mono when toolchain is uClibc based, but I really want
> to narrow down and resolve the problem.

Can you push a branch somewhere with all the needed patches + a minimal
Buildroot configuration that exhibits the problem as well as the
instructions to test this and reproduce the issue you're seeing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
