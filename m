From: Glenn Coombs <glenn.coombs@gmail.com>
Date: Wed, 19 Jul 2017 17:55:54 +0800
Subject: [Buildroot] How to build the qt plugin in gst1-plugins-bad ?
In-Reply-To: <20170719113553.6669def3@windsurf>
References: <CADujc4q8d1AMFmvoD_62qnOkNSntuCCGCe4+Pkatp4P382srfg@mail.gmail.com>
 <20170719113553.6669def3@windsurf>
Message-ID: <CADujc4o_1XZLQymNx3fQk5n9FOhg=9xNKw5U2GPSsGBCxHyhSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the debug.  Is that section with HAVE_WINDOW_VIV_FB from the
build/gst1-plugins-bad-1.10.4/configure.ac file?  I have this section in
that file at line 1059:

      if test "x$NEED_EGL" != "xno"; then
        if test "x$HAVE_WINDOW_WAYLAND" = "xyes" -o "x$HAVE_WINDOW_X11" =
"xyes" -o "x$HAVE_WINDOW_DISPMANX" = "xyes"; then
          GL_LIBS="$GL_LIBS -lEGL $EGL_LIBS"
          GL_CFLAGS="$GL_CFLAGS $EGL_CFLAGS"
          USE_EGL=yes
        fi
      fi

As you can see I am missing the HAVE_WINDOW_VIV_FB bit.  Looking at the
output of dmesg on my target system I can see this version: Buildroot
2017.05-00055-g338f004.  Presumably I need an even newer version of
buildroot than I already have ?

--
Glenn


On 19 July 2017 at 17:35, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 19 Jul 2017 17:17:43 +0800, Glenn Coombs wrote:
>
> > configure:50774: WARNING: Could not find any Qt Windowing integration
> >
> > I'm not sure why the qt plugin is explicitly disabled - is there a known
> > issue with building this plugin ?
>
> I don't think so, it's probably just that nobody needed it until now,
> and therefore nobody did the effort to see what changes were needed to
> enable it.
>
> > Can anybody help with what further options I might need to set to get
> > it to build ?
>
> You should read the configure.ac script of gst1-plugins-bad, it gives
> all the details of the checks it is doing about Qt. See
> https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/
> tree/configure.ac?id=1.12.1#n2907.
>
> Since you're using eglfs, I think you should fall into the case where:
>
>         if test "x$GST_GL_HAVE_PLATFORM_EGL" = "x1"; then
>
> then since you're not on Android
>
>           if test "x$GST_GL_HAVE_WINDOW_ANDROID" = "x1"; then
>
> should be false, which brings you to the else case:
>
>           else
>               AC_DEFINE([HAVE_QT_EGLFS], [],
>                 [Define if Qt eglfs integration is installed])
>               HAVE_QT_WINDOWING="yes"
>           fi
>
> The error message that you get "Could not find any Qt Windowing
> integration" appears when HAVE_QT_WINDOWING is "no". So obviously
> GST_GL_HAVE_PLATFORM_EGL is not "1" in your situation, and that's the
> problem.
>
> GST_GL_HAVE_PLATFORM_EGL is set to 1 in:
>
> if test "x$USE_EGL" = "xyes"; then
>   GL_PLATFORMS="egl $GL_PLATFORMS"
>   GST_GL_HAVE_PLATFORM_EGL=1
> fi
>
> So we need to understand when USE_EGL is set to "yes". For the Linux
> platform, it is set to yes as follows:
>
>       if test "x$NEED_EGL" != "xno"; then
>         if test "x$HAVE_WINDOW_WAYLAND" = "xyes" -o "x$HAVE_WINDOW_X11" =
> "xyes" -o "x$HAVE_WINDOW_DISPMANX" = "xyes" -o "x$HAVE_WINDOW_VIV_FB" =
> "xyes"; then
>           GL_LIBS="$GL_LIBS -lEGL $EGL_LIBS"
>           GL_CFLAGS="$GL_CFLAGS $EGL_CFLAGS"
>           USE_EGL=yes
>         fi
>       fi
>
> So you need to find out why HAVE_WINDOW_VIV_FB is not "yes".
>
> I suggest that you add a bunch of additional echo in the configure
> script to dump the value of the various variables, in order to
> progressively figure out what's going on.
>
> Once you have nailed down the problematic variable, we can probably
> help again to understand what is the problem.
>
> Good luck!
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170719/b237fd73/attachment.html>
