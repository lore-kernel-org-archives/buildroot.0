From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 14:32:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-video-amdgpu:
 fix glamor dependency
In-Reply-To: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
References: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
Message-ID: <20200410123207.3145145-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copy glamor dependencies from xserver_xorg-server omitting libgl/libegl
because this package already depends on both options:
https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n192

Fixes:
http://autobuild.buildroot.net/results/4da/4da87d30e6f5a10aafae60abce1b89ed92204a4e/
http://autobuild.buildroot.net/results/74c/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index e7196956a3..ccb5b30d90 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -15,6 +15,12 @@ XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS = --enable-glamor
+else
+XDRIVER_XF86_VIDEO_AMDGPU_CONF_OPTS = --disable-glamor
+endif
+
 # xdriver_xf86-video-amdgpu requires O_CLOEXEC
 XDRIVER_XF86_VIDEO_AMDGPU_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-- 
2.25.0
