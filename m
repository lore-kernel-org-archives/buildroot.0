From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Oct 2014 23:46:39 +0200
Subject: [Buildroot] [PATCH 22/25 v6] doc/asciidoc: always apply
 Buildroot's AsciiDoc config
In-Reply-To: <CAAXf6LUr6kTc_xxjVy=-QChiXbNqSmed24JsD_M1jhesTmmOyA@mail.gmail.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <56d23e0edc01ab534df783446c9891e600a61431.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LUr6kTc_xxjVy=-QChiXbNqSmed24JsD_M1jhesTmmOyA@mail.gmail.com>
Message-ID: <20141002214639.GD19775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-02 12:17 +0200, Thomas De Schampheleire spake thusly:
> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > As suggested by Thomas: the AsciiDoc options we use ensure we get a sane
> > output of the document. We want that configuration to be applied to
> > other documents as well.
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
> 
> The above two snippets almost are the same and at first I thought this
> was a merge/rebase issue.
> In fact, one of the comments should change.

Yup, 'output-specifc' is superfluous in first comment.

> Moreover, I have been staring at this patch for several minutes to
> verify if I misunderstood something. The confusing thing is that
> variable $(2)_ASCIIDOC_BR_CONF, which can expand to
> MANUAL_ASCIIDOC_BR_CONF or SOMEDOC_ASCIIDOC_BR_CONF will both contain
> the same common value docs/conf/asciidoc.conf, while the name of the
> variable suggests that it is document-specific.
> 
> Strictly speaking, you have following levels:
> 
> - buildroot conf for all formats
> - buildroot conf for a specific format
> - <doc> conf for all formats
> - <doc> conf for a specific format
> 
> Currently, the variables mapped on this are (respectively)
> 
> $(2)_ASCIIDOC_BR_CONF
> $(2)_$(4)_ASCIIDOC_BR_CONF
> $(2)_ASCIIDOC_CONF
> $(2)_$(4)_ASCIIDOC_CONF
> 
> while I would find it more logical to have:
> 
> BR_ASCIIDOC_CONF
> BR_$(4)_ASCIIDOC_CONF
> $(2)_ASCIIDOC_CONF
> $(2)_$(4)_ASCIIDOC_CONF

I've reworked that patch to account for your comments, and include the
configuration filers in the order you suggest above.

It is indeed much better. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
