From: Justin Berger <j.david.berger@gmail.com>
Date: Thu, 7 Apr 2016 11:37:03 -0600
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <20160406043324.GZ3088@tarshish>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
 <20160406043324.GZ3088@tarshish>
Message-ID: <CAPWb3NQ10VRpkjG6CO7PG9EKqVdfvE0f_NSp3UA_6z_pBLeHWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What is the reason for CXXFLAGS over CPPFLAGS? I'm not sure why exactly but
this package in particular doesn't seem to look at CXXFLAGS if CPPFLAGS is
present (which it is due to the autotools-package internals it seems), and
so doesn't catch the C++11 flag and won't compile after that.

I was a little unsure on best practice for setting that flag, so I
basically just copied what directfb.mk does on line 132; where it uses
CPPFLAGS. Although searching through I see sort of an even spread of CXX vs
CPP among autotools packages. But if there is a way to go with CXXFLAGS and
have it work, I have no preference one way or the other.

Have a good one,
Justin

On Tue, Apr 5, 2016 at 10:33 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Justin,
>
> On Tue, Apr 05, 2016 at 08:47:16PM -0600, Justin Berger wrote:
> >
> +################################################################################
> > +#
> > +# ilixi
> > +#
> >
> +################################################################################
> > +
> > +ILIXI_VERSION = 1.0.0
> > +ILIXI_SITE = http://ilixi.org/releases
> > +ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)
> > +ILIXI_LICENSE_FILES = COPYING.LESSER COPYING
> > +ILIXI_INSTALL_STAGING = YES
> > +
> > +ILIXI_DEPENDENCIES =         \
> > +     libsigc         \
> > +     libxml2         \
> > +     directfb        \
> > +     fontconfig      \
> > +
> > +ifeq ($(BR2_PACKAGE_SAWMAN),y)
> > +     ILIXI_CONF_OPTS += --enable-sawman
> > +     ILIXI_DEPENDENCIES += sawman
> > +else
> > +     ILIXI_CONF_OPTS += --disable-sawman
> > +endif
> > +
> > +ILIXI_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
>
> Should be CXXFLAGS and TARGET_CXXFLAGS.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160407/7ea62e98/attachment.html>
