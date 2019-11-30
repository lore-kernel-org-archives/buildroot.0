From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2019 19:55:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/webkitgtk:
 security bump to version 2.26.2
Message-ID: <20191130205826.2FC32813A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41197f9157c96867710d17664ed286528fcc4e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This is a minor release which includes fixes for CVE-2019-8812 and
CVE-2019-8814.

This release also fixes the build with WebDriver disabled and without
X11, so "0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch"
and "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" are not
needed anymore (and therefore removed). There is also a performance
improvement for a regression related to fallback font selection, and a
couple of small fixes. The full release notes are available at:

  https://webkitgtk.org/2019/11/06/webkitgtk2.26.2-released.html

The detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2019-0006.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b8c95a08d0cb31c98169c593d76f39327f7b0b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-eglplatform.h-is-build-broken-with-DENAB.patch | 40 ----------------
 ...GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch | 55 ----------------------
 package/webkitgtk/webkitgtk.hash                   |  8 ++--
 package/webkitgtk/webkitgtk.mk                     |  2 +-
 4 files changed, 5 insertions(+), 100 deletions(-)

diff --git a/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch b/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch
deleted file mode 100644
index 1da78f2bf9..0000000000
--- a/package/webkitgtk/0001-GTK-ANGLE-s-eglplatform.h-is-build-broken-with-DENAB.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d1697f868e047f1355fed7b44dbcd6dda897c234 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 19 Sep 2019 17:13:19 +0300
-Subject: [PATCH xserver 1/1] [GTK] ANGLE's eglplatform.h is build broken with
- -DENABLE_X11_PLATFORM=OFF https://bugs.webkit.org/show_bug.cgi?id=198621
-
-Reviewed by NOBODY (OOPS!).
-
-* PlatformGTK.cmake: Use WL_EGL_PLATFORM to prefer Wayland type
-definitions with ENABLE_WAYLAND_TARGET, and USE_SYSTEM_EGL otherwise
-when ENABLE_X11_TARGET is not enabled.
-
-Fetch from: https://bugs.webkit.org/show_bug.cgi?id=198621
-Upstream-Status: Pending
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
----
- Source/ThirdParty/ANGLE/ChangeLog         | 11 +++++++++++
- Source/ThirdParty/ANGLE/PlatformGTK.cmake |  9 +++++++++
- 2 files changed, 20 insertions(+)
-
-diff --git a/Source/ThirdParty/ANGLE/PlatformGTK.cmake b/Source/ThirdParty/ANGLE/PlatformGTK.cmake
-index 74f35e29234..7229b0e09cc 100644
---- a/Source/ThirdParty/ANGLE/PlatformGTK.cmake
-+++ b/Source/ThirdParty/ANGLE/PlatformGTK.cmake
-@@ -1,2 +1,11 @@
- # Enable GLSL compiler output.
- list(APPEND ANGLE_DEFINITIONS ANGLE_ENABLE_GLSL)
-+
-+if (ENABLE_WAYLAND_TARGET)
-+    # Explicitly prefer the Wayland platform, otherwise if we are building
-+    # in a system without X11 ANGLE will still try to use the X11 headers.
-+    list(APPEND ANGLE_DEFINITIONS WL_EGL_PLATFORM)
-+elseif (NOT ENABLE_X11_TARGET)
-+    # Allow building ANGLE on platforms which may not provide X11 headers.
-+    list(APPEND ANGLE_DEFINITIONS USE_SYSTEM_EGL)
-+endif ()
--- 
-2.23.0
-
diff --git a/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch b/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
deleted file mode 100644
index b084ec9eb3..0000000000
--- a/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From fb0f978af0dd3923a1d3bcb6dccf610861e284d3 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 8 Oct 2019 11:06:56 +0300
-Subject: [PATCH xserver 2/2] [WPE][GTK] Build fails with ENABLE_WEBDRIVER=OFF
- https://bugs.webkit.org/show_bug.cgi?id=202658
-
-Reviewed by NOBODY (OOPS!).
-
-* UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp: Add missing
-ENABLE(WEBDRIVER_MOUSE_INTERACTIONS) and ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
-preprocessor guards.
-* UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp: Ditto.
-
-Fetch (and adapted) from: https://bugs.webkit.org/show_bug.cgi?id=202658
-Upstream-Status: Pending
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-
----
- Source/WebKit/ChangeLog                              | 12 ++++++++++++
- .../Automation/gtk/WebAutomationSessionGtk.cpp       |  4 ++++
- .../Automation/wpe/WebAutomationSessionWPE.cpp       |  4 ++++
- 3 files changed, 20 insertions(+)
-
-diff --git a/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp b/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
-index dd81d1d55ea..ee665c2e346 100644
---- a/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
-+++ b/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
-@@ -34,6 +34,7 @@
- namespace WebKit {
- using namespace WebCore;
- 
-+#if ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
- static unsigned modifiersToEventState(OptionSet<WebEvent::Modifier> modifiers)
- {
-     unsigned state = 0;
-@@ -131,7 +132,9 @@ void WebAutomationSession::platformSimulateMouseInteraction(WebPageProxy& page,
-         break;
-     }
- }
-+#endif // ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
- 
-+#if ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
- static void doKeyStrokeEvent(GdkEventType type, GtkWidget* widget, unsigned keyVal, unsigned state, bool doReleaseAfterPress = false)
- {
-     ASSERT(type == GDK_KEY_PRESS || type == GDK_KEY_RELEASE);
-@@ -331,5 +334,6 @@ void WebAutomationSession::platformSimulateKeySequence(WebPageProxy& page, const
-         p = g_utf8_next_char(p);
-     } while (*p);
- }
-+#endif // ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
- 
- } // namespace WebKit
--- 
-2.23.0
-
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 0cf0080e6e..71642ad144 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.26.0.tar.xz.sums
-md5 08145bd6c1587230f135921c142bc150 webkitgtk-2.26.1.tar.xz
-sha1 bd0432281c0463147ec06587c25f226a67acbb2d webkitgtk-2.26.1.tar.xz
-sha256 6b4b21801d2b1008422a1075dbd6fb4ae8b5127503faf657cf9671289d9cd155 webkitgtk-2.26.1.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.26.2.tar.xz.sums
+md5 65e06fe73ee166447894aaea95038e3b webkitgtk-2.26.2.tar.xz
+sha1 5bd1ccb436c76fd1edb83afd5bec377de5655d45 webkitgtk-2.26.2.tar.xz
+sha256 6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512 webkitgtk-2.26.2.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 6f72cdb528..1273c1afe8 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.26.1
+WEBKITGTK_VERSION = 2.26.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
