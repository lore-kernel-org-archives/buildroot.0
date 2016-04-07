From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Apr 2016 23:24:47 +0300
Subject: [Buildroot] [PATCH] ilixi: new package
In-Reply-To: <CAPWb3NT=hjjpgdxq-kwf7VD+Sko7VJz=aChNUvk3LW-bUQhXzQ@mail.gmail.com>
References: <1459910836-12815-1-git-send-email-j.david.berger@gmail.com>
 <20160406043324.GZ3088@tarshish>
 <CAPWb3NQ10VRpkjG6CO7PG9EKqVdfvE0f_NSp3UA_6z_pBLeHWQ@mail.gmail.com>
 <20160407195002.GB3088@tarshish>
 <CAPWb3NT=hjjpgdxq-kwf7VD+Sko7VJz=aChNUvk3LW-bUQhXzQ@mail.gmail.com>
Message-ID: <20160407202447.GC3088@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 07, 2016 at 02:10:37PM -0600, Justin Berger wrote:
> Ah. That makes sense, I feel somewhat chagrined for never realizing that
> CPPFLAGS was C Pre-Processor as opposed to C++.
> 
> Would it be better to patch out configure.ac here instead of using CFLAGS?

If you push such a patch upstream that would be best. Upstream takes pull 
requests at https://github.com/ilixi/ilixi, so that shouldn't be hard.

> I imagine the main way people learn to prepare packages is by looking at
> other packages, and so this might throw people off.

baruch

> On Thu, Apr 7, 2016 at 1:50 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Thu, Apr 07, 2016 at 11:37:03AM -0600, Justin Berger wrote:
> > > What is the reason for CXXFLAGS over CPPFLAGS?
> >
> > CPPFLAGS is usually for options that affect the C pre-processor. The most
> > common pre-processor options are -I (include path), and -D (for macros).
> > CXXFLAGS is for C++ options like -std=c++11. See
> > http://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html.
> >
> > > I'm not sure why exactly but this package in particular doesn't seem to
> > look
> > > at CXXFLAGS if CPPFLAGS is present (which it is due to the
> > autotools-package
> > > internals it seems), and so doesn't catch the C++11 flag and won't
> > compile
> > > after that.
> >
> > Unfortunately configure.ac does
> >
> >   CXXFLAGS="$CFLAGS"
> >
> > which overwrites the environment CXXFLAGS. It should have been
> >
> >   CXXFLAGS="$CXXFLAGS $CFLAGS"
> >
> > In this case I think you should use CFLAGS.
> >
> > > I was a little unsure on best practice for setting that flag, so I
> > > basically just copied what directfb.mk does on line 132; where it uses
> > > CPPFLAGS.
> >
> > That's because this line adds a pre-processor -I option.
> >
> > > Although searching through I see sort of an even spread of CXX vs CPP
> > among
> > > autotools packages. But if there is a way to go with CXXFLAGS and have it
> > > work, I have no preference one way or the other.
> >
> > baruch
> >
> > > On Tue, Apr 5, 2016 at 10:33 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > > > On Tue, Apr 05, 2016 at 08:47:16PM -0600, Justin Berger wrote:
> > > > >
> > > >
> > +################################################################################
> > > > > +#
> > > > > +# ilixi
> > > > > +#
> > > > >
> > > >
> > +################################################################################
> > > > > +
> > > > > +ILIXI_VERSION = 1.0.0
> > > > > +ILIXI_SITE = http://ilixi.org/releases
> > > > > +ILIXI_LICENSE = LGPLv3+, GPLV3+ (osk utf8-decoder)
> > > > > +ILIXI_LICENSE_FILES = COPYING.LESSER COPYING
> > > > > +ILIXI_INSTALL_STAGING = YES
> > > > > +
> > > > > +ILIXI_DEPENDENCIES =         \
> > > > > +     libsigc         \
> > > > > +     libxml2         \
> > > > > +     directfb        \
> > > > > +     fontconfig      \
> > > > > +
> > > > > +ifeq ($(BR2_PACKAGE_SAWMAN),y)
> > > > > +     ILIXI_CONF_OPTS += --enable-sawman
> > > > > +     ILIXI_DEPENDENCIES += sawman
> > > > > +else
> > > > > +     ILIXI_CONF_OPTS += --disable-sawman
> > > > > +endif
> > > > > +
> > > > > +ILIXI_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
> > > >
> > > > Should be CXXFLAGS and TARGET_CXXFLAGS.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
