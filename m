From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue,  8 Oct 2019 11:30:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: fix build without
 WebDriver
Message-ID: <20191008083031.2470549-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch", which is
a slightly edited version of an upstream patch that fixes building
WebKitGTK with ENABLE_WEBDRIVER=OFF.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...uild-fails-with-ENABLE_WEBDRIVER-OFF.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch

diff --git a/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch b/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
new file mode 100644
index 0000000000..b084ec9eb3
--- /dev/null
+++ b/package/webkitgtk/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch
@@ -0,0 +1,55 @@
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
+diff --git a/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp b/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
+index dd81d1d55ea..ee665c2e346 100644
+--- a/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
++++ b/Source/WebKit/UIProcess/Automation/gtk/WebAutomationSessionGtk.cpp
+@@ -34,6 +34,7 @@
+ namespace WebKit {
+ using namespace WebCore;
+ 
++#if ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
+ static unsigned modifiersToEventState(OptionSet<WebEvent::Modifier> modifiers)
+ {
+     unsigned state = 0;
+@@ -131,7 +132,9 @@ void WebAutomationSession::platformSimulateMouseInteraction(WebPageProxy& page,
+         break;
+     }
+ }
++#endif // ENABLE(WEBDRIVER_MOUSE_INTERACTIONS)
+ 
++#if ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
+ static void doKeyStrokeEvent(GdkEventType type, GtkWidget* widget, unsigned keyVal, unsigned state, bool doReleaseAfterPress = false)
+ {
+     ASSERT(type == GDK_KEY_PRESS || type == GDK_KEY_RELEASE);
+@@ -331,5 +334,6 @@ void WebAutomationSession::platformSimulateKeySequence(WebPageProxy& page, const
+         p = g_utf8_next_char(p);
+     } while (*p);
+ }
++#endif // ENABLE(WEBDRIVER_KEYBOARD_INTERACTIONS)
+ 
+ } // namespace WebKit
+-- 
+2.23.0
+
-- 
2.23.0
