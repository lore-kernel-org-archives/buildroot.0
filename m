From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2016 15:26:14 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3 environment
Message-ID: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

qt5webkit requires Python for building stage and can be built with both
Python 2 and 3. So remove the workaround with linking python binary and
use Python dependency according to the selected Buildroot's Python
version.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a47a235..5c7a007 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -9,8 +9,9 @@ QT5WEBKIT_VERSION = b889f460280ad98c89ede179bd3b9ce9cb02002b
 # The http://code.qt.io/cgit/qt/qtwebkit.git/ repo doesn't allow to do so.
 QT5WEBKIT_SITE = $(call github,qtproject,qtwebkit,$(QT5WEBKIT_VERSION))
 QT5WEBKIT_DEPENDENCIES = \
-	host-bison host-flex host-gperf host-python host-ruby \
-	qt5base sqlite
+	host-bison host-flex host-gperf host-ruby \
+	qt5base sqlite \
+	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
@@ -33,15 +34,7 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_DEPENDENCIES += qt5declarative
 endif
 
-# QtWebkit's build system uses python, but only supports python2. We work
-# around this by forcing python2 early in the PATH, via a python->python2
-# symlink.
 QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
-define QT5WEBKIT_PYTHON2_SYMLINK
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
-endef
-QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 # Since we get the source from git, generated header files are not included.
 # qmake detects that header file generation (using the syncqt tool) must be
-- 
2.1.4
