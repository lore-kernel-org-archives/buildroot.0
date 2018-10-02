From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Oct 2018 23:28:08 +0200
Subject: [Buildroot] [PATCH 5/5] webkitgtk: explicitly set
 USE_GSTREAMER_GL build option
In-Reply-To: <20180927154026.GF16720@momiji>
References: <20180922235333.85642-1-aperez@igalia.com>
 <20180922235333.85642-6-aperez@igalia.com> <20180925225702.1b1ff215@windsurf>
 <20180927154026.GF16720@momiji>
Message-ID: <b8ac5974-c4b3-56e4-7059-a86ca13f7999@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/09/2018 14:40, Adrian Perez de Castro wrote:
> Hi Thomas,
> 
> On Tue, 25 Sep 2018 22:57:02 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> On Sun, 23 Sep 2018 02:53:33 +0300, Adrian Perez de Castro wrote:
>>> Make the USE_GSTREAMER_GL CMake build option depend on
>>> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL being enabled. This
>>> allows building WebKitGTK+ for targets where GL/GLES is
>>> available but either GStreamer-GL is disabled or cannot be
>>> built.
>>
>> What is GStreamer-GL? How is it possible to have GStreamer-GL
>> disabled, but BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL enabled?
> 
> GStreamer-GL contains components which can be plugged into GStreamer media
> pipelines. For example, one of the elements provided will render video to
> GL/GLES textures; and WebKitGTK+ can optionally use them to composite the
> textures with video frames coming from GStreamer directly using the GPU
> There are also fall-back code paths in WebKit which do not require the
> GStreamer-GL components ? and that's why is possible to build WebKitGTK+
> anyway even if they are not available.
> 
> This tries to cover cases in which GL/GLES is available, but GStreamer-GL
> is not available. While it's rare, this can happen in cases where a GL/GLES
> driver does not support window surfaces: this is needed by GStreamer-GL,
> but WebKit can be coerced into painting offscreen or using FBOs.

 Don't you simply mean: this covers the case where GL/GLES is available (so
-DENABLE_OPENGL=ON gets passed), which makes the webkitgtk build system assume
Gstreamer-GL is available, while actually it is not?

 Don't you actually need to add gst1-plugins-bad to the _DEPENDENCIES then?

 Do you have some autobuild failure or a minimal defconfig that shows the problem?

 Just to be sure: does it really need to depend on
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL and not just
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL?


 Regards,
 Arnout


> 
> I hope this has not gone too much into details, and helps to understand
> why GStreamer-GL is not selected unconditionally by WebKitGTK+.
> 
> Cheers,
> 
> 
> -Adri?n
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
