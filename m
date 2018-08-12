From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:30:29 +0200
Subject: [Buildroot] [PATCH/RFC/next 1/1] package/kodi: switch to
 internal ffmpeg version 3.1.11 build
In-Reply-To: <20180811211028.23679-1-bernd.kuhls@t-online.de>
References: <20180811211028.23679-1-bernd.kuhls@t-online.de>
Message-ID: <20180812143029.3178d100@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 11 Aug 2018 23:10:28 +0200, Bernd Kuhls wrote:
> Kodi 17 is incompatible with ffmpeg-4.x. To prepare the ffmpeg bump we
> switch the current Kodi package to internally build and statically link
> to patched ffmpeg-3.1.11 provided by upstream. Gnutls is added as
> dependency to allow playback of https streams.
> 
> Upstream expects Kodi 17 to be used with ffmpeg 3.1.x (see upstream PR
> 12368) so we choose the upstream way to build ffmpeg instead of provi-
> ding a version choice for ffmpeg in buildroot.
> 
> This hackish commit can be reverted when Kodi is bumped to version 18,
> currently released as alpha3.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

OK, not nice, but I didn't don't see us having much choice here.

> diff --git a/package/kodi/0004-fix-ffmpeg-internal-cross-build.patch b/package/kodi/0004-fix-ffmpeg-internal-cross-build.patch
> new file mode 100644
> index 0000000000..7f71be3a00
> --- /dev/null
> +++ b/package/kodi/0004-fix-ffmpeg-internal-cross-build.patch
> @@ -0,0 +1,54 @@
> +Fix crosscompiling issues
> +
> +The codepath for KODI_DEPENDSBUILD needs to be used in order to provide
> +the correct crosscompiling options to ffmpeg. The CMake option
> +KODI_DEPENDSBUILD itself can not be enabled because it disables the
> +internal build of libdvd*.
> +
> +To link kodi.bin with the statically built ffmpeg libraries kodi uses
> +a wrapper script which calls pkgconfig. Our pkgconfig is patched to
> +alter paths which breaks the link command in this case. Add a hack
> +to force the usage of unpatched /usr/bin/pkg-config instead.

I don't think you're guaranteed that /usr/bin/pkg-config exists. What
is the problem with our own pkg-config ?

Indeed, our wrapper script only overwrites
PKG_CONFIG_PATH/PKG_CONFIG_LIBDIR if they are not already defined:

DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"

> +-  avformat=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavcodec`
> +-  avcodec=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavformat`
> +-  avfilter=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavfilter`
> +-  avutil=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libavutil`
> +-  swscale=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswscale`
> +-  swresample=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig ${PKG_CONFIG_EXECUTABLE} --libs --static libswresample`
> +-  gnutls=`PKG_CONFIG_PATH=${DEPENDS_PATH}/lib/pkgconfig/ ${PKG_CONFIG_EXECUTABLE}  --libs-only-l --static --silence-errors gnutls`
> ++  avformat=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libavcodec`
> ++  avcodec=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libavformat`
> ++  avfilter=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libavfilter`
> ++  avutil=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libavutil`
> ++  swscale=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libswscale`
> ++  swresample=`PKG_CONFIG_PATH=${CMAKE_BINARY_DIR}/${CORE_BUILD_DIR}/lib/pkgconfig /usr/bin/pkg-config --libs --static libswresample`
> ++  gnutls=`PKG_CONFIG_PATH=${DEPENDS_PATH}/lib/pkgconfig/ /usr/bin/pkg-config --libs-only-l --static --silence-errors gnutls`

Did you try changing PKG_CONFIG_PATH to PKG_CONFIG_LIBDIR ?
PKG_CONFIG_LIBDIR entirely replaces the pkg-config search path, while
PKG_CONFIG_PATH only appends to it. I'd say this should probably fix
your problem, without having to use /usr/bin/pkg-config (and it would
no longer be a hack).

Also, please use a Git-formatted patch, and don't forget your
Signed-off-by, which was missing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
