From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 22:22:01 +0100
Subject: [Buildroot] [PATCHv2 6/7] package/supertux: remove explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210212135451.22786-7-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-7-patrickdepinguin@gmail.com>
Message-ID: <acd82388-c5a3-4c14-c4f9-e7adfa44c0c2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 14:54, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> supertux explicitly set CMAKE_BUILD_TYPE=Release, ignoring any possible
> value of BR2_ENABLE_DEBUG (previously) or BR2_ENABLE_RUNTIME_DEBUG (now).
> 
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, this change should no
> longer be necessary. Users that do not wish to have profiling information,
> just keep BR2_ENABLE_RUNTIME_DEBUG disabled (default value), and those that
> enable BR2_ENABLE_RUNTIME_DEBUG will get profiling.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/supertux/supertux.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
> index e4a4630918..a339c42e42 100644
> --- a/package/supertux/supertux.mk
> +++ b/package/supertux/supertux.mk
> @@ -18,7 +18,6 @@ SUPERTUX_LICENSE_FILES = LICENSE.txt data/AUTHORS
>  SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew \
>  	libogg libpng libvorbis openal physfs sdl2 sdl2_image
>  
> -# CMAKE_BUILD_TYPE=Release: disable profiling code (-pg)

 Same here: it may fail to build if no profiling is available in the toolchain.

 Regards,
 Arnout

>  # ENABLE_BOOST_STATIC_LIBS=OFF: use boost shared libraries since supertux
>  # depends on !BR2_STATIC_LIBS and boost provide only shared libraries with
>  # BR2_SHARED_LIBS.
> @@ -29,7 +28,6 @@ SUPERTUX_DEPENDENCIES = host-pkgconf boost freetype libcurl libgl libglew \
>  # in physfs.h (CHECK_SYMBOL_EXISTS) doesn't work.
>  # ENABLE_OPENGLES2=OFF: Disable opengles2 for now.
>  SUPERTUX_CONF_OPTS += \
> -	-DCMAKE_BUILD_TYPE=Release \
>  	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGLEW_NO_GLU" \
>  	-DENABLE_BOOST_STATIC_LIBS=OFF \
>  	-DBUILD_DOCUMENTATION=OFF \
> 
