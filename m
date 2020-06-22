From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jun 2020 06:34:20 -0500
Subject: [Buildroot] [RFC v9 02/10] cpe-info: id prefix/suffix
In-Reply-To: <20200621092316.GC2351@scaer>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-2-matthew.weber@rockwellcollins.com>
 <20200621092316.GC2351@scaer>
Message-ID: <CANQCQpb-k4j56P2NyKwYjpeOpSJqFTmrmYU+FGoBZ_+uXRM72Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,


On Sun, Jun 21, 2020 at 4:24 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> > There are two types of software CPE prefixes applicable for software,
> > one for applications and one for operating systems.
> > Note: The third type is for hardware.
> >
> > This patchset determines which should be used and stores that
> > information with the package for later use when assembling the CPE
> > report.
>
> So this means that the CPE manifest in patch 1 is incomplete, and indeed
> does not represent actual CPE information, right?
>
> In this case, I think we should not create that manifest until we have
> the full information available to generate it.
>
> I am fine with the series introducing the CPE info bit by bit, because
> it is easier to review (thanks! :-) ), but the manifest is useless if
> only parts of the series is applied.
>
> So, the series should probably be something like:
>
>   - introduce basic CPE info from pakcage metadata
>         (patch 1 without the manifest creation)
>
>   - introduce the OS / Application prefix
>
>   - introduce the generic suffix
>
>   - introduce support for the minor-version
>

Good point on ordering

> etc...
>
> See also a comment below...
>
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 1408845613..7d892ca1d6 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -976,11 +976,17 @@ $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
> >  $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
> >  $(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)
> >
> > +ifneq ($(filter linux linux-headers,$(1)),)
> > +$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
> > +else
> > +$(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
> > +endif
>
> I think the CPE ID could be constructed as:
>
>     ifneq ($(filter linux linux-headers,$(1)),)
>     $(2)_CPE_ID = $(CPE_PREFIX_OS)
>     else
>     $(2)_CPE_ID = $(CPE_PREFIX_APP)
>     endif
>
>     $(2)_CPE_ID += $(subst $(space),_,$($(2)_CPE_ID_VENDOR))
>     $(2)_CPE_ID += $(subst $(space),_,$($(2)_CPE_ID_NAME))
>     $(2)_CPE_ID += $(subst $(space),_,$($(2)_CPE_ID_VERSION))
>
>     $(2)_CPE_ID += $(CPE_SUFFIX)
>
> ... and then...
>
> >  $(1)-cpe-info: PKG=$(2)
> >  $(1)-cpe-info:
> >  ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> >       @$$(call MESSAGE,"Collecting cpe info")
> > -     $(Q)$$(call cpe-manifest,$$($(2)_CPE_ID),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
> > +     $(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
>
> ... use $(subst $(space),:,$($(2)_CPE_ID))
>
> The CPE spec, chapter 5.3.2, bullet point 2, states:
>     The underscore (x5f) MAY be used, and it SHOULD be used in place of
>     whitespace characters (which SHALL NOT be used).
>
> So we know there will be no space in any of the fields, and thus any
> existing space is due to our append-assignment, so we can replace the
> spaces with a colon.
>

Thanks, that makes sense and then we don't end up with any spaces to
have to clean up later.

Regards,
Matt
