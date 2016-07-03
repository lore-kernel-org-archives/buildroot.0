From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 01:14:09 +0200
Subject: [Buildroot] [PATCH v4] supertuxkart: new package
In-Reply-To: <20160703214937.5418-1-ezequiel@vanguardiasur.com.ar> (Ezequiel
 Garcia's message of "Sun, 3 Jul 2016 18:49:37 -0300")
References: <20160703214937.5418-1-ezequiel@vanguardiasur.com.ar>
Message-ID: <8737nql3ge.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > Note that this package builds and bundles a number of libraries,
 > such as GLEW and Irrlicht. We are not interested in doing
 > non-upstreamable changes, so it is not desirable to modify
 > this choice in any way.

 > In addition, Supertuxkart builds a version of the angelscript
 > interpreter. If a compatible version of angelscript is installed
 > on the system, it's possible to use it.

 > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > --
 > Changes from v3:
 >   * Bumped to v0.9.2
 >   * Added a patch to fix bad return jpeglib 'boolean' type

 > +++ b/package/supertuxkart/0002-irrlicht-Fix-boolean-return-type-for-jpeglib-s-callb.patch
 > @@ -0,0 +1,39 @@

Something went wrong with this patch / your mailer. The file you are
patching has DOS style line endings, but the patch didn't, so it
couldn't be applied on my side and I had to fix it.

> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
 > new file mode 100644
 > index 000000000000..4ee8c4d57efe
 > --- /dev/null
 > +++ b/package/supertuxkart/Config.in
 > @@ -0,0 +1,34 @@
 > +config BR2_PACKAGE_SUPERTUXKART
 > +	bool "supertuxkart"
 > +	depends on BR2_USE_MMU # fork()
 > +	depends on BR2_INSTALL_LIBSTDCPP # openal
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 > +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 > +	depends on BR2_PACKAGE_HAS_LIBGL
 > +	depends on BR2_PACKAGE_XORG7
 > +	depends on !BR2_TOOLCHAIN_USES_MUSL
 > +	select BR2_PACKAGE_JPEG
 > +	select BR2_PACKAGE_LIBCURL
 > +	select BR2_PACKAGE_LIBGLU
 > +	select BR2_PACKAGE_LIBOGG
 > +	select BR2_PACKAGE_LIBPNG
 > +	select BR2_PACKAGE_LIBVORBIS
 > +	select BR2_PACKAGE_OPENAL
 > +	select BR2_PACKAGE_XLIB_LIBXRANDR
 > +	select BR2_PACKAGE_ZLIB
 > +	help
 > +	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
 > +	  racer with multiple karts, tracks and modes you can play.
 > +	  Beat the evil Nolok by any means necessary, and make the
 > +	  mascot kingdom safe once again!
 > +
 > +	  http://supertuxkart.sourceforge.net/Main_Page
 > +
 > +comment "supertux needs X, an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++"
 > +	depends on BR2_USE_MMU
 > +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 > +		|| !BR2_INSTALL_LIBSTDCPP \
 > +		|| !BR2_PACKAGE_HAS_LIBGL \
 > +		|| BR2_TOOLCHAIN_USES_MUSL \
 > +		|| !BR2_PACKAGE_XORG7

We normally don't list the xorg dependency in the comment, so I've
dropped that (and made the comment depend on BR2_PACKAGE_XORG7).

> +++ b/package/supertuxkart/supertuxkart.mk
 > @@ -0,0 +1,48 @@
 > +################################################################################
 > +#
 > +# supertuxkart
 > +#
 > +################################################################################
 > +
 > +SUPERTUXKART_VERSION = 0.9.2
 > +SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
 > +SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
 > +
 > +# Supertuxkart itself is GPLv3+, but it bundles a few libraries with different
 > +# licenses. Irrlicht, bullet and angelscript have zlib license, while glew is
 > +# BSD-3c. Since they are linked statically, the result is GPLv3+.
 > +SUPERTUXKART_LICENSE = GPLv3+
 > +SUPERTUXKART_LICENSE_FILES = COPYING
 > +
 > +SUPERTUXKART_DEPENDENCIES += \

No need for +=, so I've changed this to use '='.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
