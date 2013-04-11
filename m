From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 17:02:16 +0200
Subject: [Buildroot] [git commit] qt5/qt5xmlpatterns: new package
Message-ID: <20130411151208.752C59B59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55fde61f67d0e4c9a1473d5d27aa3ebf6c32f103
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/Config.in                        |    1 +
 package/qt5/qt5xmlpatterns/Config.in         |   10 ++++++
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk |   43 ++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index b90c6e8..84efa89 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -19,4 +19,5 @@ source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5script/Config.in"
 source "package/qt5/qt5svg/Config.in"
+source "package/qt5/qt5xmlpatterns/Config.in"
 endif
diff --git a/package/qt5/qt5xmlpatterns/Config.in b/package/qt5/qt5xmlpatterns/Config.in
new file mode 100644
index 0000000..6ea7466
--- /dev/null
+++ b/package/qt5/qt5xmlpatterns/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT5XMLPATTERNS
+	bool "qt5xmlpatterns"
+	select BR2_PACKAGE_QT5BASE
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5xmlpatterns module.
+
+	  http://qt-project.org
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
new file mode 100644
index 0000000..3bd6aac
--- /dev/null
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# qt5xmlpatterns
+#
+#############################################################
+
+QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
+QT5XMLPATTERNS_SITE = http://releases.qt-project.org/qt5/$(QT5XMLPATTERNS_VERSION)/submodules_tar/
+QT5XMLPATTERNS_SOURCE = qtxmlpatterns-opensource-src-$(QT5XMLPATTERNS_VERSION).tar.xz
+QT5XMLPATTERNS_DEPENDENCIES = qt5base
+QT5XMLPATTERNS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5XMLPATTERNS_CONFIGURE_OPTS += -opensource -confirm-license
+QT5XMLPATTERNS_LICENSE = LGPLv2.1 or GPLv3.0
+# Here we would like to get license files from qt5base, but qt5base
+# may not be extracted at the time we get the legal-info for
+# qt5script.
+else
+QT5XMLPATTERNS_LICENSE = Commercial license
+QT5XMLPATTERNS_REDISTRIBUTE = NO
+endif
+
+define QT5XMLPATTERNS_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5XMLPATTERNS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
+$(eval $(generic-package))
