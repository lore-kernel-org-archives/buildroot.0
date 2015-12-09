From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 8 Dec 2015 22:59:10 -0200
Subject: [Buildroot] [PATCH] libsemanage: fix build error when linking
 with ustr
In-Reply-To: <20151208205910.GW4188@free.fr>
References: <1449174328-8317-1-git-send-email-sergio.prado@e-labworks.com>
 <20151208205910.GW4188@free.fr>
Message-ID: <CANu7NGsUH=0-z+OpynK7B4hwBOtQ1bck5Zb0VEZUd6PKAG_vtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-12-08 18:59 GMT-02:00 Yann E. MORIN <yann.morin.1998@free.fr>:

> Sergio, All,
>
> Thanks for your patch! :-)
>
> On 2015-12-03 18:25 -0200, Sergio Prado spake thusly:
> > Disable ustr inline functions to avoid multiple definition of symbols
> error
> > when linking with ustr.
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/e7012c7a734dbdd1c697cf63b6df6e834e8eafc7
> >
> http://autobuild.buildroot.net/results/0783a63e4694ffa8463ef5533b635c7e7c43dd42
> >
> http://autobuild.buildroot.net/results/40726abf3419a727c5762ef2791dbf53fa1736c0
> >
> http://autobuild.buildroot.net/results/a6a0c827c393a5fb41653d71d1ee50df283a32fb
> > ...
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> As Thomas already pointed to, there is already a two-patch series to fix
> the issue by bumping and fixing ustr itself.


> So I've marked your patch as rejected in our patchwork:
>     https://patchwork.ozlabs.org/patch/552445/


OK.


>
>
> Thanks! :-)
>

Thanks,


>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/libsemanage/libsemanage.mk | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/
> libsemanage.mk
> > index 197c14e4229a..ea9f4c9f67de 100644
> > --- a/package/libsemanage/libsemanage.mk
> > +++ b/package/libsemanage/libsemanage.mk
> > @@ -13,10 +13,15 @@ LIBSEMANAGE_INSTALL_STAGING = YES
> >
> >  LIBSEMANAGE_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
> >
> > +# disable ustr inline functions to avoid multiple definition of symbols
> > +# error when linking
> > +LIBSEMANAGE_CFLAGS = $(TARGET_CFLAGS) -DUSTR_CONF_COMPILE_USE_INLINE=0
> > +
> >  define LIBSEMANAGE_BUILD_CMDS
> >       # DESTDIR is needed during the compile to compute library and
> >       # header paths.
> > -     $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS) DESTDIR=$(STAGING_DIR)
> all
> > +     $(MAKE) -C $(@D) $(LIBSEMANAGE_MAKE_OPTS)
> CFLAGS="$(LIBSEMANAGE_CFLAGS)" \
> > +             DESTDIR=$(STAGING_DIR) all
> >  endef
> >
> >  define LIBSEMANAGE_INSTALL_STAGING_CMDS
> > --
> > 1.9.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151208/fccc12fd/attachment.html>
