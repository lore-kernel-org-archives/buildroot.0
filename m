From: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sat, 21 Sep 2019 23:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsodium: add config for
 minimal build
In-Reply-To: <c8da23ce-a30c-42b0-77e6-1cfcacc7063c@mind.be>
References: <20190921091110.18708-1-adrien@gallouet.fr>
 <c8da23ce-a30c-42b0-77e6-1cfcacc7063c@mind.be>
Message-ID: <CAFtSRGAkurYWKaY1B4xH2RCCH04HiExOohtL6+KWWoX59ZP=-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Sep 21, 2019 at 8:17 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>  Hi Adrien,
>
> On 21/09/2019 11:11, Adrien Gallou?t wrote:
> > Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
> > ---
> >  package/libsodium/Config.in    | 9 +++++++++
> >  package/libsodium/libsodium.mk | 4 ++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
> > index 47b9bb350c..e9b9960dae 100644
> > --- a/package/libsodium/Config.in
> > +++ b/package/libsodium/Config.in
> > @@ -4,3 +4,12 @@ config BR2_PACKAGE_LIBSODIUM
> >         A modern and easy-to-use crypto library.
> >
> >         http://libsodium.org/
> > +
> > +if BR2_PACKAGE_LIBSODIUM
> > +
> > +config BR2_PACKAGE_LIBSODIUM_MINIMAL
> > +     bool "minimal"
> > +     help
> > +       Build minimal version.
>
>  Could you extend the help text a little with what this implies, i.e. which
> features are not available in the minimal case?
>
>  Also, in general, it's better to have options that add something rather than
> remove something. Imagine that there is some package that requires a feature
> that is not included in the minimal set. It can then not do something like
> "select !BR2_PACKAGE_LIBSODIUM_MINIMAL".
>
>  So, another way to do this would be to add an option
> BR2_PACKAGE_LIBSODIUM_FULL, and pass --enable-minimal if it is *not* set. This
> option should then default to y to make sure existing configs will still work.
>
> > +
> > +endif
> > diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> > index a94a8271c5..17bccb5796 100644
> > --- a/package/libsodium/libsodium.mk
> > +++ b/package/libsodium/libsodium.mk
> > @@ -14,5 +14,9 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
> >  LIBSODIUM_CONF_OPTS += --disable-pie
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_LIBSODIUM_MINIMAL),y)
> > +LIBSODIUM_CONF_OPTS += --enable-minimal
>
>  Is there also a --disable-minimal? If yes, please use it; if no, please explain
> either in the commit message or a comment.
>
>  Regards,
>  Arnout
>
> > +endif
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> >

I submitted a new patch with a 'full' option. I also think it is
better like this,
projects that use obselete, not recommended or very specific features
should specify their needs.

Best regards,
Adrien
