From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Nov 2019 18:25:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to version
 2.26.2
Message-ID: <20191110162503.3529982-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release which includes fixes for CVE-2019-8812 and
CVE-2019-8814.

This release also fixes the build with WebDriver disabled, making patch
"0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" unneeded
(and therefore removed). There is also a performance improvement for
a regression related to fallback font selection, and a couple of small
fixes. The full release notes are available at:

  https://wpewebkit.org/release/wpewebkit-2.26.2.html

The detailed security advisory can be found at:

  https://wpewebkit.org/security/WSA-2019-0006.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...uild-fails-with-ENABLE_WEBDRIVER-OFF.patch | 56 -------------------
 package/wpewebkit/wpewebkit.hash              |  8 +--
 package/wpewebkit/wpewebkit.mk                |  2 +-
 3 files changed, 5 insertions(+), 61 deletions(-)
 delete mode 100644 package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch

diff --git a/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch b/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
deleted file mode 100644
index d8bf85e8cd..0000000000
--- a/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
+++ /dev/null
@@ -1,56 +0,0 @@
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
-diff --git a/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp b/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
-index d601f0e57ae..683f0b8eed4 100644
---- a/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
-+++ b/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
-@@ -32,6 +32,7 @@
- namespace WebKit {
- using namespace WebCore;
- 
-+#if ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
- static uint32_t modifiersToEventState(OptionSet<WebEvent::Modifier> modifiers)
- {
-     uint32_t state = 0;
-@@ -121,7 +122,9 @@ void WebAutomationSession::platformSimulateMouseInteraction(WebPageProxy& page,
-         break;
-     }
- }
-+#endif // ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
- 
-+#if ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
- static void doKeyStrokeEvent(struct wpe_view_backend* viewBackend, bool pressed, uint32_t keyCode, uint32_t modifiers, bool doReleaseAfterPress = false)
- {
-     struct wpe_input_xkb_keymap_entry* entries;
-@@ -309,6 +312,7 @@ void WebAutomationSession::platformSimulateKeySequence(WebPageProxy& page, const
-         p = g_utf8_next_char(p);
-     } while (*p);
- }
-+#endif // ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
- 
- } // namespace WebKit
- 
--- 
-2.23.0
-
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 052252c32e..85a3271874 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.1.tar.xz.sums
-md5 bec094fe878e03f42de751cbaf0b3e99 wpewebkit-2.26.1.tar.xz
-sha1 53dfafab8d5ccb537e7330febb9504c390e3bf52 wpewebkit-2.26.1.tar.xz
-sha256 d1ae85dffb5bfc106c5ac6d5e73a3dfe3cb2c1df1f18c16103e1dc744cd4ac14 wpewebkit-2.26.1.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.26.2.tar.xz.sums
+md5 057cc2647231e90c8197873df9a9f54c wpewebkit-2.26.2.tar.xz
+sha1 eca4e35af2c2e70bd36a9bdef3bfbbfbd417210c wpewebkit-2.26.2.tar.xz
+sha256 dd4fce390f1721d8d6d017fa712adb990f7230bde84a1b7d27327bd589053fdd wpewebkit-2.26.2.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 012e67af1f..c90e2d1421 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.1
+WPEWEBKIT_VERSION = 2.26.2
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
-- 
2.24.0
