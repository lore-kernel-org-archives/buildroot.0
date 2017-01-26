From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Thu, 26 Jan 2017 18:27:36 +0100
Subject: [Buildroot]
 =?utf-8?q?=5BPATCH_1/2=5D_Add_BR2=5FCMAKE=5FUSE=5FNIN?=
 =?utf-8?q?JA=5FBACKEND_option?=
In-Reply-To: <20170125142716.55e7d7b3@free-electrons.com>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <ef982565-16ec-591b-aaed-d22e5a634851@gmail.com>
 <2260e784237284271ff7745986b82cc8@openmailbox.org>
 <e48cfb34-6f4c-1c7b-c737-c5a57eb464e0@gmail.com>
 <20170125142716.55e7d7b3@free-electrons.com>
Message-ID: <901720b443e9bb90750a71c8797bbf0d@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain, Thomas, and all,

Le 2017-01-24 22:48, Romain Naour a ?crit :
> Yes, something like that but It's just a proposal...
> 
> <package>_SUPPORT_NINJA_BACKEND = YES in the .mk
> (with default to N0)
> 
> ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
> ifeq ($$($(2)_SUPPORT_NINJA_BACKEND),YES)
> $(2)_CONF_OPTS += -G Ninja
> $(2)_DEPENDENCIES += host-ninja
> endif
> endif

Yes, that could be a good solution to use ninja whenever possible and 
keep other few packages compiling with make backend.

> So, yes Ninja is slightly faster than Make.
> It would be great if you can add some test results in the commit log.

OK, I can do that.


Le 2017-01-25 02:27, Thomas Petazzoni a ?crit?:
> But then that's a bit annoying because we would have to explicitly
> set this option to "YES" on all packages that support the Ninja backend
> (most likely the majority).
> 
> I think it would make more sense to default the other way around, i.e
> default to YES, and set it to NO on the few packages that do not
> properly support the Ninja backend.
> 
> Or maybe better: do not introduce a per-package option for the moment,
> have only the global one, see in practice how many packages work /
> don't work and decide if we need a per-package option, and what default
> value it should have.

OK, but it seems that Romain has already noticed a problem with 
openpowerlink, so it is likely that this option will be necessary - and 
hopefully default to YES (supported).

> So we're saving between 1 and 2 seconds of build time, while host-ninja
> requires building host-python or host-python3 ?
> 
> Seeing those numbers, the whole thing seems really pointless to me.
> You're saving 1-2 seconds of build time, but you've got a full Python
> interpreter to build.
> 
> Would it be possible to get numbers on the overall build time showing
> what Ninja is improving?

Yes, you're right. Unless we use python and ninja from the host if 
available, instead of compiling them, but this is not the right solution 
I suppose (although this is done for CMake!...).

I agree that a few seconds are not much!... And I agree that we are 
loosing much more time to compile host packages.

So, why did I want to introduce this option?

Because I'm not using Buildroot in one-shot mode. I'm developping in a 
Buildroot environment. So I often make foo-rebuild my package, and I'm 
interested in saving time for each rebuild.

I know this is not what Buildroot is designed for. (Yet, there are a few 
things that seem to be present for dev mode (rsync with OVERRIDE_SRCDIR 
for example), so this is not "pure one-shot" either.)

In conclusion, I would say that this option is useful to me - not much, 
just for a few seconds - but maybe makes no sense for buildroot 
upstream, since it increases build time.

It's up to you. I won't be offended if the patch is refused. I don't 
want to introduce something that will break Buildroot philosophy.

Regards,

-- 
C?dric
