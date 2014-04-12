From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Apr 2014 18:10:21 +0200
Subject: [Buildroot] [PATCH 1/1] xbmc: Depend on host-gettext
Message-ID: <1397319021-20282-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autoreconf error:

autoreconf -vif lib/cpluff
autoreconf: Entering directory `lib/cpluff'
autoreconf: running: autopoint --force
Can't exec "autopoint": Datei oder Verzeichnis nicht gefunden at /home/br2/buildroot/output/host/usr/share/autoconf/Autom4te/FileUtils.pm line 345.
autoreconf: failed to run autopoint: No such file or directory
autoreconf: autopoint is needed because this package uses Gettext
make[1]: *** [lib/cpluff/configure] Error 1

[...]

./configure: line 31638: ./configure: No such file or directory
configure: error: Submodule lib/cpluff failed to configure
make: *** [/home/br2/buildroot/output/build/xbmc-12.3-Frodo/.stamp_configured] Error 1

Error occured using this minimal defconfig derived from raspberrypi_defconfig:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_DEFCONFIG="configs/raspberrypi_defconfig"
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.10.33"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3bff11d4d4b8dc28cb9ce81449c989466ba27198"
BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBCEC=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_LIBNFS=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_USERLAND=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/xbmc.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 69bb1ef..021e70a 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -12,7 +12,8 @@ XBMC_LICENSE_FILES = LICENSE.GPL
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
+XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo \
+	host-sdl_image host-swig
 XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
-- 
1.7.10.4
