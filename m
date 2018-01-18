From: Guillermo A. Amaral <g@maral.me>
Date: Thu, 18 Jan 2018 00:19:13 -0800
Subject: [Buildroot] [PATCH 1/1] package/sdl2: Fix Raspberry Pi support
 in package SDL2
In-Reply-To: <20180118081528.16612-1-g@maral.me>
References: <20180116175054.GB28324@enterprise.starfleet>
 <20180118081528.16612-1-g@maral.me>
Message-ID: <20180118081913.GA16691@enterprise.starfleet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Just a little heads up. I did try AUTORECONF but it would fail to
generate the configure script.

The upstream patch contains the configure diff as well, so I left well
enough alone.

Cheers,
G

On Thu, Jan 18, 2018 at 12:15:28AM -0800, Guillermo A. Amaral wrote:
> Backported upstream patch which makes SDL2 more cross-compiler friendly.
> 
> Signed-off-by: Guillermo A. Amaral <g@maral.me>
> ---
>  .../sdl2/0001-make-cross-compiler-friendly.patch   | 176 +++++++++++++++++++++
>  package/sdl2/sdl2.mk                               |   8 +-
>  2 files changed, 183 insertions(+), 1 deletion(-)
>  create mode 100644 package/sdl2/0001-make-cross-compiler-friendly.patch
> 
> diff --git a/package/sdl2/0001-make-cross-compiler-friendly.patch b/package/sdl2/0001-make-cross-compiler-friendly.patch
> new file mode 100644
> index 000000000..42d636adc
> --- /dev/null
> +++ b/package/sdl2/0001-make-cross-compiler-friendly.patch
> @@ -0,0 +1,176 @@
> +From ca98276a3b806b06a019ba5784b075d5d371befd Mon Sep 17 00:00:00 2001
> +From: "Guillermo A. Amaral" <g@maral.me>
> +Date: Tue, 16 Jan 2018 22:19:12 -0800
> +Subject: [PATCH] Make rpi video cross-compiler friendly.
> +
> +* Stops using fixed path to find GLES/EGL libs.
> +* Tries pkg-config to locate bcm_host.
> +
> +Signed-off-by: Guillermo A. Amaral <g@maral.me>
> +---
> + cmake/sdlchecks.cmake | 13 ++++++++-----
> + configure             | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> + configure.in          |  6 +++++-
> + src/video/SDL_egl.c   | 29 +++++++++++++++++++++++------
> + 4 files changed, 81 insertions(+), 13 deletions(-)
> +
> +diff --git a/cmake/sdlchecks.cmake b/cmake/sdlchecks.cmake
> +index e2e89a2..5dde86c 100644
> +--- a/cmake/sdlchecks.cmake
> ++++ b/cmake/sdlchecks.cmake
> +@@ -1127,15 +1127,18 @@ endmacro()
> + # - n/a
> + macro(CheckRPI)
> +   if(VIDEO_RPI)
> +-    set(VIDEO_RPI_INCLUDE_DIRS "/opt/vc/include" "/opt/vc/include/interface/vcos/pthreads" "/opt/vc/include/interface/vmcs_host/linux/" )
> +-    set(VIDEO_RPI_LIBRARY_DIRS "/opt/vc/lib" )
> +-    set(VIDEO_RPI_LIBS bcm_host )
> ++    pkg_check_modules(VIDEO_RPI bcm_host brcmegl)
> ++    if (NOT VIDEO_RPI_FOUND)
> ++      set(VIDEO_RPI_INCLUDE_DIRS "/opt/vc/include" "/opt/vc/include/interface/vcos/pthreads" "/opt/vc/include/interface/vmcs_host/linux/" )
> ++      set(VIDEO_RPI_LIBRARY_DIRS "/opt/vc/lib" )
> ++      set(VIDEO_RPI_LIBRARIES bcm_host )
> ++    endif()
> +     listtostr(VIDEO_RPI_INCLUDE_DIRS VIDEO_RPI_INCLUDE_FLAGS "-I")
> +     listtostr(VIDEO_RPI_LIBRARY_DIRS VIDEO_RPI_LIBRARY_FLAGS "-L")
> + 
> +     set(ORIG_CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS}")
> +     set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} ${VIDEO_RPI_INCLUDE_FLAGS} ${VIDEO_RPI_LIBRARY_FLAGS}")
> +-    set(CMAKE_REQUIRED_LIBRARIES "${VIDEO_RPI_LIBS}")
> ++    set(CMAKE_REQUIRED_LIBRARIES "${VIDEO_RPI_LIBRARIES}")
> +     check_c_source_compiles("
> +         #include <bcm_host.h>
> +         int main(int argc, char **argv) {}" HAVE_VIDEO_RPI)
> +@@ -1147,7 +1150,7 @@ macro(CheckRPI)
> +       set(SDL_VIDEO_DRIVER_RPI 1)
> +       file(GLOB VIDEO_RPI_SOURCES ${SDL2_SOURCE_DIR}/src/video/raspberry/*.c)
> +       set(SOURCE_FILES ${SOURCE_FILES} ${VIDEO_RPI_SOURCES})
> +-      list(APPEND EXTRA_LIBS ${VIDEO_RPI_LIBS})
> ++      list(APPEND EXTRA_LIBS ${VIDEO_RPI_LIBRARIES})
> +       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${VIDEO_RPI_INCLUDE_FLAGS} ${VIDEO_RPI_LIBRARY_FLAGS}")
> +     endif(SDL_VIDEO AND HAVE_VIDEO_RPI)
> +   endif(VIDEO_RPI)
> +diff --git a/configure b/configure
> +index b622085..5e91d08 100755
> +--- a/configure
> ++++ b/configure
> +@@ -19485,7 +19485,51 @@ else
> + fi
> + 
> +     if test x$enable_video = xyes -a x$enable_video_rpi = xyes; then
> +-        if test x$ARCH = xnetbsd; then
> ++        # Extract the first word of "pkg-config", so it can be a program name with args.
> ++set dummy pkg-config; ac_word=$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_path_PKG_CONFIG+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  case $PKG_CONFIG in
> ++  [\\/]* | ?:[\\/]*)
> ++  ac_cv_path_PKG_CONFIG="$PKG_CONFIG" # Let the user override the test with a path.
> ++  ;;
> ++  *)
> ++  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=$as_save_IFS
> ++  test -z "$as_dir" && as_dir=.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_path_PKG_CONFIG="$as_dir/$ac_word$ac_exec_ext"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=$as_save_IFS
> ++
> ++  test -z "$ac_cv_path_PKG_CONFIG" && ac_cv_path_PKG_CONFIG="no"
> ++  ;;
> ++esac
> ++fi
> ++PKG_CONFIG=$ac_cv_path_PKG_CONFIG
> ++if test -n "$PKG_CONFIG"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $PKG_CONFIG" >&5
> ++$as_echo "$PKG_CONFIG" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++        if test x$PKG_CONFIG != xno && $PKG_CONFIG --exists bcm_host; then
> ++            RPI_CFLAGS=`$PKG_CONFIG --cflags bcm_host brcmegl`
> ++            RPI_LDFLAGS=`$PKG_CONFIG --libs bcm_host brcmegl`
> ++        elif test x$ARCH = xnetbsd; then
> +             RPI_CFLAGS="-I/usr/pkg/include -I/usr/pkg/include/interface/vcos/pthreads -I/usr/pkg/include/interface/vmcs_host/linux"
> +             RPI_LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lbcm_host"
> +         else
> +diff --git a/configure.in b/configure.in
> +index 5ac2130..6a0b380 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1563,7 +1563,11 @@ CheckRPI()
> + AC_HELP_STRING([--enable-video-rpi], [use Raspberry Pi video driver [[default=yes]]]),
> +                   , enable_video_rpi=yes)
> +     if test x$enable_video = xyes -a x$enable_video_rpi = xyes; then
> +-        if test x$ARCH = xnetbsd; then
> ++        AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
> ++        if test x$PKG_CONFIG != xno && $PKG_CONFIG --exists bcm_host; then
> ++            RPI_CFLAGS=`$PKG_CONFIG --cflags bcm_host brcmegl`
> ++            RPI_LDFLAGS=`$PKG_CONFIG --libs bcm_host brcmegl`
> ++        elif test x$ARCH = xnetbsd; then
> +             RPI_CFLAGS="-I/usr/pkg/include -I/usr/pkg/include/interface/vcos/pthreads -I/usr/pkg/include/interface/vmcs_host/linux"
> +             RPI_LDFLAGS="-Wl,-R/usr/pkg/lib -L/usr/pkg/lib -lbcm_host"
> +         else
> +diff --git a/src/video/SDL_egl.c b/src/video/SDL_egl.c
> +index 9ccc2c3..08132b4 100644
> +--- a/src/video/SDL_egl.c
> ++++ b/src/video/SDL_egl.c
> +@@ -44,12 +44,13 @@
> + 
> + #if SDL_VIDEO_DRIVER_RPI
> + /* Raspbian places the OpenGL ES/EGL binaries in a non standard path */
> +-#define DEFAULT_EGL "/opt/vc/lib/libbrcmEGL.so"
> +-#define DEFAULT_OGL_ES2 "/opt/vc/lib/libbrcmGLESv2.so"
> +-#define ALT_EGL "/opt/vc/lib/libEGL.so"
> +-#define ALT_OGL_ES2 "/opt/vc/lib/libGLESv2.so"
> +-#define DEFAULT_OGL_ES_PVR "/opt/vc/lib/libGLES_CM.so"
> +-#define DEFAULT_OGL_ES "/opt/vc/lib/libGLESv1_CM.so"
> ++static const char g_rpi_opt_path[] = "/opt/vc/lib";
> ++#define DEFAULT_EGL "libbrcmEGL.so"
> ++#define DEFAULT_OGL_ES2 "libbrcmGLESv2.so"
> ++#define ALT_EGL "libEGL.so"
> ++#define ALT_OGL_ES2 "libGLESv2.so"
> ++#define DEFAULT_OGL_ES_PVR "libGLES_CM.so"
> ++#define DEFAULT_OGL_ES "libGLESv1_CM.so"
> + 
> + #elif SDL_VIDEO_DRIVER_ANDROID || SDL_VIDEO_DRIVER_VIVANTE
> + /* Android */
> +@@ -257,6 +258,22 @@ SDL_EGL_LoadLibrary(_THIS, const char *egl_path, NativeDisplayType native_displa
> +     const char *d3dcompiler;
> + #endif
> + 
> ++#if SDL_VIDEO_DRIVER_RPI
> ++    path = SDL_getenv("LD_LIBRARY_PATH");
> ++    if (path) {
> ++        const int path_size = SDL_strlen(path) + 1 + sizeof(g_rpi_opt_path);
> ++        char *new_path = SDL_calloc(1, path_size);
> ++        strcat(new_path, path);
> ++        strcat(new_path, ":");
> ++        strcat(new_path, g_rpi_opt_path);
> ++        SDL_setenv("LD_LIBRARY_PATH", new_path, 1);
> ++        SDL_free(new_path);
> ++    } else {
> ++        SDL_setenv("LD_LIBRARY_PATH", g_rpi_opt_path, 1);
> ++    }
> ++    path = NULL;
> ++#endif
> ++
> +     if (_this->egl_data) {
> +         return SDL_SetError("OpenGL ES context already created");
> +     }
> +-- 
> +2.13.6
> +
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 3e3ba54aa..113e1063d 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -19,7 +19,6 @@ SDL2_CONF_OPTS += \
>  	--disable-dbus \
>  	--disable-pulseaudio \
>  	--disable-video-wayland \
> -	--disable-video-rpi
>  
>  # We must enable static build to get compilation successful.
>  SDL2_CONF_OPTS += --enable-static
> @@ -39,6 +38,13 @@ else
>  SDL2_CONF_OPTS += --disable-video-directfb
>  endif
>  
> +ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
> +SDL2_DEPENDENCIES += rpi-userland
> +SDL2_CONF_OPTS += --enable-video-rpi
> +else
> +SDL2_CONF_OPTS += --disable-video-rpi
> +endif
> +
>  # x-includes and x-libraries must be set for cross-compiling
>  # By default x_includes and x_libraries contains unsafe paths.
>  # (/usr/X11R6/include and /usr/X11R6/lib)
> -- 
> 2.13.6

-- 
gamaral
