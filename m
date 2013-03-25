From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 25 Mar 2013 15:57:16 +0800
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
 <CAJxxZ0PCJ6X==pGsDajmDoD8mkcimZD58rfwQZyxCFSNTx=Uqg@mail.gmail.com>
Message-ID: <CAJxxZ0MqU=GeAPwKeK5ib0O0Y5ZZGfM_-+sjXyvqMsJ1Es-1ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 25, 2013 at 3:50 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> Hi Thomas,
>
> On Fri, Mar 22, 2013 at 10:29 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Sonic Zhang,
>>
>> On Fri, 22 Mar 2013 17:01:41 +0800, Sonic Zhang wrote:
>>> From: Sonic Zhang <sonic.zhang@analog.com>
>>
>> Thanks for getting back to us with Blackfin-related changes!
>>
>>> +config BR2_TARGET_ABI_FLAT
>>> +     bool
>>
>> I don't think FLAT is an ABI, it's a binary format.
>>
>> For example, on ARM, you can have ELF or FLAT binaries, that follow
>> either the OABI or EABI. True, OABI is deprecated, but it still clearly
>> points the fact that FLAT is *not* an ABI, but a binary format.
>>
>> Therefore, I think we should introduce config options like:
>>
>> config BR2_BINFMT_ELF
>>         bool
>>
>> config BR2_BINFMT_FDPIC
>>         bool
>>
>> config BR2_BINFMT_FLAT
>>         bool
>>
>> probably with a choice list or something.
>>
>
> OK.
>
>>>  if BR2_arm || BR2_armeb
>>>  source "arch/Config.in.arm"
>>>  endif
>>> diff --git a/package/Makefile.in b/package/Makefile.in
>>> index a8bf36b..acfd9c8 100644
>>> --- a/package/Makefile.in
>>> +++ b/package/Makefile.in
>>> @@ -103,6 +103,14 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
>>>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>>>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>>>
>>> +ifeq ($(BR2_TARGET_ABI_FLAT),y)
>>> +TARGET_LDFLAGS += -Wl,-elf2flt
>>> +endif
>>
>> This will have to use some BR2_BINFMT_FLAT config option, as per the
>> discussion above.
>>
>
> OK.
>
>>> +ifneq ($(BR2_USE_MMU), y)
>>> +TARGET_CFLAGS += -D__NOMMU__
>>> +endif
>>
>> I'm still not entirely happy with that. This define is completely
>> non-standard, I am not sure we want to have this at the global level.
>> autotools-based packages should be fixed to check if fork() is
>> available or not. For other packages, this special flag can be
>> introduced on a per-package basis. But it's true that maybe a good
>> number of packages will need that. Not sure here. What do others think?
>>
>
> Macro __NOMMU__ is not used only for fork/vfork. There are some
> difference between MMU and NOMMU application. For example:
> - exit(n) should be replaced by _exit(n) in child process.
> - Large buffer or array shouldn't be defined on stack.
> - calloc() should be replaced by malloc().

More difference:
- Multi-process application should be converted into multi-thread
application other than vfork if these processes are running
concurrently.
- Frequent memory allocation and free code should be converted to
allocate a big memory poll at the beginning of the application or
replaced by nedmalloc API.


Regards,

Sonic
