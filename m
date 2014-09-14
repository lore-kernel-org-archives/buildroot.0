From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:56:36 +0200
Subject: [Buildroot] [PATCH 20 of 20] packages: rename misc. occurrences
 of _OPT into _OPTS
In-Reply-To: <246b5329db5322303fef.1406668367@localhost>
References: <patchbomb.1406668347@localhost>
 <246b5329db5322303fef.1406668367@localhost>
Message-ID: <20140914145636.GP3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> change remaining occurrences of _OPT into _OPTS.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a very important comment, see below...

[--SNIP--]
> diff -r 1769f2d29e40 -r 246b5329db53 package/cdrkit/cdrkit.mk
> --- a/package/cdrkit/cdrkit.mk	Tue Jul 29 22:13:41 2014 +0200
> +++ b/package/cdrkit/cdrkit.mk	Tue Jul 29 22:18:26 2014 +0200
> @@ -11,12 +11,12 @@
>  CDRKIT_LICENSE_FILES = COPYING
>  
>  ifeq ($(BR2_ENDIAN),"BIG")
> -CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
> +CMAKE_ENDIAN_OPTS=-DBITFIELDS_HTOL=1
>  else
> -CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
> +CMAKE_ENDIAN_OPTS=-DBITFIELDS_HTOL=0
>  endif

That's horibly wrong (but unrelated to your patch): packages variables
should be prefixed with the name of the package, so as not to polute the
global namespace (or worse, another package's namespace, like here for
cmake.)

This should be fixed in another patch, of course, and is obviously not
your fault (he, I should git-blame before I say so! :-) )

Regards,
Yann E. MORIN.
 
> -CDRKIT_CONF_OPTS += $(CMAKE_ENDIAN_OPT)
> +CDRKIT_CONF_OPTS += $(CMAKE_ENDIAN_OPTS)
>  
>  ## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
>  ## some extra flags so it finds needed libs and headers.
> diff -r 1769f2d29e40 -r 246b5329db53 package/dhcpcd/dhcpcd.mk
> --- a/package/dhcpcd/dhcpcd.mk	Tue Jul 29 22:13:41 2014 +0200
> +++ b/package/dhcpcd/dhcpcd.mk	Tue Jul 29 22:18:26 2014 +0200
> @@ -11,15 +11,15 @@
>  DHCPCD_LICENSE = BSD-2c
>  
>  ifeq ($(BR2_INET_IPV6),)
> -	DHCPCD_CONFIG_OPT += --disable-ipv6
> +	DHCPCD_CONFIG_OPTS += --disable-ipv6
>  endif
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> -	DHCPCD_CONFIG_OPT += --enable-static
> +	DHCPCD_CONFIG_OPTS += --enable-static
>  endif
>  
>  ifeq ($(BR2_USE_MMU),)
> -	DHCPCD_CONFIG_OPT += --disable-fork
> +	DHCPCD_CONFIG_OPTS += --disable-fork
>  endif
>  
>  define DHCPCD_CONFIGURE_CMDS
> @@ -27,7 +27,7 @@
>  	$(TARGET_CONFIGURE_OPTS) ./configure \
>  		--target=$(BR2_GCC_TARGET_ARCH) \
>  		--os=linux \
> -		$(DHCPCD_CONFIG_OPT) )
> +		$(DHCPCD_CONFIG_OPTS) )
>  endef
>  
>  define DHCPCD_BUILD_CMDS
> diff -r 1769f2d29e40 -r 246b5329db53 package/freetype/freetype.mk
> --- a/package/freetype/freetype.mk	Tue Jul 29 22:13:41 2014 +0200
> +++ b/package/freetype/freetype.mk	Tue Jul 29 22:18:26 2014 +0200
> @@ -20,7 +20,7 @@
>  # Regen required because the tarball ships with an experimental ltmain.sh
>  # that can't be patched by our infra.
>  # autogen.sh is because autotools stuff lives in other directories and
> -# even AUTORECONF with _OPT doesn't do it properly.
> +# even AUTORECONF with _OPTS doesn't do it properly.
>  # POST_PATCH is because we still need to patch libtool after the regen.
>  define FREETYPE_RUN_AUTOGEN
>  	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> diff -r 1769f2d29e40 -r 246b5329db53 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk	Tue Jul 29 22:13:41 2014 +0200
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk	Tue Jul 29 22:18:26 2014 +0200
> @@ -10,69 +10,69 @@
>  GST_FFMPEG_INSTALL_STAGING = YES
>  GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
>  
> -GST_FFMPEG_CONF_EXTRA_OPT = \
> +GST_FFMPEG_CONF_EXTRA_OPTS = \
>  		--cross-prefix=$(TARGET_CROSS) \
>  		--target-os=linux
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
>  GST_FFMPEG_DEPENDENCIES += zlib
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-zlib
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-zlib
>  endif
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-bzlib
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-bzlib
>  GST_FFMPEG_DEPENDENCIES += bzip2
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-bzlib
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-bzlib
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_MMX),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-yasm
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-yasm
>  GST_FFMPEG_DEPENDENCIES += host-yasm
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-yasm
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-mmx
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-yasm
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-mmx
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_SSE),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-sse
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-sse
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-sse
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-sse
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-ssse3
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-ssse3
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-ssse3
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-ssse3
>  endif
>  
>  # Explicitly disable everything that doesn't match for ARM
>  # FFMPEG "autodetects" by compiling an extended instruction via AS
>  # This works on compilers that aren't built for generic by default
>  ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv5te
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
>  endif
>  ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-armv6
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
>  endif
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-neon
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-neon
>  endif
>  
>  ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-altivec
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-altivec
>  else
> -GST_FFMPEG_CONF_EXTRA_OPT += --disable-altivec
> +GST_FFMPEG_CONF_EXTRA_OPTS += --disable-altivec
>  endif
>  
>  ifeq ($(BR2_PREFER_STATIC_LIB),)
> -GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
> +GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
>  endif
>  
> -GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
> +GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
>  
>  $(eval $(autotools-package))
> diff -r 1769f2d29e40 -r 246b5329db53 package/gstreamer1/gst1-libav/gst1-libav.mk
> --- a/package/gstreamer1/gst1-libav/gst1-libav.mk	Tue Jul 29 22:13:41 2014 +0200
> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk	Tue Jul 29 22:18:26 2014 +0200
> @@ -10,74 +10,74 @@
>  
>  GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
>  
> -GST1_LIBAV_CONF_EXTRA_OPT = \
> +GST1_LIBAV_CONF_EXTRA_OPTS = \
>  	--cross-prefix=$(TARGET_CROSS) \
>  	--target-os=linux \
>  	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
>  
>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-zlib
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
>  GST1_LIBAV_DEPENDENCIES += zlib
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-zlib
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
>  endif
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-bzlib
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
>  GST1_LIBAV_DEPENDENCIES += bzip2
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-bzlib
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_MMX),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-yasm
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
>  GST1_LIBAV_DEPENDENCIES += host-yasm
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-yasm
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-mmx
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-yasm
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mmx
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_SSE),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-sse
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-sse
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-sse
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-sse
>  endif
>  
>  ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-ssse3
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-ssse3
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-ssse3
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-ssse3
>  endif
>  
>  # Explicitly disable everything that doesn't match for ARM
>  # FFMPEG "autodetects" by compiling an extended instruction via AS
>  # This works on compilers that aren't built for generic by default
>  ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv5te
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
>  endif
>  ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-armv6
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
>  endif
>  ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-neon
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-neon
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-neon
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-neon
>  endif
>  ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-vfp
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-vfp
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-vfp
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
>  endif
>  
>  ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
> -GST1_LIBAV_CONF_EXTRA_OPT += --enable-altivec
> +GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
>  else
> -GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
> +GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
>  endif
>  
>  GST1_LIBAV_CONF_OPTS = \
> -	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
> +	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
>  
>  $(eval $(autotools-package))

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
