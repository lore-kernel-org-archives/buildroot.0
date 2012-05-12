From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 12 May 2012 11:03:45 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <4FAD92BB.5040606@mind.be>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate> <4FAD92BB.5040606@mind.be>
Message-ID: <CAHXCMM+pyaWT0_jh8Nf6LVQ-xh+1EbA_ZQ-=SXhoZnbXDsbcLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

2012/5/12 Arnout Vandecappelle <arnout@mind.be>:
> On 05/07/12 16:21, Thomas Petazzoni wrote:
>>
>> Le Sat, 28 Apr 2012 23:16:18 +0200,
>> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be> ?a ?crit :
>>
>>> > ? ?Many packages have the following type of construct:
>>> >
>>> > ?ifeq ($(BR2_PACKAGE_ACL),y)
>>> > ? ? ? ? ?SYSTEMD_CONF_OPT += --enable-acl
>>> > ? ? ? ? ?SYSTEMD_DEPENDENCIES += acl
>>> > ?else
>>> > ? ? ? ? ?SYSTEMD_CONF_OPT += --disable-acl
>>> > ?endif
>>> >
>>> > ? ?The first patch in this series abbreviates that to
>>> >
>>> > ?$(eval $(call CONF_PKG_ENABLE,SYSTEMD,acl))
>>> >
>>> > ? ?It makes it possible to abbreviate similar constructs as well.
>>
>> Thanks for working on this and making a proposal.
>>
>> However, on my side, I am not yet convinced that this is actually
>> making things better than what we have now. What we have now is quite
>> obvious for the first-time reader, which is very good. Those
>> CONF_PKG_ENABLE and CONF_ENABLE macros make things a bit too cryptic
>> from my point of view.
>
>
> ?I agree that it looks too cryptic. ?Certainly with the eval and call
> things.
> And we should indeed try to keep the package .mk files as intuitive as
> possible.
>
I agree, IMHO we should keep things as explicit as possible too.

> ?However, my purpose was not to save a few lines, but rather to make sure
> that package contributors do things the correct way. ?Specifically, I want
> to make it easier for package contributors to explicitly specify --enable
> and --disable options.
>
> ?I was probably just trying too hard to support all possible use cases.
> What about adding something like:
>
> SYSTEMD_AUTO_CONF_ENABLE_DEPS += acl
>
> which would get expanded to the whole ifeq thing in the AUTOTARGETS call?
> This only works if the buildroot package name is the same as the
> --enable/--disable option, but that already catches many cases.
>
Actually, this works well only if the --enable/--disable option has
the same name as the dependency itself.
But, I prefer having to 2 lines, one for the _CONF_OPT, this other for
the _DEPENDENCIES.

BTW, there is a similar issue with CMAKETARGETS.

I'd prefer having something like:
SYSTEMD_CONF_OPT += $(call AUTO_ARG_ENDISABLE,acl,$(BR2_PACKAGE_ACL))
SYSTEMD_DEPENDENCIES += $(call COND_DEPS,acl,$(BR2_PACKAGE_ACL))

This kind of helpers can easily be extended to support
--with/--without option for AUTOTARGETS
and all kinds of knobs existing in cmake packages.

Also, doing things like this make the COND_DEPS helper common to
{AUTO,CMAKE,GEN}TARGET;
just the conditional configure helpers belongs to each specific XXXTARGET.


Regards,

Sam
