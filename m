From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 15:25:35 +0200
Subject: [Buildroot] [PATCH] qt5: use ccache for building host code
Message-ID: <20181020132535.24508-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5 currently doesn't use HOSTCC/HOSTCXX, so it doesn't use ccache
when building all its host code (especially qmake). This means that
even with ccache enabled and a hot cache, it still takes a long time
to build qt5base.

Before this patch, building qt5base takes:

 - 446 seconds with a cold ccache
 - 185 seconds with a hot ccache

This is because the ccache is not used for host code.

After this patch, building qt5base takes:

 - 450 seconds with a cold ccache
 - 15 seconds with a hot ccache

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ab2b883fc4..d9f7af7196 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -264,6 +264,13 @@ define QT5BASE_CONFIGURE_ARCH_CONFIG
 endef
 endif
 
+# This allows to use ccache when available
+define QT5BASE_CONFIGURE_HOSTCC
+	$(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX=$(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
+endef
+
 define QT5BASE_CONFIGURE_CMDS
 	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
 	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
@@ -274,6 +281,7 @@ define QT5BASE_CONFIGURE_CMDS
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
 	touch $(QT5BASE_ARCH_CONFIG_FILE)
 	$(QT5BASE_CONFIGURE_ARCH_CONFIG)
+	$(QT5BASE_CONFIGURE_HOSTCC)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-- 
2.14.4
