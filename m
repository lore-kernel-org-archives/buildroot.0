From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 10:52:47 +0200
Subject: [Buildroot] [PATCH 1/2] infra/pkg-perl: add possibility to pass
 extra env at configure time
In-Reply-To: <CAB0FRstemp5dMy_OCsrJWztjA_519S1q9A=B9MyzsUkur9e61w@mail.gmail.com>
References: <1405206164-10189-1-git-send-email-yann.morin.1998@free.fr>
 <CAB0FRstemp5dMy_OCsrJWztjA_519S1q9A=B9MyzsUkur9e61w@mail.gmail.com>
Message-ID: <20140713085247.GA3588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-13 09:05 +0200, Fran?ois Perrad spake thusly:
> I've already push the same patch in patchwork
> see http://patchwork.ozlabs.org/patch/367111/

Ah, right, I missed it.

However, the commit log for your patch is very terse, when compared to
mine.

I don't care to withdraw my patch and use yours, but the commit log
should have more info. I'll get your patch (to keep you as author) and
will complement the commit log with mine, and then resend.

But at least, you and I coming with the same patch means I was not
completely off my shoes! ;-)

Regards,
Yann E. MORIN.

> 2014-07-13 1:02 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Some perl package may use environment variables as a hint to how to be
> > configured.
> >
> > That's for example the case for perl-net-ssleay that uses
> > OPENSSL_PREFIX, if it is set in the environment, as the prefix to
> > openssl.
> >
> > Add a new variable that packages can set if they need extra environment
> > variables. Update the manual accordingly.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Francois Perrad <fperrad@gmail.com>
> > ---
> >  docs/manual/adding-packages-perl.txt | 4 ++++
> >  package/pkg-perl.mk                  | 4 ++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
> > index 4062646..52c18b9 100644
> > --- a/docs/manual/adding-packages-perl.txt
> > +++ b/docs/manual/adding-packages-perl.txt
> > @@ -104,6 +104,10 @@ cases, typical packages will therefore only use a few of them.
> >    configure options to pass to the +perl Makefile.PL+ or +perl Build.PL+.
> >    By default, empty.
> >
> > +* +PERL_FOO_CONF_ENV+/+HOST_PERL_FOO_CONF_ENV+, to specify additional
> > +  environment variables to pass to the +perl Makefile.PL+ or
> > +  +perl Build.PL+. By default, empty.
> > +
> >  * +PERL_FOO_BUILD_OPT+/+HOST_PERL_FOO_BUILD_OPT+, to specify additional
> >    options to pass to +make pure_all+ or +perl Build build+ in the build step.
> >    By default, empty.
> > diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
> > index 5cfdc77..5867ccd 100644
> > --- a/package/pkg-perl.mk
> > +++ b/package/pkg-perl.mk
> > @@ -50,6 +50,7 @@ ifeq ($(4),target)
> >  define $(2)_CONFIGURE_CMDS
> >         cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> >                 PERL_MM_USE_DEFAULT=1 \
> > +               $$($(2)_CONF_ENV) \
> >                 perl Build.PL \
> >                         --config ar="$$(TARGET_AR)" \
> >                         --config full_ar="$$(TARGET_AR)" \
> > @@ -71,6 +72,7 @@ define $(2)_CONFIGURE_CMDS
> >         else \
> >                 PERL_MM_USE_DEFAULT=1 \
> >                 PERL_AUTOINSTALL=--skipdeps \
> > +               $$($(2)_CONF_ENV) \
> >                 perl Makefile.PL \
> >                         AR="$$(TARGET_AR)" \
> >                         FULL_AR="$$(TARGET_AR)" \
> > @@ -96,6 +98,7 @@ else
> >  define $(2)_CONFIGURE_CMDS
> >         cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
> >                 PERL_MM_USE_DEFAULT=1 \
> > +               $$($(2)_CONF_ENV) \
> >                 perl Build.PL \
> >                         --install_base $$(HOST_DIR)/usr \
> >                         --installdirs vendor \
> > @@ -103,6 +106,7 @@ define $(2)_CONFIGURE_CMDS
> >         else \
> >                 PERL_MM_USE_DEFAULT=1 \
> >                 PERL_AUTOINSTALL=--skipdeps \
> > +               $$($(2)_CONF_ENV) \
> >                 perl Makefile.PL \
> >                         INSTALL_BASE=$$(HOST_DIR)/usr \
> >                         INSTALLDIRS=vendor \
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
