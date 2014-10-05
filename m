From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 18:57:41 +0200
Subject: [Buildroot] [PATCH 1/3 v2] package/opengl-registry: new package
In-Reply-To: <20141005184708.128aa15e@free-electrons.com>
References: <cover.1411334346.git.yann.morin.1998@free.fr>
 <6c5dbcd315ecd266891ca9932c47c5e5f86eaf9b.1411334346.git.yann.morin.1998@free.fr>
 <20141005184708.128aa15e@free-electrons.com>
Message-ID: <20141005165741.GN4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-05 18:47 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun, 21 Sep 2014 23:22:54 +0200, Yann E. MORIN wrote:
> 
> > We use the last svn revision at which the api directory was *changed*,
> > not the revision the repository is currently at.
> 
> Why does this matter?

It does not matter. It is just a note that the revision used might be
different than the current revision in the SVN tree, because the tree
contains many other things than the registry, some of which are not even
public.

> >  package/Config.in                                  |    1 +
> >  package/opengl-registry/Config.in                  |   18 +
> >  package/opengl-registry/gl.h                       | 2115 ++++++++++++++++++++
> 
> Hum, I was wondering if we couldn't instead download this file from the
> Mesa git repository instead. But looks like <pkg>_EXTRA_DOWNLOADS
> assumes the file is located at the same URL as <pkg>_SOURCE.

Yes, that's still the case. I remember we already had this discussion a
while ago, but it is still not possible to provide a complete URL for
extra downloads.

If that was to change, then yes, we could download it rather than bundle
it.

> Do we know why this gl.h is not part of the upstream opengl-registry?

No, I have no idea.

> > diff --git a/package/opengl-registry/Config.in b/package/opengl-registry/Config.in
> > new file mode 100644
> > index 0000000..1d4566b
> > --- /dev/null
> > +++ b/package/opengl-registry/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_OPENGL_REGISTRY
> > +	bool "opengl-registry"
> > +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES || BR2_PACKAGE_HAS_LIBEGL
> > +	help
> > +	  The OpenGL Registry contains specifications, header files, and
> > +	  related documentation for OpenGL and related APIs including GLU,
> > +	  GLX, and WGL. In addition to the core API specifications, many
> > +	  extensions to these APIs have been defined by vendors, groups of
> > +	  vendors, and the ARB. The Registry also contains specifications
> > +	  and header files for all registered extensions, written as
> > +	  modifications to the appropriate core API specifications.
> > +
> > +	  This package installs the openGL header files. You do not need them
> > +	  if the OpenGL/EGL/GLES implementation provides its own headers.
> > +	  Currently, the only known implementation requiring OpenGL Resgistry
> > +	  is the NVidia proprietary driver.
> > +
> > +	  https://www.opengl.org/registry/
> 
> Should we foresee any problem if an OpenGL implementation providing its
> own header files (e.g rpi-userland, gpu-imx, etc.) gets selected in
> addition to this package? They will overwrite each other files, no?

Hmm.. I think I thought about that when I did the patch, I can't
remember what I came up with as a conclusion. Lemme think about it once
again...

> > diff --git a/package/opengl-registry/opengl-registry.mk b/package/opengl-registry/opengl-registry.mk
> > new file mode 100644
> > index 0000000..0c4da28
> > --- /dev/null
> > +++ b/package/opengl-registry/opengl-registry.mk
> > @@ -0,0 +1,76 @@
> > +################################################################################
> > +#
> > +# opengl-registry
> > +#
> > +################################################################################
> > +
> > +# Using last revision at which the 'api' directory was *changed*
> > +OPENGL_REGISTRY_VERSION = 28221
> > +OPENGL_REGISTRY_SITE = https://cvs.khronos.org/svn/repos/ogl/trunk/doc/registry/public/api
> > +OPENGL_REGISTRY_SITE_METHOD = svn
> > +# The license is MIT, but with 's/Software/Materials/' so it is not exactly MIT
> > +OPENGL_REGISTRY_LICENSE = MIT-like
> > +# No license file, license header in all generated headers
> > +
> > +# The registry only installs header files
> > +OPENGL_REGISTRY_INSTALL_STAGING = YES
> > +OPENGL_REGISTRY_INSTALL_TARGET = NO
> > +
> > +# opengl-registry depends on at least one of those virtual packages,
> > +# so we can be sure we'll have _DIRS set to non-empty.
> > +OPENGL_REGISTRY_DIRS = $(if $(BR2_PACKAGE_HAS_LIBGL),GL)
> > +OPENGL_REGISTRY_DIRS += $(if $(BR2_PACKAGE_HAS_LIBEGL),EGL)
> > +OPENGL_REGISTRY_DIRS += $(if $(BR2_PACKAGE_HAS_LIBGLES),GLES GLES2 GLES3)
> 
> Maybe just:
> 
> OPENGL_REGISTRY_DIRS = \
> 	$(if $(BR2_PACKAGE_HAS_LIBGL),GL) \
> 	$(if $(BR2_PACKAGE_HAS_LIBEGL),EGL) \
> 	$(if $(BR2_PACKAGE_HAS_LIBGLES),GLES GLES2 GLES3)

OK.

> > +# Remove pre-generated files
> > +define OPENGL_REGISTRY_RM_H
> > +	rm -f $(@D)/GL/*.h
> > +endef
> > +OPENGL_REGISTRY_POST_EXTRACT_HOOKS += OPENGL_REGISTRY_RM_H
> > +
> > +# We need to tweak glx.h to:
> > +# - include the X11 headers it needs
> > +# - include glxext.h like mesa3d's one does
> > +# - define the glxext prototypes
> 
> Why not simply use a patch instead of this awk magic? We generally use
> patches when possible. In this case, you're patching only one file, so
> clearly a patch seems to make sense here, no?

Because it is done after the build, and changs a generated file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
