From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:16:38 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: fix build without
 WebDriver
Message-ID: <20191008211058.D29008B85F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=223a5876e04bcf2e04e22af0b104bc9b5cedd184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch", which is
a slightly edited version of an upstream patch that fixes building WPE
WebKit with ENABLE_WEBDRIVER=OFF.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch b/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
new file mode 100644
index 0000000000..d8bf85e8cd
--- /dev/null
+++ b/package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
@@ -0,0 +1,56 @@
+From fb0f978af0dd3923a1d3bcb6dccf610861e284d3 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 8 Oct 2019 11:06:56 +0300
+Subject: [PATCH xserver 2/2] [WPE][GTK] Build fails with ENABLE_WEBDRIVER=OFF
+ https://bugs.webkit.org/show_bug.cgi?id=202658
+
+Reviewed by NOBODY (OOPS!).
+
+* UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp: Add missing
+ENABLE(WEBDRIVER_MOUSE_INTERACTIONS) and ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
+preprocessor guards.
+* UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp: Ditto.
+
+Fetch (and adapted) from: https://bugs.webkit.org/show_bug.cgi?id=202658
+Upstream-Status: Pending
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+---
+ Source/WebKit/ChangeLog                              | 12 ++++++++++++
+ .../Automation/gtk/WebAutomationSessionGtk.cpp       |  4 ++++
+ .../Automation/wpe/WebAutomationSessionWPE.cpp       |  4 ++++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp b/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
+index d601f0e57ae..683f0b8eed4 100644
+--- a/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
++++ b/Source/WebKit/UIProcess/Automation/wpe/WebAutomationSessionWPE.cpp
+@@ -32,6 +32,7 @@
+ namespace WebKit {
+ using namespace WebCore;
+ 
++#if ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
+ static uint32_t modifiersToEventState(OptionSet<WebEvent::Modifier> modifiers)
+ {
+     uint32_t state = 0;
+@@ -121,7 +122,9 @@ void WebAutomationSession::platformSimulateMouseInteraction(WebPageProxy& page,
+         break;
+     }
+ }
++#endif // ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
+ 
++#if ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
+ static void doKeyStrokeEvent(struct wpe_view_backend* viewBackend, bool pressed, uint32_t keyCode, uint32_t modifiers, bool doReleaseAfterPress = false)
+ {
+     struct wpe_input_xkb_keymap_entry* entries;
+@@ -309,6 +312,7 @@ void WebAutomationSession::platformSimulateKeySequence(WebPageProxy& page, const
+         p = g_utf8_next_char(p);
+     } while (*p);
+ }
++#endif // ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
+ 
+ } // namespace WebKit
+ 
+-- 
+2.23.0
+
