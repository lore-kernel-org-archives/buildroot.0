From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 9 Jun 2021 00:16:58 +0200
Subject: [Buildroot] [PATCH 2/9] package/binutils: add upstream
 backported patches to support -mcmodel=large gcc option
In-Reply-To: <982098ed-c9d0-a15c-ca2b-5143d64e53e3@gmail.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
 <20210503111350.2933319-3-giulio.benetti@benettiengineering.com>
 <982098ed-c9d0-a15c-ca2b-5143d64e53e3@gmail.com>
Message-ID: <407e6f16-a875-0e92-0f3b-df14368afb21@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On 6/8/21 11:29 PM, Romain Naour wrote:
> Hi Giulio, All,
> 
> Le 03/05/2021 ? 13:13, Giulio Benetti a ?crit?:
>> Add upstream backported patches that allows using -mcmodel=large gcc option
>> that in order allows fixing build failure due to binutils bug 21464:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=21464
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>>   ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>>   ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>>   ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>>   ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>>   ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>>   ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>>   ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>>   ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>>   ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
>>   ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
>>   ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
>>   12 files changed, 3268 insertions(+)
>>   create mode 100644 package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>>   create mode 100644 package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>>   create mode 100644 package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>>   create mode 100644 package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>>   create mode 100644 package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>>   create mode 100644 package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>>   create mode 100644 package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>>   create mode 100644 package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>>   create mode 100644 package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>>   create mode 100644 package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
>>   create mode 100644 package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
>>   create mode 100644 package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
>>
> 
>> +   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
>> +-  unsigned insn4;
>> ++  unsigned output_insns[PLT_MAX_INSN_COUNT];
>> ++
>> ++  /* Copy instructions into the output buffer.  */
>> ++  for (size_t i = 0; i < insn_count; i++)
>> ++    output_insns[i] = insns[i];
>> +
> 
> This syntax break with good old compilers :)
> 
> elf32-or1k.c:2251:3: error: 'for' loop initial declarations are only allowed in
> C99 or C11 mode
>     for (size_t i = 0; i < insn_count; i++)
>     ^
> 
> See:
> https://gitlab.com/bootlin/toolchains-builder/-/jobs/1325646298

Thanks for pointing, I didn't think about old host compiler. I'm going 
to fix it soon by patching actual patches initializing variable at the
begin of functions.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Best regards,
> Romain
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
