From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 2 Nov 2018 11:05:48 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <5b88530949cb4aaf93436bcbc36f9fbf@SOC-EX01V.e01.socionext.com>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com> <20181101062448.GC8261@x230>
 <20181101105513.GB4937@smart-ThinkPad-T410>
 <7ba255c0-e72e-7e02-d972-f8f082ce5214@mind.be> <20181101161918.GA30470@x230>
 <20181102021259.GA8966@smart-ThinkPad-T410>
 <5b88530949cb4aaf93436bcbc36f9fbf@SOC-EX01V.e01.socionext.com>
Message-ID: <4c5ee82c-00eb-33e6-6ec1-fc4f21eba039@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/11/18 08:55, yamada.masahiro at socionext.com wrote:
> Hi.
> 
>> -----Original Message-----
>> From: Nasser [mailto:afshin.nasser at gmail.com]
>> Sent: Friday, November 02, 2018 11:13 AM
>> To: Petr Vorel <petr.vorel@gmail.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>; buildroot at buildroot.org;
>> Matthew Weber <matthew.weber@rockwellcollins.com>; Angelo Compagnucci
>> <angelo.compagnucci@gmail.com>; Yamada, Masahiro/?? ??
>> <yamada.masahiro@socionext.com>
>> Subject: Re: [PATCH] merge_config.sh: Fix merging buildroot config files
>>
>> Hi Petr, Arnout,
>> On Thu, Nov 01, 2018 at 05:19:19PM +0100, Petr Vorel wrote:
>>> Hi Arnout,
>>>
>>>>> Removing unset will cause the following make command work wrong. Note
>>>>> that the value of this environment variable is checked [1] and used.
>> The
>>>>> result of removing the unset line is that we will have double BR2_
>>>>> prefixes in the final .config file as well as lots of warnings when
>>>>> checking if all specified config values have been taken.
>>>
>>>>  We have no prefix, the BR2_ is mere convention. So when calling
>> merge_config,
>>>> we should set CONFIG_ to empty, not to BR2_.
>>>
>>>>  So indeed, the unset should be removed.
>>>
>>> +1. I overlooked that regexp works with empty $CONFIG_ as well.
>>> Thanks for explanation.
>> As we discussed earlier [1], setting CONFIG_ to empty, makes most comments
>> to
>> be identified as config fragments and generate false warnings.
> 
> I was also being worried about this.
> 
> We could improve the sed pattern.
> 
> How about this?
> https://patchwork.kernel.org/patch/10665119/

 Perhaps it's better to make the entire pattern explicit, like:

SED_CONFIG_EXP="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*$\|^#
\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1\2/p"

(\1\2 works because only one of the two subexpressions matches, so either \1 or
\2 must be empty).

 Regards,
 Arnout
