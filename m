From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 08:55:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/gstreamer1/gst1-plugins-ugly: fix static build with libdvdcss
Message-ID: <20200722065317.9E0A3880BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f457d1637ac265895d5b2238ca6e4e552577573
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The double quotes from GST1_PLUGINS_UGLY_LDFLAGS += "-ldvdcss"
raise the following build failure:

sed -e 's%@TARGET_CROSS@%/home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-%g' -e 's%@TARGET_ARCH@%arm%g' -e 's%@TARGET_CPU@%arm926ej-s%g' -e 's%@TARGET_ENDIAN@%little%g' -e 's%@TARGET_CFLAGS@%"-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE", "-D_FILE_OFFSET_BITS=64", "-Os", "-g2", "-static"%g' -e 's%@TARGET_LDFLAGS@%"-static", ""-ldvdcss""%g' -e 's%@TARGET_CXXFLAGS@%"-D_LARGEFILE_SOURCE", "-D_LARGEFILE64_SOURCE", "-D_FILE_OFFSET_BITS=64", "-Os", "-g2", "-static", "-static"%g' -e 's%@HOST_DIR@%/home/buildroot/autobuild/run/instance-2/output-1/host%g' -e 's%@STAGING_DIR@%/home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot%g' -e 's%@STATIC@%true%g' -e "/^\[binaries\]$/s:$::" -e "/^\[properties\]$/s:$::" package/meson/cross-compilation.conf.in > /home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2//build/cross-compilation.conf
PATH="/home/buildroot/autobuild/run/instance-2/output-1/host/bin:/home/buildroot/autobuild/run/instance-2/output-1/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  PYTHONNOUSERSITE=y /home/buildroot/autobuild/run/instance-2/output-1/host/bin/meson --prefix=/usr --libdir=lib --default-library=static --buildtype=debug --cross-file=/home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2//build/cross-compilation.conf -Dbuild.pkg_config_path=/home/buildroot/autobuild/run/instance-2/output-1/host/lib/pkgconfig -Dexamples=disabled -Dtests=disabled -Da52dec=disabled -Damrnb=disabled -Damrwbdec=disabled -Dcdio=disabled -Dsidplay=disabled -Dorc=disabled -Dasfdemux=enabled -Ddvdlpcmdec=disabled -Ddvdsub=disabled -Dxingmux=disabled -Drealmedia=disabled -Ddvdread=enabled -Dmpeg2dec=disabled -Dx264=disabled /home/buildroot/autobuild/run/instance-2/output-1/build/gst1-plugins-ugly-1.16.2/ /home/buildroot/autobuild/run/instance-2/output-1/build/gs
 t1-plugins-ugly-1.16.2//build

ERROR: Malformed value in cross file variable c_link_args.

However since the switch to messon, this workaround is not needed so
drop it

Fixes:
 - http://autobuild.buildroot.org/results/56a830625cf6e6b0d63b6e7e2761496abc146152

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 03b5c4f91d333e09a02bff6989dc8831d7579e14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 284516f7d1..9f8b1d3359 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -64,10 +64,6 @@ GST1_PLUGINS_UGLY_CONF_OPTS += -Drealmedia=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
-# configure does not use pkg-config to detect libdvdread
-ifeq ($(BR2_PACKAGE_LIBDVDCSS)$(BR2_STATIC_LIBS),yy)
-GST1_PLUGINS_UGLY_LDFLAGS += "-ldvdcss"
-endif
 GST1_PLUGINS_UGLY_CONF_OPTS += -Ddvdread=enabled
 GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
