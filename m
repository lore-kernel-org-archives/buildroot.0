From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:22:25 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] glmark2: Fix segmentation
	fault
Message-ID: <20170625223515.4187D81842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46d6c98de9b1ed4d77e66db41c0dd7b0941d236e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Running glmark2 on imx6 with kernel 4.11.4 and Mesa 17.1.2 leads to
a segmentation fault.

Apply Lucas Stach's patch to fix the problem while upstream glmark2
doesn't get fixed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6846d83b14fec69097a4ad6bd382c929fb91a315)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eStateDRM-use-fixed-event-context-version.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch b/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch
new file mode 100644
index 0000000..c66f409
--- /dev/null
+++ b/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch
@@ -0,0 +1,28 @@
+From: Lucas Stach <l.stach@pengutronix.de>
+Date: Wed, 31 May 2017 13:01:00 +0200
+Subject: [PATCH] NativeStateDRM: use fixed event context version
+
+Using the latest version is not a good idea, as the context content may
+change between versions.
+
+Fixes a segfault with new kernel and libdrm.
+
+Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ src/native-state-drm.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
+index 454a24d898ff..b9af996667dc 100644
+--- a/src/native-state-drm.cpp
++++ b/src/native-state-drm.cpp
+@@ -106,7 +106,7 @@ NativeStateDRM::flip()
+     FD_ZERO(&fds);
+     FD_SET(fd_, &fds);
+     drmEventContext evCtx;
+-    evCtx.version = DRM_EVENT_CONTEXT_VERSION;
++    evCtx.version = 2;
+     evCtx.page_flip_handler = page_flip_handler;
+ 
+     while (waiting) {
