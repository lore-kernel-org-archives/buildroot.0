From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 9 Jun 2021 18:57:42 +0200
Subject: [Buildroot] [PATCH 2/9] package/binutils: add upstream
 backported patches to support -mcmodel=large gcc option
In-Reply-To: <02a99332-7dfe-ae24-703d-979a98a6181a@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
 <20210503111350.2933319-3-giulio.benetti@benettiengineering.com>
 <982098ed-c9d0-a15c-ca2b-5143d64e53e3@gmail.com>
 <407e6f16-a875-0e92-0f3b-df14368afb21@benettiengineering.com>
 <4db92b61-32e1-f4c0-4986-99ab2b1da09d@gmail.com>
 <02a99332-7dfe-ae24-703d-979a98a6181a@benettiengineering.com>
Message-ID: <b930df56-fc83-295c-3132-06087c265e0f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

Le 09/06/2021 ? 18:50, Giulio Benetti a ?crit?:
> Hi Romain, All,
> 
> On 6/9/21 8:26 AM, Romain Naour wrote:
>> Hi Giulio,
>>
>> Le 09/06/2021 ? 00:16, Giulio Benetti a ?crit?:
>>> Hi Romain,
>>>
>>> On 6/8/21 11:29 PM, Romain Naour wrote:
>>>> Hi Giulio, All,
>>>>

[...]

>>>>> +?? unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
>>>>> +-? unsigned insn4;
>>>>> ++? unsigned output_insns[PLT_MAX_INSN_COUNT];
>>>>> ++
>>>>> ++? /* Copy instructions into the output buffer.? */
>>>>> ++? for (size_t i = 0; i < insn_count; i++)
>>>>> ++??? output_insns[i] = insns[i];
>>>>> +
>>>>
>>>> This syntax break with good old compilers :)
>>>>
>>>> elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
>>>> C99 or C11 mode
>>>> ???? for (size_t i = 0; i < insn_count; i++)
>>>> ???? ^
>>>>
>>>> See:
>>>> https://gitlab.com/bootlin/toolchains-builder/-/jobs/1325646298
>>>
>>> Thanks for pointing, I didn't think about old host compiler. I'm going to fix it
>>> soon by patching actual patches initializing variable at the
>>> begin of functions.
>>
>> Toolchain-builder use Debian 8 jessie to build the toolchain while Debian 9
>> stretch is used to run the Buildroot testsuite.
>>
>> See, there is no problem to build the qemu_or1k_defconfig in gitlab using
>> stretch:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/1307293494
>>
>> The host gcc used by stretch is gcc 6 while it's gcc 4.9 for jessie, the default
>> mode for C is -std=gnu11 since gcc 5:
>> https://gcc.gnu.org/gcc-5/changes.html
> 
> Here is the patch that fixes that issue [1]
> 
> I've tested it on Debian Jessie and it works fine(while before I've encountered
> your same problem).
> 
> It's pending upstream[2], this is why I've decided to add a new patch instead of
> modifying the current one.
> 
> Does it sound good for you?

It's fine for me, the current patch come from upstream so we should avoid adding
changes.

Thanks!

Best regards,
Romain


> 
> [1]:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210609162753.1138390-1-giulio.benetti at benettiengineering.com/
> 
> 
> [2]: https://sourceware.org/pipermail/binutils/2021-June/116884.html
> 
> Best regards
