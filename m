From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 07:24:15 +0100
Subject: [Buildroot] [git commit master 1/1] webkit: fix compilation with
	directfb
Message-ID: <20101119080415.156028D303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e855e2b2de71b6172822e2ed81bec4ddbd82aeb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2833

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 +-
 .../webkit-1.2.3-fix-compilation-on-DirectFB.patch |  144 ++++++++++++++++++++
 2 files changed, 146 insertions(+), 1 deletions(-)
 create mode 100644 package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch

diff --git a/CHANGES b/CHANGES
index 3f3b2f7..748738e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: libglib2, module-init-tools,
-	mtd-utils, openssh, qt, sqlite
+	mtd-utils, openssh, qt, sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -12,6 +12,7 @@
 	#2809: failed to compile libglib2
 	#2821: [PATCH] Patch for JavaScriptCore in QtWebKit module
 	#2827: qt-4.7.0-pthread_getattr_np.patch invalid for qt 4.6...
+	#2833: Failed to compile webkit without X11
 
 2010.11-rc1, Released November 8th, 2010:
 
diff --git a/package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch b/package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch
new file mode 100644
index 0000000..256f8a1
--- /dev/null
+++ b/package/webkit/webkit-1.2.3-fix-compilation-on-DirectFB.patch
@@ -0,0 +1,144 @@
+From 91a2bf4c3a21720a27223ba293ba90f58c349959 Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Sun, 11 Apr 2010 14:38:57 +0200
+Subject: [PATCH] Fix compilation with DirectFB
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ GNUmakefile.am                        |    2 ++
+ WebCore/plugins/PluginView.h          |    6 +++---
+ WebCore/plugins/gtk/PluginViewGtk.cpp |   17 ++++++++---------
+ 3 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/GNUmakefile.am b/GNUmakefile.am
+index 3bdfe53..8626bbb 100644
+--- a/GNUmakefile.am
++++ b/GNUmakefile.am
+@@ -122,8 +122,10 @@ corekit_cppflags += \
+ 
+ # For the Gtk port we want to use XP_UNIX both in X11 and Mac
+ if !TARGET_WIN32
++if !TARGET_DIRECTFB
+ corekit_cppflags += -DXP_UNIX
+ endif
++endif
+ 
+ # Default compiler flags
+ global_cflags += \
+diff --git a/WebCore/plugins/PluginView.h b/WebCore/plugins/PluginView.h
+index 21a25f6..8116864 100644
+--- a/WebCore/plugins/PluginView.h
++++ b/WebCore/plugins/PluginView.h
+@@ -22,7 +22,7 @@
+  * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+  * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+ #ifndef PluginView_h
+@@ -312,7 +312,7 @@ namespace WebCore {
+         bool m_haveInitialized;
+         bool m_isWaitingToStart;
+ 
+-#if defined(XP_UNIX)
++#if defined(XP_UNIX) || PLATFORM(DIRECTFB)
+         bool m_needsXEmbed;
+ #endif
+ 
+@@ -340,7 +340,7 @@ public:
+ 
+ private:
+ 
+-#if defined(XP_UNIX) || OS(SYMBIAN)
++#if defined(XP_UNIX) || OS(SYMBIAN) || PLATFORM(DIRECTFB)
+         void setNPWindowIfNeeded();
+ #elif defined(XP_MACOSX)
+         NP_CGContext m_npCgContext;
+diff --git a/WebCore/plugins/gtk/PluginViewGtk.cpp b/WebCore/plugins/gtk/PluginViewGtk.cpp
+index 8de63e0..039a845 100644
+--- a/WebCore/plugins/gtk/PluginViewGtk.cpp
++++ b/WebCore/plugins/gtk/PluginViewGtk.cpp
+@@ -23,7 +23,7 @@
+  * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+  * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+  * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+ #include "config.h"
+@@ -45,6 +45,7 @@
+ #include "Image.h"
+ #include "KeyboardEvent.h"
+ #include "MouseEvent.h"
++#include "NotImplemented.h"
+ #include "Page.h"
+ #include "PlatformKeyboardEvent.h"
+ #include "PlatformMouseEvent.h"
+@@ -137,7 +138,7 @@ void PluginView::updatePluginWidget()
+     if (!m_isWindowed) {
+         if (m_drawable)
+             XFreePixmap(GDK_DISPLAY(), m_drawable);
+-            
++
+         m_drawable = XCreatePixmap(GDK_DISPLAY(), getRootWindow(m_parentFrame.get()),
+                                    m_windowRect.width(), m_windowRect.height(),
+                                    ((NPSetWindowCallbackStruct*)m_npWindow.ws_info)->depth);
+@@ -571,7 +572,7 @@ NPError PluginView::handlePostReadFile(Vector<char>& buffer, uint32 len, const c
+ 
+     //FIXME - read the file data into buffer
+     FILE* fileHandle = fopen((filename.utf8()).data(), "r");
+-    
++
+     if (fileHandle == 0)
+         return NPERR_FILE_NOT_FOUND;
+ 
+@@ -706,6 +707,7 @@ void PluginView::forceRedraw()
+         gtk_widget_queue_draw(m_parentFrame->view()->hostWindow()->platformPageClient());
+ }
+ 
++#if defined(XP_UNIX)
+ static Display* getPluginDisplay()
+ {
+     // The plugin toolkit might have a different X connection open.  Since we're
+@@ -713,14 +715,9 @@ static Display* getPluginDisplay()
+     // plugins, so we can return that.  We might want to add other implementations here
+     // later.
+ 
+-#if defined(XP_UNIX)
+     return GDK_DISPLAY_XDISPLAY(gdk_display_get_default());
+-#else
+-    return 0;
+-#endif
+ }
+ 
+-#if defined(XP_UNIX)
+ static void getVisualAndColormap(int depth, Visual** visual, Colormap* colormap)
+ {
+     *visual = 0;
+@@ -794,9 +791,9 @@ bool PluginView::platformStart()
+     }
+ 
+     if (m_isWindowed) {
+-#if defined(XP_UNIX)
+         GtkWidget* pageClient = m_parentFrame->view()->hostWindow()->platformPageClient();
+ 
++#if defined(XP_UNIX)
+         if (m_needsXEmbed) {
+             // If our parent is not anchored the startup process will
+             // fail miserably for XEmbed plugins a bit later on when
+@@ -817,7 +814,9 @@ bool PluginView::platformStart()
+ #endif
+     } else {
+         setPlatformWidget(0);
++#if defined(XP_UNIX)
+         m_pluginDisplay = getPluginDisplay();
++#endif
+     }
+ 
+     show();
+-- 
+1.7.0.4
+
-- 
1.7.2.2
