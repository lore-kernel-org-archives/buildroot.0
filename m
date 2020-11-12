From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:32:38 +0100
Subject: [Buildroot] [git commit] package/wpewebkit: fix compile without
 video support
Message-ID: <20201112211901.C36F58115B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e5f672139011570a9e099c6bc0d76d1b81e1e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=13306

      .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ???class WebCore::Settings??? has no member named ???setGenericCueAPIEnabled???; did you mean ???setBeaconAPIEnabled????
                   page->settings().setGenericCueAPIEnabled(enabled);
                                    ^~~~~~~~~~~~~~~~~~~~~~~
                                    setBeaconAPIEnabled

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...InjectedBundle-fix-compile-without-video-.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

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
+  .../wpewebkit-2.30.2/Source/WebKit/WebProcess/InjectedBundle/InjectedBundle.cpp:242:30: error: ???class WebCore::Settings??? has no member named ???setGenericCueAPIEnabled???; did you mean ???setBeaconAPIEnabled????
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
