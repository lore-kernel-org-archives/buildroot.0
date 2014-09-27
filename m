From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Sep 2014 14:56:38 +0200
Subject: [Buildroot] [PATCH 22/25 v6] doc/asciidoc: always apply
 Buildroot's AsciiDoc config
In-Reply-To: <CAHXCMMJgg7qJQCruYG58ujDMWCtgTCCxMMEJecQQB4e=KhpHOA@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
 <CAHXCMMJgg7qJQCruYG58ujDMWCtgTCCxMMEJecQQB4e=KhpHOA@mail.gmail.com>
Message-ID: <20140927125638.GE4298@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-09-27 13:21 +0200, Samuel Martin spake thusly:
> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > +# Include output-specific Asciidoc configuration: first, Buildroot's
> > +# configuration, then the document's configuration
> > +ifneq ($$(wildcard $$($(2)_ASCIIDOC_BR_CONF)),)
> > +$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_BR_CONF)
> > +endif
> >  ifneq ($$(wildcard $$($(2)_ASCIIDOC_CONF)),)
> >  $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_ASCIIDOC_CONF)
> >  endif
> >
> > +# Include output-specific Asciidoc configuration: first, Buildroot's
> > +# configuration, then the document's configuration
> > +$(2)_$(4)_ASCIIDOC_BR_CONF = docs/conf/asciidoc-$(4).conf
> > +ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_BR_CONF)),)
> > +$(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_BR_CONF)
> > +endif
> >  $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
> >  ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
> >  $(2)_$(4)_ASCIIDOC_OPTS += -f $$($(2)_$(4)_ASCIIDOC_CONF)
> > @@ -136,6 +147,7 @@ $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced:
> >
> >  $(1)-prepare-sources: $$(BUILD_DIR)/docs/$(1)/.stamp_doc_rsynced
> >
> > +$(2)_ASCIIDOC_BR_CONF = docs/conf/asciidoc.conf
> >  $(2)_ASCIIDOC_CONF = $(3)/asciidoc.conf
> 
> It's a bit odd to have *_ASCIIDOC{,_BR}_CONF definitions after using
> them, whereas teh output-specific config file is defined just before
> using it.

That's because the definitions of $(2)_ASCIIDOC_CONF and $(2)_ASCIIDOC_BR_CONF
are common to all of that document, so we define them in ASCIIDOC, not
_INNER, or they'd be redefined every time _INNER is expanded.

OTOH, the $(2)_$(4)_ASCIIDOC_CONF and $(2)_$(4)_ASCIIDOC_BR_CONF are
different for each output type, so they only get defined in _INNER.

> Anyway, it has no impact on the behavior of the infra, so:

No impact on the behaviour, indeed, but no need to redefine the same
variable to the same value over-and-over again (well, just 5 times, but
still.)

> Reviewed-by: Samuel Martin <s.martin49@gmail.com>

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
