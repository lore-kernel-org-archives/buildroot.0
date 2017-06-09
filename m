From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Jun 2017 13:09:35 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] package/qt5base: install
	arch-specific configuration
Message-ID: <20170609112132.9334C80259@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e82c285cbc51b9f056a291755957d2f3e6e63af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

For some architectures, it is necessary to link with additional
libraries, such as -latomic for sparc.

Add a bit of support to make that easy; actual use will be introduced in
the following patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit a3fd13804fc801fc948d27f9fe932fce7201655a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qmake.conf | 3 +++
 package/qt5/qt5base/qt5base.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
index 49cf898..8b6debe 100644
--- a/package/qt5/qt5base/qmake.conf
+++ b/package/qt5/qt5base/qmake.conf
@@ -21,5 +21,8 @@ CONFIG                 += nostrip
 QMAKE_LIBS             += -lrt -lpthread -ldl
 QMAKE_CFLAGS_ISYSTEM   =
 
+# Architecturespecific configuration
+include(arch.conf)
+
 include(../common/linux_device_post.conf)
 load(qt_config)
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 0c08835..81774b7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -214,12 +214,15 @@ define QT5BASE_CONFIGURE_CONFIG_FILE
 endef
 endif
 
+QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
+	touch $(QT5BASE_ARCH_CONFIG_FILE)
+	$(QT5BASE_CONFIGURE_ARCH_CONFIG)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
