From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 08:48:25 +0100
Subject: [Buildroot] [PATCH v4,
 2/3] package/gobject-introspection: export cc in g-ir-scanner
In-Reply-To: <CAFSsvmrpj=Dzpz6GLO6FEha7WJ1H7bgD-bP4jtRNOm0em9c1Ug@mail.gmail.com>
References: <20200312194632.3787015-1-aduskett@gmail.com>
 <20200312194632.3787015-2-aduskett@gmail.com>
 <20200314172204.GP705@scaer>
 <CAFSsvmrpj=Dzpz6GLO6FEha7WJ1H7bgD-bP4jtRNOm0em9c1Ug@mail.gmail.com>
Message-ID: <20200315074825.GR705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, ll,

On 2020-03-14 17:40 -0700, Adam Duskett spake thusly:
> On Sat, Mar 14, 2020 at 10:22 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-03-12 12:46 -0700, aduskett at gmail.com spake thusly:
> > > From: Adam Duskett <Aduskett@gmail.com>
> > > Without this export, the host variant of g-ir-scanner will call the host
> > > gcc for linking.
[--SNIP--]
> > > +export CC="$(dirname "${0}")/../../../../bin/@BASENAME_TARGET_CC@"
> > HHhmmm. I remember that I said I wanted the wrapper to still be
> > relocatable. But it is in staging (sysroot) while the compiler is in
> > host dir, so you added that many .././/.. needed to got from there to
> > there.
> >
> > But look at the line below: we already have HOST_DIR:
> >
> > >  ${HOST_DIR}/bin/g-ir-scanner \
> >    ^^^^^^^^^^^
> >
> > So, just:
> >
> >     export CC="${HOST_DIR}/bin/@BASENAME_TARGET_CC@"
> >
> > Or did we miss something?
> 
> That's what I had originally and you said to change it to this!

That's not exactly what you did, which was:

    export CC=@TARGET_CC@

and:

    $(SED) "s%@TARGET_CC@%$(TARGET_CC)%g" $(STAGING_DIR)/usr/bin/g-ir-scanner

So, even if it would use the same path, it is not semantically
equivalent.

> Make up your mind! These patches take 2 - 3 weeks each to be reviewed
> and it is fairly annoying when a request for a change comes through, I make that
> change quickly, the changes sit for several weeks, and then a new
> request to revert
> the change that was originally requested comes in.

Sorry, but as you know well, this is a volunteer effort, and there is
always so much time available, and so many patches pending.

I agree that it can be frustrating, yes. I've been there too. We've all
been there...

But please, be sure that your work is very welcome. It's just that the
goi is so baly borked by design that it makes the topic so complex.

And when applying something, I like to at least have the impression that
I do understand the problkem and that the fix, how ugly it is, is indeed
the only solution.

> I will remake the patch with
> HOST_DIR again.

Thank you for staying on board! :-)

Regards,
Yann E. MORIN.

> Adam
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >  --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
> > >  --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
> > > diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> > > index 9043390857..a508957904 100644
> > > --- a/package/gobject-introspection/gobject-introspection.mk
> > > +++ b/package/gobject-introspection/gobject-introspection.mk
> > > @@ -104,6 +104,8 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
> > >               $(INSTALL) -D -m 755 \
> > >                       $(GOBJECT_INTROSPECTION_PKGDIR)/$(w).in $(STAGING_DIR)/usr/bin/$(w)
> > >       )
> > > +     $(SED) "s%@BASENAME_TARGET_CC@%$(notdir $(TARGET_CC))%g" $(STAGING_DIR)/usr/bin/g-ir-scanner
> > > +
> > >       # Gobject-introspection installs Makefile.introspection in
> > >       # $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
> > >       # build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
> > > --
> > > 2.24.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
