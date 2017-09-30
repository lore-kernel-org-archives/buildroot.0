From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 30 Sep 2017 15:25:37 +0200
Subject: [Buildroot] Build failure in icu-59.1
In-Reply-To: <15ed2c71f0d-c04-477e6@webjas-vac064.srv.aolmail.net>
References: <15ed2c71f0d-c04-477e6@webjas-vac064.srv.aolmail.net>
Message-ID: <c79814ba-9f28-4468-60df-5c41dc4a4ccf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ross,

Please, keep the list in Cc.

Le 30/09/2017 ? 14:33, grunpferd at netscape.net a ?crit?:
> 
> G'day Romain,
> 
> ?
>>>> glibc has been updated to 2.26 recently and the xlocale.h header file has been
>>>> removed.
>>>> See https://sourceware.org/glibc/wiki/Release/2.26#Packaging_Changes
>>>>?
>>>> I tested several packages with this new version but it's difficult to test every
>>>> single packages.
>>>?
>>>> Can you report to the upstream project or if it's already fixed upstream, send
>>>> the patch to the ml?
>>>?
>>> I have have lodged bug report with ICU project. As far as I can tell it has not
>>> been fixed or reported.
>>
>>?http://bugs.icu-project.org/trac/ticket/13385
> 
>>>?
>>> I think your analysis is correct, the advance to glibc 2.26 has flushed out this
>>> problem.
>>> How this gets fixed may depend on the ICU project that has icu 59.1 as their
>>> latest release.
>>> In the mean time buildroot might have to handle this by itself.
> 
>> glibc suggest to replace xlocale.h by locale.h.
>> Can you send a patch doing so ?
>>
>> See http://nightly.buildroot.org/manual.html#submitting-patches
> 
> I have checked that using locale.h instead of xlocale.h does indeed fix the issue.
> 
> Not quite sure how to tackle the patch however!
> 
> Currently digitlst.cpp
> 
> uses:
> #if U_USE_STRTOD_L
> # if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
> # ??include <locale.h>
> # else
> # ??include <xlocale.h>
> # endif
> #endif
> 
> 
> so I presume something like:
> 
> #if U_USE_STRTOD_L
> # if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN?
> ||??__GLIBC_PREREQ(2, 26)
> # ??include <locale.h>
> # else
> # ??include <xlocale.h>
> # endif
> #endif
> 
> I am just not sure how to handle that GLIBC_2.26 part.
> Can we use?__GLIBC_PREREQ(?maj, min)?
> 
> Keeping in mind that glibc <= 2.25 will work while using xlocale.h

xlocale.h shouldn't be used by icu in the first place.

Maybe you can try this patch:
https://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch

Best regards,
Romain

> 
> Regards,
> 
> Ross
> 
> 
