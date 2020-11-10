From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Nov 2020 23:16:29 +0100
Subject: [Buildroot] [PATCH v1] package/wpewebkit: fix compile without video
 support
Message-ID: <20201110221629.7011-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13306

      .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?; did you mean ?setBeaconAPIEnabled??
                   page->settings().setGenericCueAPIEnabled(enabled);
                                    ^~~~~~~~~~~~~~~~~~~~~~~
                                    setBeaconAPIEnabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...tedBundle-fix-compile-without-video-.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch

diff --git a/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch b/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch
new file mode 100644
index 0000000000..e684c4e3e7
--- /dev/null
+++ b/package/wpewebkit/0002-WebProcess-InjectedBundle-fix-compile-without-video-.patch
@@ -0,0 +1,42 @@
+From 1ca7dea56db25969844699bc82fe7c78cb3d2eda Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 10 Nov 2020 23:06:45 +0100
+Subject: [PATCH] WebProcess/InjectedBundle: fix compile without video support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ?class WebCore::Settings? has no member named ?setGenericCueAPIEnabled?; did you mean ?setBeaconAPIEnabled??
+               page->settings().setGenericCueAPIEnabled(enabled);
+                                ^~~~~~~~~~~~~~~~~~~~~~~
+                                setBeaconAPIEnabled
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
+index 61326f2e..d7776997 100644
+--- a/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
++++ b/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp
+@@ -236,12 +236,14 @@ void InjectedBundle::overrideBoolPreferenceForTestRunner(WebPageGroupProxy* page
+         RuntimeEnabledFeatures::sharedFeatures().setWebRTCMDNSICECandidatesEnabled(enabled);
+ #endif
+ 
++#if ENABLE(VIDEO)
+     if (preference == "WebKitGenericCueAPIEnabled") {
+         WebPreferencesStore::overrideBoolValueForKey(WebPreferencesKey::genericCueAPIEnabledKey(), enabled);
+         for (auto* page : pages)
+             page->settings().setGenericCueAPIEnabled(enabled);
+         return;
+     }
++#endif
+ 
+ #if ENABLE(GPU_PROCESS)
+     if (preference == "WebKitUseGPUProcessForMedia" || preference == "WebKitCaptureAudioInGPUProcessEnabledKey") {
+-- 
+2.29.2
+
-- 
2.29.2
