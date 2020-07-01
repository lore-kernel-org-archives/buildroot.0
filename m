From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jul 2020 19:39:56 +0200
Subject: [Buildroot] [git commit] core/pkg-infra: Add per-package support in
 qmake infra
Message-ID: <20200701173934.4E18E843E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60e3a09693703f0c923322d39ce1210baf154983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: drop useless 'rm -f' of generated file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-qmake.mk           |  1 +
 package/qt5/qt5.mk             | 14 ++++++++++++++
 package/qt5/qt5base/qt5base.mk |  9 +--------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index 46d2b22d04..27727119d7 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -50,6 +50,7 @@ endif
 #
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
+	$$(QT5_QT_CONF_FIXUP)
 	cd $$($(2)_BUILDDIR) && \
 	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
 endef
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index e540ebcf85..4fa687fd58 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -11,5 +11,19 @@ QT5_SITE = https://download.qt.io/archive/qt/$(QT5_VERSION_MAJOR)/$(QT5_VERSION)
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable and
+# tweak the per-package install pathes
+define QT5_INSTALL_QT_CONF
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
index c6b459a0e1..359a380075 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -314,13 +314,6 @@ define QT5BASE_CONFIGURE_CMDS
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
