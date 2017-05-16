From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 May 2017 23:13:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/qt5base: link with -latomic for
	sparc
In-Reply-To: <cover.1494969180.git.yann.morin.1998@free.fr>
References: <cover.1494969180.git.yann.morin.1998@free.fr>
Message-ID: <628b089124e34bcc2f6cd9be57c65d567872ef1f.1494969180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt 5.8 needs atomic operations, which on sparc are provided with
-latomic.

Fixes:
    http://autobuild.buildroot.org/results/49b/49bc9345b9849c9c3c53ace290c534ff7bb98683/
    http://autobuild.buildroot.org/results/9f2/9f213406954be51dfcad76ebdce8b73850842180/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 65320cbe04..7c9ed0b4e3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -215,6 +215,13 @@ endef
 endif
 
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
+ifeq ($(BR2_sparc)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+# Qt 5.8 needs atomics, which on sparc are in -latomic
+define QT5BASE_ARCH_CONFIG
+	printf 'LIBS += -latomic\n' >$(QT5BASE_ARCH_CONFIG_FILE)
+endef
+endif
+
 define QT5BASE_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
-- 
2.11.0
