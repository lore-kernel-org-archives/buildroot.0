From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 29 Nov 2016 14:50:21 -0800
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161129094321.656d1cb4@free-electrons.com>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
 <20161129041655.GK14207@waldemar-brodkorb.de>
 <20161129094321.656d1cb4@free-electrons.com>
Message-ID: <CAMo8BfJAGT8cdvQ2xMx33HKDwW34XP6wVxHd1yn-UxAyQEYpRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 29, 2016 at 12:43 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 29 Nov 2016 05:16:55 +0100, Waldemar Brodkorb wrote:
>> > The --start-group/--end-group ask the linker to loop between -lgcc and
>> > -lc until all unresolved symbols have been resolved. So
>> > dl_iterate_phdr() being defined in the C library, but used in libgcc, I
>> > guess the dynamic way (-lgcc -lc -lgcc) doesn't work.
>>
>> But why gcc behaves different?
>> BR+gcc5+uClibc-ng-1.0.17 - no extra -static in LDFLAGS required
>> BR+gcc5+musl+static - no extra -static in LDFLAGS required
>> BR+gcc5+uClibc-ng-1.0.19 - extra -static required!
>
> I would suspect it's a fallout of the "merge everything in libc"
> change, but I really can't figure out why that would make a difference.
>
> Could it be that with older uClibc versions, gcc was not finding the
> dl_iterate_phdr symbol in uClibc, and therefore disabling the unwind
> code, and now, due to a change in uClibc, gcc sees the dl_iterate_phdr
> symbol, enables unwinding support, which cause this extra reference
> from libgcc to libc?

No. The difference is in the __pthread_initialize_minimal function.
Prior to uclibc-1.0.18 release it used to work because a call to
__pthread_initialize_minimal from __uClibc_init was resolved to
a function defined in libpthread/nptl/sysdeps/generic/libc-tls.c
which didn't reference pthread_unwind.
Now it is resolved to a function from
libpthread/linuxthreads/pthread.c, and that file pulls in other
unused functions, which reference __GI___pthread_unwind,
and all the way down to the dl_iterate_phdr.

More details:
 http://lists.busybox.net/pipermail/buildroot/2016-November/177477.html

-- 
Thanks.
-- Max
