From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 00:13:30 +0100
Subject: [Buildroot] [PATCH 04/13 v2] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <5671EF35.4080902@mind.be>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <82f1af6280a8c913d3df331813dec4376fda2fb5.1450031251.git.yann.morin.1998@free.fr>
 <56714B61.8040308@lucaceresoli.net>
 <5671E9E9.4090705@lucaceresoli.net> <20151216230503.GB3448@free.fr>
 <5671EF35.4080902@mind.be>
Message-ID: <20151216231330.GC3448@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-17 00:09 +0100, Arnout Vandecappelle spake thusly:
> On 17-12-15 00:05, Yann E. MORIN wrote:
> > On 2015-12-16 23:47 +0100, Luca Ceresoli spake thusly:
> >> Luca Ceresoli wrote:
> >> [...]
> >>>> +# Download actual sources if they differ from the extracted sources
> >>>> +# (e.g. for external toolchains)
> >>>> +#
> >>>> +# We need to provide PKG and PKGDIR, because there's no .stamp file for
> >>>> +# the legal-info step.
> >>>> +$(1)-legal-source:    PKG=$(2)
> >>>> +$(1)-legal-source:    PKGDIR=$(pkgdir)
> >>>> +$(1)-legal-source:
> >>>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),)
> >>>> +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
> >>>> +    $$(call
> >>>> DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
> >>>> +endif # actuall sources != sources
> >>>
> >>> actuall sources -> actual source
> >>>
> >>>> +endif # actuall source != ""
> >>>
> >>> actuall -> actual
> >>>
> >>> With these fixed:
> >>>  Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
> >>>
> >>> [Tested with a minimal Sourcery ARM 2014.05 config]
> >>> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> >>
> >> Hey, NO! This patch is wrong.
> > [--SNIP--]
> >> with this defconfig:
> >>
> >> BR2_arm=y
> >> BR2_TOOLCHAIN_EXTERNAL=y
> >>
> >> But it breaks online 'make legal-info' when _ACTUAL_SOURCES have not
> >> yet been downloaded, i.e.:
> >>
> >>   $ make clean
> >>   $ rm -fr dl/
> >>   $ make legal-info
> >>   [...]
> >>   cp: cannot stat '/home/murray/devel/buildroot/dl/arm-2014.05-29-arm-none-linux-gnueabi.src.tar.bz2':
> >> No such file or directory
> > 
> > Damit... :-(
> > 
> >> I think this is because you moved the downloading of _ACTUAL_SOURCE
> >> from the $(1)-legal-info to $(1)-legal-source, and the former does not
> >> depend on the latter.
> >>
> >> Perhaps we just need this?
> >>
> >>   $(1)-legal-info: $(1)-legal-source
> > 
> > Nope, that does not work either. The download indeed occurs, but then it
> > can not find a hash for it. Indeed, we do not have ssuch a hash
> > anywhere.
> 
>  Isn't it just that we need to add hashes for the _ACTUAL_SOURCE_TARBALLs that
> we have?

It seems that does the trick, indeed. By "investigate", I really meant
"adding the missing hashes". ;-)

Anyway, I'll do some more tests later this week...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
