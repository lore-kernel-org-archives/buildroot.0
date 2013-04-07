From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 21:57:16 +0200
Subject: [Buildroot] [PATCHv5 02/14] qt5base: support static library building
In-Reply-To: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365364648-30568-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365364648-30568-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/qt5base.mk |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d22ab66..0d0fb11 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -37,6 +37,14 @@ else
 QT5BASE_CONFIGURE_OPTS += -release
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+QT5BASE_CONFIGURE_OPTS += -static
+else
+# We apparently can't build both the shared and static variants of the
+# library.
+QT5BASE_CONFIGURE_OPTS += -shared
+endif
+
 ifeq ($(BR2_LARGEFILE),y)
 QT5BASE_CONFIGURE_OPTS += -largefile
 else
@@ -179,10 +187,16 @@ define QT5BASE_INSTALL_TARGET_FONTS
 	fi
 endef
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define QT5BASE_INSTALL_TARGET_CMDS
+	$(QT5BASE_INSTALL_TARGET_FONTS)
+endef
+else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
 	$(QT5BASE_INSTALL_TARGET_FONTS)
 endef
+endif
 
 $(eval $(generic-package))
-- 
1.7.9.5
