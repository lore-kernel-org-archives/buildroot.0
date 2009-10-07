From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:33 +0200
Subject: [Buildroot] [PATCH 10/23] qt: don't enable internal tslib-module
	debugging
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-11-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Qt there are virtually hundreds of internal debug flags like
TSLIBMOUSEHANDLER_DEBUG for every module or even C++ class. There
is no reason to enable a single such flag when Qt is build with
debugging symbols and others not.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index c61d70c..47009e8 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -153,8 +153,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT_MOUSE_TSLIB),y)
 QT_CONFIGURE += -qt-mouse-tslib
 QT_DEP_LIBS+=tslib
-QT_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
-QT_TSLIB_DEB:=$(call qstrip,$(QT_TSLIB_DEB))
 else
 QT_CONFIGURE += -no-mouse-tslib
 endif
@@ -165,7 +163,7 @@ QT_CONFIGURE += -no-mouse-qvfb
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
-QT_CONFIGURE+= "-debug $(QT_TSLIB_DEB)"
+QT_CONFIGURE+= -debug
 else
 QT_CONFIGURE+= -release
 endif
-- 
1.6.3.3
