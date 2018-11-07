From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Nov 2018 23:32:27 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <4eec3fe6-b078-90a2-ceec-c91d97715e8e@mind.be>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
 <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
 <20181107174411.0b67a064@windsurf> <20181107185226.GB4702@scaer>
 <4eec3fe6-b078-90a2-ceec-c91d97715e8e@mind.be>
Message-ID: <20181107223227.GE4702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-07 22:26 +0100, Arnout Vandecappelle spake thusly:
[--SNIP--]
>  Nicolas does have a point, though, that using OVERRIDE_SRCDIR in local.mk is a
> non-intuitive way for doing this. So I have a few ideas to make it a little more
> convenient.
> 
> 1. Add an additional config option to a file that is included just before
> local.mk. So completely equivalent to Thomas's suggestion, but a little
> "cleaner" because you'll get both the configured file and the local.mk as overrides.

I would suggest that we do not add another way of doing what can already
be done with the current infrastructure, especially if it does *exactly*
what is currently doable.

Instead, why not expand the help text, or add some examples to the manual?

> 2. In a BR2_EXTERNAL, a file with a well-known name (e.g. override.mk) is
> included and can contain overrides. Note that you can't specify overrides in the
> external.mk because that is included only after the packages, and _OVERRIDE_DIR
> has to be defined before the package is included.

That would be doable, but I'm not entirely sold on this either...

> 3. Add an addition config option that points to a directory, where each
> subdirectory will be treated as a local override for a package with that name.
> Similar to BR2_GLOBAL_PATCH_DIR.

That would not work if the packages are not flat in that directory (i.e.
if they are grouped by topics in sub-dirs, for example).

> 4. Like 3 but with a well-known name in BR2_EXTERNAL (i.e. everything in
> $(BR2_EXTERNAL_FOO)/override/ is used as an override dir.)

Same issue as (3).

I believe the solution that Thomas proposed is the way to handle those
kinds of setups. I've been using variants of it for ages, and it works
nicely.

The only slight drawback it has, is that it can't easily address packages
which source trees are stored in a br2-external tree. But in the case of
using a tool like repo, that does not change much, because the
br2-external tree *has* to be managed by repo as well, so its location
is known (relative to $(TOPDIR) at least), so it's still doable.

Regards,
Yann E. MORIN.

>  I actually use the equivalent of option 4 by pointing to an override.mk that
> contains
> 
> AUTO_OVERRIDES = $(notdir $(wildcard $(BR2_EXTERNAL_FOO_PATH))/override/*))
> do_override = $(1)_OVERRIDE_SRCDIR = $$(BR2_EXTERNAL_FOO_PATH)/src/$(2)
> $(foreach override,$(AUTO_OVERRIDES),\
>         $(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))
> 
> so it's easy enough to implement that.
> 
> 
>  Regards,
>  Arnout

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
