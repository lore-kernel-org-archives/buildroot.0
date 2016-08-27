From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 16:42:46 +0200
Subject: [Buildroot] [PATCH 03/16 v3] doc/asciidoc: add possibility to
 define document dependencies
In-Reply-To: <20160827161415.5767677b@free-electrons.com>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <8b101d01b6a1c1aaadde0649c82fba5db2c511f1.1468750623.git.yann.morin.1998@free.fr>
 <20160827161415.5767677b@free-electrons.com>
Message-ID: <20160827144246.GD5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 16:14 +0200, Thomas Petazzoni spake thusly:
> On Sun, 17 Jul 2016 12:34:23 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
> > index 6e21786..0c10fd1 100644
> > --- a/docs/manual/adding-packages-asciidoc.txt
> > +++ b/docs/manual/adding-packages-asciidoc.txt
> > @@ -63,6 +63,9 @@ information is (assuming the document name is +foo+) :
> >    to one or more directories containing so-called resources (like CSS or
> >    images). By default, empty.
> >  
> > +* +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
> > +  host-packages) that must be built before building this document.
> > +
> >  There are also additional hooks (see xref:hooks[] for general information
> >  on hooks), that a document may set to define extra actions to be done at
> >  various steps:
> > diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> > index 6ab5ad2..ede6ed1 100644
> > --- a/package/doc-asciidoc.mk
> > +++ b/package/doc-asciidoc.mk
> > @@ -140,7 +140,7 @@ endef
> >  ################################################################################
> >  define ASCIIDOC
> >  # Single line, because splitting a foreach is not easy...
> > -$(1)-check-dependencies: asciidoc-check-dependencies
> > +$(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
> 
> My concern is that $(2)_DEPENDENCIES has nothing to do with *checking*
> dependencies, so it's a bit weird to see this added to a target called
> <something>-check-dependencies.

Indeed, that's not the best solution.

It ensures oredering, for sure, and it ensures it is done only once for
the document, even if multiple formats are rquested.

> Could you refresh me on how this $(1)-check-dependencies target is
> used? I had a quick look at the code around and couldn't remember, and
> wanted to look at some other patches in your series.

The $(1)-check-depednencies rule is defined outside of the ASCIIDOC_INNER
macro, in the ASCIIDOC macro, so that we do not redefine it for every
formats.

The dependency on $(1)-check-dependencies is however set in the
INNER_MACRO, as a dependency of the output file $(1).$(6) .

I can see at making that cleaner, but we'll probably have to define
another rule for that. Let's see what I can come up with...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
