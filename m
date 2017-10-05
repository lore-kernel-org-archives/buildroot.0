From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 19:50:14 +0200
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <20171005101312.GA9688@pirotess.bf.iodev.co.uk>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
 <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
 <20171005101312.GA9688@pirotess.bf.iodev.co.uk>
Message-ID: <8ffd6e7b-4a9e-e23b-38b1-2144ea207705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 12:13, Ismael Luceno wrote:
> On 04/Oct/2017 18:35, Arnout Vandecappelle wrote:
> <...>
>>  The solution (probably) is to use $(PKG) instead of $(pkgname).
> 
> I see.
> 
>>> +# github(user[,package[,version]]): returns site of GitHub repository
>>> +github = https://github.com/$(1)/$(or $(2),$(pkgname))/archive/$(or $(3),$($(call UPPERCASE,$(pkgname))_VERSION))
>>
>>  Could you estimate how many packages could be simplified with this?
> 
> A great deal, including axel, in 219 out of 380 the repo matches the
> package name, with 30 also matching the username.

 Hm, not convincing enough for me. It saves just a tiny little bit of typing, it
does not make things more readable, and it adds complexity to the github macro
itself. No, I don't think it's worth it.


>> I'm not actually sure this is a good idea anyway. The _VERSION is OK
>> because it works for *all* packages, the third argument is only needed
>> when you use the github helper outside a package (e.g. for a custom
>> kernel URL). But this change will apply only to a limited number of
>> packages on the one hand, and on the other hand it makes it even more
>> difficult for people to understand what is meant with this $(call
>> github,foo) construct.
> 
> It's "magic" anyway. It would perhaps make sense to implement this kind
> of rules via rewriting AXEL_SITE, it could be something descriptive like:
> 
> 	AXEL_SITE = @ github user:axel-download-accelerator repo:libtls
> 
> Here's a mockup: http://tmp.iodev.co.uk/rtest.mk

 Here also I don't think the added complexity in the implementation is worth it.
It is indeed a bit more explicit, but now you have to remember that the
arguments are called user: and repo:. For me,
$(call github,axel-download-accelerator,libtls) is an easy-to-remember way to
refer to https://github.com/axel-download-accelerator/libtls.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
