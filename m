From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Oct 2018 11:30:36 +0100
Subject: [Buildroot] [git commit] webkitgtk: bump to version 2.22.3
Message-ID: <20181031102834.0ACAE8385E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0def20865d75baf80b0dad5dcc81efd606cfb3af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

    https://webkitgtk.org/2018/10/29/webkitgtk2.22.3-released.html

Patch "0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch"
is removed because it is included in the new release.

This is a maintenance release which further improves playback of video
when using media source extensions (MSE), specially for WebM content,
and provides a few correctness fixes.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g-FELightingNEON.cpp-fails-due-to-missing.patch | 41 ----------------------
 package/webkitgtk/webkitgtk.hash                   |  8 ++---
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 3 files changed, 5 insertions(+), 46 deletions(-)

diff --git a/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch b/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch
deleted file mode 100644
index 6fb309d9fb..0000000000
--- a/package/webkitgtk/0001-ARM-Building-FELightingNEON.cpp-fails-due-to-missing.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b252c7aed3fa6f22db8a26c3ab0bfe66e3490eef Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Sun, 23 Sep 2018 02:34:26 +0300
-Subject: [PATCH xserver] [ARM] Building FELightingNEON.cpp fails due to
- missing lightVector member https://bugs.webkit.org/show_bug.cgi?id=189890
-
-Reviewed by NOBODY (OOPS!).
-
-No new tests needed.
-
-* platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELighting::platformApplyNeon): Adapt to new layout of "struct PaintingData" after r225122.
----
- Source/WebCore/ChangeLog                             | 12 ++++++++++++
- .../graphics/cpu/arm/filters/FELightingNEON.h        |  6 +++---
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-Fetch from: https://bugs.webkit.org/show_bug.cgi?id=189890
-Upstream-Status: Pending
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index 42af922374b..b542a4c81aa 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -144,9 +144,9 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
-         ASSERT(m_lightSource->type() == LS_DISTANT);
--        floatArguments.lightX = paintingData.lightVector.x();
--        floatArguments.lightY = paintingData.lightVector.y();
--        floatArguments.lightZ = paintingData.lightVector.z();
-+        floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
-+        floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
-+        floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-         floatArguments.padding2 = 1;
-     }
- 
--- 
-2.19.0
-
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 0b9b94ca49..19f0c487dd 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.2.tar.xz.sums
-md5 207d50d313c07b03726f3a7f22643934 webkitgtk-2.22.2.tar.xz
-sha1 ff0c40e81e240aa0743f7e6483f175defebd1417 webkitgtk-2.22.2.tar.xz
-sha256 345487d4d1896e711683f951d1e09387d3b90d7cf59295c0e634af7f515e99ba webkitgtk-2.22.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.3.tar.xz.sums
+md5 6dae6837c884a25413fb1d4527c9894a webkitgtk-2.22.3.tar.xz
+sha1 c16129f4098b35597457255e63e60126ff3e6daa webkitgtk-2.22.3.tar.xz
+sha256 9dfd542902953be9af8ff32bd37fe662ca3d75f7348514ebac15c6252a6ccd72 webkitgtk-2.22.3.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1ba1cb5329..54a791cd14 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.2
+WEBKITGTK_VERSION = 2.22.3
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
