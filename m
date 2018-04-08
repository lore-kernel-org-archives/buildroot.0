From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 21:27:04 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] qt5base: correct eglfs
 support in qmake.conf.in
Message-ID: <20180408194523.709CD80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ebb06c8ee752f4052f588087826e5aa8a9972dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Setting EGLFS_DEVICE_INTEGRATION at the end of qmake.conf like is done
by commit 0c219ddb8a doesn't work correctly: it has to be set before the
include(../common/linux_device_post.conf)

Instead of appending to the file, change it into a qmake.conf.in
template file that contains a placeholder for the
EGLFS_DEVICE_INTEGRATION assignment and update it with sed. Since the
sed always has to be executed, this removes the need for a separate
QT5BASE_CONFIGURE_QMAKE_CONFIG definition.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
[Arnout: simplify the replacement, move sunxi-mali support to a
 separate patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 81fb33af2a6e4f4d379da3372b2a607b7ae1a21f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/{qmake.conf => qmake.conf.in} | 2 ++
 package/qt5/qt5base/qt5base.mk                    | 9 ++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf.in
similarity index 98%
rename from package/qt5/qt5base/qmake.conf
rename to package/qt5/qt5base/qmake.conf.in
index 8b6debe583..d62ee7cebe 100644
--- a/package/qt5/qt5base/qmake.conf
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -24,5 +24,7 @@ QMAKE_CFLAGS_ISYSTEM   =
 # Architecturespecific configuration
 include(arch.conf)
 
+ at EGLFS_DEVICE@
+
 include(../common/linux_device_post.conf)
 load(qt_config)
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c799cb..957cdf57b7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -242,10 +242,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
 # use vivante backend
-define QT5BASE_CONFIGURE_QMAKE_CONFIG
-	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
-		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
-endef
+QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
 endif
 
 ifneq ($(QT5BASE_CONFIG_FILE),)
@@ -263,7 +260,9 @@ endef
 endif
 
 define QT5BASE_CONFIGURE_CMDS
-	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
+	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
+	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
+		$(QT5BASE_PKGDIR)/qmake.conf.in > \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
 	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
