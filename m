From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Jul 2015 22:40:43 +0200
Subject: [Buildroot] [PATCH] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <20150719104206.GA4020@free.fr>
References: <1436097417-1809-1-git-send-email-yann.morin.1998@free.fr>
 <559B02FB.8010803@mind.be> <20150719104206.GA4020@free.fr>
Message-ID: <55AC0B4B.1020001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/19/15 12:42, Yann E. MORIN wrote:
> On 2015-07-07 00:36 +0200, Arnout Vandecappelle spake thusly:
>> On 07/05/15 13:56, Yann E. MORIN wrote:
>>> When a package has both a target and a host variants, and there is an
>>> override-srcdir set for the target variant, the host variant should
>>> inherit the target's override-srcdir, unless explicitly set, like we do
>>> for all other target-variant properties.
>>>
>>> Reported-by: Mike <mikez@OpenPlayer.org>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>>  package/pkg-generic.mk | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index 9fe01b8..926d594 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -310,6 +310,12 @@ else
>>>    $(2)_VERSION := $$(call sanitize,$$($(2)_VERSION))
>>>  endif
>>>  
>>> +ifndef $(2)_OVERRIDE_SRCDIR
>>> +  ifdef $(3)_OVERRIDE_SRCDIR
>>> +    $(2)_OVERRIDE_SRCDIR = $$($(3)_OVERRIDE_SRCDIR)
>>> +  endif
>>> +endif
>>
>>  IMHO this should be
>>
>> ifdef $(3)_OVERRIDE_SRCDIR)
>>   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
>> endif
>>
>> i.e. don't set the override if it has been explicitly set to empty. Note that
>> the ifdef is still needed, otherwise the target override will always be set.

[snip]

> 4) with:
> 
>     $ cat local.mk
>     MPC_OVERRIDE_SRCDIR = /path/to/somewhere
>     HOST_MPC_OVERRIDE_SRCDIR = 
> 
>     $ make printvars |grep -E '^[^[:space:]]+_OVERRIDE_SRCDIR' |grep MPC
>     HOST_MPC_OVERRIDE_SRCDIR=/path/to/somewhere ($(MPC_OVERRIDE_SRCDIR))
>     MPC_OVERRIDE_SRCDIR=/path/to/somewhere (/path/to/somewhere)
> 
>     ==> KO
> 
> So, you're right, something's wrong, but it seems to me that the case
> you described (my 3rd test-case) does work as expected, whereas the
> other way around (test-case 4) indeed does not work. Sigh... :-/

 It's actually the fourth case I wanted to describe, I just didn't want to spend
so much text on it :-P

 Regards,
 Arnout

> 
> I'll fix that, thanks!
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
