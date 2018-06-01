From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Fri, 1 Jun 2018 08:28:20 +0000
Subject: [Buildroot] Fwd: [PATCH] arm: ensure symbol is a thumb symbol
 in new binutils
In-Reply-To: <1e9b8ffd-cc1d-2c39-e34a-d1e33f49a645@gmail.com>
References: <20171121172751.29545-1-Jason@zx2c4.com>
 <20171121173857.GJ31757@n2100.armlinux.org.uk>
 <CAHmME9quDFbdOR9hKRz-Px=Mh3FvYEyhVrs4V_+JT+GjDajMrA@mail.gmail.com>
 <20171121174942.GK31757@n2100.armlinux.org.uk>
 <CAHmME9oMTNJFnOwfhu26QSRSP92Axbc-+v9cCPsTKxekZvGvxg@mail.gmail.com>
 <20171123103518.GL31757@n2100.armlinux.org.uk>
 <CAHmME9qBxgDV-HGeqj75ohr=4Bf+TD73PcC0DUqTRh5PTOKyhQ@mail.gmail.com>
 <20171123140228.GP31757@n2100.armlinux.org.uk>
 <CAKv+Gu8TJi8qSWAkL231WhQkWxK+vSQm2tnQn_qN-2wdFaNaEA@mail.gmail.com>
 <765227b5-981d-0cea-c831-73cfe2f58721@redhat.com>
 <aaf57bb5-13e6-852c-0f67-f72aedef0e79@gmail.com>
 <254af731-459b-1f1d-2d93-27c5a91e7bfb@redhat.com>
 <1e9b8ffd-cc1d-2c39-e34a-d1e33f49a645@gmail.com>
Message-ID: <aca33630-3c36-4ba9-0237-b971cb7ffee7@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
On 05/31/2018 11:16 PM, Romain Naour wrote:
> Hi Nick,
>
> Le 31/05/2018 ? 15:00, Nick Clifton a ?crit?:
>> Hi Romain,
>>
>>>>    https://sourceware.org/bugzilla/show_bug.cgi?id=21458
>>> What's the status of this bug?
>> It was sidelined. :-(  Sorry.
> No problem :-)
>
>>> Some users reported a runtime issue with the linux kernel boot for Cortex-M
>>> target: https://bugs.buildroot.org/show_bug.cgi?id=11051
>> I think that part of the problem is that the kernel people are
>> asking for the (adr affecting part of the) patch to be reverted,
>> but they have not suggested a way to address the issue raised in
>> the PR.  (From comment #6 onwards).
> Yes, but it's a very difficult topic.
> Did you have some feedback from ARM ?
>
>> One thing that did occur to me is that the adr handling code
>> in the assembler does not check to see if the bottom bit has
>> already been set, so maybe this is part of the problem.  Are
>> you able to test out an assembler patch and see if it makes
>> a difference ?
> I'm not able to test this patch but I'm adding Christophe Priouzeau in Cc.
> He use a stm32f429 system.
>
> Christophe, it would be great if you can test this patch with your toolchain
> based on Binutils 2.29.
I have made the test on buildroot 2018.05-rc3 with bintutils 2.29.1 and 
2.30,
for the two test my boot failed. The proposition of correction doesn't work.
Thanks
>> diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
>> index dbaf1627bb..c682ceabd3 100644
>> --- a/gas/config/tc-arm.c
>> +++ b/gas/config/tc-arm.c
>> @@ -8423,7 +8423,7 @@ do_adr (void)
>>         && inst.reloc.exp.X_add_symbol != NULL
>>         && S_IS_DEFINED (inst.reloc.exp.X_add_symbol)
>>         && THUMB_IS_FUNC (inst.reloc.exp.X_add_symbol))
>> -    inst.reloc.exp.X_add_number += 1;
>> +    inst.reloc.exp.X_add_number |= 1;
>>   }
>>   
>>   /* This is a pseudo-op of the form "adrl rd, label" to be converted
>>
>> If that does not help, then I think that the only thing to do is
>> to add a command line option to control the behaviour of the ADR
>> pseudo-op and a configure time switch to set the default for this
>> option.
> Ok, let's see the test result.
>
> Thanks for your time,
> Romain
>
>> Cheers
>>    Nick
>>
If you want to? do more test, there is no problem.
Thanks for your help
Regards
Christophe
