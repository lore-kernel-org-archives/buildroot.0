From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 18 Apr 2020 10:00:32 -0700
Subject: [Buildroot] [PATCH 3/4] package/openjdk: copy all directories
 and files when installing
In-Reply-To: <20200418122128.GP5853@scaer>
References: <20200417232922.3762195-1-aduskett@gmail.com>
 <20200417232922.3762195-3-aduskett@gmail.com>
 <20200418122128.GP5853@scaer>
Message-ID: <CAFSsvmo-qP1RzwDKH1492Lyc+-CoYsdmZ1J5Zg-9_9UHFve_sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 18, 2020 at 5:21 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Adam, All,
>
> On 2020-04-17 16:29 -0700, aduskett at gmail.com spake thusly:
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > Several directories and files are currently not installed during the
> > target installation, these include:
> >   - conf
> >     Several configuration files, including security configuration files which
> >     may be necessary for running various java applications.
> >
> >   - legal
> >     This directory contains legal notices that some java applications may
> >     require.
>
> At runtime, really?
>
Unfortunately yes, as they can be used by some applications to print
legal information,
which means if these files exist an exception is thrown.

> >   - release
> >     This directory contains a list of modules included in the image.
> >
> > Because these directories take up less than of megabyte extra, it is not an
> > issue to install all of them.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/openjdk/openjdk.mk | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> > index d540b65edc..19e71e98b2 100644
> > --- a/package/openjdk/openjdk.mk
> > +++ b/package/openjdk/openjdk.mk
> > @@ -124,9 +124,7 @@ endef
> >  # which makes manual installation necessary.
> >  define OPENJDK_INSTALL_TARGET_CMDS
> >       mkdir -p $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> > -     cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
> > -             $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> > -     cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
> > +     cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
> >               $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
> >       cd $(TARGET_DIR)/usr/bin && ln -snf ../../$(OPENJDK_INSTALL_BASE)/bin/* .
> >  endef
> > --
> > 2.25.2
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
