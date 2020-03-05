From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 5 Mar 2020 13:23:19 -0700
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.18.0
In-Reply-To: <20200305210537.42d4c081@windsurf>
References: <20200303230943.24334-1-james.hilliard1@gmail.com>
 <20200305210537.42d4c081@windsurf>
Message-ID: <CADvTj4p7bNSX6C+Y6Lo_cuHMT+4ifdJgckm2mEPX1tvyFyMTdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2020 at 1:05 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> +Arnout, as there is a meson/pkg-config question.
>
> Thanks for the patch. Two questions below.
>
> On Tue,  3 Mar 2020 16:09:43 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> > index e325c6d752..6de92f63d9 100644
> > --- a/package/wayland/wayland.mk
> > +++ b/package/wayland/wayland.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -WAYLAND_VERSION = 1.17.0
> > +WAYLAND_VERSION = 1.18.0
> >  WAYLAND_SITE = http://wayland.freedesktop.org/releases
> >  WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
> >  WAYLAND_LICENSE = MIT
> > @@ -13,12 +13,12 @@ WAYLAND_INSTALL_STAGING = YES
> >  WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
> >  HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
> >
> > -# 0002-configure-add-option-to-disable-tests.patch
> > -WAYLAND_AUTORECONF = YES
> > +WAYLAND_CONF_OPTS = \
> > +     -Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
>
> Are you sure this is needed since commit
> 4e0bc29993376613d200e892d491e31ea5a49622 ? Indeed, with this commit,
> meson is properly able to use pkg-config either for native builds or
> cross builds.
It was failing for me without this.
>
> > +     -Dtests=false \
> > +     -Ddocumentation=false
> >
> > -# wayland-scanner is only needed for building, not on the target
> > -WAYLAND_CONF_OPTS = --with-host-scanner --disable-tests
>
> So how is the scanner thing working these days? With the meson build
> logic, it doesn't build the scanner when cross-compiling, and knows
> that it should use a pre-installed scanner ?
Yes, it knows there is a pre-installed scanner due to this:
-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig
See:
https://github.com/wayland-project/wayland/blob/1.18.0/src/meson.build#L57-L59
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
