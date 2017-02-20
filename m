From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:37:11 +0100
Subject: [Buildroot] [git commit] directfb: add gfx-state initialisation
Message-ID: <20170220203717.79EF48218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fdab1a070d6ecce92adac3906bfd93e57d2f79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0006-fix-client-gfx_state-initialisation.patch
add the initialisation for the variable gfx-state.

This patch was provided by the community and it is already
integrated in OpenEmbedded.

Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0006-fix-client-gfx_state-initialisation.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/directfb/0006-fix-client-gfx_state-initialisation.patch b/package/directfb/0006-fix-client-gfx_state-initialisation.patch
new file mode 100644
index 0000000..5b7a202
--- /dev/null
+++ b/package/directfb/0006-fix-client-gfx_state-initialisation.patch
@@ -0,0 +1,39 @@
+From 8e53c0b9cedb62b82e2b7680d793d433b647ae20 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 13 Jun 2016 13:32:44 -0700
+Subject: [PATCH] fix client->gfx_state initialisation
+
+Shortly before the DirectFB 1.7.7 release, an optimisation was added
+to CoreGraphicsStateClient_Init() to avoid creating an extended
+Graphics State object if it will not later be required:
+
+  4d422fb Client: Create extended Graphics State object when needed for later usage
+
+Unfortunately the client->gfx_state variable used to track the
+extended Graphics State object is not initialised, which can lead to
+crashes etc due to creation of the Graphics State object erroneously
+being skipped.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
+---
+ src/core/CoreGraphicsStateClient.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/core/CoreGraphicsStateClient.cpp b/src/core/CoreGraphicsStateClient.cpp
+index 5d46f0e..5007755 100644
+--- a/src/core/CoreGraphicsStateClient.cpp
++++ b/src/core/CoreGraphicsStateClient.cpp
+@@ -364,6 +364,7 @@ CoreGraphicsStateClient_Init( CoreGraphicsStateClient *client,
+      client->renderer  = NULL;
+      client->requestor = NULL;
+      client->throttle  = NULL;
++     client->gfx_state = NULL;
+ 
+      if (dfb_config->task_manager) {
+           if (dfb_config->call_nodirect) {
+-- 
+1.9.1
+
