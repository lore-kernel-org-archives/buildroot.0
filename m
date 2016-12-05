From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 5 Dec 2016 22:18:37 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <43f11483-2fa1-3191-b5b0-4ccbaad28903@mind.be>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204212433.GC3433@free.fr> <20161204224100.26768191@free-electrons.com>
 <43f11483-2fa1-3191-b5b0-4ccbaad28903@mind.be>
Message-ID: <f68f3eba-28f0-a3eb-23bc-4954fc05cbd0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, All,

Le 05/12/2016 ? 00:32, Arnout Vandecappelle a ?crit :
> 
> 
> On 04-12-16 22:41, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sun, 4 Dec 2016 22:24:34 +0100, Yann E. MORIN wrote:
>>> Romain, All,
>>
>>>> -     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
>>>> +     $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
>>>> +             build -j $$(PARALLEL_JOBS) $$($(2)_MAKE_OPTS)  
>>>
>>> I'm not against having variables named the same across packages, but
>>> here I think $(2)_BUILD_OPTS would be more appropriate.
>>
>> ACK.
>>
>>>> @@ -84,7 +85,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
>>>>  define $(2)_INSTALL_STAGING_CMDS
>>>>       cd $$(@D) && \
>>>>       $$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
>>>> -             install --destdir=$$(STAGING_DIR)
>>>> +             install --destdir=$$(STAGING_DIR) \
>>>> +             $$($(2)_INSTALL_STAGING_OPTS)  
>>>
>>> Usually, those options entirely override the default ones. For example,
>>> if you provide FOO_INSTALL_STAGING_OPTS for an autotools package, then
>>> the default (just 'install') is lost:
>>>
>>>     package/pkg-autotools.mk:
>>>     159 $(2)_INSTALL_STAGING_OPTS?  ?= DESTDIR=$$(STAGING_DIR) install>>
> 
> 
>  That's autotools, but if you look at cmake, python, and perl, they're basically
> doing it all differently. For example, cmake has a _MAKE_OPTS that is passed for
> all steps; python and perl hardcode the 'install' command.
> 
>  I think we can conclude that consistency is not going to happen, so instead we
> should look for the "best" option. Which means:
> 
>>> OTOH, I find this to be counter-intuitive for a user, and I would prefer
>>> the options to add rather than replace.
>>
>> Agreed. I also find it super annoying that we have to replicate
>> DESTDIR=$$(STAGING_DIR) install. But in some cases, we *do* need to
>> override it.
> 
>  In case of waf, I'm not so sure we're ever going to need to override this.
> autotools has more freedom to shoot yourself in the foot, but waf (like cmake)
> is pretty much fixed.

So basically, you prefer this version than v2 of the series.

> 
>>
>> Another thing that I dislike is that we have no way to pass an option
>> to all of the build and install steps.
> 
>  Yep, and for cmake this is possible. So it would be better to have such an
> option. What I'm not sure of, however, is how this option should be called, and
> also if it should be passed in the configure step or not. Ideally we should have
> more examples.

What's about <pkg>_WAF_OPTS ?
In case of aubio we don't really need to pass --notests for the configure step,
only for build and staging/target install step.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
> 
>>> But consistency trumps it all, so we should do the same for waf
>>> packages:
>>>
>>>     $(2)_INSTALL_STAGING_OPTS ?= install --destdir=$$(STAGING_DIR)
>>
>> I agree. Even if the current situation is not 100% nice, I think a
>> rework of this current situation is a much broader effort. So let's
>> make the waf-package infrastructure be as similar as possible to the
>> other ones.
>>
>> Best regards,
>>
>> Thomas
>>
> 
