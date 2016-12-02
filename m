From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 1 Dec 2016 21:12:34 -0800
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161130050003.GS14207@waldemar-brodkorb.de>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
 <20161129094321.656d1cb4@free-electrons.com>
 <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
 <20161130050003.GS14207@waldemar-brodkorb.de>
Message-ID: <CAMo8Bf+tDete50wsasrj=L1G=7XCJ9=dZBav4azY_PN1HTzrqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

TL;DR: -static is good, order of objects in libc.a is important.

On Tue, Nov 29, 2016 at 9:00 PM, Waldemar Brodkorb <wbx@openadk.org> wrote:
>> On Tue, Nov 29, 2016 at 12:43 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > On Tue, 29 Nov 2016 05:16:55 +0100, Waldemar Brodkorb wrote:
>> >> > The --start-group/--end-group ask the linker to loop between -lgcc and
>> >> > -lc until all unresolved symbols have been resolved. So
>> >> > dl_iterate_phdr() being defined in the C library, but used in libgcc, I
>> >> > guess the dynamic way (-lgcc -lc -lgcc) doesn't work.
>> >>
>> >> But why gcc behaves different?
>> >> BR+gcc5+uClibc-ng-1.0.17 - no extra -static in LDFLAGS required
>> >> BR+gcc5+musl+static - no extra -static in LDFLAGS required
>> >> BR+gcc5+uClibc-ng-1.0.19 - extra -static required!
>> >
>> > I would suspect it's a fallout of the "merge everything in libc"
>> > change, but I really can't figure out why that would make a difference.
>> >
>> > Could it be that with older uClibc versions, gcc was not finding the
>> > dl_iterate_phdr symbol in uClibc, and therefore disabling the unwind
>> > code, and now, due to a change in uClibc, gcc sees the dl_iterate_phdr
>> > symbol, enables unwinding support, which cause this extra reference
>> > from libgcc to libc?
>>
>> No. The difference is in the __pthread_initialize_minimal function.
>> Prior to uclibc-1.0.18 release it used to work because a call to
>> __pthread_initialize_minimal from __uClibc_init was resolved to
>> a function defined in libpthread/nptl/sysdeps/generic/libc-tls.c
>> which didn't reference pthread_unwind.
>> Now it is resolved to a function from
>> libpthread/linuxthreads/pthread.c, and that file pulls in other
>> unused functions, which reference __GI___pthread_unwind,
>> and all the way down to the dl_iterate_phdr.
>>
>> More details:
>>  http://lists.busybox.net/pipermail/buildroot/2016-November/177477.html
>
> Sorry that I didn't looked into your report in more detail last time.
> May be I was too confused ;)
>
> I really can't imagine that any code from libpthread/linuxthreads
> can be involved when we compile Xtensa with NPTL support.

Oops, wrong path, wrong searching tool. But the idea:
in the failing case __pthread_initialize_minimal is taken from
libpthread/nptl/init.c and it's way bigger than
__pthread_initialize_minimal used for linking with the uClibc-ng-1.0.17.

Now, I believe that adding the missing -static is the right
solution, because even with uClibc-ng-1.0.17 the linking fails
for a simple application that uses pthread:

$ cat hello.c
#include <pthread.h>

int main()
{
        pthread_create(NULL, NULL, NULL, NULL);
        return 0;
}

$ xtensa-buildroot-linux-uclibc-gcc -pthread hello.c -o hello
.../libgcc.a(unwind-dw2-fde-dip.o): In function `__gthread_mutex_lock':
.../gthr-default.h:748: undefined reference to `dl_iterate_phdr'
collect2: error: ld returned 1 exit status

The only thing that worries me at this point is that now we have
a lot of pthread internals linked into the program image even when
the program doesn't use them.

E.g. autossh built with uClibc-ng-1.0.17:

$ size -A autossh
autossh:
section            size      addr
.text             63771   4194484
.rodata           28112   4258256
.eh_frame           792   4286368
.tbss                 8   4291256
.ctors                8   4291256
.dtors                8   4291264
.jcr                  4   4291272
.data.rel.ro        160   4291276
.data               692   4291440
.bss              15524   4292136
.comment             31         0
.xtensa.info         56         0
.debug_aranges      288         0
.debug_info        2195         0
.debug_abbrev       398         0
.debug_line        6327         0
.debug_frame         40         0
.debug_str          468         0
.debug_loc           40         0
.xt.lit            3752         0
.xt.prop          58596         0
Total            181270

$ nm autossh  | grep pthread | wc -l
10

vs. autossh built with uClibc-ng-1.0.19:

$ size -A autossh
autossh:
section            size      addr
.text             83955   4194484
.rodata           28564   4278440
.eh_frame          1628   4307004
.tdata                4   4312728
.tbss                 8   4312732
.ctors                8   4312732
.dtors                8   4312740
.jcr                  4   4312748
.data.rel.ro        160   4312752
.data               736   4312912
.bss              24516   4313648
.comment             35         0
.xtensa.info         56         0
.debug_aranges      384         0
.debug_info       20096         0
.debug_abbrev      2925         0
.debug_line       14492         0
.debug_frame       1432         0
.debug_str         4789         0
.debug_loc        11212         0
.debug_ranges       608         0
.xt.lit            4384         0
.xt.prop          77364         0
Total            277368

$ nm autossh | grep pthread | wc -l
77

That makes me wonder, how pthread initialization is done
in uClibc-ng-1.0.17 for applications that use pthread and that
don't. So what I see is the following:

- an application that uses pthread_create references
  libpthread/nptl/init.c (because pthread_create.c includes
  allocatestack.c, which references __xidcmd defined in init.c
  from its __nptl_setxid) and thus gets __pthread_initialize_minimal
  from it.

- an application that doesn't use pthread_create gets its weakly
  defined __pthread_initialize_minimal from the
  libpthread/nptl/sysdeps/generic/libc-tls.c, which provides
  __libc_setup_tls referenced from the __uClibc_init.

So we're interested in the following three files:
- init.os (built from libpthread/nptl/init.c, with strong
   __pthread_initialize_minimal)
- libc-tls.os (built from libpthread/nptl/sysdeps/xtensa/libc-tls.c,
   with weak __pthread_initialize_minimal)
- __uClibc_main.os (built from libc/misc/internal/__uClibc_main.c
   with undefined reference to __pthread_initialize_minimal).

Comparing uClibc-ng-1.0.17 with uClibc-ng-1.0.19 I see the following:
1.0.17 had libc.a with libc-tls.os and __uClibc_main.os and
libpthread.a with init.os.
1.0.19 has libc.a with libc-tls.os, __uClibc_main.os and init.os in it
in that order.

I haven't found any related documentation, but apparently with 1.0.19
when a definition of __pthread_initialize_minimal is searched for the
undefined symbol in __uClibc_main.os, the init.os is considered
first. Manually removing and re-adding libc-tls.os and init.os so
that the final order is __uClibc_main.os, libc-tls.os and init.os
restores the 1.0.17 behavior.

> Prior to 1.0.18 libpthread.so was linked with special LDFLAGS:
> LDFLAGS-libpthread.so +=
> $(top_builddir)lib/$(UCLIBC_LDSO_NAME)-$(VERSION).so
> $(top_builddir)lib/libdl-$(VERSION).so \
>        -Wl,-z,nodelete,-z,initfirst,-init=$(SYMBOL_PREFIX)__pthread_initialize_minimal_internal
>
> May be this might be a reason we see different behavior.

AFAICS it only affects shared library, i.e. not related to static linking case.

-- 
Thanks.
-- Max
