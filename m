From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 20:10:56 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/sqlite: fix BUG_85180 build
 timeout
In-Reply-To: <5bd8815c-5183-2e54-da01-f5cf77e730ce@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
 <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
 <20190522135906.30796-2-giulio.benetti@micronovasrl.com>
 <20190524222459.2fc91773@windsurf.home>
 <6dcdb1eb-5d48-e773-9711-1df461c542e2@micronovasrl.com>
 <3e1c735b-0639-ffaf-9d96-7b51920668fc@micronovasrl.com>
 <20190527113754.48973b30@windsurf>
 <88dab430-b338-8bac-92a2-026777946561@micronovasrl.com>
 <20190527114657.093a6fc8@windsurf>
 <5bd8815c-5183-2e54-da01-f5cf77e730ce@micronovasrl.com>
Message-ID: <804fa487-03ea-5f5e-7867-6c5b44317585@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

adding Atharva+

Il 27/05/2019 12:20, Giulio Benetti ha scritto:
> Il 27/05/2019 11:46, Thomas Petazzoni ha scritto:
>> On Mon, 27 May 2019 11:44:45 +0200
>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>
>>> Il 27/05/2019 11:37, Thomas Petazzoni ha scritto:
>>>> Hello,
>>>>
>>>> On Mon, 27 May 2019 11:06:06 +0200
>>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
>>>>>>> I cannot reproduce this timeout, and you don't have any autobuilder
>>>>>>> failure. Could you provide a configuration that exhibits the 
>>>>>>> failure ?
>>>>>
>>>>> Sure, the problems comes out building libnss with gcc4.9/5/6/7.
>>>>> Here is pastebin of my savedefconfig:
>>>>> https://pastebin.com/wmR8Dme3
>>>>
>>>> I still don't understand. You're mentioning libnss, but your defconfig
>>>> does not have libnss enabled. Am I missing something ?
>>>
>>> Oh sorry, I use that defconfig and then I give:
>>> "make libnss"
>>>
>>> that causes 85180.
>>
>> But then what is the relationship with sqlite ? Your original patch,
>> which I'm replying to, is about fixing a build timeout in sqlite.
> 
> Ah yes, sqlite is a dependency of libnss.
> And now I've found that it happens only with Gcc 4.9
> I've been confused because when compiling sqlite3.c file it takes a very 
> long time with Gcc 5/6/7/8/9 and I thought they hanged.
> Instead it hangs only with Gcc 4.9, so it's a different Gcc bug, not 85180.
> Need to check in gcc bugzilla, otherwise I should submit a new bug.

It's a Gcc 4.9 only bug that I need to submit to gcc bugzilla.

Atharva built it and found it hangs while compiling sqlite3.c as me.

So, after submitting Gcc bug I'm going to add that bug to toolchain's 
Config.in and setting -O0 in sqlite.mk if that bug=y

Then I rewrite commit log and resubmit, but at this point this is not 
part of this patchset.

Right?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
