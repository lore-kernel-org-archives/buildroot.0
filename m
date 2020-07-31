From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  1 Aug 2020 00:15:13 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/libcamera: needs faligned-new
Message-ID: <20200731221514.32623-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - http://autobuild.buildroot.net/results/2db7292e251ce81d31187c3a9eb36dbc9236bd07

  ../src/libcamera/v4l2_videodevice.cpp: In member function 'int libcamera::V4L2VideoDevice::allocateBuffers(unsigned int, std::vector<std::unique_ptr<libcamera::FrameBuffer> >*)':
  ../src/libcamera/v4l2_videodevice.cpp:1139:39: error: 'new' of type 'libcamera::V4L2BufferCache' with extended alignment 8 [-Werror=aligned-new=]
   1139 |  cache_ = new V4L2BufferCache(*buffers);
        |                                       ^
  ../src/libcamera/v4l2_videodevice.cpp:1139:39: note: uses 'void* operator new(std::size_t)', which does not have an alignment parameter
  ../src/libcamera/v4l2_videodevice.cpp:1139:39: note: use '-faligned-new' to enable C++17 over-aligned new support
  ../src/libcamera/v4l2_videodevice.cpp: In member function 'int libcamera::V4L2VideoDevice::importBuffers(unsigned int)':
  ../src/libcamera/v4l2_videodevice.cpp:1315:36: error: 'new' of type 'libcamera::V4L2BufferCache' with extended alignment 8 [-Werror=aligned-new=]
   1315 |  cache_ = new V4L2BufferCache(count);
        |                                    ^
  ../src/libcamera/v4l2_videodevice.cpp:1315:36: note: uses 'void* operator new(std::size_t)', which does not have an alignment parameter
  ../src/libcamera/v4l2_videodevice.cpp:1315:36: note: use '-faligned-new' to enable C++17 over-aligned new support

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/libcamera.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index a39e9f1c3e..9739f715a1 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -36,6 +36,10 @@ LIBCAMERA_LICENSE_FILES = \
 	LICENSES/CC0-1.0.txt \
 	LICENSES/CC-BY-SA-4.0.txt
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
+LIBCAMERA_CXXFLAGS = -faligned-new
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
 LIBCAMERA_CONF_OPTS += -Dv4l2=true
 else
-- 
2.27.0
