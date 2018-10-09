From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 9 Oct 2018 23:12:27 +0200
Subject: [Buildroot] [PATCH 5/5] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <b8ac5974-c4b3-56e4-7059-a86ca13f7999@mind.be>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-6-aperez@igalia.com>	<20180925225702.1b1ff215@windsurf>
 <20180927154026.GF16720@momiji>	<b8ac5974-c4b3-56e4-7059-a86ca13f7999@mind.be>
Message-ID: <20181009231227.GB10287@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Tue, 2 Oct 2018 23:28:08 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
> 
> On 27/09/2018 14:40, Adrian Perez de Castro wrote:
> > Hi Thomas,
> > 
> > On Tue, 25 Sep 2018 22:57:02 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> >> Hello,
> >>
> >> On Sun, 23 Sep 2018 02:53:33 +0300, Adrian Perez de Castro wrote:
> >>> Make the USE_GSTREAMER_GL CMake build option depend on
> >>> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL being enabled. This
> >>> allows building WebKitGTK+ for targets where GL/GLES is
> >>> available but either GStreamer-GL is disabled or cannot be
> >>> built.
> >>
> >> What is GStreamer-GL? How is it possible to have GStreamer-GL
> >> disabled, but BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL enabled?
> > 
> > GStreamer-GL contains components which can be plugged into GStreamer media
> > pipelines. For example, one of the elements provided will render video to
> > GL/GLES textures; and WebKitGTK+ can optionally use them to composite the
> > textures with video frames coming from GStreamer directly using the GPU
> > There are also fall-back code paths in WebKit which do not require the
> > GStreamer-GL components ? and that's why is possible to build WebKitGTK+
> > anyway even if they are not available.
> > 
> > This tries to cover cases in which GL/GLES is available, but GStreamer-GL
> > is not available. While it's rare, this can happen in cases where a GL/GLES
> > driver does not support window surfaces: this is needed by GStreamer-GL,
> > but WebKit can be coerced into painting offscreen or using FBOs.
> 
>  Don't you simply mean: this covers the case where GL/GLES is available (so
> -DENABLE_OPENGL=ON gets passed), which makes the webkitgtk build system assume
> Gstreamer-GL is available, while actually it is not?

Yes, thanks for rewording my overly-technical explanation into something that
better fits a commit log message and/or a comment in the build recipe :)

>  Don't you actually need to add gst1-plugins-bad to the _DEPENDENCIES then?

Good catch, indeed.

>  Do you have some autobuild failure or a minimal defconfig that shows the problem?

There were some autobuild failures a while ago, for example this one:

  http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674

>  Just to be sure: does it really need to depend on
> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL and not just
> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL?

Yes, I have double checked and ?BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL? is
needed, otherwise the build fails.
 
I will be sending a new patch set soon addressing all the comments and
suggestions from this review ? thanks for all the feedback!


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181009/81b4f71b/attachment.asc>
