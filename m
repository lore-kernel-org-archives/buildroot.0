From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2019 14:39:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: fix gstreamer-gl
 dependency
In-Reply-To: <47167465-83d8-ccc0-97e7-9972c0888d21@mind.be>
References: <20190807192313.118268-1-james.hilliard1@gmail.com>
 <47167465-83d8-ccc0-97e7-9972c0888d21@mind.be>
Message-ID: <CADvTj4ppoXw+Huc4odkciDzdUfimcupzmbsoanf4oHh7mLKkWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 12, 2019 at 12:19 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 07/08/2019 21:23, James Hilliard wrote:
> > The gstreamer1 opengl plugin was moved from gst1-plugins-bad to
> > gst1-plugins-base so we need to update webkitgtk to depend on the
> > correct package.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/webkitgtk/Config.in    | 3 +--
> >  package/webkitgtk/webkitgtk.mk | 1 -
> >  2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
> > index db67c89042..d822bec06a 100644
> > --- a/package/webkitgtk/Config.in
> > +++ b/package/webkitgtk/Config.in
> > @@ -95,8 +95,7 @@ if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
> >  config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
> >       bool "use gstreamer-gl"
> >       default y
> > -     depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
> > -     select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
> > +     depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
>
>  Here I'm not so sure: is OPENGL_API sufficient or does it really need
> OPENGL_OPENGL?
Not entirely sure but seemed to be the case for wpewebkit at least.
>
>  Regards,
>  Arnout
>
> >       help
> >         Use the GStreamer GL elements for handling video content.
> >         This is recommended as it improves performance of video
> > diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> > index f8cd728351..7c4a9c81f8 100644
> > --- a/package/webkitgtk/webkitgtk.mk
> > +++ b/package/webkitgtk/webkitgtk.mk
> > @@ -88,7 +88,6 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
> >  WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
> > -WEBKITGTK_DEPENDENCIES += gst1-plugins-bad
> >  else
> >  WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
> >  endif
> >
