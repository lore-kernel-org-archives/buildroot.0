From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 12 Apr 2020 15:54:14 +0200
Subject: [Buildroot] [PATCH] package/jpeg-turbo: Add an option to allow
 tools install
In-Reply-To: <20200412133021.GT29898@scaer>
References: <20200412110632.4901-1-peron.clem@gmail.com>
 <20200412133021.GT29898@scaer>
Message-ID: <CAJiuCcdSJ2HntG=hx1nbgbrpzmou4Y4LFkw47OL42O3ObF_sHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, 12 Apr 2020 at 15:30, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Cl?ment, All,
>
> On 2020-04-12 13:06 +0200, Cl?ment P?ron spake thusly:
> > JPEG Turbo tools are not useless for everybody.
> >
> > Add an option to allow their installation.
> >
> > Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
> > ---
> >  package/jpeg-turbo/jpeg-turbo.mk | 6 ++++--
> >  package/jpeg/Config.in           | 9 +++++++++
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
> > index 126b470630b2..9d487e29c5d3 100644
> > --- a/package/jpeg-turbo/jpeg-turbo.mk
> > +++ b/package/jpeg-turbo/jpeg-turbo.mk
> > @@ -41,10 +41,12 @@ ifeq ($(BR2_STATIC_LIBS),)
> >  JPEG_TURBO_CONF_OPTS += -DCMAKE_POSITION_INDEPENDENT_CODE=ON
> >  endif
> >
> > -define JPEG_TURBO_REMOVE_USELESS_TOOLS
> > +define JPEG_TURBO_REMOVE_TOOLS
> >       rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtran rdjpgcom tjbench wrjpgcom)
> >  endef
> >
> > -JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_USELESS_TOOLS
> > +ifneq ($(BR2_PACKAGE_JPEG_TURBO_TOOLS),y)
>
> We usually have the conditional block also encompass the hook
> definition.
>
> > +     JPEG_TURBO_POST_INSTALL_TARGET_HOOKS += JPEG_TURBO_REMOVE_TOOLS
>
> we usually do not indent the variable assignments.

Thanks for the explanation and taking care of this.
I will follow these rules next time.

Regards,
Clement

>
> > +endif
> >
> >  $(eval $(cmake-package))
> > diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
> > index 3d0fea83b182..11ea01daf35b 100644
> > --- a/package/jpeg/Config.in
> > +++ b/package/jpeg/Config.in
> > @@ -38,6 +38,15 @@ config BR2_PACKAGE_JPEG_TURBO
> >
> >         http://www.libjpeg-turbo.org
> >
> > +config BR2_PACKAGE_JPEG_TURBO_TOOLS
> > +     bool "jpeg-turbo tools"
> > +     depends on BR2_PACKAGE_JPEG_TURBO
> > +     default n
>
> No need for 'default n' since.. this is the default.
>
> I also noved that out of the choice, because the layout becomes slightly
> weird.
>
> I also moved it to its own Config.in.options in the jpeg-turbo
> directory.
>
> Pushed to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > +     help
> > +       Libjpeg-turbo can also provide some tools like  cjpeg,
> > +       djpeg, jpegtran, rdjpgcom, tjbench and wrjpgcom.
> > +       If you want to keep them enable this option.
> > +
> >  # libjpeg from br2-external trees, if any
> >  source "$BR2_BASE_DIR/.br2-external.in.jpeg"
> >
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
