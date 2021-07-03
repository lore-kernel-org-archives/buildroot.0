From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Jul 2021 14:21:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: fix build on riscv32
In-Reply-To: <YN+A1hGJE7YjTd/F@piout.net>
References: <20210527210402.555334-1-fontaine.fabrice@gmail.com>
 <20210528065949.GA2170022@sunra>
 <CAPi7W83+pf05_ssNVpaY=mEOpr4MNA4DVX5m+0RViDfig91mwA@mail.gmail.com>
 <f46b99ad-b713-3fff-5b55-3f15300bd4ce@mind.be> <YN+A1hGJE7YjTd/F@piout.net>
Message-ID: <590fdb2c-a1b9-c0f2-b693-ed8057c9ecbd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2021 23:10, Alexandre Belloni wrote:
> Hi,
> 
> I'm very late to the pary but this patch should not be applied, in BR or
> upstream.
> 
> On 28/05/2021 16:17:03+0200, Arnout Vandecappelle wrote:
>>  That patch looks OK to me:
>>
>> +/* 32bit architectures with 64bit time_t do not define __NR_futex syscall */
>> +#if !defined(SYS_futex) && defined(SYS_futex_time64)
>> +#define SYS_futex SYS_futex_time64
>> +#endif
>>
>>  The comment was "this patch won't work if the userspace ABI uses the
>> 64-bit time_t on a 32-bit ISA that did start with 32-bit time_t" - but that's
>> not true. On a 32-bit ISA that did start with 32-bit time_t, SYS_futex will be
>> defined (or SYS_foo is not properly exported by libc and then SYS_futex_time64
>> isn't defined either).
>>
>>  To be really safe, you should maybe also check that __TIMESIZE == 64 [1] - but
>> that may break on musl or uClibc.
>>
> 
> Not defining __NR_futex was done on purpose, to ensure applications
> would break at compile time. With that patch applied, you make it harder
> to properly fix and provide an upgrade path for 32b platforms that had a
> 32b time_t.

 That's a good reasoning for not accepting the patch in upstream capnproto, but
I don't see this as a problem for Buildroot.

 I *think* your point is that capnproto is broken for 32-bit platforms with a
libc that sets TIMESIZE to 64 - but that was already broken before this patch,
the patch just doesn't fix it. I still claim that this fix is acceptable to
support 32-bit platforms that never had 32-bit time_t.

 Even then though - if libc sets TIMESIZE to 64, I would expect it will also
undef SYS_futex, no? So the patch actually still works, because SYS_futex_time64
would be used like it should be. Can you give a concrete example of when it breaks?


> The whole goal was to have the applications check
> sizeof(time_t).

> The patch works but it is hiding the issue under the rug
> and everything will break silently in 2038 instead of breaking now at
> compile time.
> 
>>  Or even better of course would be to patch all code to use the __time64_t
>> instead of time_t everywhere, independent of __TIMESIZE. But even then you'd
>> need fallback to time_t for old libc/kernel.
>>
> 
> Exactly, the solution, is simply to check sizeof(time_t).

 I don't get how that should be done (can't use sizeof in a #if as far as I
know), but I'm sure you'll point me to the patch you sent to capnproto that
shows it :-)

 Regards,
 Arnout
