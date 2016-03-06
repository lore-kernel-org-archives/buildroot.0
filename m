From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Mar 2016 11:25:53 +0100
Subject: [Buildroot] [PATCH 11/16 v4] core/legal-info: also save patches
In-Reply-To: <56DA1E1E.4060501@lucaceresoli.net>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <f1466d9d2ab2a3e2abc1f4a167e7ad38d12c2d61.1454536753.git.yann.morin.1998@free.fr>
 <56DA1E1E.4060501@lucaceresoli.net>
Message-ID: <20160306102553.GC3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-03-05 00:45 +0100, Luca Ceresoli spake thusly:
> I have a late remark, see below.

Eh! ;-)

> On 03/02/2016 23:22, Yann E. MORIN wrote:
[--SNIP--]
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 432a153..055dbdb 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -776,12 +776,10 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
> >  endif
> >  $(2)_MANIFEST_LICENSE_FILES ?= not saved
> >  
> > -# If the package declares _LICENSE_FILES, we need to extract it,
> > -# for overriden, local or normal remote packages alike, whether
> > -# we want to redistribute it or not.
> > -ifneq ($$($(2)_LICENSE_FILES),)
> > +# We need to extract and patch a package to be able to retrieve its
> > +# license files (if any) and the list of patches applied to it (if
> > +# any).
> >  $(1)-legal-info: $(1)-patch
> > -endif
> 
> A few lines below we have a dependency on $(1)-source. Always
> depending on $(1)-patch makes it useless, so we also should do:

Well, we do need $(1)-patch, because a patch may change the licensing
info (i.e. add a new license, add a LICENSE file or some such), so
depending on -source is not enough.

>  ifeq ($$($(2)_REDISTRIBUTE),YES)
>  ifneq ($$($(2)_SITE_METHOD),local)
>  ifneq ($$($(2)_SITE_METHOD),override)
>  # Packages that have a tarball need it downloaded beforehand
> -$(1)-legal-info: $(1)-source $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +$(1)-legal-info: $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
>  endif
>  endif

Hmmm... I'm not sure I am following you here... Are yoiu saying that we
need not depend on -source because we already depend on -patch, above?

> But beware this might conflict with the patch I just sent to fix the
> ifeq()s on the same few lines ('legal-info: fix detection of "override"
> packages'). Simple to fix anyway.

Eh! ;-)

Regards,
Yann E. MORIN.

> This does not invalidate your patch, it's just a piece of code that
> will become redundant with your changes.
> 
> -- 
> Luca

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
