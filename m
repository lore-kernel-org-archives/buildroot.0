From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 1 Dec 2015 14:56:20 +0100
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <CAGm1_kttUzd0XEHV0Jbkb9i3=kww5UKx25KE0hmRF82c9qe-=g@mail.gmail.com>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
 <20151201095826.GC2193@tarshish>
 <CAGm1_ks+db-1cASJWweJ6B2LHBa+zNfzj1V2+aQvdhFYbT=UOQ@mail.gmail.com>
 <20151201115651.0f1d7b34@free-electrons.com>
 <CAGm1_ksRfJUZt=1Hm8Lzn7C=hCSJwgENG5ac6jLfRO06mt_gsg@mail.gmail.com>
 <20151201122054.GG2193@tarshish>
 <CAGm1_kttUzd0XEHV0Jbkb9i3=kww5UKx25KE0hmRF82c9qe-=g@mail.gmail.com>
Message-ID: <CAGm1_ktyQ_BJ4c2d-Z6rFRK14f_-XeMVA6XF_N3jhSz7AJ89OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 1, 2015 at 2:29 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, Dec 1, 2015 at 1:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> Hi Yegor,
>>
>> On Tue, Dec 01, 2015 at 12:25:46PM +0100, Yegor Yefremov wrote:
>>> On Tue, Dec 1, 2015 at 11:56 AM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>> > On Tue, 1 Dec 2015 11:33:25 +0100, Yegor Yefremov wrote:
>>> >
>>> >> Commit message states: Pass -std=gnu99, needed to build with a basic toolchain.
>>> >>
>>> >> I've commented this like and could successfully compile with musl +
>>> >> gcc 4.9.3 and also with Linaro ARM 2015.08 (GCC 5.x).
>>> >>
>>> >> @Thomas and @Claudio: any idea, what configuration produced compiling issues?
>>> >
>>> > Can you try with
>>> > http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config ?
>>> > This is what I call a "basic" toolchain, i.e a minimal uClibc toolchain
>>> > with no wchar and al. enabled.
>>>
>>> Compilation *fails* without gnu99 with basic toolchain.
>>
>> Just curious, do you have any idea why the build fails, and how -std=gnu99
>> fixes the problem?
>
> The error occurs because openocd uses some C99 constructs, like this
> one for example:
>
> ../../../src/helper/binarybuffer.h:53:3: error: 'for' loop initial
> declarations are only allowed in C99 or C11 mode
>    for (unsigned i = first; i < first + num; i++) {

I've added AC_PROG_CC_STDC to configure.ac. When running on my host directly:

checking for gcc option to accept ISO C99... -std=gnu99
checking for gcc -std=gnu99 option to accept ISO C99... (cached) -std=gnu99
checking for gcc -std=gnu99 -std=gnu99 option to accept ISO Standard
C... (cached) -std=gnu99

When running BR (OPENOCD_OVERRIDE_SRCDIR) with basic toolchain:

checking for buildroot/testing/host/usr/bin/arm-linux-gcc option to
accept ISO C99... unsupported
checking for buildroot/testing/host/usr/bin/arm-linux-gcc option to
accept ISO C99... (cached) unsupported
checking for buildroot/testing/host/usr/bin/arm-linux-gcc option to
accept ISO C89... (cached) none needed
checking for buildroot/testing/host/usr/bin/arm-linux-gcc option to
accept ISO Standard C... (cached) none needed
