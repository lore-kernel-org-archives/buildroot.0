From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 20 Mar 2018 20:53:49 +0100
Subject: [Buildroot] [PATCH 1/2] dropbear: bump to version 2018.76
In-Reply-To: <20180320065132.7a6bo22kvdjxoizv@tarshish>
References: <20180318083659.3512-1-francois.perrad@gadz.org>
 <20180320065132.7a6bo22kvdjxoizv@tarshish>
Message-ID: <CAB0FRsvQv9O1BQ=pf5NWx24+e1HkDu6HUFL1ue6nmB_v5Q74Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-20 7:51 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Francois,
>
> On Sun, Mar 18, 2018 at 09:36:58AM +0100, Francois Perrad wrote:
> > with this new version:
> >   - "configure --enable-static" should now be used instead of
> >     "make STATIC=1"
> >   - any customised options should be put in localoptions.h
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/dropbear/dropbear.hash |  2 +-
> >  package/dropbear/dropbear.mk   | 23 ++++++++---------------
> >  2 files changed, 9 insertions(+), 16 deletions(-)
> >
> > diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.
> hash
> > index 98776e717..ef2011d90 100644
> > --- a/package/dropbear/dropbear.hash
> > +++ b/package/dropbear/dropbear.hash
> > @@ -1,2 +1,2 @@
> >  # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> > -sha256 6cbc1dcb1c9709d226dff669e5604172a18cf5dbf9a201474d5618ae4465098c
> dropbear-2017.75.tar.bz2
> > +sha256 f2fb9167eca8cf93456a5fc1d4faf709902a3ab70dd44e352f3acbc3ffdaea65
> dropbear-2018.76.tar.bz2
> > diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> > index 01a1a07b7..05b6bb4d4 100644
> > --- a/package/dropbear/dropbear.mk
> > +++ b/package/dropbear/dropbear.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ############################################################
> ####################
> >
> > -DROPBEAR_VERSION = 2017.75
> > +DROPBEAR_VERSION = 2018.76
> >  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
> >  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
> >  DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
> > @@ -23,32 +23,25 @@ DROPBEAR_MAKE = \
> >       PROGRAMS="$(DROPBEAR_PROGRAMS)"
> >
> >  ifeq ($(BR2_STATIC_LIBS),y)
> > -DROPBEAR_MAKE += STATIC=1
> > +DROPBEAR_CONF_OPTS += --enable-static
> >  endif
> >
> > -define DROPBEAR_FIX_XAUTH
> > -     $(SED) 's,^#define XAUTH_COMMAND.*/xauth,#define XAUTH_COMMAND
> "/usr/bin/xauth,g' $(@D)/options.h
> > -endef
> > -
> > -DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_FIX_XAUTH
> > -
> >  define DROPBEAR_ENABLE_REVERSE_DNS
> > -     $(SED) 's:.*\(#define DO_HOST_LOOKUP\).*:\1:' $(@D)/options.h
> > +     echo '#define DO_HOST_LOOKUP 1' >> $(@D)/localoptions.h
> >  endef
> >
> >  define DROPBEAR_BUILD_SMALL
> > -     $(SED) 's:.*\(#define NO_FAST_EXPTMOD\).*:\1:' $(@D)/options.h
> > +     echo '#define DROPBEAR_SMALL_CODE 1' >> $(@D)/localoptions.h
> >  endef
> >
> >  define DROPBEAR_BUILD_FEATURED
> > -     $(SED) 's:^#define DROPBEAR_SMALL_CODE::' $(@D)/options.h
>
> You drop the DROPBEAR_SMALL_CODE removal here, which is enabled by default
> in
> default_options.h. We probably need
>
>   echo '#define DROPBEAR_SMALL_CODE 0' >> $(@D)/localoptions.h
>
>
You are right.
With this new release, DROPBEAR_SMALL_CODE is checked with #if instead of
#ifdef,
see
https://github.com/mkj/dropbear/blob/master/libtomcrypt/src/headers/tomcrypt_dropbear.h#L9-L11

Fran?ois

> -     $(SED) 's:.*\(#define DROPBEAR_BLOWFISH\).*:\1:' $(@D)/options.h
> > -     $(SED) 's:.*\(#define DROPBEAR_TWOFISH128\).*:\1:' $(@D)/options.h
> > -     $(SED) 's:.*\(#define DROPBEAR_TWOFISH256\).*:\1:' $(@D)/options.h
> > +     echo '#define DROPBEAR_BLOWFISH 1' >> $(@D)/localoptions.h
> > +     echo '#define DROPBEAR_TWOFISH128 1' >> $(@D)/localoptions.h
> > +     echo '#define DROPBEAR_TWOFISH256 1' >> $(@D)/localoptions.h
> >  endef
> >
> >  define DROPBEAR_DISABLE_STANDALONE
> > -     $(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
> > +     echo '#define NON_INETD_MODE 0' >> $(@D)/localoptions.h
> >  endef
> >
> >  define DROPBEAR_INSTALL_INIT_SYSTEMD
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180320/7071dae2/attachment.html>
