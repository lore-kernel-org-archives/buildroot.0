From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:14 +0200
Subject: [Buildroot] [PATCH 41/41] webkit: bump to 1.2.0
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-42-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also add patchs for autoreconf and directfb compilation

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/webkit/Config.in                           |    1 +
 .../webkit-Fix-automake-failure-on-cxx-check.patch |   25 ++++
 .../webkit-Fix-compilation-on-DirectFB.patch       |  144 ++++++++++++++++++++
 package/webkit/webkit.mk                           |   23 +--
 4 files changed, 177 insertions(+), 16 deletions(-)
 create mode 100644 package/webkit/webkit-Fix-automake-failure-on-cxx-check.patch
 create mode 100644 package/webkit/webkit-Fix-compilation-on-DirectFB.patch

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 10c8b38..5bd5506 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_CAIRO_PNG
+        select BR2_PACKAGE_LIBGAIL
 	help
 	  WebKit is an open source, standards compliant web browser engine.
 
diff --git a/package/webkit/webkit-Fix-automake-failure-on-cxx-check.patch b/package/webkit/webkit-Fix-automake-failure-on-cxx-check.patch
new file mode 100644
index 0000000..6ba69f8
--- /dev/null
+++ b/package/webkit/webkit-Fix-automake-failure-on-cxx-check.patch
@@ -0,0 +1,25 @@
+From dff75872a4bf38d781ee606df7aa21f5e5cbafaf Mon Sep 17 00:00:00 2001
+From: Lionel Landwerlin <llandwerlin@gmail.com>
+Date: Sun, 28 Mar 2010 23:35:29 +0200
+Subject: [PATCH] Fix automake failure on cxx check
+
+Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
+---
+ configure.ac |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0d3a7ea..6ddf18a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,6 +82,7 @@ esac
+ WEBKIT_INIT
+ AC_DISABLE_STATIC
+ AC_LIBTOOL_WIN32_DLL
++AC_PROG_CXX
+ AC_PROG_LIBTOOL
+ # use dolt to speedup the build
+ DOLT
+-- 
+1.7.0.2
+
diff --git a/package/webkit/webkit-Fix-compilation-on-DirectFB.patch b/package/webkit/webkit-Fix-compilation-on-DirectFB.patch
new file mode 100644
index 0000000..256f8a1
--- /dev/null
+++ b/package/webkit/webkit-Fix-compilation-on-DirectFB.patch
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
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index a3ba690..1ed9c82 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -3,15 +3,17 @@
 # webkit
 #
 #############################################################
-WEBKIT_VERSION = r44552
-WEBKIT_SOURCE = WebKit-$(WEBKIT_VERSION).tar.bz2
-WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
-
+WEBKIT_VERSION = 1.2.0
+WEBKIT_SOURCE = webkit-$(WEBKIT_VERSION).tar.gz
+WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
+WEBKIT_AUTORECONF = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
-			libgtk2 sqlite enchant libsoup
+			libgtk2 sqlite enchant libsoup libgail
+
+WEBKIT_AUTORECONF_OPT = -Iautotools
 
 ifeq ($(BR2_PACKAGE_WEBKIT_X11),y)
 WEBKIT_CONF_OPT = --with-target=x11
@@ -25,15 +27,4 @@ WEBKIT_CONF_OPT += --disable-video
 
 WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
-define WEBKIT_AUTOGEN_PATCH
-$(SED) 's%ACLOCAL_FLAGS=.*%ACLOCAL_FLAGS="-I autotools -I $(STAGING_DIR)/usr/share/aclocal"%' $(WEBKIT_DIR)/autogen.sh
-$(SED) 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/' $(WEBKIT_DIR)/autogen.sh
-$(SED) 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/' $(WEBKIT_DIR)/autogen.sh
-cp package/webkit/gtk-doc.make $(WEBKIT_DIR)/
-# Don't run the configure step yet
-cd $(WEBKIT_DIR); $(HOST_CONFIGURE_OPTS) AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
-endef
-
-WEBKIT_POST_EXTRACT_HOOKS += WEBKIT_AUTOGEN_PATCH
-
 $(eval $(call AUTOTARGETS,package,webkit))
-- 
1.7.0.4
