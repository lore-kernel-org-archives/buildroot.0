From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 23:11:41 +0100
Subject: [Buildroot] [PATCH 04/13 v2] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <5671F164.3080504@mind.be>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
 <5671F164.3080504@mind.be>
Message-ID: <20151218221141.GH27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-17 00:19 +0100, Arnout Vandecappelle spake thusly:
> On 13-12-15 19:35, Yann E. MORIN wrote:
> > Almost all packages which are saved for legal-info have their source
> > archives downloaded as part of 'make source', which makes an off-line
> > build completely possible [0].
> > 
> > However, for the pre-configured external toolchains, the source tarball
> > is different, as the main tarball is a binary package. And that source
> > tarball is only downloaded during the legal-info phase, which makes it
> > inconvenient for full off-line builds.
> > 
> > We fix that in two steps:
> > 
> >   - first, we move the declaration of _ACTUAL_SOURCE_TARBALL and _SITE
> >     earlier in the pkg-generic.mk file, so we get those definitions at
> >     the time we define the -source and -all-source rules;
> 
>  I don't see why this is needed: they are first use at exactly the place where
> they were originally defined.

Yep. That was nto the case in a previous iteration (that I did not
post), and the code has changed since then, but I overlooked that part
of the commit log. Will fix it.

>  That said, these definitions fit much better where you put them now (just after
> the handling of _SOURCE), so keep it this way. Could be a seperate patch but not
> really required for me.

Yep, I'll split and keep the move, so the code is "nicer". ;-)

> >   - second, we add a new rule, $(1)-legal-source which only
> >     $(1)-all-source depends on, so that we only download it for a
> >     top-level 'make source', not as part of the standard download
> >     mechanism (i.e. only what is really needed to build).
> > 
> > This way, we can do a complete [0] off-line build and are still able to
> > generate legal-info, while at the same time we do not incur any download
> > overhead during a simple build.
> > 
> > Also, we previously downloaded the _ACTUAL_SOURCE_TARBALL when it was
> > not empty. 
> 
>  I haven't tested, but according to me this code already did the right thing:
> 
> ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>     $$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> endif
> 
>  It is true, however, that the original code didn't handle the case where a
> package explicitly declares ACTUAL_SOURCE_TARBALL to be empty.

Yes, everything was downloaded, even missing pieces.

However, this patch is about getting the missing pieces when running
'make source' for completely-offline builds.

What was previously broken was;

    make menuconfig
    [enable whatever, like an external toolchain with an actual source]
    make source
    [unplug your ehternet cable, disable WiFi, get under a tunnel to
     avoid 3g...]
    make legal-info

-> broken, it tries to download the actual sources.

What this patch does is;

  - 'make source' will also download the actual sources

  - but since it can take some time to do so, we do not want to do it
    for a simple build, like just runnint 'make'

> > However, since _ACTUAL_SOURCE_TARBALL default to the value of
> > _SOURCE, it can not be empty when _SOURCE is not. Thus, we'd get a
> > spurious report of a missing hash for the tarball, since it was not in
> > a standard package rule (configure, build, install..) and thus would
> > miss the PKG and PKGDIR variables to find the .hash file.
> > 
> > We fix that in this commit as well, by:
> > 
> >   - setting PKG and PKGDIR just for the -legal-source rule;
> 
>  Have we still not gotten rid of PKGDIR? How silly...

Hmm... It;s used elsewhere in the code, so I stick to it.

Removing can be another series.

[--SNIP--]
> > +$(2)_ACTUAL_SOURCE_TARBALL ?= $$($(2)_SOURCE)
> > +$(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
> 
>  This is not really related to this patch (it was like that in the original),
> but why do we qstrip here?

Good question. I just moved the code around.

> > @@ -627,6 +635,10 @@ $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
> >  
> >  $(1)-source:		$$($(2)_TARGET_SOURCE)
> >  
> > +$(1)-all-source:	$(1)-legal-source
> > +
> > +$(1)-legal-source:	$(1)-source
> 
>  As noted by Luca, we're missing a -legal-info -> legal-source dependency here.

Yup, already fixed here. Thanks! :-)

> >  $(1)-source-check:
> >  	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
> >  
> > @@ -764,13 +776,19 @@ endif
> >  endif
> >  endif
> >  
> > -# If FOO_ACTUAL_SOURCE_TARBALL is explicitly defined, it means FOO_SOURCE is
> > -# indeed a binary (e.g. external toolchain) and FOO_ACTUAL_SOURCE_TARBALL/_SITE
> > -# point to the actual sources tarball. Use the actual sources for legal-info.
> > -# For most packages the FOO_SITE/FOO_SOURCE pair points to real source code,
> > -# so these are the defaults for FOO_ACTUAL_*.
> > -$(2)_ACTUAL_SOURCE_TARBALL ?= $$($(2)_SOURCE)
> > -$(2)_ACTUAL_SOURCE_SITE    ?= $$(call qstrip,$$($(2)_SITE))
> > +# Download actual sources if they differ from the extracted sources
> > +# (e.g. for external toolchains)
> > +#
> > +# We need to provide PKG and PKGDIR, because there's no .stamp file for
> > +# the legal-info step.
> > +$(1)-legal-source:	PKG=$(2)
> > +$(1)-legal-source:	PKGDIR=$(pkgdir)
> > +$(1)-legal-source:
> > +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
> > +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> > +	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> 
>  Actually we should have the same kind of logic here as in _ALL_DOWNLOADS, to
> allow for multiple ACTUAL_SOURCE_TARBALLs and different SITEs. And that would
> also remove the need for the ACTUAL_SOURCE_SITE. And if we use a foreach, it
> would remove the need to check for an empty TARBALL. But of course, all that is
> not for this patch :-)

Yup, can be done later.

> > @@ -907,6 +922,7 @@ endif
> >  	$(1)-show-depends \
> >  	$(1)-show-version \
> >  	$(1)-source \
> > +	$(1)-legal-source \
> 
>  The rest of .PHONY is kept alphabetically ordered...

OK, fixed.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
