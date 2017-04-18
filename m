From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 22:14:19 +0200
Subject: [Buildroot] [PATCH 2/2] odroid-gl: reorganize structure
In-Reply-To: <20170417065654.28313-2-daggs@gmx.com>
References: <20170417065654.28313-1-daggs@gmx.com>
 <20170417065654.28313-2-daggs@gmx.com>
Message-ID: <f4fb0589-647c-00a8-818f-47cc72b27792@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Dagg,

On 17-04-17 08:56, Dagg Stompler wrote:
>  - remove support for 32 bit libs as it is impossible to build a 32 bit odroid image.

 I think this part should be a separate patch.

>  - reorganize structure to support other boards from odroid.

 This would better be combined in a series that actually adds such a different
board, so we can see where this is going.

> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/odroid-gl/Config.in      | 13 +++++++++++--
>  package/odroid-gl/odroid-gl.hash |  2 +-
>  package/odroid-gl/odroid-gl.mk   | 20 ++++++++++++--------
>  3 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/package/odroid-gl/Config.in b/package/odroid-gl/Config.in
> index 9c605f6de..72727f41e 100644
> --- a/package/odroid-gl/Config.in
> +++ b/package/odroid-gl/Config.in
> @@ -6,9 +6,10 @@ config BR2_PACKAGE_ODROID_GL
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_aarch64 || BR2_ARM_EABIHF
>  	help
> -	  Install the ARM Mali drivers for odroidc2 based systems.
> +	  Install the ARM Mali drivers for odorid boards.
                                           ^^^^^^ odroid?

>  
> -	  https://github.com/mdrjr/c2_mali
> +	  support list:
> +	    c2: https://github.com/mdrjr/c2_mali

 I guess the idea here is to add more boards?

>  
>  if BR2_PACKAGE_ODROID_GL
>  
> @@ -18,6 +19,14 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
>  config BR2_PACKAGE_PROVIDES_LIBGLES
>  	default "odroid-gl"
>  
> +choice
> +	prompt "odroid board selection"
> +
> +	config BR2_PACKAGE_ODROID_GL_C2
> +		bool "odroid c2 gl"

 With just one option, this choice really doesn't make any sense. It could make
sense as an in-between patch in a series that adds 4 or more additional boards.
But if it is just one or two more, you can keep it in a single patch adding
those two options.

 Also, in this patch you're introducing this new symbol, but you're not actually
using it anywhere. That is really completely pointless: even if you gradually
want to add several boards, the first patch should contain both the new config
symbol and how it is used in the .mk file.

 [sidetrack: it is already crazy that Mali needs a different binary blob for
different chips, but it also needs a different binary for a different *board*?
Really? What are these guys smoking?]

> +
> +endchoice
> +
>  endif
>  
>  config BR2_PACKAGE_ODROID_GL_X11
> diff --git a/package/odroid-gl/odroid-gl.hash b/package/odroid-gl/odroid-gl.hash
> index b71ebab13..456944651 100644
> --- a/package/odroid-gl/odroid-gl.hash
> +++ b/package/odroid-gl/odroid-gl.hash
> @@ -1,2 +1,2 @@
>  # Locally computed hash
> -sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-mali-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
> +sha256 6c85e96f3372c24c6497f2a1cbea867a8dbf3a7b3edd736802c762176006aec6  odroid-gl-c2-4f8a541693fee5fdcaa162a7fd8922861a4ba0a9.tar.gz
> diff --git a/package/odroid-gl/odroid-gl.mk b/package/odroid-gl/odroid-gl.mk
> index 0591497ca..40be77f01 100644
> --- a/package/odroid-gl/odroid-gl.mk
> +++ b/package/odroid-gl/odroid-gl.mk
> @@ -4,8 +4,20 @@
>  #
>  ################################################################################
>  
> +ifeq ($(BR2_PACKAGE_ODROID_GL_C2),y)
>  ODROID_GL_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
>  ODROID_GL_SITE = $(call github,mdrjr,c2_mali,$(ODROID_GL_VERSION))
> +ODROID_GL_LIBS_SUBDIR = fbdev/mali_libs/
> +ODROID_GL_PREFIX = c2
> +ifeq ($(BR2_PACKAGE_ODROID_GL_X11),y)
> +ODROID_GL_HEADERS_SUBDIR = x11/mali_headers/
> +ODROID_GL_LIBS_SUBDIR = x11/mali_libs/

 What is the reason to move this part?

> +else
> +ODROID_GL_HEADERS_SUBDIR = fbdev/mali_headers/
> +endif
> +endif
> +
> +ODROID_GL_SOURCE := odroid-gl-$(ODROID_GL_PREFIX)-$(ODROID_GL_VERSION).tar.gz

 Use = instead of :=, except if there is a *really* good reason not to. And such
a reason would typically warrant a comment explaining it.

 But I wonder where this is going... With the github helper, the _SOURCE can
actually be set to *anything* (as long as it ends with .tar.gz). github will
only look at the directory path leading up to it. So this ODROID_GL_PREFIX can't
possibly have any function, as far as I can see...

>  ODROID_GL_LICENSE = Hardkernel EULA
>  ODROID_GL_LICENSE_FILES = README.md
>  
> @@ -13,8 +25,6 @@ ODROID_GL_INSTALL_STAGING = YES
>  ODROID_GL_PROVIDES = libegl libgles
>  
>  ifeq ($(BR2_PACKAGE_ODROID_GL_X11),y)
> -ODROID_GL_HEADERS_SUBDIR = x11/mali_headers/
> -ODROID_GL_LIBS_SUBDIR = x11/mali_libs/
>  # The X11 blobs are linked against those libraries, and the headers
>  # include headers from those libraries
>  ODROID_GL_DEPENDENCIES += \
> @@ -25,12 +35,6 @@ define ODROID_GL_FIX_EGL_PC
>  	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
>  		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
>  endef
> -ODROID_GL_HEADERS_SUBDIR = fbdev/mali_headers/
> -ifeq ($(BR2_aarch64),y)
> -ODROID_GL_LIBS_SUBDIR = fbdev/mali_libs/
> -else
> -ODROID_GL_LIBS_SUBDIR = fbdev/32bit_libs/

 If it can never work on 32 bits, why do they even have this directory?

 Regards,
 Arnout

> -endif
>  endif
>  
>  define ODROID_GL_INSTALL_LIBS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
