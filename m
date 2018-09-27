From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 Sep 2018 15:40:26 +0300
Subject: [Buildroot] [PATCH 5/5] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20180925225702.1b1ff215@windsurf>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-6-aperez@igalia.com>	<20180925225702.1b1ff215@windsurf>
Message-ID: <20180927154026.GF16720@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 25 Sep 2018 22:57:02 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> On Sun, 23 Sep 2018 02:53:33 +0300, Adrian Perez de Castro wrote:
> > Make the USE_GSTREAMER_GL CMake build option depend on
> > BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL being enabled. This
> > allows building WebKitGTK+ for targets where GL/GLES is
> > available but either GStreamer-GL is disabled or cannot be
> > built.
> 
> What is GStreamer-GL? How is it possible to have GStreamer-GL
> disabled, but BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL enabled?

GStreamer-GL contains components which can be plugged into GStreamer media
pipelines. For example, one of the elements provided will render video to
GL/GLES textures; and WebKitGTK+ can optionally use them to composite the
textures with video frames coming from GStreamer directly using the GPU
There are also fall-back code paths in WebKit which do not require the
GStreamer-GL components ? and that's why is possible to build WebKitGTK+
anyway even if they are not available.

This tries to cover cases in which GL/GLES is available, but GStreamer-GL
is not available. While it's rare, this can happen in cases where a GL/GLES
driver does not support window surfaces: this is needed by GStreamer-GL,
but WebKit can be coerced into painting offscreen or using FBOs.

I hope this has not gone too much into details, and helps to understand
why GStreamer-GL is not selected unconditionally by WebKitGTK+.

Cheers,


-Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180927/66ce1db0/attachment.asc>
