From: Andreas Naumann <anaumann@ultratronik.de>
Date: Tue,  8 Nov 2016 11:30:47 +0100
Subject: [Buildroot] [PATCH 4/5] qt5declarative: enable Quick for non-GL
	platforms
In-Reply-To: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1478601048-21388-5-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

However, some modules provide less functionality without OpenGL, so install
steps have to be limited for the softrender only backend:
- qtmultimedia does not provide qml

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5declarative/Config.in       | 4 +---
 package/qt5/qt5multimedia/qt5multimedia.mk | 2 ++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index eba4c8d..0604e85 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -14,12 +14,10 @@ config BR2_PACKAGE_QT5DECLARATIVE
 
 if BR2_PACKAGE_QT5DECLARATIVE
 
-comment "quick module needs an OpenGL-capable backend"
+comment "quick module without OpenGL-capable backend will use a less performant software backend"
 	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
 
 config BR2_PACKAGE_QT5DECLARATIVE_QUICK
 	bool "quick module"
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 
 endif
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 67e7968..41eb0f6 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -53,11 +53,13 @@ define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5_GL_AVAILABLE),y)
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
 endef
 endif
+endif
 
 define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
 	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
-- 
1.9.1
