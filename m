From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Mar 2014 22:40:41 +0100
Subject: [Buildroot] [PATCH] legal-info: extract even no-redistribute
 packages
In-Reply-To: <53223E15.5000504@lucaceresoli.net>
References: <1394663367-11778-1-git-send-email-yann.morin.1998@free.fr>
 <53223E15.5000504@lucaceresoli.net>
Message-ID: <20140314214041.GA16649@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-03-14 00:24 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Currently, if a package is marked _REDISTRIBUTE = NO, then legal-info
> >will not try to extract it first.
[--SNIP--]
> >diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >index 339c3eb..d201a77 100644
> >--- a/package/pkg-generic.mk
> >+++ b/package/pkg-generic.mk
> >@@ -555,15 +555,13 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
> >  endif
> >  $(2)_MANIFEST_LICENSE_FILES ?= not saved
> >
> >-ifeq ($$($(2)_REDISTRIBUTE),YES)
> >-ifneq ($$($(2)_SITE_METHOD),local)
> >-ifneq ($$($(2)_SITE_METHOD),override)
> >+# If the package declares _LICENSE_FILES, we need to extract it,
> >+# for overriden, local or normal remote packages alike.
> >+ifneq ($$($(2)_LICENSE_FILES),)
> >  # Packages that have a tarball need it downloaded and extracted beforehand
> >  $(1)-legal-info: $(1)-extract $(REDIST_SOURCES_DIR_$(call UPPERCASE,$(4)))
> >  $(2)_MANIFEST_TARBALL = $$($(2)_SOURCE)
> >  endif
> >-endif
> >-endif
> 
> You're right Yann.
> Not only we need to extract the sources in order to copy the license
> files.
> We also do _not_ need the extract step in order to save the tarball:
> that was useless (although not harmful -- only wasting a little time).
> 
> As far as the overridden and local packages are concerned, I've always
> found them very useful during development but not for integration,
> when legal-info becomes useful. So I have no strong opinion.

We anyway do *not* save the sources for these packages, as can be seen a
few lines below:

    ifeq ($$($(2)_SITE_METHOD),local)
    # Packages without a tarball: don't save and warn
        @$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)

    else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
        @$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)

So my patch is (partially) wrong: we must not set $(2)_MANIFEST_TARBALL
for local or overriden packages, we *must* set it to "not saved" since
that's what we're doing.

I'll resend a patch in a moment.

> However, if somebody really uses them for integration and they do work,
> then it's correct to extract them for legal-info. If nobody does, then
> the question is irrelevant. So I'm fine with your proposed patch, and
> I like the fact that it removes 5 lines and adds only 1 (comments
> excluded)!
> 
> [tested before and after the patch, enabling and disabling the
> _REDISTRIBUTE and _LICENSE_FILES attributes for a sample package]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Thanks! But as I explained above, I've found an issue with the patch, so
I'm not adding your tags to the next iteration, as it will be different.

You'll however have a chance to add your tags to the next iteration,
of course! Muhaha! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
