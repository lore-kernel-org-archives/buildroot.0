From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Apr 2018 18:28:13 +0200
Subject: [Buildroot] [PATCH v4 2/8] gst-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <20180410100736.2e6f8f7b@windsurf>
References: <20180322173220.31791-1-aduskett@gmail.com>
 <20180322173220.31791-2-aduskett@gmail.com>
 <20180322235537.261ea603@gmx.net>
 <20180410100736.2e6f8f7b@windsurf>
Message-ID: <20180410182813.691be3ff@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Adam,

On Tue, 10 Apr 2018 10:07:36 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> I talked with Adam about this gstreamer1 patch series, and apparently
> your comment below isn't clear to Adam, and this explains why he hasn't
> resent the patch series.
> 
> On Thu, 22 Mar 2018 23:55:37 +0100, Peter Seiderer wrote:
> 
> > > Add the following to gst1-plugins-base and remove them from plugins-bad:
> > >  - opengl
> > >  - gles2
> > >  - glx
> > >  - egl
> > >  - x11
> > >  - wayland    
> > 
> > This still contradicts your own statement [1]:
> > 
> >   Not entirely! There is --enable-wayland now in both base AND bad!  
> 
> Indeed, the gst1-plugins-bad package still has a
> --enable-wayland/--disable-wayland option:
> 
> output/build/gst1-plugins-bad-1.14.0 $ ./configure --help | grep wayland
>   --disable-wayland            disable wayland sink: wayland

This is the 'old' one in gstreamer and buildroot and should be kept (NOT moved from bad to base)....

> 
> And in base:
> 
> output/build/gst1-plugins-base-1.14.0 $ ./configure --help | grep wayland
>   --enable-wayland        Enable Wayland support (requires EGL) [default=auto]

This is the 'new' one in gstreamer, yet without handling in buildroot, enables
wayland support in libgstgl (which is used by some plugins, but I believe not
by the waylandsink plugin from bad)...

> 
> > > Changes v2 -> v3:
> > >   - Removed wayland references from plugins-bad (Peter)    
> > 
> > No, see suggestion from [2]:
> > 
> >   I think there is a difference, the bad/wayland option enables extra gstreamer
> >   plugins/elements, the base/wayland opton enables no extra plugins/elements but
> >   enables wayland support in the qt/gtk plugins (did not look further if it
> >   results only in wayland support in some elements or extra elements in the same
> >   plugin library), in case it enables only wayland support, I think no
> >   user visible option is needed (if a user visible option is needed there is
> >   definitely a change in option name and help text needed)  
> 
> It's not entirely clear to me what are the two options doing.
> 
> In gst1-plugins-base, the --enable-wayland option requires EGL support,
> and will enable some wayland related code in gst-libs/gl/. Peter, do
> you understand what this does, compared to the wayland sink provided in
> gst1-plugins-bad ?

Yes, your short analysis is right (and sorry, I can add no more details what
is enabled/disabled in the resulting libgstgl library)....

> 
> In gst1-plugins-bad, the --enable-wayland option enables the build of a
> wayland sink.

Yes, see [1]...

Regards,
Peter

[1] https://gstreamer.freedesktop.org/data/doc/gstreamer/head/gst-plugins-bad/html/gst-plugins-bad-plugins-waylandsink.html

> 
> Best regards,
> 
> Thomas
