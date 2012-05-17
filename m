From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 May 2012 17:11:22 +0200
Subject: [Buildroot] [PATCH] opencv: add zlib dependency
Message-ID: <1337267482-6849-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opencv package selects zlib, but it does not depend on it. This
leads to cases where opencv gets built before zlib, and in this case,
opencv uses its internal version of zlib, which doesn't build properly
(it has some conditional code for ARM that is probably broken), see:

  http://autobuild.buildroot.org/results/45f4e195fe0cc5acace10287f5ff33aa953d5430/build-end.log

We fix this by properly adding the opencv dependency on zlib.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index d415e51..ec94715 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -35,6 +35,8 @@ OPENCV_CONF_OPT = \
 	-DWITH_UNICAP=OFF \
 	-DWITH_XINE=OFF
 
+OPENCV_DEPENDENCIES += zlib
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PYTHON),y)
 OPENCV_CONF_OPT += -DBUILD_NEW_PYTHON_SUPPORT=ON
 OPENCV_DEPENDENCIES += python
-- 
1.7.9.5
