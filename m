From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 21 Nov 2016 11:44:23 +0000
Subject: [Buildroot] [arc-buildroot] Analysis of autobuild failures
	18-19/11
In-Reply-To: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
References: <40bbe29b-2601-f710-970c-065f0b2c639f@mind.be>
Message-ID: <1479728662.5879.6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2016-11-19 at 20:23 +0100, Arnout Vandecappelle wrote:
> 
> http://autobuild.buildroot.net/results/1a506eee41dd9e3a14244f4add90d89d7b818352
> arc / arc700????mpfr-3.1.5??????uclibc??
> 
> 
> > /bin/bash ../libtool? --tag=CC?? --mode=compile /accts/mlweber1/rc-buildroot-test/scripts/instance-
> 1/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc -DTIME_WITH_SYS_TIME=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1
> -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1 -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_STRUCT_LCONV_DECIMAL_POINT=1
> -DHAVE_STRUCT_LCONV_THOUSANDS_SEP=1 -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1
> -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1 -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1
> -DHAVE_FLOOR=1 -DHAVE_CEIL=1 -DHAVE_NEARBYINT=1 -DHAVE_CLOCK_GETTIME=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1
> -DHAVE___GMPN_ROOTREM=1 -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I.?? -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64? -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os? -ffloat-store
> -c -o mul.lo mul.c
> > libtool: compile:? /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/usr/bin/arc-buildroot-linux-
> uclibc-gcc -DTIME_WITH_SYS_TIME=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1
> -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_STRUCT_LCONV_DECIMAL_POINT=1 -DHAVE_STRUCT_LCONV_THOUSANDS_SEP=1
> -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1
> -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1 -DHAVE_FLOOR=1 -DHAVE_CEIL=1
> -DHAVE_NEARBYINT=1 -DHAVE_CLOCK_GETTIME=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1 -DHAVE___GMPN_ROOTREM=1
> -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os -ffloat-store -c mul.c? -fPIC -DPIC -o
> .libs/mul.o
> > In file included from mpfr-impl.h:98:0,
> >????????????????? from mul.c:24:
> > mul.c: In function 'mpfr_mul':
> > mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
> >??? __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"?? \
> >??? ^
> > mul.c:333:11: note: in expansion of macro 'add_ssaaaa'
> >??????????? add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], 0, t);
> >??????????? ^~~~~~~~~~
> > mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
> >??? __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"?? \
> >??? ^
> > mul.c:343:11: note: in expansion of macro 'add_ssaaaa'
> >??????????? add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], 0, t1);
> >??????????? ^~~~~~~~~~
> > mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
> >??? __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"?? \
> >??? ^
> > mul.c:347:11: note: in expansion of macro 'add_ssaaaa'
> >??????????? add_ssaaaa (tmp[3], t1, tmp[3], t1, 0, t3);
> >??????????? ^~~~~~~~~~
> > mpfr-longlong.h:403:3: error: impossible constraint in 'asm'
> >??? __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"?? \
> >??? ^
> > mul.c:349:11: note: in expansion of macro 'add_ssaaaa'
> >??????????? add_ssaaaa (tmp[2], tmp[1], tmp[2], tmp[1], t1, t2);
> >??????????? ^~~~~~~~~~
> 
> ?Compiler bug. I guess the Synopsys people will look at this, right?

Hi Arnout,?

The issue here is caused by obsolete ARC asm constraints that are no longer supported in GCC. Unfortunately such
constraints are still used in source code of some packages, e.g. "mpfr" library.?
I am preparing a workaround that replaces these obsolete constraints with up-to-date ones and send this patch to
buildroot.?
Also I am going to send a patch that updates asm constraints to "mpfr" in order to fix initial issue.?

Thanks.
-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
