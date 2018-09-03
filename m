From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 3 Sep 2018 13:59:13 +0200
Subject: [Buildroot] [PATCH v3] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
References: <20180815210249.5e11df4d@gmx.net>
 <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <ee5e8334-902f-b4c8-c5df-b2cb110622a8@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-09-03 09:14, I?igo Huguet wrote:
> gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
> is disabled. Added option to enable it, allowing to use elements
> qmlglsrc and qmlglsink.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> 

Hi,

I actually prepare my system to use this gstreamer module now. Your
change looks good to me in general and I built my system using it now.
So thanks a lot for this!


I'm on an i.MX6 system and need the following patches against gstreamer
plugins applied _additionally_. But IMO we should apply your current
change as-is, and (if applicable) the following separately:


gst1-plugins-good:
https://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=319171b162bac6bd56c342e0dd4bd3968a59392f
this is just not yet part of gstreamer 1.14.2. As soon as included, this
could be removed of course.


gst1-plugins-base:
The following chage removes the build-dependency on udev (I don't use
udev). In this case the device (to be found by udev) can be defined
using the GST_GL_GBM_DRM_DEVICE env.variable (but the default should
mostly be fine).

--- a/gst-libs/gst/gl/gbm/gstgl_gbm_utils.c

+++ b/gst-libs/gst/gl/gbm/gstgl_gbm_utils.c

@@ -20,7 +20,9 @@



 #include <unistd.h>

 #include <fcntl.h>

+#ifdef HAVE_GUDEV

 #include <gudev/gudev.h>

+#endif

 #include "gstgl_gbm_utils.h"



 GST_DEBUG_CATEGORY_EXTERN (gst_gl_gbm_debug);

@@ -440,6 +442,7 @@ gst_gl_gbm_find_and_open_drm_node (void)

   /* In here we use GUDev to try to autodetect the GPU */



   int drm_fd = -1;

+#ifdef HAVE_GUDEV

   GUdevClient *gudev_client = NULL;

   GUdevEnumerator *gudev_enum = NULL;

   GList *devlist = NULL;

@@ -526,4 +529,7 @@ cleanup:

   }



   goto done;

+#else

+  return drm_fd;

+#endif

 }

diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4

index 1e9724094..bd6d173f9 100644

--- a/m4/gst-gl.m4

+++ b/m4/gst-gl.m4

@@ -176,7 +176,7 @@ case $host in

         PKG_CHECK_MODULES(DRM, libdrm >= 2.4.55, HAVE_DRM=yes,
HAVE_DRM=no)
         AC_SUBST(DRM_CFLAGS)

         AC_SUBST(DRM_LIBS)

-        if test "x$HAVE_DRM" = "xyes" -a "x$HAVE_GUDEV" = "xyes"; then

+        if test "x$HAVE_DRM" = "xyes"; then

           PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=yes,
HAVE_GBM_EGL=no)
           AC_SUBST(GBM_CFLAGS)

           AC_SUBST(GBM_LIBS)




Also, while playing with it, I see the following problem I want to point
out just in case you have any idea or hint about it; this is a special
case and should not prevent us from enabling and using it here of course :)
https://bugreports.qt.io/browse/QTBUG-65993

thanks

                                    martin

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180903/721322cf/attachment.bin>
