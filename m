From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 15:22:16 +0300
Subject: [Buildroot] [PATCH 2/6] package/wlroots: bump to version 0.13.0
In-Reply-To: <20210516134145.GE2506@scaer>
References: <20210513163325.1775639-1-aperez@igalia.com>
 <20210513163325.1775639-3-aperez@igalia.com> <20210516134145.GE2506@scaer>
Message-ID: <20210518152216.GD1064184@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Sun, 16 May 2021 15:41:45 +0200 "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
 
> On 2021-05-13 19:33 +0300, Adrian Perez de Castro spake thusly:
> > Update wlroots to version 0.13.0. This is a release which changes
> > API/ABI, applications which use wlroots need to be rebuilt. Currently in
> > Buildroot there is only cage, to be updated by a follow-up patch of the
> > series.
> > 
> > Additionally, remove usage of the xcb-icccm build option, which is no
> > longer available.
> 
> Hmm... This one got me to look deeper, and it seems that, even though
> the option -Dxcb-icccm is no longer available, the dependency toward
> xcb-util-wm is now mandatory for the X11 backend. See upstream commit
> 565f67f805:
> 
>     https://github.com/swaywm/wlroots/commit/565f67f805a0d1077e63c16123cea16cee97d3e6
> 
> Even more, it seems that BR2_PACKAGE_WLROOTS_X11 should now select a few
> additional packages, namely:
> 
>     BR2_PACKAGE_LIBXCB
>     BR2_PACKAGE_XCB_UTIL_RENDERUTIL
>     BR2_PACKAGE_XCB_UTIL_WM

You're absolutely right.

Provided that the X11 backend now will have a few dependencies more, which
are a superset of the ones needed for XWayland, I think it is a good idea
to derive the values for both ?-Dx11-backend=? and ?-Dxwayland=? from
BR2_PACKAGE_WLROOTS_X11?I'll do that for v2 of the patch set.

Cheers,
-Adrian

> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/wlroots/wlroots.hash | 4 ++--
> >  package/wlroots/wlroots.mk   | 9 +--------
> >  2 files changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/package/wlroots/wlroots.hash b/package/wlroots/wlroots.hash
> > index 2fab9b30b4..024ea93cae 100644
> > --- a/package/wlroots/wlroots.hash
> > +++ b/package/wlroots/wlroots.hash
> > @@ -1,5 +1,5 @@
> > -# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.12.0/wlroots-0.12.0.tar.gz.sig
> > -sha256  c9e9f4f6d2f526d0b2886daf3ec37e64831773059aa669fb98a88522a1626bdb  wlroots-0.12.0.tar.gz
> > +# Generated locally, after checking https://github.com/swaywm/wlroots/releases/download/0.13.0/wlroots-0.13.0.tar.gz.sig
> > +sha256  f6bea37fd4a6f5e5f552b83d61adae8c73e64b0bcb9ae0ab464ebcd9309d3cf3  wlroots-0.13.0.tar.gz
> >  
> >  # Hashes for license files:
> >  sha256  ffd3737a478b83a8b51b42757d3bf909ef36694508355879722e11fc1fa6736b  LICENSE
> > diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> > index 0160b1aedb..95fadfef5e 100644
> > --- a/package/wlroots/wlroots.mk
> > +++ b/package/wlroots/wlroots.mk
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >  
> > -WLROOTS_VERSION = 0.12.0
> > +WLROOTS_VERSION = 0.13.0
> >  WLROOTS_SITE = https://github.com/swaywm/wlroots/releases/download/$(WLROOTS_VERSION)
> >  WLROOTS_LICENSE = MIT
> >  WLROOTS_LICENSE_FILES = LICENSE
> > @@ -53,11 +53,4 @@ else
> >  WLROOTS_CONF_OPTS += -Dxwayland=disabled
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_XCB_UTIL_WM),y)
> > -WLROOTS_CONF_OPTS += -Dxcb-icccm=enabled
> > -WLROOTS_DEPENDENCIES += xcb-util-wm
> > -else
> > -WLROOTS_CONF_OPTS += -Dxcb-icccm=disabled
> > -endif
> > -
> >  $(eval $(meson-package))
> > -- 
> > 2.31.1
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210518/f95721c7/attachment.asc>
