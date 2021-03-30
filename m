From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:37:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/libqmi: drop unrecognized option
In-Reply-To: <CAAP7uc+qpS+Y9xN=C89jzupCH5qS2-_W_H7smrYa7SqMov57hw@mail.gmail.com>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
 <CAAP7uc+qpS+Y9xN=C89jzupCH5qS2-_W_H7smrYa7SqMov57hw@mail.gmail.com>
Message-ID: <20210330193734.GY24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-03-29 23:46 +0200, Aleksander Morgado spake thusly:
> Hey,
> 
> On Mon, Mar 29, 2021 at 11:22 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > --enable-more-warnings has been dropped since version 1.26.0 and
> > https://github.com/freedesktop/libqmi/commit/9f31a45d5fc137431705d47b83669f35259932b4
> >
> 
> For some context, the build switched to
> AX_COMPILER_FLAGS()+AX_IS_RELEASE() so, when building from a release
> tarball, the build will default to --enable-compile-warnings=yes, and
> when building from a git checkout, the build will default to
> --enable-compile-warnings=error. As long as the buildroot makefile
> relies on stable release tarballs,

And even when working from a git tree, we would not have the .git
directory anyway, so I suppose we'd end up in the "release tarball"
case.

Only people working with LIBQMI_OVERRIDE_SRCDIR set pointing to a
local git clone would fall back into the "defaults to Werror" state.

> -Werror should be always implicitly
> disabled.

But there is a --disable-Werror option, and I think we should use it
unconditionally.

I've done that now, and applied to master, thanks.

Regards,
Yann E. MORIN.

> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libqmi/libqmi.mk | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> > index b02312d702..998952e47d 100644
> > --- a/package/libqmi/libqmi.mk
> > +++ b/package/libqmi/libqmi.mk
> > @@ -13,9 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
> >
> >  LIBQMI_DEPENDENCIES = libglib2
> >
> > -# we don't want -Werror
> > -LIBQMI_CONF_OPTS = --enable-more-warnings=no
> > -
> >  # if libgudev available, request udev support for a better
> >  # qmi-firmware-update experience
> >  ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
> > --
> > 2.30.2
> >
> 
> 
> -- 
> Aleksander
> https://aleksander.es
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
