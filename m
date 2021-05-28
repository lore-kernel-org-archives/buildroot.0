From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 May 2021 17:25:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: fix build on riscv32
In-Reply-To: <CAPi7W81NhANSaH3ytFt3OWfs8qUxXOxNu1O1n23kv8TohAkqbQ@mail.gmail.com>
References: <20210527210402.555334-1-fontaine.fabrice@gmail.com>
 <20210528065949.GA2170022@sunra>
 <CAPi7W83+pf05_ssNVpaY=mEOpr4MNA4DVX5m+0RViDfig91mwA@mail.gmail.com>
 <f46b99ad-b713-3fff-5b55-3f15300bd4ce@mind.be>
 <CAPi7W81NhANSaH3ytFt3OWfs8qUxXOxNu1O1n23kv8TohAkqbQ@mail.gmail.com>
Message-ID: <7eca6978-c70c-cb04-00f3-3ddad374e7f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2021 16:33, Fabrice Fontaine wrote:
> Hi Arnout,
> 
> Le ven. 28 mai 2021 ? 16:17, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>
>>
>> On 28/05/2021 09:11, Fabrice Fontaine wrote:
>>> Hi Koen,
>>>
>>> Le ven. 28 mai 2021 ? 09:00, Koen Martens <gmc@sonologic.nl> a ?crit :
>>>>
>>>> Hi,
>>>>
>>>> Thanks for diving into this. I've had emails about this for months, and briefly
>>>> looked at it, but never found the time to properly figure it out.
>>>>
>>>> I see the patch below is also present upstream. Do you know whether this has
>>>> already been released or when it will be?
>>> I don't know when upstream will release a new version.
>>> However, after digging through a lot of riscv32 build failures on
>>> other packages, I'm not sure that this upstream patch is right
>>> anymore.
>>> Aliasing SYS_futex to SYS_futex_time64 has been rejected by vlc for example:
>>> https://patches.videolan.org/patch/30581/
>>
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
>>  Or even better of course would be to patch all code to use the __time64_t
>> instead of time_t everywhere, independent of __TIMESIZE. But even then you'd
>> need fallback to time_t for old libc/kernel.
> Thanks for your feedback, I'll then send a v2 of my patch for vlc to
> fix the build on riscv32 instead of disabling it.

 Well, no, only if upstream vlc is going to accept that approach.

 Regards,
 Arnout

>>
>>
>>  Regards,
>>  Arnout
>>
>>
>> [1]
>> https://www.gnu.org/software/libc/manual/html_node/64_002dbit-time-symbol-handling.html
>>
>>
>>
>>
>>
>>> So another option would be to just disable capnproto on riscv32.
>>>>
>>>> Given that this exact patch is also applied upstream, your patch below seems fine
>>>> to me.
>>>>
>>>> Cheers,
>>>>
>>>> Koen
>>>>
>>>> On Thu, May 27, 2021 at 11:04:02PM +0200, Fabrice Fontaine wrote:
>>>>> Fixes:
>>>>>  - http://autobuild.buildroot.org/results/1c1cd4775241ee57d878cad5c978413d4b4a8736
>>>>>
>>>>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>>> ---
>>>>>  ...it-architectures-using-64-bit-time_t.patch | 37 +++++++++++++++++++
>>>>>  1 file changed, 37 insertions(+)
>>>>>  create mode 100644 package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
>>>>>
>>>>> diff --git a/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
>>>>> new file mode 100644
>>>>> index 0000000000..ce70ab8f29
>>>>> --- /dev/null
>>>>> +++ b/package/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit-time_t.patch
>>>>> @@ -0,0 +1,37 @@
>>>>> +From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
>>>>> +From: Khem Raj <raj.khem@gmail.com>
>>>>> +Date: Sun, 15 Nov 2020 12:10:28 -0800
>>>>> +Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
>>>>> +
>>>>> +mutex code uses SYS_futex, which it expects from system C library.
>>>>> +in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
>>>>> +rv32 is using 64bit time_t from get go unlike other 32bit architectures
>>>>> +in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
>>>>> +this aliases it to NR_futex so that SYS_futex is then defined for rv32
>>>>> +
>>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> +[Retrieved from:
>>>>> +https://github.com/capnproto/capnproto/commit/e2a05a19e9dc51287e19cc9f11fd91449219e361]
>>>>> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>>> +---
>>>>> + c++/src/kj/mutex.c++ | 6 ++++++
>>>>> + 1 file changed, 6 insertions(+)
>>>>> +
>>>>> +diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
>>>>> +index c81cead7b..e1594b117 100644
>>>>> +--- a/c++/src/kj/mutex.c++
>>>>> ++++ b/c++/src/kj/mutex.c++
>>>>> +@@ -39,7 +39,13 @@
>>>>> +
>>>>> + #ifndef SYS_futex
>>>>> + // Missing on Android/Bionic.
>>>>> ++#ifdef __NR_futex
>>>>> + #define SYS_futex __NR_futex
>>>>> ++#elif defined(SYS_futex_time64)
>>>>> ++#define SYS_futex SYS_futex_time64
>>>>> ++#else
>>>>> ++#error "Need working SYS_futex"
>>>>> ++#endif
>>>>> + #endif
>>>>> +
>>>>> + #ifndef FUTEX_WAIT_PRIVATE
>>>>> --
>>>>> 2.30.2
>>>>>
>>> Best Regards,
>>>
>>> Fabrice
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
> Best Regards,
> 
> Fabrice
> 
