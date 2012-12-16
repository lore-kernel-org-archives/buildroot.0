From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 21:00:56 +0100
Subject: [Buildroot] [git commit] package/cegui06: new package
Message-ID: <20121216200127.078A79A29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=303c922c62d2eb08ce3ffb02206b9bf959b305dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although there are more recent versions of CEGUI, we are stuck
with 0.6.2b for use by spice.

[Peter: add C++ dependency]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/cegui06/Config.in              |   19 ++++++++++++++++
 package/cegui06/cegui06-stddef.h.patch |   26 +++++++++++++++++++++++
 package/cegui06/cegui06.mk             |   36 ++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 07681b5..de23724 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -109,6 +109,7 @@ comment "Graphic applications"
 source "package/rrdtool/Config.in"
 
 comment "graphic libraries"
+source "package/cegui06/Config.in"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
diff --git a/package/cegui06/Config.in b/package/cegui06/Config.in
new file mode 100644
index 0000000..5ce9700
--- /dev/null
+++ b/package/cegui06/Config.in
@@ -0,0 +1,19 @@
+comment "cegui06 needs a toolchain with C++ and threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_CEGUI06
+	bool "cegui06"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PCRE
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
index 0000000..817254f
--- /dev/null
+++ b/package/cegui06/cegui06.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# libcegui
+#
+#############################################################
+
+# Do not update the version, we need exactly that one for Spice.
+CEGUI06_VERSION_MAJOR   = 0.6.2
+CEGUI06_VERSION         = $(CEGUI06_VERSION_MAJOR)b
+CEGUI06_SOURCE          = CEGUI-$(CEGUI06_VERSION).tar.gz
+CEGUI06_SITE            = http://downloads.sourceforge.net/project/crayzedsgui/CEGUI%20Mk-2/$(CEGUI06_VERSION_MAJOR)
+CEGUI06_LICENSE         = MIT
+CEGUI06_LICENSE_FILES   = COPYING
+CEGUI06_INSTALL_STAGING = YES
+
+CEGUI06_DEPENDENCIES    =       \
+    expat                       \
+    freetype                    \
+    pcre                        \
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
