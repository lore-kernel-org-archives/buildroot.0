From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:23:28 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: disable opencv
 python and cpp example
Message-ID: <20200823111627.4763B801F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c1174ddd0dcefbbaf1b4f803ffc03736a1abff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-numpy is an optional dependency since
https://github.com/jacksonliam/mjpg-streamer/commit/545c1a1d3abf72bb7a97c870c78e85dd0845f63a

This dependency will raise the following build failure if python-numpy
is found on the host:

aarch64_be-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/lib/python3/dist-packages/numpy/core/include'

because mjpg-streamer uses the python executable to retrieve the include
directory:

-- Found PythonLibs: /home/peko/autobuild/instance-0/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/lib/libpython3.8.so (found version "3.8.5")
-- Found PythonInterp: /usr/bin/python3.5 (found version "3.5.3")
-- Found NUMPY: /usr/lib/python3/dist-packages/numpy/core/include

So disable python filter as well as cpp example while at it

Fixes:
 - http://autobuild.buildroot.org/results/e6795fa8ed5d8514b3e10ea1135afb31eab22b7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mjpg-streamer/mjpg-streamer.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 64404e21fa..46f3f50104 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -23,7 +23,10 @@ MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),yyy)
-MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=ON
+MJPG_STREAMER_CONF_OPTS += \
+	-DPLUGIN_INPUT_OPENCV=ON \
+	-DPLUGIN_CVFILTER_CPP=OFF \
+	-DPLUGIN_CVFILTER_PY=OFF
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf opencv3
 else
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
