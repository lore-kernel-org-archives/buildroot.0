From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 13:09:58 +0000
Subject: [Buildroot] [PATCH 2/2] sdl: Fix compilation with libX11 >=
	1.5.99.902
In-Reply-To: <87lhype3bi.fsf@dell.be.48ers.dk>
References: <1389268653-45909-1-git-send-email-Vincent.Riera@imgtec.com>
 <1389268653-45909-2-git-send-email-Vincent.Riera@imgtec.com>
 <87lhype3bi.fsf@dell.be.48ers.dk>
Message-ID: <52CE9FA6.2020909@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/2014 12:40 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > Applying an upstream patch to fix a compilation error with versions of
>   > libX11 since 1.5.99.902. This patch modifies configure.in so we need to
>   > run autogen.sh to make it working correctly. Running autoreconf will
>   > fail because SDL uses bit tricky automake/autoconf configuration.
>
>   > Upstream patch URL:
>   >    http://hg.libsdl.org/SDL/rev/91ad7b43317a
>
>   > Fixes:
>   >    http://autobuild.buildroot.net/results/bf8/bf83466a7bbb0635d97fe279a18778d92f20bea2/
>
>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>   > ---
>   >  .../sdl/sdl-0002-fix-compilation-with-libx11.patch |   60 ++++++++++++++++++++
>   >  package/sdl/sdl.mk                                 |    6 ++
>   >  2 files changed, 66 insertions(+), 0 deletions(-)
>   >  create mode 100644 package/sdl/sdl-0002-fix-compilation-with-libx11.patch
>
>   > diff --git a/package/sdl/sdl-0002-fix-compilation-with-libx11.patch b/package/sdl/sdl-0002-fix-compilation-with-libx11.patch
>   > new file mode 100644
>   > index 0000000..27f2448
>   > --- /dev/null
>   > +++ b/package/sdl/sdl-0002-fix-compilation-with-libx11.patch
>   > @@ -0,0 +1,60 @@
>   > +sdl: Fix compilation with libX11 >= 1.5.99.902
>   > +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>   > +
>   > +# HG changeset patch
>   > +# User Azamat H. Hackimov <azamat.hackimov@gmail.com>
>   > +# Date 1370184533 -21600
>   > +# Node ID 91ad7b43317a6387e115ecdf63a49137f47e42c8
>   > +# Parent  f7fd5c3951b9ed922fdf696f7182e71b58a13268
>   > +Fix compilation with libX11 >= 1.5.99.902.
>   > +
>   > +These changes fixes bug #1769 for SDL 1.2
>   > +(http://bugzilla.libsdl.org/show_bug.cgi?id=1769).
>   > +
>   > +diff -r f7fd5c3951b9 -r 91ad7b43317a configure.in
>   > +--- a/configure.in	Wed Apr 17 00:56:53 2013 -0700
>   > ++++ b/configure.in	Sun Jun 02 20:48:53 2013 +0600
>   > +@@ -1169,6 +1169,17 @@
>   > +             if test x$definitely_enable_video_x11_xrandr = xyes; then
>   > +                 AC_DEFINE(SDL_VIDEO_DRIVER_X11_XRANDR)
>   > +             fi
>   > ++            AC_MSG_CHECKING(for const parameter to _XData32)
>   > ++            have_const_param_xdata32=no
>   > ++            AC_TRY_COMPILE([
>   > ++              #include <X11/Xlibint.h>
>   > ++              extern int _XData32(Display *dpy,register _Xconst long *data,unsigned len);
>   > ++            ],[
>   > ++            ],[
>   > ++            have_const_param_xdata32=yes
>   > ++            AC_DEFINE(SDL_VIDEO_DRIVER_X11_CONST_PARAM_XDATA32)
>   > ++            ])
>   > ++            AC_MSG_RESULT($have_const_param_xdata32)
>   > +         fi
>   > +     fi
>   > + }
>   > +diff -r f7fd5c3951b9 -r 91ad7b43317a include/SDL_config.h.in
>   > +--- a/include/SDL_config.h.in	Wed Apr 17 00:56:53 2013 -0700
>   > ++++ b/include/SDL_config.h.in	Sun Jun 02 20:48:53 2013 +0600
>   > +@@ -283,6 +283,7 @@
>   > + #undef SDL_VIDEO_DRIVER_WINDIB
>   > + #undef SDL_VIDEO_DRIVER_WSCONS
>   > + #undef SDL_VIDEO_DRIVER_X11
>   > ++#undef SDL_VIDEO_DRIVER_X11_CONST_PARAM_XDATA32
>   > + #undef SDL_VIDEO_DRIVER_X11_DGAMOUSE
>   > + #undef SDL_VIDEO_DRIVER_X11_DYNAMIC
>   > + #undef SDL_VIDEO_DRIVER_X11_DYNAMIC_XEXT
>   > +diff -r f7fd5c3951b9 -r 91ad7b43317a src/video/x11/SDL_x11sym.h
>   > +--- a/src/video/x11/SDL_x11sym.h	Wed Apr 17 00:56:53 2013 -0700
>   > ++++ b/src/video/x11/SDL_x11sym.h	Sun Jun 02 20:48:53 2013 +0600
>   > +@@ -165,7 +165,11 @@
>   > +  */
>   > + #ifdef LONG64
>   > + SDL_X11_MODULE(IO_32BIT)
>   > ++#if SDL_VIDEO_DRIVER_X11_CONST_PARAM_XDATA32
>   > ++SDL_X11_SYM(int,_XData32,(Display *dpy,register _Xconst long *data,unsigned len),(dpy,data,len),return)
>   > ++#else
>   > + SDL_X11_SYM(int,_XData32,(Display *dpy,register long *data,unsigned len),(dpy,data,len),return)
>   > ++#endif
>   > + SDL_X11_SYM(void,_XRead32,(Display *dpy,register long *data,long len),(dpy,data,len),)
>   > + #endif
>   > +
>   > diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
>   > index ef723dd..0032b97 100644
>   > --- a/package/sdl/sdl.mk
>   > +++ b/package/sdl/sdl.mk
>   > @@ -67,6 +67,12 @@ define SDL_FIXUP_SDL_CONFIG
>   >  		$(STAGING_DIR)/usr/bin/sdl-config
>   >  endef
>
>   > +define SDL_RUN_AUTOGEN
>   > +	cd $(@D) && ./autogen.sh
>   > +endef
>
> Hmm, this ends up relying on the use having compatible auto* tools
> installed on the build machine. Are you sure we cannot use our
> pkg_AUTORECONF = YES handling?

I tried it but I can't get it working properly. Maybe you could try it.

> Alternatively, it should depend on
> host-automake host-autoconf host-libtool so we build our own versions of
> the tools, similar to how AUTORECONF does.

So, what do you want I do, sending an updated patch adding those 
dependencies, or do you prefer to try to use the pkg_AUTORECONF = YES way?


-- 
Vincent
