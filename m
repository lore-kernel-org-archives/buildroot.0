From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Feb 2014 11:26:43 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <20140206093724.52c0fb0f@skate>
References: <patchbomb.1391597406@argentina>	<ab1e96c7872d5567b2a4.1391597410@argentina>	<20140205134957.463211f6@skate>	<CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>	<20140205141626.654ac08a@skate>	<52F2AB5A.8000006@mind.be>
 <20140206093724.52c0fb0f@skate>
Message-ID: <52F36363.5060004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/14 09:37, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Wed, 05 Feb 2014 22:21:30 +0100, Arnout Vandecappelle wrote:
> 
>>> WARNING: options --disable-foo --enable-bar unsupported
>>>
>>> If you have gazillions of options that are unsupported, then you may
>>> very well miss an option passed by your .mk file on which you made a
>>> typo, for example.
>>>
>>> So having a long list of options to disable documentation is not
>>> something that I personally like that much, but I believe Arnout does
>>> not share the same opinion :)
>>
>>  I have a mixed opinion about this...
>>
>>  I do think that the configure options should ideally be as exact as
>> possible. However, documentation is something that is wont to cause hard
>> to track build failures
> 
> Not sure what you meant here. Will those build failures be hard to
> track, or *not* hard to track ?
> 
> Remember that the Free Electrons autobuilder builds run in a chroot
> that has only the minimal hard dependencies required by Buildroot. This
> typically allows us to catch invisible dependencies on asciidoc or
> other documentation utilities.

 Yes, and this is exactly the problem. On the autobuilders, autotools
will detect that asciidoc is missing and will not build documentation. On
a user's machine, however, autotools will detect that asciidoc is present
and use it, but then /usr/bin/asciidoc will try to use host-python
instead of /usr/bin/python and fails because of some missing modules.

> 
>> , e.g. trying to run system asciidoc with host
>> python, or system makeinfo with host-perl. So if we remove it from the
>> defaults, then we should make sure that _all_ autotools packages disable
>> their documentation.
> 
> Indeed.
> 
>>  Hm, now I think about that, it would actually be a good idea to do
>> that... We currently still miss some of these cases because we assume
>> --disable-documentation works, but if we make a habit of paying attention
>> to it, then there is less risk of this happening.
> 
> So your conclusion is that instead of passing those options globally,
> we should pass them in a per-package basis, so that we remember to
> always verify that the documentation disabling has been done?

 Exactly.

 But of course that's a large change, since all 846 autotools packages
would have to be checked...

 So let's start with not adding anything to the global CONF_OPT :-)

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
