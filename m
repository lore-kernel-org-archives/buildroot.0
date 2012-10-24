From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:25:35 +0200
Subject: [Buildroot] [PATCH 09/47] package/libcegui: new package
In-Reply-To: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
References: <1351113973-17237-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1351113973-17237-10-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                      |    1 +
 package/cegui06/Config.in              |   14 +++++++++++++
 package/cegui06/cegui06-stddef.h.patch |   26 ++++++++++++++++++++++++
 package/cegui06/cegui06.mk             |   34 ++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 0 deletions(-)
 create mode 100644 package/cegui06/Config.in
 create mode 100644 package/cegui06/cegui06-stddef.h.patch
 create mode 100644 package/cegui06/cegui06.mk

diff --git a/package/Config.in b/package/Config.in
index 330d8a3..97d38af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -108,6 +108,7 @@ comment "Graphic applications"
 source "package/rrdtool/Config.in"
 
 comment "graphic libraries"
+source "package/cegui06/Config.in"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
new file mode 100644
index 0000000..7225f9c
--- /dev/null
+++ b/package/cegui06/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CEGUI06
+	bool "libcegui06"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_EXPAT
+	help
+	  Crazy Eddie's GUI System is a free library providing windowing and
+	  widgets for graphics APIs / engines where such functionality is not
+	  natively available, or severely lacking. The library is object
+	  orientated, written in C++, and targeted at games developers who
+	  should be spending their time creating great games, not building
+	  GUI sub-systems!
+	  
+	  http://www.cegui.org.uk/
diff --git a/package/cegui06/cegui06-stddef.h.patch b/package/cegui06/cegui06-stddef.h.patch
new file mode 100644
index 0000000..cc16eff
--- /dev/null
+++ b/package/cegui06/cegui06-stddef.h.patch
@@ -0,0 +1,26 @@
+includes: ptrdiff_t is defined in stddef.h
+
+ptrdiff_t is defined in the stddef.h header, so this
+header must be included.
+
+Do the #include in a common header to avoid doing it
+all over the place.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch not sent upstream, it's a no-longer-maintained branch.
+To be noted, however, is that the current devel branch is
+still missing that include.
+
+diff -durN cegui06-0.6.2.orig/include/CEGUIBase.h cegui06-0.6.2/include/CEGUIBase.h
+--- cegui06-0.6.2.orig//include/CEGUIBase.h	2008-02-11 15:38:27.000000000 +0100
++++ cegui06-0.6.2/include/CEGUIBase.h	2012-08-19 22:51:50.260385978 +0200
+@@ -34,6 +34,7 @@
+ #define _CEGUIBase_h_
+ 
+ #include <cassert>
++#include <stddef.h>
+ 
+ // bring in configuration options
+ #include "CEGUIConfig.h"
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
new file mode 100644
index 0000000..2f562ac
--- /dev/null
+++ b/package/cegui06/cegui06.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# libcegui
+#
+#############################################################
+
+CEGUI06_VERSION         = 0.6.2
+CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION)b.tar.gz
+CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION)
+CEGUI06_LICENSE         = MIT
+CEGUI06_LICENSE_FILES   = COPYING
+CEGUI06_INSTALL_STAGING = YES
+
+CEGUI06_DEPENDENCIES    =       \
+    freetype                    \
+    pcre                        \
+    expat                       \
+
+CEGUI06_CONF_OPT =              \
+    --enable-expat              \
+    --disable-external-tinyxml  \
+    --disable-xerces-c          \
+    --disable-libxml            \
+    --disable-tinyxml           \
+    --disable-opengl-renderer   \
+    --disable-external-glew     \
+    --disable-irrlicht-renderer \
+    --disable-directfb-renderer \
+    --disable-samples           \
+    --disable-lua-module        \
+    --disable-toluacegui        \
+    --disable-external-toluapp  \
+
+$(eval $(autotools-package))
-- 
1.7.2.5
