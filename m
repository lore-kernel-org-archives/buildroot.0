From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Jun 2016 11:11:43 +0100
Subject: [Buildroot] [PATCH v6] openblas: new package
In-Reply-To: <073ee191-8822-86b6-8e49-cfc0abd0a0c5@mind.be>
References: <1466441142-52096-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160620172736.GB3502@free.fr> <57690DDE.8000404@imgtec.com>
 <638a2dac-5514-724c-8252-6caf62271840@mind.be> <576BAC50.1070605@imgtec.com>
 <073ee191-8822-86b6-8e49-cfc0abd0a0c5@mind.be>
Message-ID: <576D075F.3040907@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On 23/06/16 21:17, Arnout Vandecappelle wrote:
[snip]
>>>>> On 2016-06-20 17:45 +0100, Vicente Olivert Riera spake thusly:
>>> [snip]
>>>>>> +config BR2_PACKAGE_OPENBLAS_TARGET
>>>>>> +	string "OpenBLAS target CPU"
>>>
>>>  This smells fishy to me. Why do we ask the user to fill this in? I mean, if
>>> we're building for power4, does it make sense to set this to e.g. CORE2?
>>>
>>>  In other words, I think this should be a blind option.
>>
>> there are OpenBLAS targets that apply for the same core. For instance:
>>
>> - KATMAI and COPPERMINE are pentium3.
>> - BANIAS and YONAH are pentium_m.
>> - CORE2, PENRYN and DUNNINGTON are core2.
> 
>  Where do you get this information?

KATMAI and COPPERMINE:
https://en.wikipedia.org/wiki/List_of_Intel_Pentium_III_microprocessors

For YONAH and DUNNINGTON I'm not 100% sure.

For CORE2 and PENRYN:
https://en.wikipedia.org/wiki/List_of_Intel_Core_2_microprocessors

>> So as per Thomas suggestion we choose one by default but let the user
>> change it.
> 
>  OK, I've taken a look at the TargetList.txt. I think actually there are not
> many more options than the ones you have listed now, so it _could_ be possible
> to add a choice for the missing ones. Alternatively, we could make the option
> visible only in the cases where there is ambiguity. However, both options would
> complicate things even more than they are now, and we're already at v6, so let's
> stick to the current approach. Still:
> 
> 1. The commit message should clarify this extensively.
> 2. The help text should explain more clearly what the user should choose.
> 
> Commit message:
> 
> OpenBLAS is optimised for specific CPU models, which don't fully match with the
> GCC code generation options. Therefore, we can't automatically select
> BR2_PACKAGE_OPENBLAS_TARGET based on the CPU choice. Instead, let the user
> select the TARGET name, but offer a sensible default. Other possible solutions
> were deemed too complicated: adding choice options in the ambiguous cases, or
> only making the option user-visible when there is ambiguity.
> 
> 
> Help text:
> 
> 	  OpenBLAS target CPU. See TargetList.txt in the source tree for the
> 	  possible target strings. A possible value is set automatically based
> 	  on your Target Architecture Variant.

Ok, I will use them in the next version.

> [snip]
>>>>> Is there an even lower "target CPU" that openBLAS knows of? Or should we
>>>>> just disable openBLAS for the aforementioned CPUs?
>>>>>
>>>>> Note: I haven't looked at the other archs, but arm springs to mind too
>>>>> (what would be the value for armv4, armv5 or armv6? Should it also be
>>>>> disabled for those as well?)
> 
>  It looks like armv4 is not supported and target should be set to ARMV5 or ARMV6
> as appropriate.

Ooops, I forgot about ARMV5 and ARMV6! Thanks.

Regards,

Vincent.

>>>>
>>>> So you want me to disable this package for every core we have in
>>>> Buildroot that doesn't have a matching OpenBLAS core?
>>>
>>>  That depends on whether OpenBLAS works on them or not. This is absolutely not
>>> clear from this patch. Please explain this in the commit log or in comments in
>>> your next version.
>>
>> Well, I think is sensible to enable OpenBLAS only for those BR cores who
>> have an usable OpenBLAS target.
> 
>  It would indeed be better that way, but again that would complicate things too
> much I think. Also, there are some variants that we don't cover now that
> probably would work as well by selecting an appropriate TARGET.
> 
>  Regards,
>  Arnout
> 
> 
