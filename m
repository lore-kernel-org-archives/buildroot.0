From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 14 Aug 2017 08:44:49 -0500
Subject: [Buildroot] [PATCH] util-linux: Revert genrandom(2) logic
In-Reply-To: <CANQCQpY7K96pb6As-43dKb7KDeGRc8DdvLHTCTa=-GA_ed921Q@mail.gmail.com>
References: <1502506894-64344-1-git-send-email-matthew.weber@rockwellcollins.com>
 <f2b0d935-279c-3d35-efda-71cbfebb2ed8@mind.be>
 <692fba0f-299d-2baf-7df7-7a42135a762e@cartelsol.com>
 <CANQCQpY7K96pb6As-43dKb7KDeGRc8DdvLHTCTa=-GA_ed921Q@mail.gmail.com>
Message-ID: <CANQCQpY9WqARa+QTDiALkM4nXpj3i+VJJXu1Bjr4+7dkOHcPMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Aug 14, 2017 at 8:15 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Marcus,
>
> On Mon, Aug 14, 2017 at 4:54 AM, Marcus Hoffmann
> <m.hoffmann@cartelsol.com> wrote:
>> Hey Matt, Arnout,
>>
>> On 12.08.2017 18:00, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 12-08-17 05:01, Matt Weber wrote:
>>>> New logic was added at configure time and new conditional code
>>>> in lib/randutils.c between versions 2.29.2 and >= 2.30.  The logic
>>>> determines if the glibc or syscall API should be used for
>>>> rand calls.  This has been observed causing issues in a
>>>> configuration of a 4.1 kernel and glibc2.25.  A tool like
>>>> parted when used at boot hangs for ~40x the time and when
>>>> debugged with gdb shows blocking on genrandom, even though
>>>                                       getrandom
>>>
>>>> a entropy check from a hardware rng used by rngd is adequate
>>>> before the parted tool is used.
>>>>
>>>> Bug tracker:
>>>> https://github.com/karelzak/util-linux/issues/496
>>>>
>>>> Upstream reverted commits
>>>> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=b192dd6943e5bb5d2a3773b2c9b06cbd4eb28258
>>>> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?h=stable/v2.30&id=cc01c2dca4f62e36505570d5cb15f868aa44bf54
>>>>
>>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>>
>>>  To be honest, I don't think we want this in Buildroot. It's rather a feature
>>> patch, and it is absolutely not upstreamable in its current form. Also, you can
>>> easily keep these patches in your BR2_GLOBAL_PATCH_DIR
>>
>> A fix for this was just added by Karel:
>> https://github.com/karelzak/util-linux/commit/5264aebb4f822fa9147ee576562a4961ca97261d
>>
>> @Matt, can you test it?
>

Didn't work, but I did notice what may actually be the issue.  For
some reason my entropy pool is 3095 before I hang and then after the
~40-50sec I see a "random: nonblocking pool is initialized".  My
understanding was the rngd service handled init of the kernel's random
number generation using my hardware generator without the normal
(non-hardware)entropy sources gathering activity.  Any ideas?
