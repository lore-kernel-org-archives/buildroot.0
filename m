From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Jun 2019 15:59:10 -0600
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 add wpe plugin option
In-Reply-To: <0a023992-228e-28a7-2f13-3348de8293cd@mind.be>
References: <20190605055125.38900-1-james.hilliard1@gmail.com>
 <0a023992-228e-28a7-2f13-3348de8293cd@mind.be>
Message-ID: <CADvTj4ocW=w=hFRHNuTTu7PJYxrRp8D0WBYHuGKp8FWY_NAUqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 8, 2019 at 2:54 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/06/2019 07:51, James Hilliard wrote:
> > Removed gst1-plugins-bad dependency from wpewebkit gstreamer-gl option
> > so that there isn't a circular dependency with gst1-plugins-bad.
>
>  This should be a separate patch, with a commit message that explains why the
> dependency isn't needed. My guess is that it's a runtime dependency because the
> GL plugin is loaded dynamically.
Yeah, that's my assumption but I didn't extensively check that.
>
>  That patch should also add a '# runtime' comment in the wpewebkit Config.in, i.e.:
>
> config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
>         bool "use gstreamer-gl"
>         default y
>         depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
>         select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL # runtime
>
>
>  Also, I wonder if the same doesn't apply to the gst1-plugins-good, gst1-libav
> and possibly even gst1-plugins-base dependencies.
>
>
> >
> > It appears that wpewebkit gstreamer-gl only has a runtime dependency on
> > gst1-plugins-bad.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/gstreamer1/gst1-plugins-bad/Config.in          | 10 ++++++++++
> >  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk    |  7 +++++++
> >  package/wpewebkit/wpewebkit.mk                         |  1 -
> >  3 files changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> > index e1e7b05a59..3d19012e95 100644
> > --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> > +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> > @@ -583,6 +583,16 @@ comment "webrtcdsp needs a toolchain w/ C++, NPTL, gcc >= 4.8"
> >       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> >               || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> >
> > +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
> > +     bool "wpe"
> > +     default y
> > +     depends on BR2_PACKAGE_WPEWEBKIT
>
>  We normally select packages instead of depending on them. Yes, that implies
> copying all its dependencies.
>
>  If there is a good reason to use a depends instead of select, please explain it
> in the commit message.
I basically just copied this:
https://github.com/buildroot/buildroot/blob/280149ce60774aab6a75e3f257185b0d6d2b144e/package/gstreamer1/gst1-plugins-bad/Config.in#L403
>
>
>  Also, just to be clear: there is no dependency on
> BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA or BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL ?
Not from what I could tell, at least there didn't appear to be in the
autoconf script here:
https://github.com/GStreamer/gst-plugins-bad/blob/1.16/configure.ac#L2301
Those all appear to be BR2_PACKAGE_WPEWEBKIT dependencies.
The configure script however doesn't check for gl headers even though
they are required for wpe,
hence the need to add BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL as a
buildroot dependency to ensure the build doesn't fail when wpewebkit
and gst1-plugins-bad
are enabled without opengl.
>
>
>  Regards,
>  Arnout
>
> > +     depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> > +
> > +comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
> > +     depends on !BR2_PACKAGE_WPEWEBKIT \
> > +             || !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> > +
> >  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
> >       bool "x265"
> >       depends on BR2_INSTALL_LIBSTDCPP
> > diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> > index 32edde4901..c6e2877dde 100644
> > --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> > +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> > @@ -698,6 +698,13 @@ else
> >  GST1_PLUGINS_BAD_CONF_OPTS += --disable-webrtcdsp
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE),y)
> > +GST1_PLUGINS_BAD_CONF_OPTS += --enable-wpe
> > +GST1_PLUGINS_BAD_DEPENDENCIES += wpewebkit
> > +else
> > +GST1_PLUGINS_BAD_CONF_OPTS += --disable-wpe
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
> >  GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
> >  GST1_PLUGINS_BAD_DEPENDENCIES += x265
> > diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> > index b59a1f793a..4dc4a29064 100644
> > --- a/package/wpewebkit/wpewebkit.mk
> > +++ b/package/wpewebkit/wpewebkit.mk
> > @@ -34,7 +34,6 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL),y)
> >  WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
> > -WPEWEBKIT_DEPENDENCIES += gst1-plugins-bad
> >  else
> >  WPEWEBKIT_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
> >  endif
> >
