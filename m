From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:43 -0000
Subject: [Buildroot] [git commit branch/next] opencv: add zlib dependency
Message-ID: <20120802195232.4B6AE96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60cc0ba4b3a97804c9230cddbdeb1999f5023368
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The opencv package selects zlib, but it does not depend on it. This
leads to cases where opencv gets built before zlib, and in this case,
opencv uses its internal version of zlib, which doesn't build properly
(it has some conditional code for ARM that is probably broken), see:

  http://autobuild.buildroot.org/results/45f4e195fe0cc5acace10287f5ff33aa953d5430/build-end.log

We fix this by properly adding the opencv dependency on zlib.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/opencv/opencv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
