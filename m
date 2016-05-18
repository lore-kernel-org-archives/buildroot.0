From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 May 2016 23:52:25 +0200
Subject: [Buildroot] [PATCH v2] supertuxkart: new package
In-Reply-To: <1463159188-1564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1463159188-1564-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <ce50871b-7e0d-d540-6b08-cbb0a4a8fea3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/16 19:06, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> --
> Changes from v1 -- thanks, Arnout!
>   * Made fribidi optional
>   * Made the bluez5_utils optional, which simplifies dependencies
>   * Disable Wii only if bluez5_utils is disabled
>   * Fixed dependencies inherited from OpenAL
>   * Added a patch to remove -I/usr/X11R6/include from bundled irrlicht-based engine
>
> No changes regarding Freetype, because latest v0.9.1 release
> does not use it.

  Ah yes I only looked at git master.

> ---
>  package/Config.in                                  |  1 +
>  package/supertuxkart/Config.in                     | 31 ++++++++++++++++++++
>  .../supertuxkart-rm-x11r6-include.patch            | 14 +++++++++
>  package/supertuxkart/supertuxkart.hash             |  2 ++
>  package/supertuxkart/supertuxkart.mk               | 34 ++++++++++++++++++++++
>  5 files changed, 82 insertions(+)
>  create mode 100644 package/supertuxkart/Config.in
>  create mode 100644 package/supertuxkart/supertuxkart-rm-x11r6-include.patch
>  create mode 100644 package/supertuxkart/supertuxkart.hash
>  create mode 100644 package/supertuxkart/supertuxkart.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 9d668bf34f31..ec3dce5ace53 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -233,6 +233,7 @@ menu "Games"
>  	source "package/prboom/Config.in"
>  	source "package/rubix/Config.in"
>  	source "package/sl/Config.in"
> +	source "package/supertuxkart/Config.in"
>  endmenu
>
>  menu "Graphic libraries and applications (graphic/text)"
> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
> new file mode 100644
> index 000000000000..cd7d2a3676a2
> --- /dev/null
> +++ b/package/supertuxkart/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_SUPERTUXKART
> +	bool "supertuxkart"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_INSTALL_LIBSTDCPP # openal
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
> +	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	depends on BR2_PACKAGE_XORG7
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
> +comment "supertux needs a toolchain w/ NPTL, C++"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
> +		|| !BR2_INSTALL_LIBSTDCPP

  You need to add the architecture dependencies here:
	depends on BR2_USE_MMU # fork()
	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal

> +
> +comment "supertuxkart needs an OpenGL backend"
> +	depends on !BR2_PACKAGE_HAS_LIBGL

  Missing comment for XORG7.

  We also try to put everything in a single comment:

comment "supertuxkart needs X, an OpenGL backend, a toolchain w/ NPTL, C++"

It's a few characters too long but acceptable IMHO.

> diff --git a/package/supertuxkart/supertuxkart-rm-x11r6-include.patch b/package/supertuxkart/supertuxkart-rm-x11r6-include.patch
> new file mode 100644
> index 000000000000..368db9417192
> --- /dev/null
> +++ b/package/supertuxkart/supertuxkart-rm-x11r6-include.patch
> @@ -0,0 +1,14 @@

  Missing description + SoB.

  Since upstream uses git, we prefer git formatted patches.

> +diff -Naur supertuxkart-0.9.1-old/lib/irrlicht/CMakeLists.txt supertuxkart-0.9.1/lib/irrlicht/CMakeLists.txt
> +--- supertuxkart-0.9.1-old/lib/irrlicht/CMakeLists.txt	2016-05-13 12:21:04.857373661 -0300
> ++++ supertuxkart-0.9.1/lib/irrlicht/CMakeLists.txt	2016-05-13 12:21:25.277821763 -0300
> +@@ -25,8 +25,8 @@
> +   add_definitions(-D_IRR_STATIC_LIB_)
> +   add_definitions(-D_CRT_SECURE_NO_WARNINGS) # Shut up about unsafe stuff
> + else()
> +-  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
> +-  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations -I/usr/X11R6/include")
> ++  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
> ++  set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wall -pipe -O3  -fno-exceptions  -fstrict-aliasing -fexpensive-optimizations")
> + endif()
> +
> + # Xrandr
> diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
> new file mode 100644
> index 000000000000..d8e7ac30f6d1
> --- /dev/null
> +++ b/package/supertuxkart/supertuxkart.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	c50f00a71df165fb613d20e86bea2d9d5e51ed3e27e1d436fbac3b07cf2ea149	supertuxkart-0.9.1-src.tar.xz

  There's a sha1 and md5 on sourceforge. We prefer to include those as well.

# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.1/
sha1  2208405a3a0f2117caf6ae00c24debb611ad7d2e  supertuxkart-0.9.1-src.tar.xz
md5  5d87d943f2e746043aed87dc80004701  supertuxkart-0.9.1-src.tar.xz

  Also, preferably use two spaces to separate fields, like the output of sha256sum.

> diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
> new file mode 100644
> index 000000000000..4898140a055e
> --- /dev/null
> +++ b/package/supertuxkart/supertuxkart.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# supertuxkart
> +#
> +################################################################################
> +
> +SUPERTUXKART_VERSION = 0.9.1
> +SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
> +SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
> +SUPERTUXKART_LICENSE = GPLv3
> +SUPERTUXKART_LICENSE_FILES = COPYING

  I didn't bother checking the licenses before, and of course it's complicated. 
So I uploaded to fossology and it gets even worse :-)

  First of all, it's GPLv3+.

  But then there are the bundled libraries. irrlicht, bullet and angelscript 
have zlib license; glew is BSD-3c. Now, they all end up in a statically linked 
binary, so I guess it's OK to keep it as GPLv3+ after all.


> +
> +SUPERTUXKART_DEPENDENCIES += jpeg libcurl libgl libglu libpng libogg libvorbis openal zlib xlib_libXrandr

  This is not entirely alphabetical. Also, it's too long. You can either split 
the line, or (my personal preference):

SUPERTUXKART_DEPENDENCIES = \
	jpeg \
	libcurl \
	libgl \
	libglu \
	libogg \
	libpng \
	libvorbis \
	openal \
	xlib_libXrandr \
	zlib

> +
> +# Since supertuxkart is not installing libstkirrlicht.so,
> +# and given we don't really need that library to be shared
> +# we turn off shared libs here.
> +SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF

  What about angelscript and wiiuse?

  That said, I agree with the principle, but maybe reword the comment as follows:

# Since supertuxkart is not installing libstkirrlicht.so, and since it is the
# only user of the bundled libraries, turn off shared libraries entirely.

  Note BTW that wrapping in *.mk is at 80 columns.


> +
> +ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
> +SUPERTUXKART_DEPENDENCIES += libfribidi
> +SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=ON
> +else
> +SUPERTUXKART_CONF_OPTS += -DUSE_FRIBIDI=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
> +SUPERTUXKART_DEPENDENCIES += bluez5_utils

  Add an explicit -DUSE_WIIUSE=ON

> +else
> +# Disable Wiimote support

  This comment is redundant. You could add a comment before the condition like this:

# Wiimote support relies on bluez5.



  Finally, there's the issue of the bundled angelscript. AFAICS supertuxkart 
supports an installed angelscript as well. But we don't have that package yet, 
so ideally it should be added as a first patch in the series.

  But I'm OK with using the bundled one for now.

  Regards,
  Arnout

> +SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
> +endif
> +
> +$(eval $(cmake-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
