From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 5 Jun 2019 12:50:19 +0000
Subject: [Buildroot] [PATCH 1/1] package/exiv2: cleanup options and
 licenses
In-Reply-To: <032fd98f-fda9-8b80-658e-453001b3b063@mind.be>
References: <20190507103639.94701-1-nicolas.serafini@sensefly.com>
 <bdcad4a5-2ba7-ed8c-8fc3-3de53bd2aa0d@mind.be>
 <20190508102742.0000138c@sensefly.com>
 <8e7755d7-831f-4945-d04f-b63d9ebc67c2@mind.be>
 <20190604182559.2a52cf10@gmx.net>
 <032fd98f-fda9-8b80-658e-453001b3b063@mind.be>
Message-ID: <20190605145017.00003e94@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Peter,

On Wed, 5 Jun 2019 00:59:03 +0200 Arnout Vandecappelle <arnout@mind.be> wrote:

>On 04/06/2019 18:25, Peter Seiderer wrote:
>> Hello Arnout, Nicolas,
>> 
>> On Wed, 8 May 2019 10:44:38 +0200, Arnout Vandecappelle
>> <arnout@mind.be> wrote: 
>>> On 08/05/2019 10:27, Nicolas Serafini wrote:  
>>>>>>  config BR2_PACKAGE_EXIV2_LENSDATA
>>>>>> -	bool "Nikon lens name database"
>>>>>> -	depends on !BR2_PACKAGE_EXIV2_COMMERCIAL
>>>>>> +	bool "Include lens data"  
>>>>> How big is this lens data? Is it worth keeping an option for it?  
>>>> Yes you are right we can remove it. The binary is only 80KB less
>>>> with the lensdata option disabled.
>>>>
>>>> Do I need to add a Config.in.legacy option if I remove it.  
>>>
>>>  No, same as for the _COMMERCIAL option. The legacy handling is
>>> there to make sure that people who update Buildroot and had some
>>> option enabled will be able to do whatever is needed to keep the
>>> same behaviour.
>>>
>>>  It is useful to mention explicitly in the commit message why
>>> legacy handling is skipped. Something like: "Legacy handling for
>>> the removed options _COMMERCIAL and _LENSDATA is not needed, since
>>> now they are always enabled."  
>> 
>> Disagree with this reasoning, o.k. for the enable-_LENSDATA option,
>> NAK for the _COMMERCIAL one (users who selected _COMMERCIAL before
>> will now get GPL-2.0+ without warning/notice)...  
>
> OK, so I studied this in a bit more detail, and it's actually more
> complicated
>than that...
>
> The Nikon lens data has a different license, which is this:
>
>// Free use in non-commercial, GPL or open source software only!
>// Please contact me for adding lenses or use in commercial software.
>
> So the problem is not so much that you force GPL; it is that you are
> not
>allowed to use this in commercial software.
>
> So, at first sight, we should keep the LENSDATA option as an option,
> mention in
>the help text that it cannot be used for commercial use, and if the
>option is selected update EXIV2_LICENSE with something like
>"Rottmerhusen non-commercial license" and add src/nikonmn_int.cpp to
>EXIV2_LICENSE_FILES.
>
> However, I wonder about the validity of this thing. First, the piece
> of code is
>just a database - in principle, it's not copyrightable. Second, the
>same database is also included in exiftool, and that source code
>doesn't have a similar clause (exiftool is Artistic-licensed). Third,
>I tried to look up the real source
>(https://eur02.safelinks.protection.outlook.com/?url=http%3A%2F%2Frottmerhusen.com&amp;data=02%7C01%7Cnicolas.serafini%40sensefly.com%7C59de32933c1d477ebd4208d6e9403ee9%7Cff7d991b392248038418ab806a3414a6%7C1%7C0%7C636952859484138627&amp;sdata=Y69lDoAl88GHxTx5uQh9jybvxYENiDudLZ2d2QUNw5U%3D&amp;reserved=0)
>but that site has gone down and the wayback machine doesn't give me
>anything with such a license.
>
> If we would package exiv2 now, we probably never would have noticed
> this
>license issue...
>
>
> So, let's go for the simple and pragmatic solution: keep the
> _LENSDATA option,
>maybe mention in the help text something about the non-commercial use.
>
> Which is, essentially, v1 of this patch...
>
> Nicolas, sorry for the back-and-forth, and thank you for your
> patience.

Thanks for your feedback I prepare a patch v4.

>
> Peter, thanks for finding this issue.
>
> Regards,
> Arnout
>
>> 
>> Regards,
>> Peter
>>   
>>>  
>>>> The default
>>>> state in exiv2 CMakeList is enabled.  
>>>
>>>  It is a good idea to still add the -D...=ON explicitly, because:
>>> - it makes sure that the same behaviour is kept if the default
>>> changes; and
>>> - if the option changes name, is removed, ... there is a warning in
>>> the configure step, so there's a better chance that whoever is
>>> doing the bump will notice it.
>>>
>>>  Regards,
>>>  Arnout
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> https://eur02.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.busybox.net%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=02%7C01%7Cnicolas.serafini%40sensefly.com%7C59de32933c1d477ebd4208d6e9403ee9%7Cff7d991b392248038418ab806a3414a6%7C1%7C0%7C636952859484148621&amp;sdata=HU4Z4xAyVjW3V001nozXz7wRd8wgaNq%2F0JXzjj1Ttos%3D&amp;reserved=0  
>>   
