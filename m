From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 00:29:15 +0200
Subject: [Buildroot] [PATCH 0/3] Add CONF_ENABLE and CONF_PKG_ENABLE
 helper functions
In-Reply-To: <20120507162139.44a814e9@skate>
References: <1335647781-16536-1-git-send-email-arnout@mind.be>
 <20120507162139.44a814e9@skate>
Message-ID: <4FAD92BB.5040606@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/12 16:21, Thomas Petazzoni wrote:
> Le Sat, 28 Apr 2012 23:16:18 +0200,
> "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>  a ?crit :
>
>> >    Many packages have the following type of construct:
>> >
>> >  ifeq ($(BR2_PACKAGE_ACL),y)
>> >          SYSTEMD_CONF_OPT += --enable-acl
>> >          SYSTEMD_DEPENDENCIES += acl
>> >  else
>> >          SYSTEMD_CONF_OPT += --disable-acl
>> >  endif
>> >
>> >    The first patch in this series abbreviates that to
>> >
>> >  $(eval $(call CONF_PKG_ENABLE,SYSTEMD,acl))
>> >
>> >    It makes it possible to abbreviate similar constructs as well.
> Thanks for working on this and making a proposal.
>
> However, on my side, I am not yet convinced that this is actually
> making things better than what we have now. What we have now is quite
> obvious for the first-time reader, which is very good. Those
> CONF_PKG_ENABLE and CONF_ENABLE macros make things a bit too cryptic
> from my point of view.

  I agree that it looks too cryptic.  Certainly with the eval and call things.
And we should indeed try to keep the package .mk files as intuitive as
possible.

  However, my purpose was not to save a few lines, but rather to make sure
that package contributors do things the correct way.  Specifically, I want
to make it easier for package contributors to explicitly specify --enable
and --disable options.

  I was probably just trying too hard to support all possible use cases.
What about adding something like:

SYSTEMD_AUTO_CONF_ENABLE_DEPS += acl

which would get expanded to the whole ifeq thing in the AUTOTARGETS call?
This only works if the buildroot package name is the same as the
--enable/--disable option, but that already catches many cases.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
