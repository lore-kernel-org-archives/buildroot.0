From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 22 Apr 2015 00:56:12 -0700
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150422091426.0f431551@free-electrons.com>
References: <20150421125634.385A788D@mail.free-electrons.com>
 <CAKbGBLgnq72kw570gNB=EHFnw9UOJY3_7H0nFpebjJ9kgGx+qQ@mail.gmail.com>
 <20150422091426.0f431551@free-electrons.com>
Message-ID: <CAKbGBLi_+k0-vTTj-pdBg_soyyMOQaVLOmqV7pY-S-Gjgc2w1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2015 at 12:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Steven,
>
> On Tue, 21 Apr 2015 16:58:02 -0700, Steven Noonan wrote:
>
>> > Here is the list of patches you have submitted that are still pending:
>> >
>> >  - [1/7] package/perf: if slang is enabled, depend on it
>> >    http://patchwork.ozlabs.org/patch/451638/
>> >
>> >  - [2/7] package/perf: if numactl (libnuma) is enabled, depend on it
>> >    http://patchwork.ozlabs.org/patch/451636/
>> >
>> >  - [3/7] package/perf: if libunwind is enabled, depend on it
>> >    http://patchwork.ozlabs.org/patch/451637/
>> >
>> >  - [5/7] package/perf: patch installation paths
>> >    http://patchwork.ozlabs.org/patch/451641/
>> >
>> >  - [6/7] package/perf: add patch to prevent crash on empty history buffer
>> >    http://patchwork.ozlabs.org/patch/451634/
>> >
>> >  - [7/7] package/perf: use correct definition of ARCH on x86_64
>> >    http://patchwork.ozlabs.org/patch/451633/
>>
>> All 7 are still relevant.
>
> Ok. I'll have a look at those perf patches.

At least a couple of these depend on making perf patchable. :(

But the dependency ones (slang, numactl, libunwind) should be straightforward.

>> >  - implement granular choice for stack protector
>> >    http://patchwork.ozlabs.org/patch/451643/
>>
>> Still relevant.
>
> Do all the gcc versions support those different levels of stack
> protection?

No, which is why the patch introduces the BR2_TOOLCHAIN_HAS_SSP_STRONG
flag (-fstack-protector-strong is the newest addition, added in GCC
4.9).

-fstack-protector and -fstack-protector-all were introduced at the
same time, but I'm not sure which version they were introduced in --
but since Buildroot doesn't currently have flags for whether the
toolchain supports it, we can assume it existed for quite some time.

>> >  - package/glibc: enable lock elision on x86_64 hosts
>> >    http://patchwork.ozlabs.org/patch/451651/
>>
>> Still relevant.
>
> Is lock elision a feature always available on x86-64 ? Or only on
> certain cores ? I believe it required a certain generation of hardware.
> But maybe the glibc gracefully falls back to a non-elided lock
> implementation when the hardware does not have the required features.

It's available on Haswell and later. Enabling lock elision in glibc
will have it do a CPUID check whether the feature is supported before
using it, so it's safe to enable on *any* x86_64 build.

> All sort of questions that should have been addressed in the commit
> log... which is currently empty :-)

Fair enough, I am so used to thinking in this context that I didn't
realize it was non-trivial.

>> >  - package: add shadow 4.2.1
>> >    http://patchwork.ozlabs.org/patch/451723/
>>
>> There was some followup discussion which I haven't addressed. But it
>> is still relevant.
>
> Yes, but can you address the comments?

Eventually. I have a lot on my plate right now. I have another patch
series I do want to send out eventually as well (introducing the X32
ABI support) but that's all on hold until things quiet down.

We can drop the submission until I can address the comments.

>>
>> >  - package: add mosh 1.2.4
>> >    http://patchwork.ozlabs.org/patch/451726/
>>
>> Still relevant.
>
> There has been some comments. Can you address them and resend? The
> comments have been made a month ago. While I agree we (Buildroot
> maintainers / core developers) are not best placed to criticize about
> delays, it would be good to respin patches not too long after the
> comments, so that they are kept "alive and moving".

Again, being busy doesn't help. :)

We can drop the submission until I can address the comments.

>> >  - [v2] package/perf: build outside kernel tree
>> >    http://patchwork.ozlabs.org/patch/451947/
>>
>> Relevant but people didn't want this one -- I just didn't see an
>> alternative if we were going to apply any patches to perf.
>
> Yeah, this isn't a simple problem :-/

Well, it sort of is. Just extract it for both and deal with it. But
people are [perhaps rightfully] stingy about how much space is
consumed by extracting the kernel tree again. We could filter the
extract down to just the tools directory and any top-level Makefiles
that the tools directory depends on, and then it would be feasible to
extract+patch.

>> >  - package/libpthsem: correctly handle --{en, dis}able-debug arguments on configure
>> >    http://patchwork.ozlabs.org/patch/452271/
>>
>> Still relevant.
>
> Not really: we are going to get rid of passing --enable-debug /
> --disable-debug. A patch series doing this has already been posted. I
> believe it will make this patch irrelevant. Can you confirm?

Perhaps. If we pass *neither* --enable-debug or --disable-debug then
things should be fine. But libpthsem currently mishandles it and
considers both of --{enable,disable}-debug as enable -- which is
basically the opposite of what we wanted.
