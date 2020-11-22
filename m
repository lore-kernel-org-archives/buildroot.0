From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:25:55 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: bump to version 2.30.3
Message-ID: <20201122141535.831AA8390C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=445b03fb9b7f1611d173a578088ddffea3b9d158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which solved a build issues and fixes a number
of rendering issues. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.30.3.html

Patch "0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch"
can be removed because a similar fix is included in this release.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...InjectedBundle-fix-compile-without-video-.patch | 42 ----------------------
 package/wpewebkit/wpewebkit.hash                   |  8 ++---
 package/wpewebkit/wpewebkit.mk                     |  2 +-
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch b/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch
deleted file mode 100644
index e684c4e3e7..0000000000
--- a/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1ca7dea56db25969844699bc82fe7c78cb3d2eda Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 10 Nov 2020 23:06:45 +0100
-Subject: [PATCH] WebProcess/InjectedBundle: fix compile without video support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-
-  .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ???class WebCore::Settings??? has no member named ???setGenericCueAPIEnabled???; did you mean ???setBeaconAPIEnabled????
-               page->settings().setGenericCueAPIEnabled(enabled);
-                                ^~~~~~~~~~~~~~~~~~~~~~~
-                                setBeaconAPIEnabled
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
-index 61326f2e..d7776997 100644
---- a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
-+++ b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
-@@ -236,12 +236,14 @@ void InjectedBundle::overrideBoolPreferenceForTestRunner(WebPageGroupProxy* page
-         RuntimeEnabledFeatures::sharedFeatures().setWebRTCMDNSICECandidatesEnabled(enabled);
- #endif
- 
-+#if ENABLE(VIDEO)
-     if (preference == "WebKitGenericCueAPIEnabled") {
-         WebPreferencesStore::overrideBoolValueForKey(WebPreferencesKey::genericCueAPIEnabledKey(), enabled);
-         for (auto* page : pages)
-             page->settings().setGenericCueAPIEnabled(enabled);
-         return;
-     }
-+#endif
- 
- #if ENABLE(GPU_PROCESS)
-     if (preference == "WebKitUseGPUProcessForMedia" || preference == "WebKitCaptureAudioInGPUProcessEnabledKey") {
--- 
-2.29.2
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 2bd5fd3fba..3534abf0e4 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.30.2.tar.xz.sums
-md5  5b0fed3333b53dbb36e572935fd54a7b  wpewebkit-2.30.2.tar.xz
-sha1  a143723fb77c2ea20bad888b95ccc37a7dd5b375  wpewebkit-2.30.2.tar.xz
-sha256  c94925ca2d655c7fc07dbc2d4b7a47a822c7699816a8cca35ed9efd676b5ba86  wpewebkit-2.30.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.30.3.tar.xz.sums
+md5  75f6ef1819b182043a25b916272ebec6  wpewebkit-2.30.3.tar.xz
+sha1  2ed723f779513205449e0c5b7c080eb19d635aee  wpewebkit-2.30.3.tar.xz
+sha256  f2dfc1a6279810353f601bb9bd0d8ef671b41b38352d679b93d01631c2bf7b4b  wpewebkit-2.30.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 6f83775e96..66f86edf4d 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.30.2
+WPEWEBKIT_VERSION = 2.30.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
