From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 May 2017 23:13:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5base: install arch-specific
	configuration
In-Reply-To: <cover.1494969180.git.yann.morin.1998@free.fr>
References: <cover.1494969180.git.yann.morin.1998@free.fr>
Message-ID: <0251e17047b7b3c82e23fe1026af7a9847a6a43b.1494969180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some architectures, it is necessary to link with additional
libraries, such as -latomic for sparc.

Add a bit of support to make that easy; actual use will be introduced in
the following patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qmake.conf | 3 +++
 package/qt5/qt5base/qt5base.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
index 49cf898316..8b6debe583 100644
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
index 0c088350e5..65320cbe04 100644
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
+	$(QT5BASE_ARCH_CONFIG)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-- 
2.11.0
