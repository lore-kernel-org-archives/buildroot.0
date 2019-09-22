From: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sun, 22 Sep 2019 21:54:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libsodium: add config for
 full build
In-Reply-To: <c881d3fd-fe49-f7bf-a98b-fc003274216c@mind.be>
References: <20190921214734.23587-1-adrien@gallouet.fr>
 <c881d3fd-fe49-f7bf-a98b-fc003274216c@mind.be>
Message-ID: <CAFtSRGD=uFx=x52fnn8DSSw2Om06YY_P5m5A60EtvO1--_5EMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Sep 22, 2019 at 2:51 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Adrien,
>
>  Thanks for this update. However, I'll repeat two comments I made earlier, could
> you reply to those? Maybe it's OK as it is, I just want to be sure I understand.
>
> On 21/09/2019 23:47, Adrien Gallou?t wrote:
> > By default, build libsodium in the minimal mode.
> > A new option is added to build seldom used or obsolete (not recommended) functions.
> >
> > Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> >
> > ---
> > Changes v1 -> v2:
> >   - full build (suggested by Arnout Vandecappelle)
> > ---
> >  package/libsodium/Config.in    | 9 +++++++++
> >  package/libsodium/libsodium.mk | 4 ++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
> > index 47b9bb350c..36e2f35df1 100644
> > --- a/package/libsodium/Config.in
> > +++ b/package/libsodium/Config.in
> > @@ -4,3 +4,12 @@ config BR2_PACKAGE_LIBSODIUM
> >         A modern and easy-to-use crypto library.
> >
> >         http://libsodium.org/
> > +
> > +if BR2_PACKAGE_LIBSODIUM
> > +
> > +config BR2_PACKAGE_LIBSODIUM_FULL
> > +     bool "Add seldom used or obsolete functions"
>
>  This should default to y, in order not to break existing configs.
>
> > +     help
> > +       Build libsodium with all functions.
>
>  I would turn the prompt and the help text around. So
>
>         bool "all functions"
>         default y
>         help
>           Build all seldom used and obsolete functions. Without
>           this option, only the minimal set of normally used
>           functions is built.

Yes, this is far better, I'll update the commit this way.

>  It would also be nice if there was a reference (URL) that you could add to show
> which functions are built or not built with this option.

The only information on the minimal set in the documentation is (which
is not completely true):
"The test suite covers all the functions, symbols and macros of a
library built with --enable-minimal".
Also, most of the functions not present in the minimal set are not documented.

>
> > +
> > +endif
> > diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> > index a94a8271c5..9afa09ff37 100644
> > --- a/package/libsodium/libsodium.mk
> > +++ b/package/libsodium/libsodium.mk
> > @@ -14,5 +14,9 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> >  LIBSODIUM_CONF_OPTS += --disable-pie
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_LIBSODIUM_FULL),)
> > +LIBSODIUM_CONF_OPTS += --enable-minimal
>
>  We prefer to be explicit, so --disable-minimal if the other case. If that works.

Sorry, I forgot to point it out, it is not possible.

>
>
>  Regards,
>  Arnout
>
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> >

Best regards,
Adrien
