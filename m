From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 20:31:44 +0200
Subject: [Buildroot] [PATCH] classpath: remove qt support
Message-ID: <1368383504-13355-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

classpath doesn't work with Qt in buildroot. It assumes qt will run on X11,
but we don't have qt-x11 support on buildroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/classpath/classpath.mk | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 2d12552..61a1034 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -8,6 +8,10 @@ CLASSPATH_CONF_OPT = \
 	--disable-gconf-peer \
 	--disable-tools
 
+# classpath assumes qt runs on top of X11, but we
+# don't support qt4 on X11
+CLASSPATH_CONF_OPT += --disable-qt-peer
+
 CLASSPATH_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
@@ -39,13 +43,6 @@ else
 CLASSPATH_CONF_OPT += --disable-gtk-peer --disable-gstreamer-peer
 endif
 
-ifeq ($(BR2_PACKAGE_QT),y)
-CLASSPATH_CONF_OPT += --enable-qt-peer
-CLASSPATH_DEPENDENCIES += qt
-else
-CLASSPATH_CONF_OPT += --disable-qt-peer
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
 CLASSPATH_CONF_OPT += --enable-xmlj
 CLASSPATH_DEPENDENCIES += libxml2 libxslt
-- 
1.8.2.1
