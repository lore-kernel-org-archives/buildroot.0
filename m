From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 22:26:50 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <20181107185226.GB4702@scaer>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
 <20181107174411.0b67a064@windsurf> <20181107185226.GB4702@scaer>
Message-ID: <4eec3fe6-b078-90a2-ceec-c91d97715e8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/11/18 19:52, Yann E. MORIN wrote:
> Nicolas, Thomas, All,
> 
> On 2018-11-07 17:44 +0100, Thomas Petazzoni spake thusly:
[snip]
>> Alternatively, maybe we should decide that linux and u-boot are special

 ... and also barebox, at91bootstrap, at91bootstrap3, arm-trusted-firmware,
mxs-bootlets, and I probably forget a few.

>> packages, and just like for those packages we support fetching from
>> custom tarballs and custom Git repositories, we should support fetching
>> from custom local directories (this is what your patch implements, but
>> until now, we have resisted going into this direction).
> 
> I would say we should not go that route, otherwise it would be difficult
> to resist adding yet more exceptions, for people that have local "forks"
> for some packages. And then it becomes a nightmare to maintain.

 +1

 So I've marked the patch as Rejected in patchwork.


 Nicolas does have a point, though, that using OVERRIDE_SRCDIR in local.mk is a
non-intuitive way for doing this. So I have a few ideas to make it a little more
convenient.

1. Add an additional config option to a file that is included just before
local.mk. So completely equivalent to Thomas's suggestion, but a little
"cleaner" because you'll get both the configured file and the local.mk as overrides.

2. In a BR2_EXTERNAL, a file with a well-known name (e.g. override.mk) is
included and can contain overrides. Note that you can't specify overrides in the
external.mk because that is included only after the packages, and _OVERRIDE_DIR
has to be defined before the package is included.

3. Add an addition config option that points to a directory, where each
subdirectory will be treated as a local override for a package with that name.
Similar to BR2_GLOBAL_PATCH_DIR.

4. Like 3 but with a well-known name in BR2_EXTERNAL (i.e. everything in
$(BR2_EXTERNAL_FOO)/override/ is used as an override dir.)


 I actually use the equivalent of option 4 by pointing to an override.mk that
contains

AUTO_OVERRIDES = $(notdir $(wildcard $(BR2_EXTERNAL_FOO_PATH))/override/*))
do_override = $(1)_OVERRIDE_SRCDIR = $$(BR2_EXTERNAL_FOO_PATH)/src/$(2)
$(foreach override,$(AUTO_OVERRIDES),\
        $(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))

so it's easy enough to implement that.


 Regards,
 Arnout
