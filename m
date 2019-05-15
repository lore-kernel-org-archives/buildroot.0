From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 21:07:35 +0300
Subject: [Buildroot] [PATCH 2/5] package/wpebackend-fdo: bump to version
 1.2.0
In-Reply-To: <CAB0FRsuK9U0+Gv=HCivDwtjwjD9MmBnicKfxGPsHBe-Q0BGxHg@mail.gmail.com>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190514114111.20424-3-aperez@igalia.com>
 <CAB0FRsuK9U0+Gv=HCivDwtjwjD9MmBnicKfxGPsHBe-Q0BGxHg@mail.gmail.com>
Message-ID: <20190515210735.GD5634@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 15 May 2019 08:53:39 +0200, Fran?ois Perrad <francois.perrad@gadz.org> wrote:
> Le mar. 14 mai 2019 ? 14:24, Adrian Perez de Castro <aperez@igalia.com> a
> ?crit :
> 
> > WPE WebKit 2.24.x requires WPEBackend-fdo 1.2.x, as indicated at:
> >
> >   https://wpewebkit.org/release/schedule/#compatible-components
> >
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
> >  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash
> > b/package/wpebackend-fdo/wpebackend-fdo.hash
> > index 6e6f9f0e3f..4d89d1e16f 100644
> > --- a/package/wpebackend-fdo/wpebackend-fdo.hash
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.hash
> > @@ -1,7 +1,7 @@
> > -# From https://wpewebkit.org/releases/wpebackend-fdo-1.0.1.tar.xz.sums
> > -md5 <https://wpewebkit.org/releases/wpebackend-fdo-1.0.1.tar.xz.sums-md5>
> > 2ee81a4212c18110a06a0c51c12e0d2e wpebackend-fdo-1.0.1.tar.xz
> > -sha1 cdc6ac95e302a2358204b766936a9bf8ef4f26f2 wpebackend-fdo-1.0.1.tar.xz
> > -sha256 15b8b1febea5d9c271e95c35b3c1e13f870712a54bc5f689cfdbb96e2f070fc8
> > wpebackend-fdo-1.0.1.tar.xz
> > +# From https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums
> > +md5 <https://wpewebkit.org/releases/wpebackend-fdo-1.2.0.tar.xz.sums+md5>
> > 74e1b2fc2bc19933b17ff4f8435f67cd wpebackend-fdo-1.2.0.tar.xz
> > +sha1 60559697512fd483c1d918b708a3d1d130b74a0a wpebackend-fdo-1.2.0.tar.xz
> > +sha256 b1bb261273772af8f7d96d94989fc2ed0445ec06c7eb21f47a1b94e52422ddd5
> > wpebackend-fdo-1.2.0.tar.xz
> >
> >  # Hashes for license files:
> >  sha256 c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825
> > COPYING
> > diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk
> > b/package/wpebackend-fdo/wpebackend-fdo.mk
> > index 5842861bac..15530ec45f 100644
> > --- a/package/wpebackend-fdo/wpebackend-fdo.mk
> > +++ b/package/wpebackend-fdo/wpebackend-fdo.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> >  ################################################################################
> >
> > -WPEBACKEND_FDO_VERSION = 1.0.1
> > +WPEBACKEND_FDO_VERSION = 1.2.0
> >  WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
> >  WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
> >  WPEBACKEND_FDO_INSTALL_STAGING = YES
> >
> 
> Here, I need to add this hook:
> 
> # CMake found the wayland-scanner in $(STAGING_DIR), we need the one in
> $(HOST_DIR)
> define WPEBACKEND_FDO_FIX_WAYLAND_SCANNER
>     $(SED) "s:/usr/bin/wayland-scanner:$(HOST_DIR)/bin/wayland-scanner:;" \
>         $(@D)/CMakeFiles/WPEBackend-fdo.dir/build.make
> endef
> 
> WPEBACKEND_FDO_POST_CONFIGURE_HOOKS += WPEBACKEND_FDO_FIX_WAYLAND_SCANNER

Ouch, this looks ugly, but thanks a lot to point out this issue. We can do
better, so I just made a pull request to the upstream project with a patch
that improves the CMake code to make it smarter so it searches in the $PATH
first, and also to allow passing the path to wayland-scanner manually in the
CMake command (which always takes precedence, of course), see:

    https://github.com/Igalia/WPEBackend-fdo/pull/39

For v2 of the patch set I plan to include the above patch :-)


Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190515/06331d11/attachment.asc>
