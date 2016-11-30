From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 30 Nov 2016 06:00:04 +0100
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
 <20161129094321.656d1cb4@free-electrons.com>
 <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
Message-ID: <20161130050003.GS14207@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
Max Filippov wrote,

> On Tue, Nov 29, 2016 at 12:43 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Tue, 29 Nov 2016 05:16:55 +0100, Waldemar Brodkorb wrote:
> >> > The --start-group/--end-group ask the linker to loop between -lgcc and
> >> > -lc until all unresolved symbols have been resolved. So
> >> > dl_iterate_phdr() being defined in the C library, but used in libgcc, I
> >> > guess the dynamic way (-lgcc -lc -lgcc) doesn't work.
> >>
> >> But why gcc behaves different?
> >> BR+gcc5+uClibc-ng-1.0.17 - no extra -static in LDFLAGS required
> >> BR+gcc5+musl+static - no extra -static in LDFLAGS required
> >> BR+gcc5+uClibc-ng-1.0.19 - extra -static required!
> >
> > I would suspect it's a fallout of the "merge everything in libc"
> > change, but I really can't figure out why that would make a difference.
> >
> > Could it be that with older uClibc versions, gcc was not finding the
> > dl_iterate_phdr symbol in uClibc, and therefore disabling the unwind
> > code, and now, due to a change in uClibc, gcc sees the dl_iterate_phdr
> > symbol, enables unwinding support, which cause this extra reference
> > from libgcc to libc?
> 
> No. The difference is in the __pthread_initialize_minimal function.
> Prior to uclibc-1.0.18 release it used to work because a call to
> __pthread_initialize_minimal from __uClibc_init was resolved to
> a function defined in libpthread/nptl/sysdeps/generic/libc-tls.c
> which didn't reference pthread_unwind.
> Now it is resolved to a function from
> libpthread/linuxthreads/pthread.c, and that file pulls in other
> unused functions, which reference __GI___pthread_unwind,
> and all the way down to the dl_iterate_phdr.
> 
> More details:
>  http://lists.busybox.net/pipermail/buildroot/2016-November/177477.html

Sorry that I didn't looked into your report in more detail last time.
May be I was too confused ;)

I really can't imagine that any code from libpthread/linuxthreads
can be involved when we compile Xtensa with NPTL support.

I believe there is a bug or a change in behavior regarding static
linking prior to 1.0.18.

See:
wbx at helium:~/buildroot/output/build/uclibc-1.0.19 $ grep -r __pthread_initialize_minimal *                                                                          
Binary file lib/libc.a matches
Binary file libc/misc/internals/__uClibc_main.os matches
libc/misc/internals/__uClibc_main.c:extern void weak_function __pthread_initialize_minimal(void);
libc/misc/internals/__uClibc_main.c:extern void __pthread_initialize_minimal(void);
libc/misc/internals/__uClibc_main.c:     * __pthread_initialize_minimal so we can use pthread_locks
libc/misc/internals/__uClibc_main.c:    if (likely(__pthread_initialize_minimal!=NULL))
libc/misc/internals/__uClibc_main.c: __pthread_initialize_minimal();
libpthread/nptl_db/td_ta_thr_iter.c:      /* __pthread_initialize_minimal has not run.  There is just the main
libpthread/nptl_db/td_ta_map_lwp2thr.c:     before __pthread_initialize_minimal has gotten far enough.  They
libpthread/nptl_db/td_thr_validate.c:   /* __pthread_initialize_minimal has not run yet.
libpthread/linuxthreads/internals.h:void __pthread_initialize_minimal (void);
libpthread/linuxthreads/pthread.c:void __pthread_initialize_minimal(void)
libpthread/nptl/init.c:void __pthread_initialize_minimal_internal (void) attribute_hidden;
libpthread/nptl/init.c:__pthread_initialize_minimal_internal (void) 
libpthread/nptl/init.c:strong_alias (__pthread_initialize_minimal_internal, 
libpthread/nptl/init.c:       __pthread_initialize_minimal)
libpthread/nptl/allocatestack.c:   initialize this, since it's done in __pthread_initialize_minimal.  */
libpthread/nptl/sysdeps/generic/libc-tls.c:extern void __pthread_initialize_minimal(void) __attribute__((weak));
libpthread/nptl/sysdeps/generic/libc-tls.c:__pthread_initialize_minimal (void)
libpthread/nptl/sysdeps/generic/libc-tls.c:__pthread_initialize_minimal (void)
libpthread/nptl/sysdeps/alpha/elf/pt-initfini.c:        bsr     $26, __pthread_initialize_minimal_internal !samegp \n\
Binary file libpthread/nptl/sysdeps/xtensa/libc-tls.os matches
Binary file libpthread/nptl/init.os matches
Binary file utils/getconf matches

libpthread/nptl/sysdeps/xtensa/libc-tls.c includes
libpthread/nptl/sysdeps/generic/libc-tls.c.

Prior to 1.0.18 libpthread.so was linked with special LDFLAGS:
LDFLAGS-libpthread.so +=
$(top_builddir)lib/$(UCLIBC_LDSO_NAME)-$(VERSION).so
$(top_builddir)lib/libdl-$(VERSION).so \
       -Wl,-z,nodelete,-z,initfirst,-init=$(SYMBOL_PREFIX)__pthread_initialize_minimal_internal

May be this might be a reason we see different behavior.

best regards
 Waldemar
