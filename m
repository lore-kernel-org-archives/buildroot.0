From: Will Newton <will.newton@gmail.com>
Date: Mon, 11 Nov 2013 10:25:27 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131111111718.0c539360@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAFbHwiRbF9E=7st0wu+WesxSnWayQjjKWKuEb+n4QqvbNk21ww@mail.gmail.com>
 <20131111111718.0c539360@skate>
Message-ID: <CAFbHwiSvfDnHS1ovy2QTsA1t4-yJ_fwW+TwUhwK=N8z6T0-vYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2013 at 10:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Will Newton,
>
> On Mon, 11 Nov 2013 10:01:17 +0000, Will Newton wrote:
>
>> >>        arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f174541ac06aeeac82b8399686a8d4371532760d/
>> >
>> > /tmp/cceJNtCh.s: Assembler messages:
>> > /tmp/cceJNtCh.s:200: Error: r15 not allowed here -- `str r15,[r3,#+0]'
>> > make[4]: *** [libcoregrind_arm_linux_a-m_libcassert.o] Error 1
>> > make[4]: *** Waiting for unfinished jobs....
>> >
>> > Not sure what's going on here. Anyone to have a look?
>>
>> valgrind uses inline assembly that is not Thumb compatible. It seems
>> it isn't expected to build it in Thumb mode (although it emulates
>> Thumb mode). It might be quite simple to fix but would need
>> coordination with upstream etc.
>
> Are you talking about Thumb, or Thumb-2 ? Because here the
> configuration has:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TARGET_OPTIMIZATION="-mthumb"
>
> so it's an ARMv7-A with -mthumb, so that means Thumb-2, right?

Yes, Thumb-2. Only those crazy microcontroller guys care about Thumb-1. ;-)

ARM ARM A8.8.203 is the relevant page, Thumb-2 cannot store pc/r15
directly. It should be possible to use a temporary to achieve the same
effect but it would need thorough testing.
