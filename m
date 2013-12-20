From: Paul Cercueil <paul@crapouillou.net>
Date: Fri, 20 Dec 2013 14:39:20 +0100
Subject: [Buildroot] [PATCH] cairo: Build with GLESv2 and VG backends if
	possible
In-Reply-To: <878uvgklnw.fsf@dell.be.48ers.dk>
References: <1387243053-5281-1-git-send-email-paul@crapouillou.net>
 <878uvgklnw.fsf@dell.be.48ers.dk>
Message-ID: <52B44888.4070608@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/2013 08:48, Peter Korsgaard wrote:
>>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:
>   > Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
>   > ---
>   >  package/cairo/cairo.mk | 14 ++++++++++++++
>   >  1 file changed, 14 insertions(+)
>
>   > diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
>   > index 347bb75..aa03a27 100644
>   > --- a/package/cairo/cairo.mk
>   > +++ b/package/cairo/cairo.mk
>   > @@ -54,6 +54,20 @@ else
>   >  	CAIRO_CONF_OPT += --disable-directfb
>   >  endif
>   
>   > +ifeq ($(BR2_PACKAGE_HAS_OPENGL_ES),y)
>   > +	CAIRO_CONF_OPT += --enable-glesv2
>   > +	CAIRO_DEPENDENCIES += libgles
>   > +else
>   > +	CAIRO_CONF_OPT += --disable-glesv2
>   > +endif
>   > +
>   > +ifeq ($(BR2_PACKAGE_HAS_OPENVG),y)
>   > +	CAIRO_CONF_OPT += --enable-vg
>   > +	CAIRO_DEPENDENCIES += libopenvg
>   > +else
>   > +	CAIRO_CONF_OPT += --disable-vg
>   > +endif
>
> What openvg / gles providers did you test against? We seem to have a
> number of autobuild failures with the rpi provider:
>
> http://autobuild.buildroot.net/results/b7f/b7f71cd412e5a7f801e81140a02c7da04694151f/build-end.log
>
> http://autobuild.buildroot.net/results/f70/f7012c1e09d75dd103b61da364272f6385d2dc7b/build-end.log
>
> http://autobuild.buildroot.net/results/ec5/ec550547f6465b52ba552ca757c9bbeac17cd1c6/build-end.log
>
> http://autobuild.buildroot.net/results/81a/81ae93018ca6d7a61460e0c78d5a60e6a5531dbc/build-end.log
>

The following patch addresses the first issue. I reported it upstream.


[PATCH] cairo: Patch to fix OpenVG backend on X11-less platforms

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
  package/cairo/cairo-002-openvg-build-fix.patch | 28 
++++++++++++++++++++++++++
  1 file changed, 28 insertions(+)
  create mode 100644 package/cairo/cairo-002-openvg-build-fix.patch

diff --git a/package/cairo/cairo-002-openvg-build-fix.patch 
b/package/cairo/cairo-002-openvg-build-fix.patch
new file mode 100644
index 0000000..6614934
--- /dev/null
+++ b/package/cairo/cairo-002-openvg-build-fix.patch
@@ -0,0 +1,28 @@
+Fix build of OpenVG backend on platforms without X11
+
+https://bugs.freedesktop.org/show_bug.cgi?id=72911
+
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+Index: b/boilerplate/cairo-boilerplate-vg.c
+===================================================================
+--- a/boilerplate/cairo-boilerplate-vg.c
++++ b/boilerplate/cairo-boilerplate-vg.c
+@@ -215,7 +215,7 @@ _cairo_boilerplate_vg_create_surface_egl (const 
char            *name,
+     EGL_ALPHA_SIZE, 8,
+     EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
+     EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
+-    None
++    EGL_NONE
+     };
+     int rgb_attribs[] = {
+     EGL_RED_SIZE, 8,
+@@ -225,7 +225,7 @@ _cairo_boilerplate_vg_create_surface_egl (const 
char            *name,
+     EGL_VG_ALPHA_FORMAT, EGL_VG_ALPHA_FORMAT_PRE_BIT,
+     EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
+     EGL_RENDERABLE_TYPE, EGL_OPENVG_BIT,
+-    None
++    EGL_NONE
+     };
+     int dummy_attribs[] = {
+     EGL_WIDTH, 8, EGL_HEIGHT, 8,
-- 
