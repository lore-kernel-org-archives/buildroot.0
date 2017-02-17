From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2017 08:56:52 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
 the various providers
In-Reply-To: <20170216175648.GD4986@free.fr>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
 <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
 <20170216175648.GD4986@free.fr>
Message-ID: <c29bd185-70aa-7641-1ff0-285ef2d2565b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-02-17 18:56, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-02-16 18:46 +0100, Arnout Vandecappelle spake thusly:
>> On 14-02-17 22:13, Yann E. MORIN wrote:
[snip]
>>> Since we can not protect against this situation in the Config.in files
>>> (especially because providers may be out-of-tree), we can only check for
>>> the validity after the fact.
>>
>>  Perhaps it would be possible to create a new opengl virtual package, and that
>> the libgl* providers provide opengl instead of the specific libgl. So libgl etc.
>> would no longer be virtual packages by themselves, but just suboptions of
>> opengl. The libgl* consumers would depend on BR2_PACKAGE_HAS_LIBGL but add
>> opengl to their dependencies instead of libgl.
> 
> I don't like it, because it means that it is no longer possible to have
> out-of-tree providers (e.g. in a br2-external tree).
> 
> (If I understood correctly what you are proposing.)

 Probably not :-) My proposal would break current out-of-tree providers (and
consumers), but new providers would still be possible.

 The idea is that libgl, libgles and libegl would no longer be virtual packages.
Instead, opengl would be a virtual package, with three suboptions
BR2_PACKAGE_HAS_LIBGL, BR2_PACKAGE_HAS_LIBGLES and BR2_PACKAGE_HAS_LIBEGL, each
of which would select BR2_PACKAGE_HAS_OPENGL. A provider would select one of the
suboptions (which implicitly selects HAS_OPENGL), and would set only
BR2_PACKAGE_PROVIDES_OPENGL to itself. A consumer would depend on one of the
suboptions in the Config.in file, and add opengl to its DEPENDENCIES in the .mk
file. BR2_PACKAGE_HAS_OPENGL itself would not be used except by the
virtual-package infra.

 Basically, it boils down to reusing the existing infra for detecting
conflicting providers of virtual packages.


>>  Clearly this alternative is too invasive for 2017.02, so your patch is still valid.
>>
>>>
>>> Fixes:
>>>     http://autobuild.buildroot.org/results/6f1/6f197c643972e92f0b27b3afac7da7b4b1115f7e/
>>>     http://autobuild.buildroot.org/results/6c6/6c6e0a236bde7b892a69119a49422119f3efaa97/
>>>     http://autobuild.buildroot.org/results/5a2/5a2a1503b7d19c0ca5b0e9093aa24ed9c020e812/
>>
>>  Does the autobuilder script filter out errors like these? If not, the
>> autobuilder errors will not be fixed, they'll just move...
> 
> Clearly, the autobuilder scripts will have to learn to catch this, as
> they are currently catching the multiple-providers case.
> 
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>>  package/opengl/opengl.mk | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/package/opengl/opengl.mk b/package/opengl/opengl.mk
>>> index abf96d5..47902f2 100644
>>> --- a/package/opengl/opengl.mk
>>> +++ b/package/opengl/opengl.mk
>>> @@ -1 +1,30 @@
>>>  include $(sort $(wildcard package/opengl/*/*.mk))
>>> +
>>> +# Ensure consistency betwenn the various GL providers:
>>> +
>>> +# If we have a libgl provider, then the libegl provider must be the same
>>> +ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_HAS_LIBEGL),yy)
>>> +# No need to qstrip, both are quoted
>>> +ifneq ($(BR2_PACKAGE_PROVIDES_LIBGL),$(BR2_PACKAGE_PROVIDES_LIBEGL))
>>> +$(error Provider for libgl ($(BR2_PACKAGE_PROVIDES_LIBGL)) is not the same \
>>> +	as for libegl ($(BR2_PACKAGE_PROVIDES_LIBEGL)))
>>> +endif
>>> +endif
>>
>>  Shouldn't all this be protected by BR_BUILDING?
> 
> I was wondering if we should have it, so that we could re-enter the
> menuconfig in case of error, but it seems that it was not needed.
> 
> And we do not want to allow 'make source' either, sonce the
> configuration is invalid.
> 
> What are you trying to protect against (here) with BR_BUILDING?

 I didn't thing really hard about it, that's why it was a question :-) It's just
that most of this kind of stuff is protected by BR_BUILDING. But indeed, the
check in virtual-package isn't, and that's what we try to emulate here, so it's OK.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
