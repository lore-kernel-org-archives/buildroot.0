From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2013 11:25:25 +0100
Subject: [Buildroot] [git commit] qt: fix build with opengl es
Message-ID: <20131129102845.B66D89BE64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fe8d728db5fd386696d43f43a52effad25c09387
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/efe/efe26c54361094fb1e201da6915900cd9b24d596/

qt doesn't use pkg-config to figure out the needed compiler/linker flags
for egl, so pass them explicitly instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/qt.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 82ce51d..7f799fd 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -35,6 +35,7 @@ endif
 
 QT_CFLAGS = $(TARGET_CFLAGS)
 QT_CXXFLAGS = $(TARGET_CXXFLAGS)
+QT_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_LARGEFILE),y)
 QT_CONFIGURE_OPTS += -largefile
@@ -320,6 +321,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_OPENGL_ES),y)
 QT_CONFIGURE_OPTS += -opengl es2 -egl
 QT_DEPENDENCIES   += libgles libegl
+QT_CFLAGS   += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
+QT_CXXFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags egl)
+QT_LDFLAGS  += $(shell $(PKG_CONFIG_HOST_BINARY) --libs egl)
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
@@ -490,7 +494,7 @@ define QT_CONFIGURE_CMDS
 	$(call QT_QMAKE_SET,QMAKE_STRIP,$(TARGET_STRIP),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_CFLAGS,$(QT_CFLAGS),$(@D))
 	$(call QT_QMAKE_SET,QMAKE_CXXFLAGS,$(QT_CXXFLAGS),$(@D))
-	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(TARGET_LDFLAGS),$(@D))
+	$(call QT_QMAKE_SET,QMAKE_LFLAGS,$(QT_LDFLAGS),$(@D))
 	$(call QT_QMAKE_SET,PKG_CONFIG,$(HOST_DIR)/usr/bin/pkg-config,$(@D))
 # Don't use TARGET_CONFIGURE_OPTS here, qmake would be compiled for the target
 # instead of the host then. So set PKG_CONFIG* manually.
