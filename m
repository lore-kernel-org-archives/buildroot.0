From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 20:34:39 +0200
Subject: [Buildroot] [PATCH] mpv: va-api requires egl-drm,
	wayland and/or x11
In-Reply-To: <1461853987-5313-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 28 Apr 2016 11:33:07 -0300")
References: <1461853987-5313-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vb31wpj4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The VA-API acceleration requires one or more of the egl-drm, wayland
 > and/or x11 backends.
 > Since the egl-drm backend means LIBGL (X11) + EGL + DRM we'll handle it
 > later once the mesa3d libgl hidden knob is applied.
 > So for now we'll support wayland and x11 until that happens. Fixes:
 > http://autobuild.buildroot.net/results/4b9/4b98d0c2c0617715e77fb47b3d97037c6b7562ec/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/mpv/mpv.mk | 8 ++++++--
 >  1 file changed, 6 insertions(+), 2 deletions(-)

 > diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
 > index 0a13aee..fb45aef 100644
 > --- a/package/mpv/mpv.mk
 > +++ b/package/mpv/mpv.mk
 > @@ -179,11 +179,15 @@ MPV_CONF_OPTS += --disable-sdl1 --disable-sdl2
 >  endif
 
 >  # va-api support
 > +# This requires one or more of the egl-drm, wayland, x11 backends
 > +# For now we support wayland and x11
 >  ifeq ($(BR2_PACKAGE_LIBVA),y)
 > +ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),)
 > +MPV_CONF_OPTS += --disable-vaapi
 > +else
 >  MPV_CONF_OPTS += --enable-vaapi
 >  MPV_DEPENDENCIES += libva
 > -else
 > -MPV_CONF_OPTS += --disable-vaapi
 > +endif
 >  endif

With this we no longer pass --disable-vaapi if libva isn't enabled. I've
changed it to do that as well and inverted the wayland/libx11 test like
Thomas suggested:

ifneq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_XLIB_LIBX11),)
MPV_CONF_OPTS += --enable-vaapi
..

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
