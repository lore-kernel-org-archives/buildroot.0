From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:41 +0100
Subject: [Buildroot] [PATCH v6 19/28] core/pkg-infra: Add per-package
 support in qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-20-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qmake configured packages will, by default, use the absolute HostPrefix/Sysroot
pathes set during configuration/building of qt5base for their install
destinations.
For the per-package host/staging infrastructure, this causes non-qt5base
packages to litter the qt5base folders. In addition, buildroots target-install
step subsequently fails because the respective files are missing from the
per-package sysroot of the package itself.

Fortunately, qmake's built-in pathes can be overridden by placing a custom
qt.conf next to the qmake binary. This is already used to facilitate SDK
relocation. So for per-package path manipulation we can reuse that method, but
need to change the host/sysroot values according to each per-package
path.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-qmake.mk           |  1 +
 package/qt5/qt5.mk             | 15 +++++++++++++++
 package/qt5/qt5base/qt5base.mk |  9 +--------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index 53ac3e4a1c..3aa0dd7101 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -46,6 +46,7 @@ $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
+	$$(QT5_QT_CONF_FIXUP)
 	cd $$($(2)_BUILDDIR) && \
 	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
 endef
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d94d9cc99f..eb2a749678 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -17,5 +17,20 @@ QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install pathes
+define QT5_INSTALL_QT_CONF
+	rm -f $(HOST_DIR)/bin/qt.conf && \
+	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
+endef
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT5_QT_CONF_FIXUP
+        $(QT5_INSTALL_QT_CONF)
+endef
+endif
+
 # Variable for other Qt applications to use
 QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 03f984ef8c..960a802b3b 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -352,13 +352,6 @@ define QT5BASE_CONFIGURE_CMDS
 	)
 endef
 
-# The file "qt.conf" can be used to override the hard-coded paths that are
-# compiled into the Qt library. We need it to make "qmake" relocatable.
-define QT5BASE_INSTALL_QT_CONF
-	sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
-		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
-endef
-
-QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_INSTALL_QT_CONF
+QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
 
 $(eval $(qmake-package))
-- 
2.25.0
