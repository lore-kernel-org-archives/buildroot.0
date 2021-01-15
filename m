From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 15 Jan 2021 18:01:22 +0100
Subject: [Buildroot] [PATCH] uboot: fix binman with a new dependency
In-Reply-To: <d7be54607e5dc1b892211dfe1970b1cf@walle.cc>
References: <20210112091806.906954-1-francois.perrad@gadz.org>
 <d7be54607e5dc1b892211dfe1970b1cf@walle.cc>
Message-ID: <CAB0FRstTvLNNQwAXr3QfkbBYZdB0nNPzRT6F1SXdJwa+YG38nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 15 janv. 2021 ? 16:36, Michael Walle <michael@walle.cc> a ?crit :

> Hi Francois,
>
> Am 2021-01-12 10:18, schrieb Francois Perrad:
> > since 2021.01, tools/binman is broken.
> > tools/binman/control.py imports pkg_resources
> > the module pkg_resources is supplied by setuptools,
> > so this new dependency is required.
> >
> > binman is used only for building SPL
>
> is it? AFAIK binman is just for generating images and can as
> well be used without SPL. There is also a CONFIG_BINMAN.
> I don't know if we could check the u-boot config for that.
> Otherwise, I guess we'd need yet another "u-boot uses binman"
> config option. I don't think checking of SPL is enough.
>
>
setuptools is a very small package (compared to python itself).
so, I will added it unconditionally with python.

Fran?ois

-michael
>
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  boot/uboot/uboot.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index d2b4e8dc6..a3d949a55 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -167,8 +167,14 @@ endif
> >
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON2),y)
> >  UBOOT_DEPENDENCIES += host-python
> > +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> > +UBOOT_DEPENDENCIES += host-python-setuptools
> > +endif
> >  else ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
> >  UBOOT_DEPENDENCIES += host-python3
> > +ifeq ($(BR2_TARGET_UBOOT_SPL),y)
> > +UBOOT_DEPENDENCIES += host-python3-setuptools
> > +endif
> >  endif
> >
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210115/278437a9/attachment.html>
